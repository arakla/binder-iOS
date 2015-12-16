//
//  ViewController.swift
//  binder-ios
//
//  Created by Aamer Rakla on 12/7/15.
//  Copyright (c) 2015 SCC. All rights reserved.
//

import UIKit

class OrganizationController: UITableViewController {
    
    var organizations = [Organization]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        println("In Orgcntrl View Did")
        DataManager.getOrgDataFromFileWithSuccess { (data) -> Void in
            println("Into OrgDataFromFile...")
            var parseError: NSError?
            let parsedObject: AnyObject? = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments, error: &parseError)
            if parseError != nil {
                println("Parse Error")
                return
            }
            println("json Parsed")
            if let jsonDict = parsedObject as? NSDictionary {
                println(jsonDict)
//                let orgDict = jsonDict["organizations"] as! NSDictionary
//                let name = organizations["name"] as? String
//                println("Optional Binding: \(name)")
            }

            
        }
        
//        DataManager.getForecastDataFromFileWithSuccess { (data) -> Void in
//            var parseError: NSError?
//            let parsedObject: AnyObject? = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments, error: &parseError)
//            if parseError != nil {
//                return
//            }
//            
//            println("\nPart 1\n")
//            
//            if let jsonDict = parsedObject as? NSDictionary {
//                //            println(jsonDict)
//                let cityDict = jsonDict["city"] as! NSDictionary
//                let name = cityDict["name"] as? String
//                println("Optional Binding: \(name)")
//            }
//            
//            println("\nProf H\n")
//            
//            // Prof H's answer w/safe unwrap
//            if let forecastStream = parsedObject as? NSDictionary {
//                println("forecast opened")
//                if let city = forecastStream["city"] as? NSDictionary {
//                    println("city found")
//                    if let name = city["name"] as? String {
//                        println("Optional Binding: \(name)")
//                    }
//                    else {
//                        println("failed on name")
//                    }
//                }
//            }
//        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Segues
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow() {
                let object = organizations[indexPath.row]
                (segue.destinationViewController as! OrgDetailController).detailItem = object
            }
        }
    }
    
    // MARK: - Table View
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return organizations.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
        
        let object = organizations[indexPath.row]
        cell.textLabel!.text = object.short_name
        return cell
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return false
    }
    
}

