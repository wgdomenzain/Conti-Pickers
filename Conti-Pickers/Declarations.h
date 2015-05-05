//
//  Declarations.h
//  Conti-Pickers
//
//  Created by Walter Gonzalez Domenzain on 05/05/15.
//  Copyright (c) 2015 Smartplace. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SBJson.h"

//Post status
#define nPostFail       0
#define nPostSuccess    1

//States and capitals
#define     nInitialStates      @"Jalisco", @"Sinaloa",@"Sonora",@"Nayarit",@"Michoacán",nil
#define     nInitialAmerica     @"Mexico", @"Guatemala",@"Sonora",@"Nayarit",@"Michoacán",nil
#define     nInitialEurope      @"España", @"Noruega",@"Sonora",@"Nayarit",nil
#define     nInitialAsia        @"Japón", @"Sinaloa",@"Sonora",@"Nayarit",@"Michoacán",nil

extern  NSMutableArray  *maStates;
extern  NSMutableArray  *maCountries;
extern  NSMutableArray  *maOrderedCountries;
extern  NSMutableArray  *maStudentNames;

@interface Declarations : NSObject

- (void) postService;
- (int) loadService;

@end
