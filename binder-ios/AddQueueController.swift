//
//  AddQueueController.swift
//  binder-ios
//
//  Created by Aamer Rakla on 12/16/15.
//  Copyright (c) 2015 SCC. All rights reserved.
//

import UIKit

protocol AddQueueControllerDelegate: class {
    func addQueueControllerDidCancel(controller: AddQueueController)
    func addQueueController(controller: AddQueueController, didFinishAddingQueue: Queue)
}

class AddQueueController: UITableViewController, UIPickerViewDataSource {
    
    var organizations = [Organization]() //orgs from orgsCtrl
    var orgSelected:String?
    
    // MARK - IB
    
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    @IBOutlet weak var pickerView: UIPickerView!
    
    weak var delegate: AddQueueControllerDelegate?
    
    @IBAction func cancel() {
        delegate?.addQueueControllerDidCancel(self)
    }
    
    @IBAction func done() {
        var queue = Queue()
        queue.name = orgSelected
        queue.start = NSDate()
        delegate?.addQueueController(self, didFinishAddingQueue: queue)
    }
    
    // MARK - view
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        loadOrgData()
        pickerView.becomeFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView = UIPickerView()
        pickerView.dataSource = self
        pickerView.center = view.center
        view.addSubview(pickerView)
    }
    
    // MARK - PickerView Methods
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return organizations.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
            return organizations[row].short_name
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        println("\(organizations[row].short_name) was selected")
        orgSelected = organizations[row].short_name
        doneBarButton.enabled = (orgSelected != nil)
    }
    
    // MARK - Load Orgs
    
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