//
//  TwitterPostInfo.m
//  accountsTest
//
//  Created by Russell Gaspard on 6/5/14.
//  Copyright (c) 2014 Russell Gaspard. All rights reserved.
//
/*
 
 Russ Gaspard
 Week 1
 Mobile Development
 MDF2 1406
 
 */

#import "TwitterPostInfo.h"

@implementation TwitterPostInfo
@synthesize dateTime, userScreenName, userDescription, posterName, tweetText;

-(id)initWithPostInfo:(NSString*)screenName userDesc:(NSString*)userDesc poster:(NSString*)poster text:(NSString*)text dateTimeInfo:(NSString*)dateTimeInfo
{
    
    if (self == [super init])  //(self = [super init])
    {
        userScreenName = [screenName copy];
        userDescription = [userDesc copy];
        posterName = [poster copy];
        tweetText = [text copy];
        dateTime = [dateTimeInfo copy];
    }
    return self;
}

@end
