//
//  NSDecimalNumberBugTests.m
//  NSDecimalNumberBugTests
//
//  Created by Lane Roathe on 6/1/17.
//  Copyright © 2017 Quicken, Inc. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface NSDecimalNumberBugTests : XCTestCase

@end

@implementation NSDecimalNumberBugTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testBug {
    NSArray *strings =
    @[
      @"0",                     // validation tests
      @"1",
      @"1.8446744073709551615", // 64/65 bit tests (radar 32520109)
      @"1.8446744073709551616",
      @"9.821426272392280061",  // radar 25465729 tests
      @"9.821426272392280060",
      ];

    for (NSString *string in strings)
    {
        NSDecimalNumber *v = [NSDecimalNumber decimalNumberWithString:string];
        double expectedDouble = v.doubleValue;
        XCTAssertEqual(v.charValue,             (char)expectedDouble);
        XCTAssertEqual(v.unsignedCharValue,     (unsigned char)expectedDouble);
        XCTAssertEqual(v.shortValue,            (short)expectedDouble);
        XCTAssertEqual(v.unsignedShortValue,    (unsigned short)expectedDouble);
        XCTAssertEqual(v.intValue,              (int)expectedDouble);
        XCTAssertEqual(v.unsignedIntValue,      (unsigned int)expectedDouble);
        XCTAssertEqual(v.longValue,             (long)expectedDouble);
        XCTAssertEqual(v.unsignedLongValue,     (unsigned long)expectedDouble);
        XCTAssertEqual(v.longLongValue,         (long long)expectedDouble);
        XCTAssertEqual(v.unsignedLongLongValue, (unsigned long long)expectedDouble);

        XCTAssertEqual(v.floatValue,            (float)expectedDouble);

        XCTAssertEqual(v.boolValue,             (BOOL)expectedDouble);
        XCTAssertEqual(v.integerValue,          (NSInteger)expectedDouble);
        XCTAssertEqual(v.unsignedIntegerValue,  (NSUInteger)expectedDouble);
    }
}

@end
