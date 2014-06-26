//
//  ViewController.m
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

#import "ViewController.h"
#import "MovieInfo.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    
    
    //ALOMA CINEMA CHILL
    
    movieList = [[NSMutableArray alloc] init];
    
    currentMovie = [[MovieInfo alloc] initWithData:@"Any Which Way You Can"
                                        movieImage:nil
                                    movieShowtimes:@[@"7:20 PM", @"9:35 PM", @"10:50 PM"]
                                           preview:nil
                                     movieCitation:@"(Van Horn, 1980)"];
    [movieList addObject:currentMovie];
    
    currentMovie = [[MovieInfo alloc] initWithData:@"Crockodile Dundee"
                                        movieImage:nil
                                    movieShowtimes:@[@"7:30 PM", @"9:45 PM", @"11:00 PM"]                                           preview:nil
                                     movieCitation:@"(Faiman, 1986)"];
    [movieList addObject:currentMovie];
    
    currentMovie = [[MovieInfo alloc] initWithData:@"Gone with the Wind"
                                        movieImage:nil
                                    movieShowtimes:@[@"6:55 PM", @"9:10 PM", @"10:25 PM"]
                                           preview:nil
                                     movieCitation:@"(Fleming, 1939)"];
    [movieList addObject:currentMovie];
    
    currentMovie = [[MovieInfo alloc] initWithData:@"Rocky"
                                        movieImage:nil
                                    movieShowtimes:@[@"7:55 PM", @"10:10 PM", @"11:25 PM"]
                                           preview:nil
                                     movieCitation:@"(Avildsen, 1976)"];
    [movieList addObject:currentMovie];
    
    currentMovie = [[MovieInfo alloc] initWithData:@"Star Trek"
                                        movieImage:nil
                                    movieShowtimes:@[@"6:30 PM", @"8:45 PM", @"10:00 PM"]
                                           preview:nil
                                     movieCitation:@"(Abrams, 2009)"];
    [movieList addObject:currentMovie];
    
    currentMovie = [[MovieInfo alloc] initWithData:@"The Shining"
                                        movieImage:nil
                                    movieShowtimes:@[@"7:15 PM", @"9:30 PM", @"10:45 PM"]                                           preview:nil
                                     movieCitation:@"(Kubrick, 1980)"];
    [movieList addObject:currentMovie];
    
    
    //INZIAN
    
    currentMovie = [[MovieInfo alloc] initWithData:@"Beatlejuice"
                                        movieImage:nil
                                    movieShowtimes:@[@"6:35 PM", @"8:50 PM", @"10:05 PM"]
                                           preview:nil
                                     movieCitation:@"(Burton, 1988)"];
    [movieList addObject:currentMovie];
    
    currentMovie = [[MovieInfo alloc] initWithData:@"Cool Hand Luke"
                                        movieImage:nil
                                    movieShowtimes:@[@"7:50 PM", @"10:05 PM", @"11:20 PM"]                                          preview:nil
                                     movieCitation:@"(Rosenberg, 1967)"];
    [movieList addObject:currentMovie];
    
    currentMovie = [[MovieInfo alloc] initWithData:@"Deliverance"
                                        movieImage:nil
                                    movieShowtimes:@[@"7:40 PM", @"9:55 PM", @"11:10 PM"]
                                           preview:nil
                                     movieCitation:@"(Boorman, 1972)"];
    [movieList addObject:currentMovie];
    
    currentMovie = [[MovieInfo alloc] initWithData:@"Dirty Harry"
                                        movieImage:nil
                                    movieShowtimes:@[@"7:00 PM", @"9:15 PM", @"10:30 PM"]
                                           preview:nil
                                     movieCitation:@"(Siegel, 1971)"];
    [movieList addObject:currentMovie];
    
    currentMovie = [[MovieInfo alloc] initWithData:@"The Terminator"
                                        movieImage:nil
                                    movieShowtimes:@[@"7:05 PM", @"9:20 PM", @"10:35 PM"]
                                           preview:nil
                                     movieCitation:@"(Cameron, 1984)"];
    [movieList addObject:currentMovie];

    
    //STARDUST

    currentMovie = [[MovieInfo alloc] initWithData:@"E.T. the Extra-Terrestrial"
                                        movieImage:nil
                                    movieShowtimes:@[@"6:50 PM", @"9:05 PM", @"10:20 PM"]
                                           preview:nil
                                     movieCitation:@"(Spielberg, 1982)"];
    [movieList addObject:currentMovie];
    
    currentMovie = [[MovieInfo alloc] initWithData:@"From Russia With Love"
                                        movieImage:nil
                                    movieShowtimes:@[@"6:40 PM", @"8:55 PM", @"10:10 PM"]                                          preview:nil
                                     movieCitation:@"(Young, 1963)"];
    [movieList addObject:currentMovie];
    
    currentMovie = [[MovieInfo alloc] initWithData:@"Ghost Busters"
                                        movieImage:nil
                                    movieShowtimes:@[@"6:45 PM", @"9:00 PM", @"10:15 PM"]
                                           preview:nil
                                     movieCitation:@"(Reitman, 1984)"];
    [movieList addObject:currentMovie];
    
    currentMovie = [[MovieInfo alloc] initWithData:@"Monty Python and the Holy Grail"
                                        movieImage:nil
                                    movieShowtimes:@[@"7:45 PM", @"10:00 PM", @"11:15 PM"]
                                           preview:nil
                                     movieCitation:@"(Gilliam, 1975)"];
    [movieList addObject:currentMovie];
    
    currentMovie = [[MovieInfo alloc] initWithData:@"Scarface"
                                        movieImage:nil
                                    movieShowtimes:@[@"7:25 PM", @"9:40 PM", @"10:55 PM"]
                                           preview:nil
                                     movieCitation:@"(De Palma, 1983)"];
    [movieList addObject:currentMovie];
    
    currentMovie = [[MovieInfo alloc] initWithData:@"Star Wars"
                                        movieImage:nil
                                    movieShowtimes:@[@"7:35 PM", @"9:50 PM", @"11:05 PM"]                                          preview:nil
                                     movieCitation:@"(Lucas, 1977)"];
    [movieList addObject:currentMovie];
    
    currentMovie = [[MovieInfo alloc] initWithData:@"The Graduate"
                                        movieImage:nil
                                    movieShowtimes:@[@"7:10 PM", @"9:25 PM", @"10:40 PM"]                                          preview:nil
                                     movieCitation:@"(Nichols, 1967)"];
    [movieList addObject:currentMovie];
    
    for(int i = 0; i < [movieList count]; i++)
    {
        
        currentMovie = [movieList objectAtIndex:i];
        NSArray *currectShowtimes = currentMovie.showtimes;
        
        //NSLog(@"%@ %@" , currentMovie.title, currentMovie.citation);
              
        NSLog(@"%@ %@ %@",[currectShowtimes objectAtIndex:0], [currectShowtimes objectAtIndex:1], [currectShowtimes objectAtIndex:2]);
    }
    
    
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
