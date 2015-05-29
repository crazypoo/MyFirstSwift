//
//  PooSystemInfo.h
//  WNMPro
//
//  Created by crazypoo on 1/8/14.
//  Copyright (c) 2014 鄧傑豪. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sys/socket.h>
#import <sys/types.h>
#import <sys/sysctl.h>
//#import <SystemConfiguration/SystemConfiguration.h>

@interface PooSystemInfo : NSObject
+(NSString*)getDeviceVersion;
+ (NSString *) platformString;
+(BOOL)isRetinaDevice;
@end
