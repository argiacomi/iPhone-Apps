//
//  SubtaskDetailViewController.swift
//  TaskManager
//
//  Created by Andrew Giacomi on 4/1/15.
//  Copyright (c) 2015 Andrew Giacomi. All rights reserved.
//

import UIKit
import CoreData

class SubtaskDetailViewController: UIViewController {
    
    let managedObjectContext = (UIApplication.sharedApplication().delegate as AppDelegate).managedObjectContext
    
    
    @IBOutlet var txtDesc: UILabel!
    @IBOutlet var optDeadline: UILabel!
    @IBOutlet var subtaskComplete: UILabel!
    
    
    var subtask: Subtask? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if subtask != nil {
            txtDesc.text = subtask?.desc
            optDeadline.text = subtask?.deadline
            if (subtask?.done != 0) {
                subtaskComplete.text = "Yes"
            } else if (subtask?.myTask.done != 0) {
                subtaskComplete.text = "Yes"
            } else {
                subtaskComplete.text = "No"
            }
        }
    }
    
    @IBAction func back(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if segue.identifier == "edit" {
            let subtaskController:SubtaskEditViewController = segue.destinationViewController as SubtaskEditViewController
            subtaskController.subtask = subtask
            subtaskController.title = "Edit Subtask"
        }
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
