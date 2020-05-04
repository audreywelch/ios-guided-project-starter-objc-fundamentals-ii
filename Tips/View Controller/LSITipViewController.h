//
//  LSITipViewController.h
//  Tips
//
//  Created by Spencer Curtis on 2/6/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import <UIKit/UIKit.h>

// Forward Class Declaration
@class LSITipController;

NS_ASSUME_NONNULL_BEGIN

@interface LSITipViewController : UIViewController

// Public Property

// Dependency injection allows us to pass in the model controller
@property (nonatomic) LSITipController *tipController;

// Public IBOutlet (similar to UITableViewCell's imageView)

// The .h files are public - in most cases we want to protect or encapsulate our data
// so we would put things in our implementation files
// We protect how our code is written so that we can change it when we need to and it won't break someone else's code


@end

NS_ASSUME_NONNULL_END
