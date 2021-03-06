//
//  LSITipViewController.m
//  Tips
//
//  Created by Spencer Curtis on 2/6/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

#import "LSITipViewController.h"
#import "LSITip.h" // ONLY IMPORT .H FILES!
#import "LSITipController.h"

// Class Extension

// Conform to delegate protocols in the .m file using the Class Extension
@interface LSITipViewController () <UITableViewDelegate, UITableViewDataSource>

// Private Properties
@property (nonatomic) double total;
@property (nonatomic) int split;
@property (nonatomic) double percentage;
@property (nonatomic) double tip;

// Private IBOutlets
@property (strong, nonatomic) IBOutlet UITextField *totalTextField;
@property (strong, nonatomic) IBOutlet UILabel *splitLabel;
@property (strong, nonatomic) IBOutlet UILabel *tipLabel;
@property (strong, nonatomic) IBOutlet UILabel *percentageLabel;
@property (strong, nonatomic) IBOutlet UIStepper *splitStepper;
@property (strong, nonatomic) IBOutlet UISlider *percentageSlider;
@property (strong, nonatomic) IBOutlet UITableView *tableView;


// Private Methods

@end

@implementation LSITipViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    LSITip *tip = [[LSITip alloc] initWithTotal:84.45 splitCount:2 tipPercentage:20 name:@"Brick oven pizza"];
    
    // Prints out the property name
    // Under the hood it's accessing the accessor method, which is a name
    NSLog(@"Tip: %@", tip.name);
    
//    tip.name = @"Tacos";
//    NSLog(@"Tip: %@", tip.name);
    
    NSLog(@"Tip Percentage: %0.2f", tip.tipPercentage);
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
}

// Lazy Property (getter)
- (LSITipController *)tipController {
    // if true, initialize it
    if (!_tipController) { // if _tipController != nil {
        _tipController = [[LSITipController alloc] init];
    }
    
    // return instance variable/object
    return _tipController;
}

// Calculate the tip using the values from the UI
- (void)calculateTip {
    self.percentage = round(self.percentageSlider.value);
    self.total = [self.totalTextField.text doubleValue];
    self.split = self.splitStepper.value;
    
    self.tip = self.total * (self.percentage / 100.0) / self.split;
    
    [self updateViews];
}

- (void)updateViews {
    // TODO: Use the model data to update the views
    
    self.splitStepper.value = self.split;
    self.percentageSlider.value = self.percentage;
    self.totalTextField.text = [NSString stringWithFormat:@"%.2f", self.total];
    
    self.tipLabel.text = [NSString stringWithFormat:@"$%.2f", self.tip];
    self.splitLabel.text = [NSString stringWithFormat:@"%d", self.split];
    
    // %% = % for output
    self.percentageLabel.text = [NSString stringWithFormat:@"%0.0f%%", self.percentage];
}

- (void)saveTipNamed:(NSString *)name {
    
    // TODO: Save the tip to the controller and update tableview

}

// MARK: - IBActions

- (IBAction)splitChanged:(UIStepper *)sender {
    self.split = round(self.splitStepper.value);
    [self calculateTip];
}

- (IBAction)sliderChanged:(UISlider *)sender {
    self.percentage = round(self.percentageSlider.value);
    [self calculateTip];
}

- (IBAction)saveTipButtonPressed:(UIButton *)sender {
    [self showSaveTipAlert];
}

// MARK: - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.tipController.tips.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TipCell" forIndexPath:indexPath];
    
    LSITip *tip = self.tipController.tips[indexPath.row];
    
    cell.textLabel.text = tip.name;
    
    return cell;
}

// MARK: - UITableViewDelegate

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

// TODO: Load the selected tip from the controller

//}

// MARK: - Alert Helper

- (void)showSaveTipAlert {
    UIAlertController *alert = [UIAlertController
                                alertControllerWithTitle:@"Save Tip"
                                message:@"What name would you like to give to this tip?"
                                preferredStyle:UIAlertControllerStyleAlert];
    
    
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"Tip Name:";
    }];
    
    UIAlertAction *saveAction = [UIAlertAction actionWithTitle:@"Save"
                                                         style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        NSString *name = [[alert.textFields firstObject] text];
        if (name.length > 0) {
            [self saveTipNamed: name];
        }
    }];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel"
                                                           style:UIAlertActionStyleCancel
                                                         handler:nil];
    
    [alert addAction:saveAction];
    [alert addAction:cancelAction];
    
    [self presentViewController:alert animated:YES completion:nil];
}

@end
