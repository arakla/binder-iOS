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
        println("Org Count: \(organizations.count)")
        println("end view did load")
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Segues
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
////        println("In prep for seg")
////        println("Row Index, before 2xif: \(self.tableView.indexPathForSelectedRow()!.row)")
//        if segue.identifier == "showDetail" {
////            println("in Segue if")
////            println("Row Index, pre if: \(self.tableView.indexPathForSelectedRow()!.row)")
//            if let indexPath = self.tableView.indexPathForSelectedRow() {
////                println("Row Index, in if: \(self.tableView.indexPathForSelectedRow()!.row)")
//                let object = organizations[indexPath.row]
//                println(object.name)
//                (segue.destinationViewController as! OrgDetailController).detailItem = object
//            }
//        }
        
        println("In prep for seg")
//        if segue.identifier == "showDetail" {
            println("In show detail")
            if let destination = segue.destinationViewController as? OrgDetailController {
                println("In destVC \(destination.description)")
                if let indexPathRow = tableView.indexPathForSelectedRow()?.row {
                    println("In indexPath: \(indexPathRow)")
                    destination.detailItem = organizations[indexPathRow]
                }
            }
//        }
    
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
        cell.textLabel!.text = object.name
        return cell
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return false
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            organizations.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }
    
    // MARK: - Load Data
    
    func loadOrgData() {
        DataManager.getOrgDataFromFileWithSuccess { (data) -> Void in
            var json = JSON(data: data)
            for var i = 0; i < json["organizations"].count; i++ {
                self.organizations.append(Organization())
                
                if let id = json["organizations"][i]["id"].int {
                    self.organizations[i].binder_id = id
                }

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
        }
    }
    
}

