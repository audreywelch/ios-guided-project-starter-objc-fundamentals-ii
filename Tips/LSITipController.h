//
//  LSITipController.h
//  Tips
//
//  Created by Audrey Welch on 5/3/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import <Foundation/Foundation.h>

// Typically don't want to import .h files into other .h files
// so we use a forward class declaration

// Forward Class Declaration (this class's details will be shared later, but I want to use a placeholder for now)
// Helps with build times being faster
// Helps with classes that need to include each other (import cycle)
@class LSITip; // there's a class that I'm going to declare, called LSITip

NS_ASSUME_NONNULL_BEGIN

@interface LSITipController : NSObject

// Public Properties

// now we can create a property or a method that uses the tip class, saying that I know that it exists, even though it doesn't right now - it will.
@property (nonatomic, readonly) NSArray<LSITip *> *tips;

// Public Methods

- (void)addTip:(LSITip *)tip;

@end

NS_ASSUME_NONNULL_END
