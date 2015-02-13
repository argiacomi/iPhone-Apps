//
//  CalculatorViewController.m
//  CalculatorApp
//
//  Created by William McDermid on 2/4/15.
//  Copyright (c) 2015 William McDermid. All rights reserved.
//

#import "CalculatorViewController.h"
#import "Calculator.h"

int i = 0;

@interface CalculatorViewController ()
@property (strong) Calculator *calculator;
@property (strong, nonatomic) IBOutlet UIButton *clearButton;

@end


@implementation CalculatorViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.calculator = [[Calculator alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)buttonPressed:(id)sender {
    
    UIButton *buttonPressed = (UIButton *)sender;
    pressed = buttonPressed.titleLabel.text;
    
    NSLog (@"%@", buttonPressed.titleLabel.text);
    if ([buttonPressed.titleLabel.text isEqual: @"AC"] || [buttonPressed.titleLabel.text isEqual: @"C"]) {
        [self.clearButton setTitle:@"AC" forState:UIControlStateNormal];
        i = 0;
    }
    else if (i == 0 && [buttonPressed.titleLabel.text isEqual: @"0"]) {
        [self.clearButton setTitle:@"AC" forState:UIControlStateNormal];
    }
    else {
        i++;
        if (i > 0) {
            [self.clearButton setTitle:@"C" forState:UIControlStateNormal];
        }
    }
    
    
    [self.calculator calculatorOperations:pressed];
    calculatorDisplay.text = [self.calculator displayValue];
    
}


@end