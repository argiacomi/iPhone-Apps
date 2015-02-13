//
//  CalculatorAppTests.m
//  CalculatorAppTests
//
//  Created by William McDermid on 8/31/14.
//  Copyright (c) 2014 William McDermid. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Calculator.h"

@interface CalculatorAppTests : XCTestCase {
@private
    Calculator *calculator;
}
@end

@implementation CalculatorAppTests

- (void)setUp
{
    [super setUp];
    NSLog(@"%@ setUp", self.name);
    calculator = [[Calculator alloc] init];
    XCTAssertNotNil(calculator, @"Cannot create Calculator instance");
}

- (void)tearDown
{
   NSLog(@"%@ tearDown", self.name);
    [super tearDown];
}

- (void) testAddition {
    NSLog(@"%@ start", self.name);
    [calculator calculatorOperations:@"2"];
    [calculator calculatorOperations:@"+"];
    [calculator calculatorOperations:@"2"];
    [calculator calculatorOperations:@"="];
    XCTAssertTrue([[calculator displayValue] isEqualToString:@"4"], @"");
    NSLog(@"%@ end", self.name);
}

- (void) testSubtraction {
    NSLog(@"%@ start", self.name);   // Use NSLog to generate additional build-results output.
    [calculator calculatorOperations:@"3"];
    [calculator calculatorOperations:@"1"];
    [calculator calculatorOperations:@"-"];
    [calculator calculatorOperations:@"2"];
    [calculator calculatorOperations:@"="];
    XCTAssertTrue([[calculator displayValue] isEqualToString:@"29"], @"");
    NSLog(@"%@ end", self.name);
}

- (void) testDivision {
    NSLog(@"%@ start", self.name);
    [calculator calculatorOperations:@"4"];
    [calculator calculatorOperations:@"1"];
    [calculator calculatorOperations:@"/"];
    [calculator calculatorOperations:@"2"];
    [calculator calculatorOperations:@"="];
    XCTAssertTrue([[calculator displayValue] isEqualToString:@"20.5"], @"");
    NSLog(@"%@ end", self.name);
}

- (void) testMultiplication {
    NSLog(@"%@ start", self.name);
    [calculator calculatorOperations:@"4"];
    [calculator calculatorOperations:@"X"];
    [calculator calculatorOperations:@"1"];
    [calculator calculatorOperations:@"1"];
    [calculator calculatorOperations:@"="];
    XCTAssertTrue([[calculator displayValue] isEqualToString:@"44"], @"");
    NSLog(@"%@ end", self.name);
}

- (void) testNegativeResult {
    NSLog(@"%@ start", self.name);
    [calculator calculatorOperations:@"1"];
    [calculator calculatorOperations:@"1"];
    [calculator calculatorOperations:@"-"];
    [calculator calculatorOperations:@"2"];
    [calculator calculatorOperations:@"3"];
    [calculator calculatorOperations:@"="];
    XCTAssertTrue([[calculator displayValue] isEqualToString:@"-12"], @"");
    NSLog(@"%@ end", self.name);
}

- (void) testClearView {
    NSLog(@"%@ start", self.name);
    [calculator calculatorOperations:@"9"];
    [calculator calculatorOperations:@"+"];
    [calculator calculatorOperations:@"8"];
    [calculator calculatorOperations:@"C"];
    [calculator calculatorOperations:@"9"];
    [calculator calculatorOperations:@"="];
    XCTAssertTrue([[calculator displayValue] isEqualToString:@"18"], @"");
    NSLog(@"%@ end", self.name);
}

- (void) testClearTotal {
    NSLog(@"%@ start", self.name);
    [calculator calculatorOperations:@"C"];
    [calculator calculatorOperations:@"9"];
    [calculator calculatorOperations:@"+"];
    [calculator calculatorOperations:@"7"];
    [calculator calculatorOperations:@"C"];
    [calculator calculatorOperations:@"C"];
    XCTAssertTrue([[calculator displayValue] isEqualToString:@"0"], @"");
    NSLog(@"%@ end", self.name);
}

- (void) testNegation {
    NSLog(@"%@ start", self.name);
    [calculator calculatorOperations:@"8"];
    [calculator calculatorOperations:@"2"];
    [calculator calculatorOperations:@"+/-"];
    [calculator calculatorOperations:@"+"];
    [calculator calculatorOperations:@"8"];
    [calculator calculatorOperations:@"2"];
    [calculator calculatorOperations:@"="];
    XCTAssertTrue([[calculator displayValue] isEqualToString:@"0"], @"");
    NSLog(@"%@ end", self.name);
}

- (void) testModulus {
    NSLog(@"%@ start", self.name);
    [calculator calculatorOperations:@"8"];
    [calculator calculatorOperations:@"0"];
    [calculator calculatorOperations:@"%"];
    [calculator calculatorOperations:@"X"];
    [calculator calculatorOperations:@"1"];
    [calculator calculatorOperations:@"0"];
    [calculator calculatorOperations:@"="];
    XCTAssertTrue([[calculator displayValue] isEqualToString:@"8"], @"");
    NSLog(@"%@ end", self.name);
}

