//
//  CalculatorViewController.h
//  CalculatorApp
//
//  Created by William McDermid on 2/4/15.
//  Copyright (c) 2015 William McDermid. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CalculatorViewController : UIViewController{
    IBOutlet UILabel *calculatorDisplay;
    NSString *pressed;
}

- (IBAction)buttonPressed:(id)sender;

@end
