//
//  dataManager.swift
//  binder-ios
//
//  Created by Aamer Rakla on 12/10/15.
//  Copyright (c) 2015 SCC. All rights reserved.
//

import Foundation

class DataManager {
    
    var organizations = [Organization]()
    
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
    
    class func getForecastDataFromFileWithSuccess(success: ((data: NSData) -> Void)) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
            let filePath = NSBundle.mainBundle().pathForResource("forecast",ofType:"json")
            
            var readError:NSError?
            if let data = NSData(contentsOfFile:filePath!,
                options: NSDataReadingOptions.DataReadingUncached,
                error:&readError) {
                    success(data: data)
            }
        })
    }
    
    func loadOrgData() {
        DataManager.getOrgDataFromFileWithSuccess { (data) -> Void in
            var json = JSON(data: data)
            
            println("\nSwiftyJSON\n")
            println(json["organizations"])
            println(json["organizations"].count)
            if let orgName = json["organizations"][0]["name"].string {
                println("OrgName: \(orgName)")
            }
            
            if let orgShort = json["organizations"][0]["short_name"].string {
                println("OrgShort: \(orgShort)")
            }
            
            if let orgCat = json["organizations"][0]["category"].string {
                println("OrgCat: \(orgCat)")
            }
            
            if let chairName = json["organizations"][0]["booth_chairs"][0]["cached_name"].string {
                println("chairName: \(chairName)")
            }
            
            if let chairPhone = json["organizations"][0]["booth_chairs"][0]["phone_number"].string {
                println("chairPhone: \(chairPhone)")
            }
            
            println("\nEndSwiftyJSON\n")
        }
    }
}