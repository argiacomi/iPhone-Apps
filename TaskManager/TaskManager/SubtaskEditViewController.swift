//
//  SubtaskEditViewController.swift
//  TaskManager
//
//  Created by Andrew Giacomi on 4/1/15.
//  Copyright (c) 2015 Andrew Giacomi. All rights reserved.
//

import UIKit
import CoreData

class SubtaskEditViewController: UIViewController {
    
    let managedObjectContext = (UIApplication.sharedApplication().delegate as AppDelegate).managedObjectContext
    
    @IBOutlet var txtDesc: UITextField!
    @IBOutlet var txtDeadline: UITextField!
    @IBOutlet var taskComplete: UISwitch!
    
    var task: Task? = nil
    var subtask: Subtask? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if subtask != nil {
            txtDesc.text = subtask?.desc
            txtDeadline.text = subtask?.deadline
            if subtask?.done == 1 {
                taskComplete.on = true
            } else if (subtask?.myTask.done != 0) {
                taskComplete.on = true
            } else {
                taskComplete.on = false
            }
        }
    }
    
    @IBAction func done(sender: AnyObject) {
        if subtask != nil {
            editTask()
        } else {
            createTask()
        }
        navigationController?.popToRootViewControllerAnimated(true)
    }
    
    @IBAction func cancel(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
    
    
    func createTask() {
        let entityDescripition = NSEntityDescription.entityForName("Subtask", inManagedObjectContext: managedObjectContext!)
        let subtask = Subtask(entity: entityDescripition!, insertIntoManagedObjectContext: managedObjectContext)
        subtask.myTask = task!
        subtask.desc = txtDesc.text
        subtask.deadline = txtDeadline.text
        subtask.done = 0
        managedObjectContext?.save(nil)
    }
    
    func editTask() {
        subtask?.desc = txtDesc.text
        subtask?.deadline = txtDeadline.text
        if taskComplete.on == true {
            subtask?.done = 1
        } else if subtask?.myTask.done == 1 {
            subtask?.done = 1
        } else {
            subtask?.done = 0
        }
        managedObjectContext?.save(nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
