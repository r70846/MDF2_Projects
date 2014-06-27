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
#import "TheaterInfo.h"
#import "CustomTableCell.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    
    
    
    //Create an array of TheaterInfo objects
    theaterList = [[NSMutableArray alloc] init];
    
    //Local Variable to build each theater
    TheaterInfo *currentTheater;
    
    //Local Variable to build each movie
    MovieInfo *currentMovie;
    
    //ALOMA CINEMA CHILL ///////////////////////////////////////////////////////////
    
    //Create a TheaterInfo object
    currentTheater = [[TheaterInfo alloc] init];
    
    //Build new theater
    currentTheater.name = @"Aloma Cinema Chill";
    currentTheater.location = @"2155 Aloma Ave, Winter Park";
    //currentTheater.image =
    
    
    currentMovie = [[MovieInfo alloc] initWithData:@"Any Which Way You Can"
                                        movieImage:nil
                                    movieShowtimes:@[@"7:20 PM", @"9:35 PM", @"10:50 PM"]
                                           preview:nil
                                     movieCitation:@"(Van Horn, 1980)"];
    [currentTheater.movies addObject:currentMovie];
    
    currentMovie = [[MovieInfo alloc] initWithData:@"Crockodile Dundee"
                                        movieImage:nil
                                    movieShowtimes:@[@"7:30 PM", @"9:45 PM", @"11:00 PM"]                                           preview:nil
                                     movieCitation:@"(Faiman, 1986)"];
    [currentTheater.movies addObject:currentMovie];
    
    currentMovie = [[MovieInfo alloc] initWithData:@"Gone with the Wind"
                                        movieImage:nil
                                    movieShowtimes:@[@"6:55 PM", @"9:10 PM", @"10:25 PM"]
                                           preview:nil
                                     movieCitation:@"(Fleming, 1939)"];
    [currentTheater.movies addObject:currentMovie];
    
    currentMovie = [[MovieInfo alloc] initWithData:@"Rocky"
                                        movieImage:nil
                                    movieShowtimes:@[@"7:55 PM", @"10:10 PM", @"11:25 PM"]
                                           preview:nil
                                     movieCitation:@"(Avildsen, 1976)"];
    [currentTheater.movies addObject:currentMovie];
    
    currentMovie = [[MovieInfo alloc] initWithData:@"Star Trek"
                                        movieImage:nil
                                    movieShowtimes:@[@"6:30 PM", @"8:45 PM", @"10:00 PM"]
                                           preview:nil
                                     movieCitation:@"(Abrams, 2009)"];
    [currentTheater.movies addObject:currentMovie];
    
    currentMovie = [[MovieInfo alloc] initWithData:@"The Shining"
                                        movieImage:nil
                                    movieShowtimes:@[@"7:15 PM", @"9:30 PM", @"10:45 PM"]                                           preview:nil
                                     movieCitation:@"(Kubrick, 1980)"];
    [currentTheater.movies addObject:currentMovie];
    
    //Add TheaterInfo object to my theater list array
    [theaterList addObject:currentTheater];
    
    
    //INZIAN  ///////////////////////////////////////////////////////////
    
    
    //Reuse my TheaterInfo object
    currentTheater = nil;
    currentTheater = [[TheaterInfo alloc] init];
    
    //Build new theater
    currentTheater.name = @"Inzian Theater";
    currentTheater.location = @"1300 S Orlando Ave, Maitland";
    
    currentMovie = [[MovieInfo alloc] initWithData:@"Beatlejuice"
                                        movieImage:nil
                                    movieShowtimes:@[@"6:35 PM", @"8:50 PM", @"10:05 PM"]
                                           preview:nil
                                     movieCitation:@"(Burton, 1988)"];
    [currentTheater.movies addObject:currentMovie];
    
    currentMovie = [[MovieInfo alloc] initWithData:@"Cool Hand Luke"
                                        movieImage:nil
                                    movieShowtimes:@[@"7:50 PM", @"10:05 PM", @"11:20 PM"]                                          preview:nil
                                     movieCitation:@"(Rosenberg, 1967)"];
    [currentTheater.movies addObject:currentMovie];
    
    currentMovie = [[MovieInfo alloc] initWithData:@"Deliverance"
                                        movieImage:nil
                                    movieShowtimes:@[@"7:40 PM", @"9:55 PM", @"11:10 PM"]
                                           preview:nil
                                     movieCitation:@"(Boorman, 1972)"];
    [currentTheater.movies addObject:currentMovie];
    
    currentMovie = [[MovieInfo alloc] initWithData:@"Dirty Harry"
                                        movieImage:nil
                                    movieShowtimes:@[@"7:00 PM", @"9:15 PM", @"10:30 PM"]
                                           preview:nil
                                     movieCitation:@"(Siegel, 1971)"];
    [currentTheater.movies addObject:currentMovie];
    
    currentMovie = [[MovieInfo alloc] initWithData:@"The Terminator"
                                        movieImage:nil
                                    movieShowtimes:@[@"7:05 PM", @"9:20 PM", @"10:35 PM"]
                                           preview:nil
                                     movieCitation:@"(Cameron, 1984)"];
    [currentTheater.movies addObject:currentMovie];

    //Add TheaterInfo object to my theater list array
    [theaterList addObject:currentTheater];
    
    //STARDUST ///////////////////////////////////////////////////////////
    
    //Reuse my TheaterInfo object
    currentTheater = nil;
    currentTheater = [[TheaterInfo alloc] init];

    //Build new theater
    currentTheater.name = @"Stardust Coffee & Video";
    currentTheater.location = @"1842 Winter Park Rd, Orlando";

    currentMovie = [[MovieInfo alloc] initWithData:@"E.T. the Extra-Terrestrial"
                                        movieImage:nil
                                    movieShowtimes:@[@"6:50 PM", @"9:05 PM", @"10:20 PM"]
                                           preview:nil
                                     movieCitation:@"(Spielberg, 1982)"];
    [currentTheater.movies addObject:currentMovie];
    
    currentMovie = [[MovieInfo alloc] initWithData:@"From Russia With Love"
                                        movieImage:nil
                                    movieShowtimes:@[@"6:40 PM", @"8:55 PM", @"10:10 PM"]                                          preview:nil
                                     movieCitation:@"(Young, 1963)"];
    [currentTheater.movies addObject:currentMovie];
    
    currentMovie = [[MovieInfo alloc] initWithData:@"Ghost Busters"
                                        movieImage:nil
                                    movieShowtimes:@[@"6:45 PM", @"9:00 PM", @"10:15 PM"]
                                           preview:nil
                                     movieCitation:@"(Reitman, 1984)"];
    [currentTheater.movies addObject:currentMovie];
    
    currentMovie = [[MovieInfo alloc] initWithData:@"Monty Python and the Holy Grail"
                                        movieImage:nil
                                    movieShowtimes:@[@"7:45 PM", @"10:00 PM", @"11:15 PM"]
                                           preview:nil
                                     movieCitation:@"(Gilliam, 1975)"];
    [currentTheater.movies addObject:currentMovie];
    
    currentMovie = [[MovieInfo alloc] initWithData:@"Scarface"
                                        movieImage:nil
                                    movieShowtimes:@[@"7:25 PM", @"9:40 PM", @"10:55 PM"]
                                           preview:nil
                                     movieCitation:@"(De Palma, 1983)"];
    [currentTheater.movies addObject:currentMovie];
    
    currentMovie = [[MovieInfo alloc] initWithData:@"Star Wars"
                                        movieImage:nil
                                    movieShowtimes:@[@"7:35 PM", @"9:50 PM", @"11:05 PM"]                                          preview:nil
                                     movieCitation:@"(Lucas, 1977)"];
    [currentTheater.movies addObject:currentMovie];
    
    currentMovie = [[MovieInfo alloc] initWithData:@"The Graduate"
                                        movieImage:nil
                                    movieShowtimes:@[@"7:10 PM", @"9:25 PM", @"10:40 PM"]                                          preview:nil
                                     movieCitation:@"(Nichols, 1967)"];
    [currentTheater.movies addObject:currentMovie];
    
    
    //Add TheaterInfo object to my theater list array
    [theaterList addObject:currentTheater];
    
    
    