- (void) testAdvancedOne {
    NSLog(@"%@ start", self.name);
    [calculator calculatorOperations:@"5"];
    [calculator calculatorOperations:@"X"];
    [calculator calculatorOperations:@"5"];
    [calculator calculatorOperations:@"="];
    [calculator calculatorOperations:@"="];
    [calculator calculatorOperations:@"+"];
    [calculator calculatorOperations:@"3"];
    [calculator calculatorOperations:@"="];
    [calculator calculatorOperations:@"="];
    XCTAssertTrue([[calculator displayValue] isEqualToString:@"131"], @"");
    NSLog(@"%@ end", self.name);
}

- (void) testAdvancedTwo {
    NSLog(@"%@ start", self.name);
    [calculator calculatorOperations:@"2"];
    [calculator calculatorOperations:@"X"];
    [calculator calculatorOperations:@"="];
    [calculator calculatorOperations:@"="];
    [calculator calculatorOperations:@"="];
    [calculator calculatorOperations:@"="];
    [calculator calculatorOperations:@"="];
    [calculator calculatorOperations:@"="];
    XCTAssertTrue([[calculator displayValue] isEqualToString:@"128"], @"");
    NSLog(@"%@ end", self.name);
}

- (void) testAdvancedThree {
    NSLog(@"%@ start", self.name);
    [calculator calculatorOperations:@"2"];
    [calculator calculatorOperations:@"0"];
    [calculator calculatorOperations:@"+"];
    [calculator calculatorOperations:@"1"];
    [calculator calculatorOperations:@"5"];
    [calculator calculatorOperations:@"="];
    [calculator calculatorOperations:@"="];
    [calculator calculatorOperations:@"="];
    [calculator calculatorOperations:@"="];
    [calculator calculatorOperations:@"="];
    [calculator calculatorOperations:@"="];
    [calculator calculatorOperations:@"="];
    [calculator calculatorOperations:@"="];
    XCTAssertTrue([[calculator displayValue] isEqualToString:@"140"], @"");
    NSLog(@"%@ end", self.name);
}

- (void) testMemoryOne {
    NSLog(@"%@ start", self.name);
    [calculator calculatorOperations:@"2"];
    [calculator calculatorOperations:@"0"];
    [calculator calculatorOperations:@"+"];
    [calculator calculatorOperations:@"1"];
    [calculator calculatorOperations:@"5"];
    [calculator calculatorOperations:@"="];
    [calculator calculatorOperations:@"MS"];
    [calculator calculatorOperations:@"C"];
    [calculator calculatorOperations:@"C"];
    [calculator calculatorOperations:@"5"];
    [calculator calculatorOperations:@"+"];
    [calculator calculatorOperations:@"MR"];
    [calculator calculatorOperations:@"="];
    XCTAssertTrue([[calculator displayValue] isEqualToString:@"40"], @"");
    NSLog(@"%@ end", self.name);
}
- (void) testMemoryTwo {
    NSLog(@"%@ start", self.name);
    [calculator calculatorOperations:@"2"];
    [calculator calculatorOperations:@"+"];
    [calculator calculatorOperations:@"2"];
    [calculator calculatorOperations:@"="];
    [calculator calculatorOperations:@"MS"];
    [calculator calculatorOperations:@"+"];
    [calculator calculatorOperations:@"2"];
    [calculator calculatorOperations:@"="];
    [calculator calculatorOperations:@"+"];
    [calculator calculatorOperations:@"2"];
    [calculator calculatorOperations:@"="];
    [calculator calculatorOperations:@"M+"];
    [calculator calculatorOperations:@"C"];
    [calculator calculatorOperations:@"MR"];
    XCTAssertTrue([[calculator displayValue] isEqualToString:@"12"], @"");
    NSLog(@"%@ end", self.name);
}

- (void) testMemoryThree {
    NSLog(@"%@ start", self.name);
    [calculator calculatorOperations:@"2"];
    [calculator calculatorOperations:@"0"];
    [calculator calculatorOperations:@"+"];
    [calculator calculatorOperations:@"1"];
    [calculator calculatorOperations:@"5"];
    [calculator calculatorOperations:@"="];
    [calculator calculatorOperations:@"MS"];
    [calculator calculatorOperations:@"C"];
    [calculator calculatorOperations:@"C"];
    [calculator calculatorOperations:@"MC"];
    [calculator calculatorOperations:@"5"];
    [calculator calculatorOperations:@"+"];
    [calculator calculatorOperations:@"MR"];
    [calculator calculatorOperations:@"="];
    XCTAssertTrue([[calculator displayValue] isEqualToString:@"5"], @"");
    NSLog(@"%@ end", self.name);
}

@end

