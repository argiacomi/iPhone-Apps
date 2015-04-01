//
//  CourseList.m
//  Homework 2
//
//  Created by William McDermid on 2/25/15.
//  Copyright (c) 2015 William McDermid. All rights reserved.
//
//  All data used in this file was scraped from the following source:
//      http://www.cis.upenn.edu/current-students/undergraduate/courses/spring.php
//

#import "CourseList.h"

@interface CourseList ()

@property (nonatomic, strong) NSDictionary *courses;

@end

@implementation CourseList

//  List of courses and course titles
/*  NOTE:
    The order in which courses appear here may not be the 
    same order as they appear in the array self.courses.allKeys
 */
- (NSDictionary *)courses {
    if (!_courses) {
        _courses = @{@"CIS-110": @{@"title": @"Intro to Comp Programming",
                                   @"instructor": @"Eaton",
                                   @"day/time": @"MWF 10-11AM",
                                   @"room": @"TOWN 100",
                                   },
                     @"CIS-120": @{@"title": @"Prog Lang and Tech I",
                                   @"instructor": @"Eaton",
                                   @"day/time": @"MWF 11-12PM",
                                   @"room": @"DRLB A1",
                                   },
                     @"CIS-121": @{@"title": @"Prog Lang and Tech II",
                                   @"instructor": @"Gandhi",
                                   @"day/time": @"TR 10:30-12PM",
                                   @"room": @"TOWN 100",
                                   },
                     @"CIS-125": @{@"title": @"Technology and Policy",
                                   @"instructor": @"Blaze",
                                   @"day/time": @"TR 1:30-3PM",
                                   @"room": @"GITTIS 214",
                                   },
                     @"CIS-160": @{@"title": @"Mathematical Found. of Comp. Sci",
                                   @"instructor": @"Tannen",
                                   @"day/time": @"TR 1:30-3PM",
                                   @"room": @"TOWN 100",
                                   },
                     @"CIS-190": @{@"title": @"C++ Prog",
                                   @"instructor": @"Staff",
                                   @"day/time": @"M 12-1:30PM",
                                   @"room": @"TOWN 313",
                                   },
                     @"CIS-191": @{@"title": @"Linux/Unix Skills",
                                   @"instructor": @"Lee",
                                   @"day/time": @"W 1:30-3PM",
                                   @"room": @"TOWN 303",
                                   },
                     @"CIS-192": @{@"title": @"Python Prog",
                                   @"instructor": @"Staff",
                                   @"day/time": @"F 1:30-3PM",
                                   @"room": @"TOWN 303",
                                   },
                     @"CIS-195": @{@"title": @"IPhone App Development",
                                   @"instructor": @"McDermid",
                                   @"day/time": @"W 12-1:30PM",
                                   @"room": @"TOWN 303",
                                   },
                     @"CIS-196": @{@"title": @"Ruby on Rails Web Develp",
                                   @"instructor": @"Staff",
                                   @"day/time": @"M 12-1:30PM",
                                   @"room": @"MOOR 212",
                                   },
                     @"CIS-197": @{@"title": @"Javascript",
                                   @"instructor": @"Staff",
                                   @"day/time": @"F 1:30-3PM",
                                   @"room": @"TOWN 319",
                                   },
                     @"CIS-240": @{@"title": @"Intro To Comp Systems",
                                   @"instructor": @"Farmer",
                                   @"day/time": @"TR 9-10:30AM",
                                   @"room": @"TOWN 100",
                                   },
                     @"CIS-277": @{@"title": @"Intro to Computer Graphics Tech",
                                   @"instructor": @"Brown",
                                   @"day/time": @"TR 3-4:30PM",
                                   @"room": @"TOWN 337",
                                   },
                     @"CIS-320": @{@"title": @"Intro to Algorithms",
                                   @"instructor": @"Khanna",
                                   @"day/time": @"MW 3-4:30PM",
                                   @"room": @"TOWN 100",
                                   },
                     @"CIS-331": @{@"title": @"Intro to Networks & Security",
                                   @"instructor": @"Heninger",
                                   @"day/time": @"TR 10:30-12PM",
                                   @"room": @"MOOR 216",
                                   },
                     @"CIS-334": @{@"title": @"Adv Topics in Algorithms",
                                   @"instructor": @"Guha",
                                   @"day/time": @"TR 1:30-3PM",
                                   @"room": @"TOWN 309",
                                   },
                     @"CIS-341": @{@"title": @"Compilers and Interpreter",
                                   @"instructor": @"Zdancewic",
                                   @"day/time": @"TR 12-1:30PM",
                                   @"room": @"TOWN 321",
                                   },
                     @"CIS-350": @{@"title": @"Software Design/Engineer",
                                   @"instructor": @"Murphy",
                                   @"day/time": @"MW 4:30-6PM",
                                   @"room": @"TOWN 100",
                                   },
                     @"CIS-371": @{@"title": @"Computer Organization and Design",
                                   @"instructor": @"Brown",
                                   @"day/time": @"TR 12-1:30PM",
                                   @"room": @"TOWN 100",
                                   },
                     @"CIS-398": @{@"title": @"Quantum Comp & Info Sci",
                                   @"instructor": @"Mintz",
                                   @"day/time": @"TR 4-6PM",
                                   @"room": @"DRLB 4E9",
                                   },
                     @"CIS-450": @{@"title": @"Database and Info Systems",
                                   @"instructor": @"Davidson",
                                   @"day/time": @"TR 1:30-3PM",
                                   @"room": @"SKIR AUD",
                                   },
                     @"CIS-455": @{@"title": @"Internet and Web Systems",
                                   @"instructor": @"Ives",
                                   @"day/time": @"MWF 11-12PM",
                                   @"room": @"TOWN 100",
                                   },
                     };
    }
    return _courses;
}

// Returns an array of all courses (keys) in the courses dictionary
- (NSArray *)getCourseList {
    return self.courses.allKeys;
}

// Returns the dictionary of details for the course at the specified index
- (NSDictionary *)detailsForCourseAtIndex:(NSString *)index {
    return [self.courses objectForKey:index];
}

// Returns the "title" for the course at the specified index
- (NSArray *)subtitleForCourseAtIndex:(NSString *)index {
    return [[self.courses objectForKey:index] objectForKey:@"title"];
}

@end
