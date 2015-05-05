//
//  Tab02.m
//  Conti-Pickers
//
//  Created by Walter Gonzalez Domenzain on 05/05/15.
//  Copyright (c) 2015 Smartplace. All rights reserved.
//

#import "Tab02.h"
#import "cellTableViewCell.h"

@interface Tab02 ()

@end

@implementation Tab02

- (void)viewDidLoad {
    [super viewDidLoad];
    self.Declarations       = [[Declarations alloc] init];
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


- (IBAction)btnRefreshPressed:(id)sender
{
//-------------------------------------------------------------------------------
//Get post
    [self.activityView startAnimating];
    NSOperationQueue *queue                 = [NSOperationQueue new];
    
    NSInvocationOperation *opGetData        = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(getPost) object:nil];
    [queue addOperation:opGetData];
    
    NSInvocationOperation *opDoneGetData    = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(donePost) object:nil];
    [opDoneGetData addDependency:opGetData];
    [queue addOperation:opDoneGetData];
}
//-------------------------------------------------------------------------------
- (void)getPost
{
    [self.Declarations loadService];
}
//-------------------------------------------------------------------------------
- (void)donePost
{
    [self.tblStudents reloadData];
    [self.activityView stopAnimating];
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
