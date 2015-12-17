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
        println("In ViewDidLoad")
        loadOrgData()
//        DataManager.getOrgDataFromFileWithSuccess { (data) -> Void in
//            var json = JSON(data: data)
//            
//            println(json["organizations"].count)
//            
//            for var i = 0; i < json["organizations"].count; i++ {
////                println("in for loop for load data")
//                self.organizations.append(Organization())
//                
//                if let orgName = json["organizations"][i]["name"].string {
//                    self.organizations[i].name = orgName
////                    println(orgName)
//                }
//                
//                if let orgShort = json["organizations"][i]["short_name"].string {
//                    self.organizations[i].short_name = orgShort
//                }
//                
//                if let orgCat = json["organizations"][i]["category"].string {
//                    self.organizations[i].category = orgCat
//                }
//                
//                if let chairName1 = json["organizations"][i]["booth_chairs"][0]["cached_name"].string {
//                    self.organizations[i].chair1 = chairName1
//                }
//                
//                if let chairPhone1 = json["organizations"][i]["booth_chairs"][0]["phone_number"].string {
//                    self.organizations[i].phone1 = chairPhone1
//                }
//                
//                if let chairName2 = json["organizations"][i]["booth_chairs"][1]["cached_name"].string {
//                    self.organizations[i].chair2 = chairName2
//                }
//                
//                if let chairPhone2 = json["organizations"][i]["booth_chairs"][1]["phone_number"].string {
//                    self.organizations[i].phone2 = chairPhone2
//                }
//                
//                if let chairName3 = json["organizations"][i]["booth_chairs"][2]["cached_name"].string {
//                    self.organizations[i].chair3 = chairName3
//                }
//                
//                if let chairPhone3 = json["organizations"][i]["booth_chairs"][2]["phone_number"].string {
//                    self.organizations[i].phone3 = chairPhone3
//                }
//            }
////            println("Inside DataManager")
////            for var r = 0; r < self.organizations.count; r++ {
////                println(self.organizations[r].name!)
////            }
//        }
        
        println("Data Loaded")
        println("Org Count: \(organizations.count)")
        for var i = 0; i < organizations.count; i++ {
            println(organizations[i].name!)
        }
        println("end view did load")
        // Do any additional setup after loading the view, typically from a nib.
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
    
    // MARK: - Load Data
    
    func loadOrgData() {
        DataManager.getOrgDataFromFileWithSuccess { (data) -> Void in
            var json = JSON(data: data)
            println("Loading Data")
            for var i = 0; i < json["organizations"].count; i++ {
//                println("in for loop for load data")
                self.organizations.append(Organization())

                if let orgName = json["organizations"][i]["name"].string {
                    self.organizations[i].name = orgName
                }
                
                if let orgShort = json["organizations"][i]["short_name"].string {
                    self.organizations[i].short_name = orgShort
                }
                
                if let orgCat = json["organizations"][i]["category"].string {
                    self.organizations[i].category = orgCat
                }
                
                if let chairName1 = json["organizations"][i]["booth_chairs"][0]["cached_name"].string {
                    self.organizations[i].chair1 = chairName1
                }
                
                if let chairPhone1 = json["organizations"][i]["booth_chairs"][0]["phone_number"].string {
                    self.organizations[i].phone1 = chairPhone1
                }
                
                if let chairName2 = json["organizations"][i]["booth_chairs"][1]["cached_name"].string {
                    self.organizations[i].chair2 = chairName2
                }
                
                if let chairPhone2 = json["organizations"][i]["booth_chairs"][1]["phone_number"].string {
                    self.organizations[i].phone2 = chairPhone2
                }
                
                if let chairName3 = json["organizations"][i]["booth_chairs"][2]["cached_name"].string {
                    self.organizations[i].chair3 = chairName3
                }
                
                if let chairPhone3 = json["organizations"][i]["booth_chairs"][2]["phone_number"].string {
                    self.organizations[i].phone3 = chairPhone3
                }
            }
            println("DataMan Fin")
        }
        println("Load fin")
    }
    
}

