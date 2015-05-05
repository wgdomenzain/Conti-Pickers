//
//  Tab01.h
//  Conti-Pickers
//
//  Created by Walter Gonzalez Domenzain on 05/05/15.
//  Copyright (c) 2015 Smartplace. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Declarations.h"
#import "GAITrackedViewController.h"

@interface Tab01 : GAITrackedViewController <UIPickerViewDelegate, UIPickerViewDataSource>

//Labels
@property (strong, nonatomic) IBOutlet UILabel *lblResult;

//Pickers
@property (strong, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (strong, nonatomic) IBOutlet UIPickerView *pickerData;

//Actions
- (IBAction)btnStatePressed:(id)sender;
- (IBAction)btnDatePressed:(id)sender;

@end
