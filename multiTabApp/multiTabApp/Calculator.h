//
//  Calculator.h
//  CalculatorApp
//
//  Created by Andrew Giacomi on 2/4/15.
//  Copyright (c) 2015 Andrew Giacomi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Calculator : NSObject {
}


- (void) calculatorOperations:(NSString *) buttonPressed;
- (NSString *) displayValue;

@end
