//
//  dataManager.swift
//  binder-ios
//
//  Created by Aamer Rakla on 12/10/15.
//  Copyright (c) 2015 SCC. All rights reserved.
//

import Foundation

class DataManager {
    class func getOrgDataFromFileWithSuccess(success: ((data: NSData) -> Void)) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
            let filePath = NSBundle.mainBundle().pathForResource("organizations",ofType:"json")
            
            var readError:NSError?
            if let data = NSData(contentsOfFile:filePath!,
                options: NSDataReadingOptions.DataReadingUncached,
                error:&readError) {
                    success(data: data)
            }
        })
    }
    
    class func getOrgData() {
        DataManager.getOrgDataFromFileWithSuccess { (data) -> Void in
            var json = JSON(data: data)
            
            if let organizations = json["organizations"][0]["name"].string {
                println("Orgs: \(organizations)")
            }
            
//            if let list = json["list"].array {
//                if let tempK = list[0]["main"]["temp"].double {
//                    var tempF = (tempK - 273.15) * 1.8000 + 32.00
//                    println("Temp in K: \(tempK)")
//                    println("Temp in F: \(tempF)")
//                }
//            }
//            
//            if let list = json["list"].array {
//                if let period = list[0]["dt_txt"].string {
//                    let dateFormatter = NSDateFormatter()
//                    dateFormatter.dateFormat = ""
//                    let periodF = dateFormatter.dateFromString(period)
//                    println("Period: \(periodF)")
//                }
//            }
            
//            var orgObj = map(organization){Organization(name: $0, ship: $1)}
            
        }
    }
}