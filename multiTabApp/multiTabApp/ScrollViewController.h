//
//  ScrollViewController.h
//  multiTabApp
//
//  Created by Andrew Giacomi on 3/1/15.
//  Copyright (c) 2015 Andrew Giacomi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScrollViewController : UIViewController <UIScrollViewDelegate>
{
    NSInteger selectedButton;
    UIImage *image;
}

@property (nonatomic) NSInteger selectedButton;

@end



