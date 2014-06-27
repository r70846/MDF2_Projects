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
#import "MovieDetailsView.h"
#import "MovieView.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    //Run main funtion to set up data objects and arrays
    [self loadData];
    
    [super viewDidLoad];
	
}

- (void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:animated];
	
    //Deselect any selected selected cell on view load
    [mainTableView deselectRowAtIndexPath:[mainTableView indexPathForSelectedRow] animated:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//Set the height of section headers
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    //return float value for how tall header section should be
    return 60.0f;
}

//set up my custom section headers
- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section
{
    UITableViewHeaderFooterView *headerView = (UITableViewHeaderFooterView*) view;
    if(headerView != nil)
    {
        //Get access to data for each section
        TheaterInfo *currentTheater = [theaterList objectAtIndex:section];
        
        //Darken backround tint of header
        headerView.tintColor = [UIColor darkGrayColor];
        
        //Setup my own custom section titles
        UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(70.0f,5.0f,250.0f,25.0f)];
        
        //set some view parameters on section (theater) title
        nameLabel.text = currentTheater.name;
        nameLabel.textColor = [UIColor whiteColor];
        nameLabel.font = [UIFont boldSystemFontOfSize:18.0f];
        
        //Add section (theater) title  to my header
        [headerView.contentView addSubview:nameLabel];
        
        //Create a location label for each header
        UILabel *locationLabel = [[UILabel alloc] initWithFrame:CGRectMake(70.0f,31.0f,250.0f,20.0f)];
        
        //set some view parameters on the location label
        locationLabel.text = currentTheater.location;
        locationLabel.textColor = [UIColor whiteColor];
        locationLabel.font = [UIFont systemFontOfSize:15.0f];

        //Add location label to my header
        [headerView.contentView addSubview:locationLabel];
        
        //Create an imageview for theater image
        UIImageView *headerImage = [[UIImageView alloc] initWithFrame:CGRectMake(10.0f,5.0f,50.0f,50.0f)];
        
        //load current theater image
        headerImage.image = currentTheater.image;
        
        //add theater image to my header
        [headerView.contentView addSubview:headerImage];
    }
    
}

//create number of rows for each section based on the movies for that theater
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    TheaterInfo *currentTheater = [theaterList objectAtIndex:section];
    
    return [currentTheater.movies count];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //get a reference to the theater for this section
    TheaterInfo *currentTheater = [theaterList objectAtIndex:indexPath.section];
    
    //get a cell reference from the recycle bin
    CustomTableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CustomCell"];
    
    //if we have a good one, load it up and use it
    if(cell != nil)
    {
        //get a reference to the movie at hand..
        MovieInfo *currentMovie = [currentTheater.movies objectAtIndex:indexPath.row];
        
        //display info about the movie in my cell
        cell.cellLabel.text = currentMovie.title;
        cell.showtimesLabel.text = currentMovie.showtimes;
        cell.movieImage.image = currentMovie.image;
    }
    
    return cell;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView // Default is 1 if not implemented
{
    //one section for each theater in my list
    return [theaterList count];
}


//Called when we go to the detail view
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    //if we're on the way to details view, pass the movie data
    if([segue.identifier isEqualToString:@"segueToDetailView"])
    {
        //reference to details view
        MovieDetailsView *movieDetailsView = segue.destinationViewController;
    
        if (movieDetailsView != nil)
        {
        
            //Cast the "sender" as a TableView Cell
            UITableViewCell *cell = (UITableViewCell*)sender;
            NSIndexPath *indexPath = [mainTableView indexPathForCell:cell];
        
        
            TheaterInfo *currentTheater = [theaterList objectAtIndex:indexPath.section];
            MovieInfo *currentMovie = [currentTheater.movies objectAtIndex:indexPath.row];
        
            //Set the MovieInfo property in detail view to the chosen one
            movieDetailsView.currentMovie = currentMovie;
        
        }
    }
}

