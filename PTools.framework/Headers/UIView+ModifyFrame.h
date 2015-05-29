//
//  UIView+ModifyFrame.h
//
//  Created by Gavin on 19/2/14.
//

/*
 
 Before:
 CGRect frame = myView.frame;
 frame.origin.x = newX;
 myView.frame = frame;
 
 After:
 myView.x = newX;
 
 */

#import <UIKit/UIKit.h>

@interface UIView (Ext)

@property float x;
@property float y;
@property float width;
@property float height;

@property CGPoint origin;
@property CGSize size;

@property float top;
@property float bottom;
@property float left;
@property float right;

@end
