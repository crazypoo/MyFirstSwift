//
//  SecondViewController.swift
//  MyFirstSwift
//
//  Created by crazypoo on 15/5/29.
//  Copyright (c) 2015年 P. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UIAlertViewDelegate {

    convenience init(arg:String,bgc:UIColor){
        self.init()
        self.title = arg
        self.view.backgroundColor = bgc
        
    }
    
    override func viewDidLoad() {
        buildC()

    }
    
    func buildC()
    {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSizeMake(70, 70)
        let paddingY  :CGFloat = 10;
        let paddingX : CGFloat = 5;
        layout.sectionInset = UIEdgeInsetsMake(paddingY, paddingX, paddingY, paddingX);
        layout.minimumLineSpacing = paddingY;
        
        let jobCollection = UICollectionView(frame: CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height), collectionViewLayout: layout)
        jobCollection.backgroundColor = UIColor.whiteColor()
        jobCollection.dataSource = self
        jobCollection.delegate = self
        jobCollection.showsHorizontalScrollIndicator = false
        jobCollection.showsVerticalScrollIndicator = false
        jobCollection.pagingEnabled = false
        jobCollection.registerClass(SecCell.classForCoder(), forCellWithReuseIdentifier: "Cell")
        self.view.addSubview(jobCollection)
        
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! SecCell
        cell.cellTitle!.text = "1111"
        let str:String = "http://112.124.4.216/client/commons/commonAction_viewArchiveFirst.do?systemForm.archive.fileCatalog=SHOP_IMG&systemForm.archive.relationId=2761020"
        let nsurl = NSURL(string: str)
        cell.cellImage!.sd_setImageWithURL(nsurl, placeholderImage: UIImage(named: "1"), completed: nil)

        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        let alert = UIAlertView()
        alert.title = "\(indexPath.row)"
        alert.message = "My message"
        alert.addButtonWithTitle("Ok")
        alert.show()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
