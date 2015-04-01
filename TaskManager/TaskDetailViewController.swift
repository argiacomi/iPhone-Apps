//
//  TaskDetailViewController.swift
//  TaskManager
//
//  Created by Andrew Giacomi on 4/1/15.
//  Copyright (c) 2015 Andrew Giacomi. All rights reserved.
//

import UIKit
import CoreData

class TaskDetailViewController: UIViewController {

    let managedObjectContext = (UIApplication.sharedApplication().delegate as AppDelegate).managedObjectContext
    

    @IBOutlet var txtDesc: UILabel!
    @IBOutlet var txtDeadline: UILabel!
    @IBOutlet var taskComplete: UILabel!
    
    
    var task: Task? = nil

    
    override func viewDidLoad() {
        super.viewDidLoad()
        if task != nil {
            txtDesc.text = task?.desc
            txtDeadline.text = task?.deadline
            if (task?.done != 0) {
                taskComplete.text = "Yes"
            } else {
                taskComplete.text = "No"
            }
        }
    }
    
    @IBAction func back(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if segue.identifier == "edit" {
            let taskController:TaskEditViewController = segue.destinationViewController as TaskEditViewController
            taskController.task = task
            taskController.title = "Edit Task"
        }
        
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
