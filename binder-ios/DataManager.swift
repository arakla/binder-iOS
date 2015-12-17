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
    
//    class func getOrgDataFromFileWithSuccess(success: ((data: NSData) -> Void)) {
//        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
//            let filePath = NSBundle.mainBundle().pathForResource("organizations",ofType:"json")
//            
//            var readError:NSError?
//            if let data = NSData(contentsOfFile:filePath!,
//                options: NSDataReadingOptions.DataReadingUncached,
//                error:&readError) {
//                    success(data: data)
//            }
//        })
//    }
    
    class func getOrgDataFromFileWithSuccess(success: ((data: NSData) -> Void)) {
        let filePath = NSBundle.mainBundle().pathForResource("organizations",ofType:"json")
        
        var readError:NSError?
        if let data = NSData(contentsOfFile:filePath!,
            options: NSDataReadingOptions.DataReadingUncached,
            error:&readError) {
                success(data: data)
        }
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
    
//    func loadOrgData() {
//        DataManager.getOrgDataFromFileWithSuccess { (data) -> Void in
//            var json = JSON(data: data)
//            
////            println("\nSwiftyJSON\n")
////            println(json["organizations"])
////            println(json["organizations"].count)
//            
//            for var i = 0; i < json["organizations"].count; i++ {
//                
//                self.organizations.append(Organization())
//                
////                println("Org Count: \(self.organizations.count)")
//                
////                println("OrgNumber: \(i)")
//                if let orgName = json["organizations"][i]["name"].string {
////                    println("OrgName: \(orgName)")
//                    self.organizations[i].name = orgName
//                }
//                
//                if let orgShort = json["organizations"][i]["short_name"].string {
////                    println("OrgShort: \(orgShort)")
//                    self.organizations[i].short_name = orgShort
//                }
//                
//                if let orgCat = json["organizations"][i]["category"].string {
////                    println("OrgCat: \(orgCat)")
//                    self.organizations[i].category = orgCat
//                }
//                
//                if let chairName1 = json["organizations"][i]["booth_chairs"][0]["cached_name"].string {
////                    println("chairName1: \(chairName1)")
//                    self.organizations[i].chair1 = chairName1
//                }
//                
//                if let chairPhone1 = json["organizations"][i]["booth_chairs"][0]["phone_number"].string {
////                    println("chairPhone1: \(chairPhone1)")
//                    self.organizations[i].phone1 = chairPhone1
//                }
//                
//                if let chairName2 = json["organizations"][i]["booth_chairs"][1]["cached_name"].string {
////                    println("chairName2: \(chairName2)")
//                    self.organizations[i].chair2 = chairName2
//                }
//                
//                if let chairPhone2 = json["organizations"][i]["booth_chairs"][1]["phone_number"].string {
////                    println("chairPhone2: \(chairPhone2)")
//                    self.organizations[i].phone2 = chairPhone2
//                }
//                
//                if let chairName3 = json["organizations"][i]["booth_chairs"][2]["cached_name"].string {
////                    println("chairName3: \(chairName3)")
//                    self.organizations[i].chair3 = chairName3
//                }
//                
//                if let chairPhone3 = json["organizations"][i]["booth_chairs"][2]["phone_number"].string {
////                    println("chairPhone3: \(chairPhone3)")
//                    self.organizations[i].phone3 = chairPhone3
//                }
//            }
//            
////            println("\nEndSwiftyJSON\n")
//            
////            for var a = 0; a < self.organizations.count; a++ {
////                println(self.organizations[a].name)
////            }
//        }
//    }
}