//
//  TheaterInfo.m
//  Movie Time
//
//  Created by Russell Gaspard on 6/26/14.
//  Copyright (c) 2014 Russell Gaspard. All rights reserved.
//
/*
 
 Russ Gaspard
 Week 4
 Mobile Development
 MDF2 1406
 
 */

#import "TheaterInfo.h"

@implementation TheaterInfo
@synthesize name, location, image, movies;

//My custom init method
-(id)init
{
    
    self = [super init];
    if (self) {
        movies = [[NSMutableArray alloc] init];
    }
    
    return self;
    
}

@end
