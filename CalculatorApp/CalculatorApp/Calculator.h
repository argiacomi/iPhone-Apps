//
//  Calculator.h
//  CalculatorApp
//
//  Created by William McDermid on 2/4/15.
//  Copyright (c) 2015 William McDermid. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Calculator : NSObject {
}


- (void) calculatorOperations:(NSString *) buttonPressed;
- (NSString *) displayValue;

@end