//////////  DEBUG LOG CODE ////////////////////////////////////////
/*
    for(int i = 0; i < [theaterList count]; i++)
    {
        
        currentTheater = [theaterList objectAtIndex:i];
        NSLog(@"%@" , currentTheater.name);
        NSLog(@"%@" , currentTheater.location);
        
        NSLog(@"count = %d" , [currentTheater.movies count]);
        
        
        for(int j = 0; j < [currentTheater.movies count]; j++)
        {
            currentMovie = [currentTheater.movies objectAtIndex:j];
            NSArray *currectShowtimes = currentMovie.showtimes;
            
            NSLog(@"   %@" , currentMovie.title);
            NSLog(@"   %@" , currentMovie.citation);
            NSLog(@"   %@ %@ %@",[currectShowtimes objectAtIndex:0], [currectShowtimes objectAtIndex:1], [currectShowtimes objectAtIndex:2]);
        }
        
    }
*/   
//////////////////////////////////////////////////////////////////
    
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    TheaterInfo *currentTheater = [theaterList objectAtIndex:section];
    
    return [currentTheater.movies count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    TheaterInfo *currentTheater = [theaterList objectAtIndex:indexPath.section];
     
    CustomTableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CustomCell"];
    if(cell != nil)
    {
        MovieInfo *currentMovie = [currentTheater.movies objectAtIndex:indexPath.row];
        cell.cellLabel.text = currentMovie.title;
        
    }
    return cell;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView // Default is 1 if not implemented
{
    return [theaterList count];
}



@end
