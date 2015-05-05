//
//  Tab02.m
//  Conti-Pickers
//
//  Created by Walter Gonzalez Domenzain on 05/05/15.
//  Copyright (c) 2015 Smartplace. All rights reserved.
//

#import "Tab02.h"
#import "Declarations.h"
#import "cellTableViewCell.h"

@interface Tab02 ()

@end

@implementation Tab02

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//------------------------------------------------------------------
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.screenName = @"Tab02 Screen";
}

/******************************************************************************
 Table functions
 ******************************************************************************/
//-----------------------------------------
//Table functions
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
//-------------------------------------------------------------------------------
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}
//-------------------------------------------------------------------------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  maStudentNames.count;
}
//-------------------------------------------------------------------------------
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"tableCell");
    static NSString *CellIdentifier = @"tableCell";
    
    cellTableViewCell *cell = (cellTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil)
    {
        cell = [[cellTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.labelcell.text      = maStudentNames[indexPath.row];
    return cell;
}


@end
