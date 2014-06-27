//
//  MovieView.m
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

#import "MovieView.h"
#import <MediaPlayer/MediaPlayer.h>
#import "MovieInfo.h"


@interface MovieView ()

@end

@implementation MovieView

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
    //Show title of the movie chosen movie
    titleLabel.text = _currentMovie.title;
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}


- (void)viewDidAppear:(BOOL)animated
{

    [super viewDidAppear:true];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction)onPlay:(id)sender
{
    
    //Create a string representing the file path to my video file
    NSString *filePath = [[NSBundle mainBundle] pathForResource:_currentMovie.trailerURL ofType:@"mp4" inDirectory:@"vid"];
    
    //use URL because the Movie Player is designed to load files locally or remotely
    NSURL *fileURL = [NSURL fileURLWithPath:filePath];
    
    //Alloc and init movieplayer with URL
    moviePlayer = [[MPMoviePlayerController alloc] initWithContentURL:fileURL];
    
    if(moviePlayer != nil)
    {
        //Add player object to my "UIView" movie view
        [movieView addSubview:moviePlayer.view];
        
        
        //setup the moviePlayer size to the same size as the movie view
        moviePlayer.view.frame = CGRectMake(0.0f, 0.0f, movieView.frame.size.width, movieView.frame.size.height);
        
        //set some parameters
        moviePlayer.fullscreen = false;
        moviePlayer.controlStyle = MPMovieControlStyleNone;
     
        //finally we play the video!
        [moviePlayer play];
    }
}



-(IBAction)onStop:(id)sender
{
    if(moviePlayer != nil)
    {
        //Stop playing the video
        [moviePlayer stop];
    }
}


@end
