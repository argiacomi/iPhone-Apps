//
//  Subtask.swift
//  TaskManager
//
//  Created by Andrew Giacomi on 4/1/15.
//  Copyright (c) 2015 Andrew Giacomi. All rights reserved.
//

import Foundation
import CoreData

class Subtask: NSManagedObject {

    @NSManaged var desc: String
    @NSManaged var deadline: String
    @NSManaged var done: NSNumber
    @NSManaged var myTask: Task

}
