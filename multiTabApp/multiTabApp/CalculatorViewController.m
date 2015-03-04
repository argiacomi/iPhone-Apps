//
//  CalculatorViewController.m
//  CalculatorApp
//
//  Created by Andrew Giacomi on 3/1/15.
//  Copyright (c) 2015 Andrew Giacomi. All rights reserved.
//

#import "CalculatorViewController.h"
#import "Calculator.h"

int i = 0;

@interface CalculatorViewController ()
@property (strong) Calculator *calculator;

@end


@implementation CalculatorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	self.calculator = [[Calculator alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)buttonPressed:(id)sender {

    UIButton *buttonPressed = (UIButton *)sender;
    pressed = buttonPressed.titleLabel.text;
    
    [self.calculator calculatorOperations:pressed];
    calculatorDisplay.text = [self.calculator displayValue];

}


@end
