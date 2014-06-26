//
//  MovieInfo.m
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

#import "MovieInfo.h"

@implementation MovieInfo
@synthesize title, image, showtimes, trailerURL, citation, reference;


//My custom init method
-(id)initWithData:(NSString*)movieTitle movieImage:(UIImage*)movieImage movieShowtimes:(NSArray*)movieShowtimes preview:(NSString*)preview movieCitation:(NSString*)movieCitation
{
    
    self = [super init];
    if (self) {
        // Initialization code
        title = movieTitle;
        image = movieImage;
        showtimes = movieShowtimes;
        trailerURL = preview;
        citation = movieCitation;
    }

    return self;
    
}



@end
