//
//  dataManager.swift
//  binder-ios
//
//  Created by Aamer Rakla on 12/10/15.
//  Copyright (c) 2015 SCC. All rights reserved.
//

import Foundation

class DataManager {
    class func getForecastDataFromFileWithSuccess(success: ((data: NSData) -> Void)) {
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
}