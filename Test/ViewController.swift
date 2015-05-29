//
//  ViewController.swift
//  Test
//
//  Created by crazypoo on 15/5/28.
//  Copyright (c) 2015年 P. All rights reserved.
//

import UIKit



class ViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource
{
    
    var tbView:UITableView?
    var items :NSMutableArray?
    var btnl:UIButton?
    var viewTitle:String?
        
    convenience init(arg:String,bgc:UIColor){
        self.init()
        viewTitle = arg
        self.view.backgroundColor = bgc
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        items = NSMutableArray()

        self.view.backgroundColor = UIColor(red: 0.2, green: 0.1, blue: 0.3, alpha: 1)        
        let but = UIButton(frame:CGRect(x:0,y:0,width:100,height:30))
        but.setTitle("add",forState:.Normal)
        but.addTarget(self,action:"ooooo",forControlEvents:.TouchUpInside)
        but.backgroundColor = UIColor.blueColor()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: but)
        
        btnl = UIButton(frame:CGRect(x:0,y:0,width:100,height:30))
        btnl!.setTitle("edit",forState:.Normal)
        btnl!.addTarget(self,action:"bbbbb",forControlEvents:.TouchUpInside)
        btnl!.backgroundColor = UIColor.blueColor()
        btnl!.tag = 100
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: btnl!)

        let tBtn = UIButton(frame:CGRect(x:0,y:0,width:100,height:30))
        tBtn.setTitle(viewTitle,forState:.Normal);
        tBtn.addTarget(self,action:"back",forControlEvents:.TouchUpInside)
        tBtn.backgroundColor = UIColor.blueColor();
        self.navigationItem.titleView = tBtn
        
        creatTbView()
        println(CarrierSwift.currentRadioAccessTechnology())
        println(CarrierSwift.subscriberCellularProvider())

    }
    func back()
    {
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
    func creatTbView()
    {
        tbView = UITableView(frame: CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height), style: .Plain)
        tbView!.delegate = self
        tbView!.dataSource = self
        tbView!.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(tbView!)

    }
    func ooooo()
    {
        var row = self.items!.count
        var indexPath = NSIndexPath(forRow:row,inSection:0)
        self.items?.addObject("1")
        tbView?.insertRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Left)
        btnl!.userInteractionEnabled = true
    }
    
    func bbbbb(){
    
        if (btnl!.tag == 100)
        {
            tbView?.setEditing(true, animated: true)
            btnl!.tag = 200
            btnl?.setTitle("Done", forState: UIControlState.Normal)
        }
        else
        {
            tbView?.setEditing(false, animated: true)
            btnl!.tag = 100
            btnl?.setTitle("Edit", forState: UIControlState.Normal)
        }
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.items!.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView .dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! UITableViewCell
        cell.textLabel!.text = String(format: "%i", indexPath.row+1)
        return cell
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool
    {
        return true
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    {
        self.items?.removeObjectAtIndex(indexPath.row)
        
        tbView?.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Top)
        if (self.items!.count == 0)
        {
            btnl!.userInteractionEnabled = false
        }
        
    }
    
    func tableView(tableView: UITableView,editingStyleForRowAtIndexPath indexPath: NSIndexPath)-> UITableViewCellEditingStyle
    {
        return (UITableViewCellEditingStyle.Delete)
    }
    
    func tableView(tableView: UITableView,canMoveRowAtIndexPath indexPath: NSIndexPath)-> Bool
    {
        return true
    }
    
    func tableView(tableView: UITableView,moveRowAtIndexPath sourceIndexPath: NSIndexPath,toIndexPath destinationIndexPath: NSIndexPath)    {
        tbView?.moveRowAtIndexPath(sourceIndexPath, toIndexPath: destinationIndexPath)
        self.items?.exchangeObjectAtIndex(sourceIndexPath.row, withObjectAtIndex: destinationIndexPath.row)
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        println("row = %d",indexPath.row)
        let sec = SecondViewController(arg: "22222", bgc: UIColor.blueColor())
        self.navigationController?.pushViewController(sec, animated: true)
    }


    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

