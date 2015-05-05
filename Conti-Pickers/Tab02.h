//
//  Tab02.h
//  Conti-Pickers
//
//  Created by Walter Gonzalez Domenzain on 05/05/15.
//  Copyright (c) 2015 Smartplace. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GAITrackedViewController.h"
#import "Declarations.h"

@interface Tab02 : GAITrackedViewController <UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityView;

//Table
@property (strong, nonatomic) IBOutlet UITableView *tblStudents;


//Variables
@property (nonatomic,strong) Declarations *Declarations;

//Actions
- (IBAction)btnRefreshPressed:(id)sender;


@end
