//
//  LSITipController.m
//  Tips
//
//  Created by Audrey Welch on 5/3/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import "LSITipController.h"
#import "LSITip.h"

// Class Extension (Private properties, instance variables, methods)
@interface LSITipController ()

// All properties and variables will default to nil, 0 or NO

// Private Properties
@property (nonatomic) NSMutableArray<LSITip *> *internalTips;

// Private methods

@end


@implementation LSITipController

// Override default initializer
- (instancetype)init {
    self = [super init];
    if (self) {
        
        _internalTips = [[NSMutableArray alloc] init];
        
    }
    return self;
}

// Create a computed property for the tips property, so that no
// one modifies the collection without using our addTip/removeTip methods

// Override
- (NSArray<LSITip *> *)tips {
    // always use _insanceVariableName in your setter/getter property methods to prevent an infinite loop
    return [_internalTips copy]; // Copy on Write (COW)
}

- (void)addTip:(LSITip *)tip {
    
    // the following are equivalent:
    
    // Use the dot syntax anytime you're not in an init/dealloc/setter/getter
    [self.internalTips addObject:tip];
    
    // Alternative Syntax: method calling syntax
    // [[self internalTips] addObject:tip];
}

@end
