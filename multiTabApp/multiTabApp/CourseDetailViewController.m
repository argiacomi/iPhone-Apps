//
//  CourseDetailViewController.m
//  multiTabApp
//
//  Created by Andrew Giacomi on 3/1/15.
//  Copyright (c) 2015 Andrew Giacomi. All rights reserved.
//

#import "CourseDetailViewController.h"
#import "CourseList.h"

@interface CourseDetailViewController ()

@property (strong, nonatomic) IBOutlet UILabel *className;
@property (strong, nonatomic) IBOutlet UILabel *instructorName;
@property (strong, nonatomic) IBOutlet UILabel *classTime;
@property (strong, nonatomic) IBOutlet UILabel *classRoom;

@end

@implementation CourseDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    NSDictionary *details = self.listDetails;
    
    self.className.text = [details objectForKey:@"title"];
    self.instructorName.text = [details objectForKey:@"instructor"];
    self.classTime.text = [details objectForKey:@"day/time"];
    self.classRoom.text = [details objectForKey:@"room"];

}

@end
