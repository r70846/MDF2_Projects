//
//  MovieInfo.h
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

@interface MovieInfo : NSObject
{
    
}

//create properties to hold all movie data
@property (nonatomic, strong)NSString *title;
@property (nonatomic, strong)UIImage *image;
@property (nonatomic, strong)NSString *showtimes;
@property (nonatomic, strong)NSString *trailerURL;
@property (nonatomic, strong)NSString *citation;
@property (nonatomic, strong)NSString *reference;



//Set up a custom init method
-(id)initWithData:(NSString*)movieTitle movieImage:(UIImage*)movieImage movieShowtimes:(NSString*)movieShowtimes preview:(NSString*)preview movieCitation:(NSString*)movieCitation;


@end
