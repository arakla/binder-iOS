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

class AddQueueController: UITableViewController, UITextFieldDelegate {
    
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    @IBOutlet weak var nameField: UITextField!
    
    weak var delegate: AddQueueControllerDelegate?
    
    @IBAction func cancel() {
        delegate?.addQueueControllerDidCancel(self)
    }
    
    @IBAction func done() {
        var queue = Queue()
        queue.name = nameField.text
        queue.start = NSDate()
        delegate?.addQueueController(self, didFinishAddingQueue: queue)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        nameField.becomeFirstResponder()
    }
    
    func textField(nameField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        let oldText: NSString = nameField.text
        let newText: NSString = oldText.stringByReplacingCharactersInRange(range, withString: string)
        
        doneBarButton.enabled = (newText.length > 0)
        return true
    }
}