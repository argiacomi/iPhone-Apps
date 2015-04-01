//
//  SubtaskManagerViewController.swift
//  TaskManager
//
//  Created by Andrew Giacomi on 4/1/15.
//  Copyright (c) 2015 Andrew Giacomi. All rights reserved.
//

import UIKit
import CoreData

class SubtaskManagerViewController: UITableViewController, NSFetchedResultsControllerDelegate {

    let managedObjectContext = (UIApplication.sharedApplication().delegate as AppDelegate).managedObjectContext
    
    var parentTask: Task? = nil
    var fetchedResultController: NSFetchedResultsController = NSFetchedResultsController()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchedResultController = getFetchedResultController()
        fetchedResultController.delegate = self
        fetchedResultController.performFetch(nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if segue.identifier == "edit" {
            let subtaskController:SubtaskEditViewController = segue.destinationViewController as SubtaskEditViewController
            subtaskController.task = parentTask
        }
        
        if segue.identifier == "details" {
            let cell = sender as UITableViewCell
            let indexPath = tableView.indexPathForCell(cell)
            let taskController:SubtaskDetailViewController = segue.destinationViewController as SubtaskDetailViewController
            let subtask:Subtask = fetchedResultController.objectAtIndexPath(indexPath!) as Subtask
            taskController.subtask = subtask
            taskController.title = subtask.desc
        }
        
    }
    
    @IBAction func back(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
    

    
    func getFetchedResultController() -> NSFetchedResultsController {
        fetchedResultController = NSFetchedResultsController(fetchRequest: taskFetchRequest(), managedObjectContext: managedObjectContext!, sectionNameKeyPath: nil, cacheName: nil)
        return fetchedResultController
    }
    
    func taskFetchRequest() -> NSFetchRequest {
        let fetchRequest = NSFetchRequest(entityName: "Subtask")
        let resultPredicate = NSPredicate(format: "myTask = %@", parentTask!)
        let sortDescriptor = NSSortDescriptor(key: "desc", ascending: true)
        fetchRequest.predicate = resultPredicate
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
        var cell = tableView.dequeueReusableCellWithIdentifier("SubCell", forIndexPath: indexPath) as UITableViewCell
        let task = fetchedResultController.objectAtIndexPath(indexPath) as Subtask
        if task.done == 1 {
            let string = task.desc as NSString
            var attributedString = NSMutableAttributedString(string: string)
            let attribute = [NSForegroundColorAttributeName: UIColor.redColor(), NSStrikethroughStyleAttributeName: 1]
            attributedString.addAttributes(attribute, range: string.rangeOfString(string))
            cell.textLabel?.attributedText = attributedString
        } else if task.myTask.done == 1{
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

