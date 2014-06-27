//
//  MovieDetailsView.h
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
#import "MovieInfo.h"

@interface MovieDetailsView : UIViewController
{
    IBOutlet UILabel *titleLabel;
    IBOutlet UILabel *showtimesLabel;
    IBOutlet UILabel *citationLabel;
    IBOutlet UIImageView *movieImage;
}

@property (nonatomic, strong)MovieInfo *currentMovie;



-(IBAction)onClick:(id)sender;

@end
