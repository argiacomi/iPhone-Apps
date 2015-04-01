//
//  CourseList.h
//  Homework 2
//
//  Created by William McDermid on 2/25/15.
//  Copyright (c) 2015 William McDermid. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CourseList : NSObject

// Returns an array of all courses (keys) in the courses dictionary
- (NSArray *)getCourseList;

// Returns the dictionary of details for the course at the specified index
- (NSDictionary *)detailsForCourseAtIndex:(NSString *)index;

// Returns the "subtitle" for the course at the specified index
- (NSString *)subtitleForCourseAtIndex:(NSString *)index;

@end
