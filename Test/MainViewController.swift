//
//  MainViewController.swift
//  MyFirstSwift
//
//  Created by crazypoo on 15/5/29.
//  Copyright (c) 2015年 P. All rights reserved.
//

import UIKit

class MainViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource
{
    
    var tbView:UITableView?
    var items :NSMutableArray?
    var btnl:UIButton?
    var colorView : UIView?
    
    convenience init(arg:String,bgc:UIColor){
        self.init()
        self.title = arg
        self.view.backgroundColor = bgc
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        items = NSMutableArray(array: ["Table","Collection","HUB","Is Jail Broken?","Color","Call"])
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "iadTap:", name:"BBShowLaunchAdDetailNotification", object: nil)
        
        creatTbView()
    }
    
    func iadTap(object:NSNotification)
    {
//        println(object.object!.objectForKey("projectId"))
        let info:String = object.object!.objectForKey("projectId") as! String
        let alert = UIAlertView()
        alert.title = "\(PCheckHack.isJailBroken())"
        alert.message = "\(info)"
        alert.addButtonWithTitle("Ok")
        alert.show()
    }
    func creatTbView()
    {
        tbView = UITableView(frame: CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height), style: .Plain)
        tbView!.delegate = self
        tbView!.dataSource = self
        tbView!.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(tbView!)
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 6
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView .dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! UITableViewCell
        cell.textLabel!.text = "\(items!.objectAtIndex(indexPath.row))"
        if indexPath.row == 4
        {
            colorView = UIView(frame:CGRectMake(100, 0, 100, cell.contentView.frame.size.height))
            colorView!.backgroundColor = UIColor.randomColor()
            cell.contentView.addSubview(colorView!)
        }
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        return cell
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        if indexPath.row == 0
        {
            let sec = ViewController(arg: "Table", bgc: UIColor.blueColor())
            self.navigationController?.pushViewController(sec, animated: true)

        }
        else if indexPath.row == 1
        {
            let sec = SecondViewController(arg: "Collection", bgc: UIColor.blueColor())
            self.navigationController?.pushViewController(sec, animated: true)
        }
        else if indexPath.row == 2
        {
            WMHub .show()
            NSTimer.scheduledTimerWithTimeInterval(3.0, target:self, selector:"stopHub", userInfo:nil, repeats:false)
        }
        else if indexPath.row == 3
        {
            let alert = UIAlertView()
            alert.title = "\(PCheckHack.isJailBroken())"
            alert.message = "My message"
            alert.addButtonWithTitle("Ok")
            alert.show()
        }
        
        else if indexPath.row == 5
        {
            PooPhoneBlock.callPhoneNumber("13422781561", call: nil, cancel: nil)
        }
        
    }
    
    func stopHub(){
        WMHub.hide()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}