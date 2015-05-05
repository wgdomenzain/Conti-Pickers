//
//  Tab01.m
//  Conti-Pickers
//
//  Created by Walter Gonzalez Domenzain on 05/05/15.
//  Copyright (c) 2015 Smartplace. All rights reserved.
//

#import "Tab01.h"

NSString    *stSelectedState;

@interface Tab01 ()

@end

@implementation Tab01
//------------------------------------------------------------------
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initController];
}
//------------------------------------------------------------------
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//------------------------------------------------------------------
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.screenName = @"Tab01 Screen";
}
//------------------------------------------------------------------
- (void)initController
{
    self.Declarations       = [[Declarations alloc] init];
    
    maStates                = [NSMutableArray arrayWithObjects: nInitialStates];

    maOrderedCountries      = [[NSMutableArray array] init];
    maOrderedCountries[0]   = [NSMutableArray arrayWithObjects: nInitialAmerica];
    maOrderedCountries[1]   = [NSMutableArray arrayWithObjects: nInitialEurope];
    maOrderedCountries[2]   = [NSMutableArray arrayWithObjects: nInitialAsia];
    
    NSLog(@"maOrderedCountries = %@", maOrderedCountries);
    
    NSLog(@"maOrderedCountries 0 = %d", (int)[maOrderedCountries[0] count]);
    NSLog(@"maOrderedCountries 1 = %d", (int)[maOrderedCountries[1] count]);
    
    
    maOrderedCountries       = [[NSMutableArray arrayWithArray:maOrderedCountries] mutableCopy];
    maOrderedCountries[0][2] = @"Belice";
    maOrderedCountries[1][2] = @"Belice1";
    maOrderedCountries[2][2] = @"Beliced3dedkedkedkejdkjekjdkejkd2";
    
    NSLog(@"maOrderedCountries = %@", maOrderedCountries);
}
//------------------------------------------------------------------
- (IBAction)btnStatePressed:(id)sender
{
    self.lblResult.text = stSelectedState;
    [self.Declarations postService];
}
//------------------------------------------------------------------
- (IBAction)btnDatePressed:(id)sender
{
    /*NSLocale *usLocale          = [[NSLocale alloc] initWithLocaleIdentifier:@"es_MX"];
    NSDate  *pickerDate         = [self.datePicker date];
    NSString *stSelectedDate    = [[NSString alloc] initWithFormat:@"%@", [pickerDate descriptionWithLocale:usLocale]];
    
    self.lblResult.text         = stSelectedDate;
    self.lblResult.adjustsFontSizeToFitWidth = YES;*/
    NSDate *myDate                  = self.datePicker.date;
    NSDateFormatter *dateFormat     = [[NSDateFormatter alloc] init];
    //[dateFormat setDateFormat:@"cccc, MMMM d, hh:mm aa"];
    [dateFormat setDateFormat:@"dd/MM/YY"];
    NSString *stDate                = [dateFormat stringFromDate:myDate];
    self.lblResult.text             = stDate;
}
//------------------------------------------------------------------
#pragma mark -
#pragma mark PickerView DataSource

- (NSInteger)numberOfComponentsInPickerView: (UIPickerView *)pickerView
{
    return 1;
}
//------------------------------------------------------------------
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return maStates.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return maStates[row];
}
//------------------------------------------------------------------
#pragma mark -
#pragma mark PickerView Delegate

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 40;
}
//------------------------------------------------------------------
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    NSLog(@"Picker");
    if (pickerView == self.pickerData)
    {
        stSelectedState = maStates[row];
    }
}

@end
