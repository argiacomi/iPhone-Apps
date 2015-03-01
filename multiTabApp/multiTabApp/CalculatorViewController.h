//
//  CalculatorViewController.h
//  CalculatorApp
//
//  Created by Andrew Giacomi on 2/4/15.
//  Copyright (c) 2015 Andrew Giacomi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CalculatorViewController : UIViewController{
    IBOutlet UILabel *calculatorDisplay;
    NSString *pressed;
}

- (IBAction)buttonPressed:(id)sender;

@end
