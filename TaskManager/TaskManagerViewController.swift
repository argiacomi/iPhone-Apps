//
//  TaskManagerViewController.swift
//  TaskManager
//
//  Created by Andrew Giacomi on 4/1/15.
//  Copyright (c) 2015 Andrew Giacomi. All rights reserved.
//

import UIKit
import CoreData

class TaskManagerViewController: UITableViewController, NSFetchedResultsControllerDelegate {
    
    let managedObjectContext = (UIApplication.sharedApplication().delegate as AppDelegate).managedObjectContext
    
    var fetchedResultController: NSFetchedResultsController = NSFetchedResultsController()

    override func viewDidLoad() {
        super.viewDidLoad()

        fetchedResultController = getFetchedResultController()
        fetchedResultController.delegate = self
        fetchedResultController.performFetch(nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if segue.identifier == "details" {
            let indexPath = sender as NSIndexPath
            let taskController:TaskDetailViewController = segue.destinationViewController as TaskDetailViewController
            let task:Task = fetchedResultController.objectAtIndexPath(indexPath) as Task
            taskController.task = task
            taskController.title = task.desc
        }
        
        else if segue.identifier == "ShowSubtasks" {
            let cell = sender as UITableViewCell
            let indexPath = tableView.indexPathForCell(cell)
            let subtaskController:SubtaskManagerViewController = segue.destinationViewController as SubtaskManagerViewController
            let task:Task = fetchedResultController.objectAtIndexPath(indexPath!) as Task
            subtaskController.parentTask = task
            subtaskController.title = task.desc
        }
        
    }
    
    override func tableView(tableView: UITableView, accessoryButtonTappedForRowWithIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("details", sender: indexPath)
        
    }
    
    func getFetchedResultController() -> NSFetchedResultsController {
        fetchedResultController = NSFetchedResultsController(fetchRequest: taskFetchRequest(), managedObjectContext: managedObjectContext!, sectionNameKeyPath: nil, cacheName: nil)
        return fetchedResultController
    }
    
    func taskFetchRequest() -> NSFetchRequest {
        let fetchRequest = NSFetchRequest(entityName: "Task")
        let sortDescriptor = NSSortDescriptor(key: "desc", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        return fetchRequest
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // #pragma mark - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        let numberOfSections = fetchedResultController.sections?.count
        return numberOfSections!
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let numberOfRowsInSection = fetchedResultController.sections?[section].numberOfObjects
        return numberOfRowsInSection!
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        let task = fetchedResultController.objectAtIndexPath(indexPath) as Task
        println(task.done)
        if task.done == 1 {
            let string = task.desc as NSString
            var attributedString = NSMutableAttributedString(string: string)
            let attribute = [NSForegroundColorAttributeName: UIColor.redColor(), NSStrikethroughStyleAttributeName: 1]
            attributedString.addAttributes(attribute, range: string.rangeOfString(string))
            cell.textLabel?.attributedText = attributedString
        } else {
            let string = task.desc as NSString
            var attributedString = NSMutableAttributedString(string: string)
            let attribute = [NSForegroundColorAttributeName: UIColor.blackColor()]
            attributedString.addAttributes(attribute, range: string.rangeOfString(string))
            cell.textLabel?.attributedText = attributedString
        }
        return cell
    }
    
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        let managedObject:NSManagedObject = fetchedResultController.objectAtIndexPath(indexPath) as NSManagedObject
        managedObjectContext?.deleteObject(managedObject)
        managedObjectContext?.save(nil)
    }
    
    func controllerDidChangeContent(controller: NSFetchedResultsController!) {
        tableView.reloadData()
    }
}
