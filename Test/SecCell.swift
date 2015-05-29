//
//  SecCell.swift
//  MyFirstSwift
//
//  Created by crazypoo on 15/5/29.
//  Copyright (c) 2015年 P. All rights reserved.
//

import UIKit

class SecCell: UICollectionViewCell {

    var cellTitle : UILabel?
    var cellImage : UIImageView?
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.contentView.layer.borderColor = UIColor.lightGrayColor().CGColor
        self.contentView.layer.borderWidth = 1
        
        cellImage = UIImageView(frame: CGRectMake(0, 0, self.contentView.frame.size.width, 50))
        self.contentView.addSubview(cellImage!)
        
        cellTitle = UILabel(frame: CGRectMake(0, 50, self.contentView.frame.size.width, 20))
        cellTitle!.textAlignment = .Center
        cellTitle!.lineBreakMode = NSLineBreakMode.ByWordWrapping
        cellTitle!.numberOfLines = 0
        cellTitle!.font = UIFont(name: "HelveticaNeue-CondensedBlack", size: 13)
        self.contentView.addSubview(cellTitle!)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
