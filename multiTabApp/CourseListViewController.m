//
//  CourseListViewController.m
//  multiTabApp
//
//  Created by Andrew Giacomi on 3/1/15.
//  Copyright (c) 2015 Andrew Giacomi. All rights reserved.
//

#import "CourseListViewController.h"
#import "CourseList.h"
#import "CourseDetailViewController.h"

@interface CourseListViewController ()
@property (strong) CourseList *cL;

@end

@implementation CourseListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.cL = [[CourseList alloc] init];

}

- (instancetype)init {
    self = [super initWithStyle:UITableViewStylePlain];

    return self;
}

- (instancetype)initWithStyle:(UITableViewStyle)style {
    return [self init];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger numRows = self.cL.getCourseList.count;
    return numRows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"UITableViewCell"];
    
    NSSortDescriptor *sd = [[NSSortDescriptor alloc] initWithKey:nil ascending:YES];
    NSArray *cList = [self.cL.getCourseList sortedArrayUsingDescriptors:@[sd]];
    NSString *detail = [self.cL subtitleForCourseAtIndex:[cList[indexPath.row] description]];
    
    cell.textLabel.text = [cList[indexPath.row] description];
    cell.detailTextLabel.text = detail;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self performSegueWithIdentifier:(NSString *)@"pushCourseDetail" sender:indexPath];
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(NSIndexPath *)indexPath {
    if ([[segue identifier] isEqualToString:@"pushCourseDetail"]) {
        
        CourseDetailViewController *detailViewController = [segue destinationViewController];
        
        NSSortDescriptor *sd = [[NSSortDescriptor alloc] initWithKey:nil ascending:YES];
        NSArray *cList = [self.cL.getCourseList sortedArrayUsingDescriptors:@[sd]];
        NSDictionary *details = [self.cL detailsForCourseAtIndex:[cList[indexPath.row] description]];
        
        detailViewController.listDetails = details;
        detailViewController.title = [cList[indexPath.row] description];
        
        NSLog(@"%@", detailViewController.listDetails);
    }
}

@end
