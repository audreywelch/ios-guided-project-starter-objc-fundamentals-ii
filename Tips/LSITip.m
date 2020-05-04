//
//  LSITip.m
//  Tips
//
//  Created by Audrey Welch on 5/3/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import "LSITip.h"

@implementation LSITip

// If you override both setter/getter or disable them, you need to tell the compiler to still create
// your backing instance variable
// "I have a property called 'name' and I want you to still create an
// instance variable of the form _name
@synthesize name = _name;

- (instancetype)initWithTotal:(double)total
   splitCount:(int)splitCount
tipPercentage:(double)tipPercentage
                         name:(NSString *)name {
    self = [super init];
    if (self) {
        
        // init or dealloc (deinit), we want to use the
        // _underscoreVariableName or assignment
        // This prevents side effects from property didSet/willSet
        _total = total;
        _splitCount = splitCount;
        _tipPercentage = tipPercentage;
        _name = name;
    }
    return self;
}

- (NSString *)name {
    NSLog(@"accessing name");
    
    return _name;
}

@end
