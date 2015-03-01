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
const NSString *memory    = @"MSMRMCM+";
BOOL lastButtonWasOperator = YES;
int n = 0;


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
        else if ([_lastButtonPressed isEqual: @"0"] && [[self displayValue] doubleValue] == 0){
            [self.display setString:buttonPressed];
            _lastButtonPressed = buttonPressed;
        }
        else {
            [self.display appendString:buttonPressed];
            _lastButtonPressed = buttonPressed;
        }
    }
    
    else if ([operators rangeOfString:buttonPressed].length || [buttonPressed isEqual:@"="]) {
        if (n > 0 && ![buttonPressed isEqualToString:@"="]) {
            self.operator = nil;
            n = 0;
        }
        
        if (!self.operator && ![buttonPressed isEqualToString:@"="]) {
            self.operand  = [[self displayValue] doubleValue];
            self.operator = buttonPressed;
            _lastButtonPressed = buttonPressed;
            
        }
        else {
            if (self.operator) {
                double operand2 = [[self displayValue] doubleValue];
                
                if (n == 0) {
                    self.recursive = operand2;
                    n++;
                }
                
                if (![buttonPressed isEqual:@"="]) {
                    n = 0;
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
        [self.display setString:@"0"];
        lastButtonWasOperator = YES;
        n = 0;
    }
    
    else if ([buttonPressed isEqualToString:@"AC"]) {
        [self.display setString:@"0"];
        self.operator = nil;
        lastButtonWasOperator = YES;
        n = 0;
    }
    
    else if ([memory rangeOfString: buttonPressed].length) {
        if ([buttonPressed isEqual:@"MS"]) {
            self.calcMemory = [[self displayValue] doubleValue];
        }
        if ([buttonPressed isEqual:@"M+"]) {
            self.calcMemory = self.calcMemory + [[self displayValue] doubleValue];
        }
        else if ([buttonPressed isEqual:@"MR"]) {
            [self.display setString: [@(self.calcMemory) stringValue]];
        }
        else if ([buttonPressed isEqual:@"MC"]) {
            self.calcMemory = 0;
        }
    }
}


- (NSString *) displayValue {
    if ([self.display length]) {
        return self.display;
    }
    return @"0";
}

@end
