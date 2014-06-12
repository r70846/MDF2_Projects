//
//  DetailViewController.h
//  TwitterFlock
//
//  Created by Russell Gaspard on 6/12/14.
//  Copyright (c) 2014 Russell Gaspard. All rights reserved.
/*
 
 Russ Gaspard
 Week 2
 Mobile Development
 MDF2 1406
 
 *///

#import <UIKit/UIKit.h>
#import "FollowerInfo.h"

@interface DetailViewController : UIViewController
{
    
    IBOutlet UILabel *nameLabel;
    IBOutlet UIImageView *imageView;
    
}

//Set the object property
@property (nonatomic, strong) FollowerInfo *currentFriend;

@end
