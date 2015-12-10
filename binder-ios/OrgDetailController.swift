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
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // outlets go here
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var chair1Label: UILabel!
    @IBOutlet weak var phone1Label: UILabel!
    @IBOutlet weak var chairwLabel: UILabel!
    @IBOutlet weak var phone2Label: UILabel!
    @IBOutlet weak var chair3Label: UILabel!
    @IBOutlet weak var phone3Label: UILabel!
    
    var detailItem: Organization? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }
    
    func configureView() {
        // Update the user interface for the detail item.
        if let detail: Organization = self.detailItem {
            if let name = self.nameLabel {
                name.text = detail.name
            }
            if let status = self.statusLabel {
                status.text = detail.status
            }
            if let phone1 = self.phone1Label {
                phone1.text = detail.phone1
            }
        }
    }
    
}

