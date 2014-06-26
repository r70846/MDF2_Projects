//
//  TheaterInfo.h
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

#import <Foundation/Foundation.h>
#import "MovieInfo.h"

@interface TheaterInfo : NSObject
{
    
}

@property (nonatomic, strong)NSString *name;
@property (nonatomic, strong)NSString *location;
@property (nonatomic, strong)UIImage *image;
@property (nonatomic, strong)NSMutableArray *movies;

@end
