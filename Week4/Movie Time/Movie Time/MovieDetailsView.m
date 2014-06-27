//
//  MovieDetailsView.m
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
#import "MovieDetailsView.h"
#import "MovieView.h"


@interface MovieDetailsView ()

@end

@implementation MovieDetailsView

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    
    titleLabel.text = _currentMovie.title;
    showtimesLabel.text = _currentMovie.showtimes;
    citationLabel.text = _currentMovie.citation;
    movieImage.image = _currentMovie.image;
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Called when we go to the detail view
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //UIButton *btn = (UIButton*)sender;
    if([segue.identifier isEqualToString:@"segueToMovieView"])
    {
        MovieView *movieView = segue.destinationViewController;
        
        if (movieView != nil)
        {
            //Set the MovieInfo property in detail view to the chosen one
            movieView.currentMovie = _currentMovie;
        }
    }
}

-(IBAction)onClick:(id)sender
{
    
    [self performSegueWithIdentifier:@"segueBackFromMovie" sender:sender];
    //[self dismissViewControllerAnimated:NO completion:nil];
}
@end
