//
//  Calculator.m
//  CalculatorApp
//
//  Created by William McDermid on 2/4/15.
//  Copyright (c) 2015 William McDermid. All rights reserved.
//

#import "Calculator.h"

const NSString *operators = @"+-/X";
const NSString *numbers    = @"0123456789.";
const NSString *memory    = @"MRMCM+";
BOOL lastButtonWasOperator = YES;
int N = 0;


@interface Calculator ()
@property double operand;
@property double calcMemory;
@property double recursive;
@property (nonatomic) NSString *operator;
@property (nonatomic) NSMutableString *display;
@property (nonatomic) NSString *lastButtonPressed;

@end


@implementation Calculator

- init {
    if ((self = [super init])) {
        _display = [NSMutableString stringWithCapacity:20];
        _operator = nil;
    }
    return self;
}

- (void)calculatorOperations:(NSString *)buttonPressed{


    if ([numbers rangeOfString: buttonPressed].length) {
        if (lastButtonWasOperator && ![buttonPressed isEqual:@"."] ) {
            [self.display setString: buttonPressed];
            lastButtonWasOperator = NO;
            _lastButtonPressed = buttonPressed;
        }
        else if (lastButtonWasOperator && [buttonPressed isEqual:@"."] ) {
            [self.display setString: @"0"];
            [self.display appendString: buttonPressed];
            lastButtonWasOperator = NO;
            _lastButtonPressed = buttonPressed;
        }
        else {
            [self.display appendString:buttonPressed];
            _lastButtonPressed = buttonPressed;
        }
    }

    else if ([operators rangeOfString:buttonPressed].length || [buttonPressed isEqual:@"="]) {
        if (N > 0 && ![buttonPressed isEqualToString:@"="]) {
            self.operator = nil;
            N = 0;
        }
        
        if (!self.operator && ![buttonPressed isEqualToString:@"="]) {
            self.operand  = [[self displayValue] doubleValue];
            self.operator = buttonPressed;
            _lastButtonPressed = buttonPressed;
            
        }
        else {
            NSLog (@"%@", self.operator);
            if (self.operator) {
                double operand2 = [[self displayValue] doubleValue];
                
                if (N == 0) {
                    self.recursive = operand2;
                    N++;
                }
                
                if (![buttonPressed isEqual:@"="]) {
                    N = 0;
                    if (_lastButtonPressed == buttonPressed) {
                        
                    }
                        else {
                        if ([self.operator isEqual:@"+"]) {
                            self.operand = self.operand + operand2;
                        }
                        else if ([self.operator isEqual:@"-"]) {
                            self.operand = self.operand - operand2;
                        }
                        else if ([self.operator isEqual:@"X"]) {
                            self.operand = self.operand * operand2;
                        }
                        else if ([self.operator isEqual:@"/"]) {
                            self.operand = self.operand / operand2;
                        }
                        if (self.operand == INFINITY) {
                            [self.display setString:@"Error"];
                            
                        }
                        else {
                            [self.display setString: [@(self.operand) stringValue]];
                        }
                    }
                }
                
                if ([buttonPressed isEqual:@"="]) {
                    
                    NSLog (@"%f", self.recursive);
                    if ([self.operator isEqual:@"+"]) {
                        self.operand = self.operand + self.recursive;
                    }
                    else if ([self.operator isEqual:@"-"]) {
                        self.operand = self.operand - self.recursive;
                    }
                    else if ([self.operator isEqual:@"X"]) {
                        self.operand = self.operand * self.recursive;
                    }
                    else if ([self.operator isEqual:@"/"]) {
                        self.operand = self.operand / self.recursive;
                        NSLog (@"%f",self.operand);
                    }
                    if (self.operand == INFINITY) {
                        [self.display setString:@"Error"];
                        
                    }
                    else {
                        [self.display setString: [@(self.operand) stringValue]];
                    }
                }
                
            }

            self.operator = ([buttonPressed isEqual:@"="])? self.operator : buttonPressed;
        }
        lastButtonWasOperator = YES;
    }

    else if ([buttonPressed isEqual:@"+/-"]) {
        if ([[self displayValue] doubleValue] != 0) {
            double negSwitch  = [[self displayValue] doubleValue];
            negSwitch = negSwitch * -1;
            [self.display setString: [@(negSwitch) stringValue]];
        }

    }
    
    else if ([buttonPressed isEqual:@"%"]) {
        double percentSwitch  = [[self displayValue] doubleValue];
        percentSwitch = percentSwitch / 100;
        [self.display setString: [@(percentSwitch) stringValue]];
    }
    
    else if ([buttonPressed isEqualToString:@"C"]) {
        if (!self.display) {
            self.operator = nil;
        }
        else {
            [self.display setString:@"0"];
        }
        lastButtonWasOperator = YES;
    }
    
}


- (NSString *) displayValue {
    if ([self.display length]) {
        return self.display;
    }
    return @"0";
}

@end
