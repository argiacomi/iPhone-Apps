//
//  TaskEditViewController.swift
//  TaskManager
//
//  Created by Andrew Giacomi on 4/1/15.
//  Copyright (c) 2015 Andrew Giacomi. All rights reserved.
//

import UIKit
import CoreData

class TaskEditViewController: UIViewController {

    let managedObjectContext = (UIApplication.sharedApplication().delegate as AppDelegate).managedObjectContext
    
    @IBOutlet var txtDesc: UITextField!
    @IBOutlet var txtDeadline: UITextField!
    @IBOutlet var taskComplete: UISwitch!
    
    
    var task: Task? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if task != nil {
            txtDesc.text = task?.desc
            txtDeadline.text = task?.deadline
            if task?.done == 1 {
                taskComplete.on = true
            } else {
                taskComplete.on = false
            }
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if segue.identifier == "AddSubtasks" {

                let subtaskController:SubtaskEditViewController = segue.destinationViewController as SubtaskEditViewController
                subtaskController.task = task
                subtaskController.title = "New Subtask"
        }
        
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String!, sender: AnyObject!) -> Bool {
        if identifier == "AddSubtasks" || identifier == "AddSubtasks" {
            
            if (task == nil) {
                
                let alert = UIAlertView()
                alert.title = "No Description"
                alert.message = "Please Enter Text In The Description"
                alert.addButtonWithTitle("Ok")
                alert.show()
                
                return false
            }
                
            else {
                return true
            }
        }
        
        // by default, transition
        return true
    }
    
    @IBAction func done(sender: AnyObject) {
        if task != nil {
            editTask()
        } else {
            createTask()
        }
        
        if txtDesc.text != "" {
            navigationController?.popToRootViewControllerAnimated(true)
        } else {
            let alert = UIAlertView()
            alert.title = "No Description"
            alert.message = "Please Enter Text In The Description"
            alert.addButtonWithTitle("Ok")
            alert.show()
        }
        
        
    }
    
    @IBAction func cancel(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
    
    
    func createTask() {
        if txtDesc.text != "" {
            let entityDescripition = NSEntityDescription.entityForName("Task", inManagedObjectContext: managedObjectContext!)
            let task = Task(entity: entityDescripition!, insertIntoManagedObjectContext: managedObjectContext)
            task.desc = txtDesc.text
            task.deadline = txtDeadline.text
            task.done = 0
            managedObjectContext?.save(nil)
        }
    }
    
    func editTask() {
        task?.desc = txtDesc.text
        task?.deadline = txtDeadline.text
        if taskComplete.on == true {
            task?.done = 1
        }  else {
            task?.done = 0
        }
        managedObjectContext?.save(nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}