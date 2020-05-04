//
//  LSITip.h
//  Tips
//
//  Created by Audrey Welch on 5/3/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LSITip : NSObject

// What information do we need to store?

// total
// # of people
// percent
// name

// property attribute: (* = default)

// readonly (will not create the setter)
// readwrite*

// copy (used for making copy of data to have our own version, not share with oanother code file)
// assign* (default for primitive types)

// atomic* (set and get happen together)
// nonatomic

@property (readonly, nonatomic) double total;
// 3 things get created the moment we create our property

// 1. setter method is created by compiler
// - (void)setTotal:(double)total;

// 2. getter method is created by compiler
// - (double)total;

// 3. create an instance variable (_total)
// double _total;
// (actual storage location)

@property (readonly, nonatomic) int splitCount;
@property (readonly, nonatomic) double tipPercentage;

// Always use copy with NSString, NSArray, NSSet
// protects data by preventing us from storing something that someone else can modify
@property (readonly, nonatomic, copy) NSString *name;

- (instancetype)initWithTotal:(double)total
                   splitCount:(int)splitCount
                tipPercentage:(double)tipPercentage
                         name:(NSString *)name;

@end

NS_ASSUME_NONNULL_END
