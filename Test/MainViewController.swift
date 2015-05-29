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
    
    convenience init(arg:String,bgc:UIColor){
        self.init()
        self.title = arg
        self.view.backgroundColor = bgc
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        items = NSMutableArray(array: ["Table","Collection"])
        
        creatTbView()
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
        return 2
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView .dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! UITableViewCell
        cell.textLabel!.text = "\(items!.objectAtIndex(indexPath.row))"
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
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}