//
//  ViewController.swift
//  binder-ios
//
//  Created by Aamer Rakla on 12/7/15.
//  Copyright (c) 2015 SCC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func OpenBinder(sender: AnyObject) {
        if let url = NSURL(string: "https://binder.springcarnival.org/") {
            UIApplication.sharedApplication().openURL(url)
        }
    }
    
    // MARK: - Segues
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        println("In prep for seg")
        if segue.identifier == "electrical" {
            println("In electrical")
            if let destination = segue.destinationViewController as? QueueController {
                println("In destVC \(destination.description)")
                    destination.queueType = 1
            }
        } else if segue.identifier == "structural" {
            println("In electrical")
            if let destination = segue.destinationViewController as? QueueController {
                println("In destVC \(destination.description)")
                destination.queueType = 2
            }
        } else if segue.identifier == "combined" {
            println("In Combined")
            if let destination = segue.destinationViewController as? QueueController {
                println("In destVC \(destination.description)")
                destination.queueType = 0
            }
        }
        
    }


}

