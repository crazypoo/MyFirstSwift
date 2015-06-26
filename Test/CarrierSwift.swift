//
//  CarrierSwift.swift
//  MyFirstSwift
//
//  Created by crazypoo on 15/5/29.
//  Copyright (c) 2015年 P. All rights reserved.
//

import CoreTelephony
import Foundation

class CarrierSwift: NSObject {

    static func currentRadioAccessTechnology()->NSString
    {
        let current = CTTelephonyNetworkInfo()
        return current.currentRadioAccessTechnology!
    }
    
    static func subscriberCellularProvider()->NSMutableDictionary
    {
        let arr = NSMutableDictionary()
        
        let current = CTTelephonyNetworkInfo()
        arr.setObject(current.subscriberCellularProvider!.carrierName!, forKey: "carrierName")
        arr.setObject(current.subscriberCellularProvider!.mobileCountryCode!, forKey: "mobileCountryCode")
        arr.setObject(current.subscriberCellularProvider!.mobileNetworkCode!, forKey: "mobileNetworkCode")
        arr.setObject(current.subscriberCellularProvider!.isoCountryCode!, forKey: "isoCountryCode")
        arr.setObject(current.subscriberCellularProvider!.allowsVOIP, forKey: "allowsVOIP")
        return arr
    }

}
