//
//  MovieView.h
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

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import "MovieInfo.h"

@interface MovieView : UIViewController
{
    MPMoviePlayerController *moviePlayer;
    IBOutlet UIView *movieView;
    IBOutlet UILabel *titleLabel;
    
}

-(IBAction)onPlay:(id)sender;
-(IBAction)onStop:(id)sender;

@property (nonatomic, strong)MovieInfo *currentMovie;

@end
