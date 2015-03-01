//
//  ButtonViewController.m
//  multiTabApp
//
//  Created by Andrew Giacomi on 3/1/15.
//  Copyright (c) 2015 Andrew Giacomi. All rights reserved.
//

#import "ButtonViewController.h"
#import "ScrollViewController.h"

@interface ButtonViewController ()

@end


@implementation ButtonViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


- (IBAction)buttonPressed:(id)sender {

    [self performSegueWithIdentifier:(NSString *)@"pushScrollPicture" sender:sender];
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"pushScrollPicture"]) {
        
        ScrollViewController *vc = [segue destinationViewController];
        NSInteger tagIndex = [(UIButton *)sender tag];
        [vc setSelectedButton:tagIndex];
    }
}


@end