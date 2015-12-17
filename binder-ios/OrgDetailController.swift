//
//  ViewController.swift
//  binder-ios
//
//  Created by Aamer Rakla on 12/7/15.
//  Copyright (c) 2015 SCC. All rights reserved.
//

import UIKit

class OrgDetailController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        println("In OrgDetail ViewDid")
        println(detailItem?.name)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // outlets go here
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var shortNameLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBOutlet weak var chair1Label: UILabel!
    @IBOutlet weak var phone1Label: UILabel!
    @IBOutlet weak var chair2Label: UILabel!
    @IBOutlet weak var phone2Label: UILabel!
    @IBOutlet weak var chair3Label: UILabel!
    @IBOutlet weak var phone3Label: UILabel!
    
    var detailItem: Organization? {
        didSet {
            // Update the view.
            println("In didSet")
            self.configureView()
        }
    }
    
    @IBAction func callButton1(sender: AnyObject) {
        UIApplication.sharedApplication().openURL(NSURL(string: "tel://\(phone1Label.text)")!)
    }
    
    @IBAction func callButton2(sender: AnyObject) {
        UIApplication.sharedApplication().openURL(NSURL(string: "tel://\(phone2Label.text)")!)
    }
    
    @IBAction func callButton3(sender: AnyObject) {
        UIApplication.sharedApplication().openURL(NSURL(string: "tel://\(phone3Label.text)")!)
    }
    
    func configureView() {
        // Update the user interface for the detail item.
        println("In configView")
        if let detail: Organization = self.detailItem {
            println("In if let detail")
            if let name = self.nameLabel {
                name.text = detail.name
            }
            if let short_name = self.shortNameLabel {
                short_name.text = detail.short_name
            }
            if let status = self.statusLabel {
                status.text = "TEST STATUS"//detail.status
            }
            if let chair1 = self.chair1Label {
                chair1.text = detail.chair1
            }
            if let phone1 = self.phone1Label {
                phone1.text = detail.phone1
            }
            if let chair2 = self.chair2Label {
                chair2.text = detail.chair2
            }
            if let phone2 = self.phone2Label {
                phone2.text = detail.phone2
            }
            if let chair3 = self.chair3Label {
                chair3.text = detail.chair3
            }
            if let phone3 = self.phone3Label {
                phone3.text = detail.phone3
            }
        }
    }
    
}