-(void)loadData
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
    currentTheater.image = [UIImage imageNamed:@"img/aloma50.png"];
    
    //create a movie object and load data with custom init
    currentMovie = [[MovieInfo alloc] initWithData:@"Any Which Way You Can"
                                        movieImage:[UIImage imageNamed:@"img/_AnyWHichWayYouCan.png"]
                                    movieShowtimes:@"7:20pm | 9:35pm | 10:50pm"
                                           preview:@"_AnyWhichWayYouCan"
                                     movieCitation:@"(Van Horn, 1980)"];
    //add to the movie list for this theater
    [currentTheater.movies addObject:currentMovie];
    
    //create a movie object and load data with custom init
    currentMovie = [[MovieInfo alloc] initWithData:@"Crockodile Dundee"
                                        movieImage:[UIImage imageNamed:@"img/_CrocodileDundee.png"]
                                    movieShowtimes:@"7:30pm | 9:45pm | 11:00pm"                                         preview:@"_CrocodileDundee"
                                     movieCitation:@"(Faiman, 1986)"];
    //add to the movie list for this theater
    [currentTheater.movies addObject:currentMovie];
    
    //create a movie object and load data with custom init
    currentMovie = [[MovieInfo alloc] initWithData:@"Gone with the Wind"
                                        movieImage:[UIImage imageNamed:@"img/_GoneWithTheWind.png"]
                                    movieShowtimes:@"6:55pm | 9:10pm | 10:25pm"
                                           preview:@"_GoneWithTheWind"
                                     movieCitation:@"(Fleming, 1939)"];
    //add to the movie list for this theater
    [currentTheater.movies addObject:currentMovie];
    
    //create a movie object and load data with custom init
    currentMovie = [[MovieInfo alloc] initWithData:@"Rocky"
                                        movieImage:[UIImage imageNamed:@"img/_Rocky.png"]
                                    movieShowtimes:@"7:55pm | 10:10pm | 11:25pm"
                                           preview:@"_Rocky"
                                     movieCitation:@"(Avildsen, 1976)"];
    //add to the movie list for this theater
    [currentTheater.movies addObject:currentMovie];
    
    //create a movie object and load data with custom init
    currentMovie = [[MovieInfo alloc] initWithData:@"Star Trek"
                                        movieImage:[UIImage imageNamed:@"img/_StarTrek.png"]
                                    movieShowtimes:@"6:30pm | 8:45pm | 10:00pm"
                                           preview:@"_StarTrek"
                                     movieCitation:@"(Abrams, 2009)"];
    //add to the movie list for this theater
    [currentTheater.movies addObject:currentMovie];
    
    //create a movie object and load data with custom init
    currentMovie = [[MovieInfo alloc] initWithData:@"The Shining"
                                        movieImage:[UIImage imageNamed:@"img/_TheShining.png"]
                                    movieShowtimes:@"7:15pm | 9:30pm | 10:45pm"                                          preview:@"_TheShining"
                                     movieCitation:@"(Kubrick, 1980)"];
    //add to the movie list for this theater
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
    currentTheater.image = [UIImage imageNamed:@"img/Inzian50.png"];
    
    //create a movie object and load data with custom init
    currentMovie = [[MovieInfo alloc] initWithData:@"Beatlejuice"
                                        movieImage:[UIImage imageNamed:@"img/_Beatlejuice.png"]
                                    movieShowtimes:@"6:35pm | 8:50pm | 10:05pm"
                                           preview:@"_Beatlejuice"
                                     movieCitation:@"(Burton, 1988)"];
    //add to the movie list for this theater
    [currentTheater.movies addObject:currentMovie];
    
    //create a movie object and load data with custom init
    currentMovie = [[MovieInfo alloc] initWithData:@"Cool Hand Luke"
                                        movieImage:[UIImage imageNamed:@"img/_CoolHandLuke.png"]
                                    movieShowtimes:@"7:50pm | 10:05pm | 11:20pm"                                         preview:@"_CoolHandLuke"
                                     movieCitation:@"(Rosenberg, 1967)"];
    //add to the movie list for this theater
    [currentTheater.movies addObject:currentMovie];
    
    //create a movie object and load data with custom init
    currentMovie = [[MovieInfo alloc] initWithData:@"Deliverance"
                                        movieImage:[UIImage imageNamed:@"img/_Deliverance.png"]
                                    movieShowtimes:@"7:40pm | 9:55pm | 11:10pm"
                                           preview:@"_Deliverance"
                                     movieCitation:@"(Boorman, 1972)"];
    //add to the movie list for this theater
    [currentTheater.movies addObject:currentMovie];
    
    //create a movie object and load data with custom init
    currentMovie = [[MovieInfo alloc] initWithData:@"Dirty Harry"
                                        movieImage:[UIImage imageNamed:@"img/_DirtyHarry.png"]
                                    movieShowtimes:@"7:00pm | 9:15pm | 10:30pm"
                                           preview:@"_DirtyHarry"
                                     movieCitation:@"(Siegel, 1971)"];
    //add to the movie list for this theater
    [currentTheater.movies addObject:currentMovie];
    
    //create a movie object and load data with custom init
    currentMovie = [[MovieInfo alloc] initWithData:@"The Terminator"
                                        movieImage:[UIImage imageNamed:@"img/_TheTerminator.png"]
                                    movieShowtimes:@"7:05pm | 9:20pm | 10:35pm"
                                           preview:@"_TheTerminator"
                                     movieCitation:@"(Cameron, 1984)"];
    //add to the movie list for this theater
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
    currentTheater.image = [UIImage imageNamed:@"img/stardust50.png"];
    
    //create a movie object and load data with custom init
    currentMovie = [[MovieInfo alloc] initWithData:@"E.T. the Extra-Terrestrial"
                                        movieImage:[UIImage imageNamed:@"img/_ET.png"]
                                    movieShowtimes:@"6:50pm | 9:05pm | 10:20pm"
                                           preview:@"_ET"
                                     movieCitation:@"(Spielberg, 1982)"];
    //add to the movie list for this theater
    [currentTheater.movies addObject:currentMovie];
    
    //create a movie object and load data with custom init
    currentMovie = [[MovieInfo alloc] initWithData:@"From Russia With Love"
                                        movieImage:[UIImage imageNamed:@"img/_FromRussiaWithLove.png"]
                                    movieShowtimes:@"6:40pm | 8:55pm | 10:10pm"                                         preview:@"_FromRussiaWithLove"
                                     movieCitation:@"(Young, 1963)"];
    //add to the movie list for this theater
    [currentTheater.movies addObject:currentMovie];
    
    //create a movie object and load data with custom init
    currentMovie = [[MovieInfo alloc] initWithData:@"Ghost Busters"
                                        movieImage:[UIImage imageNamed:@"img/_GhostBusters.png"]
                                    movieShowtimes:@"6:45pm | 9:00pm | 10:15pm"
                                           preview:@"_GhostBusters"
                                     movieCitation:@"(Reitman, 1984)"];
    //add to the movie list for this theater
    [currentTheater.movies addObject:currentMovie];
    
    //create a movie object and load data with custom init
    currentMovie = [[MovieInfo alloc] initWithData:@"The Holy Grail"
                                        movieImage:[UIImage imageNamed:@"img/_QuestForTheHollyGrail.png"]
                                    movieShowtimes:@"7:45pm | 10:00pm | 11:15pm"
                                           preview:@"_QuestForTheHolyGrail"
                                     movieCitation:@"(Gilliam, 1975)"];
    //add to the movie list for this theater
    [currentTheater.movies addObject:currentMovie];
    
    //create a movie object and load data with custom init
    currentMovie = [[MovieInfo alloc] initWithData:@"Scarface"
                                        movieImage:[UIImage imageNamed:@"img/_Scarface.png"]
                                    movieShowtimes:@"7:25pm | 9:40pm | 10:55pm"
                                           preview:@"_Scarface"
                                     movieCitation:@"(De Palma, 1983)"];
    //add to the movie list for this theater
    [currentTheater.movies addObject:currentMovie];
    
    //create a movie object and load data with custom init
    currentMovie = [[MovieInfo alloc] initWithData:@"Star Wars"
                                        movieImage:[UIImage imageNamed:@"img/_StarWars.png"]
                                    movieShowtimes:@"7:35pm | 9:50pm | 11:05pm"                                         preview:@"_StarWars"
                                     movieCitation:@"(Lucas, 1977)"];
    //add to the movie list for this theater
    [currentTheater.movies addObject:currentMovie];
    
    //create a movie object and load data with custom init
    currentMovie = [[MovieInfo alloc] initWithData:@"The Graduate"
                                        movieImage:[UIImage imageNamed:@"img/_TheGraduate.png"]
                                    movieShowtimes:@"7:10pm | 9:25pm | 10:40pm"                                         preview:@"_TheGraduate"
                                     movieCitation:@"(Nichols, 1967)"];

    [currentTheater.movies addObject:currentMovie];
    
    
    //Add TheaterInfo object to my theater list array
    [theaterList addObject:currentTheater];
    
}


//provide a function to return to from unwind segue
-(IBAction)done:(UIStoryboardSegue*)segue
{
    
}


@end
