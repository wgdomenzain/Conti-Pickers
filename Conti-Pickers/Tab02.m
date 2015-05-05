//
//  Tab02.m
//  Conti-Pickers
//
//  Created by Walter Gonzalez Domenzain on 05/05/15.
//  Copyright (c) 2015 Smartplace. All rights reserved.
//

#import "Tab02.h"

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

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger *)section
{
    return u;
}

@end
