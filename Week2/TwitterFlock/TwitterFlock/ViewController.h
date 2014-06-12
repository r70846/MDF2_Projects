//
//  ViewController.h
//  TwitterFlock
//
//  Created by Russell Gaspard on 6/12/14.
//  Copyright (c) 2014 Russell Gaspard. All rights reserved.
//
/*
 
 Russ Gaspard
 Week 2
 Mobile Development
 MDF2 1406
 
 */

#import <UIKit/UIKit.h>
#import <Accounts/Accounts.h>
#import <Social/Social.h>

@interface ViewController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource>
{
    
    //Alert notification if there is no internet connection
    UIAlertView *noConnection;
    
    //Alert notification if used declines permission
    UIAlertView *accessDenied;
    
    
    //Array to hold custom FollowerInfo objects
    NSMutableArray *twitterFollowers;
    
    //Outlet for my collection view
    IBOutlet UICollectionView *mainCollectionView;    //Collection view reference
}


-(void)getFriendData;


@end
