//
//  Declarations.m
//  Conti-Pickers
//
//  Created by Walter Gonzalez Domenzain on 05/05/15.
//  Copyright (c) 2015 Smartplace. All rights reserved.
//

#import "Declarations.h"

#define     nurlPostService     @"http://ec2-52-11-227-165.us-west-2.compute.amazonaws.com/"


NSMutableArray  *maStates;
NSMutableArray  *maCountries;
NSMutableArray  *maOrderedCountries;

//Jsons variables
NSString        *mstdataPara;
NSDictionary    *jsonResponse;
NSMutableArray  *maStudentNames;

@implementation Declarations

//-------------------------------------------------------------------------------
- (void) postService
{
    NSOperationQueue *queue             = [NSOperationQueue new];
    NSInvocationOperation *operation    = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(loadService) object:nil];
    [queue addOperation:operation];
}
//-------------------------------------------------------------------------------
- (int) loadService
{
    @try
    {
        NSString *post = [[NSString alloc] initWithFormat:@"data=%@", mstdataPara];
        NSLog(@"postService: %@",post);
        post = [post stringByReplacingOccurrencesOfString:@"+" withString:@"%2B"];
        NSLog(@"postService: %@",post);
        NSURL *url = [NSURL URLWithString:nurlPostService];
        NSLog(@"URL postSetUserEmail = %@", url);
        NSData *postData = [post dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
        NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[postData length]];
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
        [request setURL:url];
        [request setHTTPMethod:@"POST"];
        [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
        [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
        [request setHTTPBody:postData];
        [NSURLRequest requestWithURL:url];
        NSError *error = [[NSError alloc] init];
        NSHTTPURLResponse *response = nil;
        NSData *urlData=[NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
//-------------------------------------------------------------------------------
        if ([response statusCode] >=200 && [response statusCode] <300)
        {
            jsonResponse            = [NSJSONSerialization JSONObjectWithData:urlData options:kNilOptions error:&error];
            maStudentNames          = [jsonResponse valueForKey: @"studentName"];
            NSLog(@"jsonResponse = %@", jsonResponse);
            NSLog(@"maStudentNames = %@", maStudentNames);
        }
        else { if (error) { NSLog(@"Error"); return nPostFail;} else { NSLog(@"Conect Fail"); return nPostFail;} }
    }
    @catch (NSException * e) { NSLog(@"Exception"); return nPostFail;}
}
@end
