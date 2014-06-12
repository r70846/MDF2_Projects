//
//  ViewController.h
//  TweetMe
//
//  Created by Russell Gaspard on 6/5/14.
//  Copyright (c) 2014 Russell Gaspard. All rights reserved.
//
/*
 
 Russ Gaspard
 Week 1
 Mobile Development
 MDF2 1406
 
 */

#import <UIKit/UIKit.h>
#import "TwitterPostInfo.h"
#import <Accounts/Accounts.h>
#import <Social/Social.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    NSMutableArray *twitterPosts;
    
    
    
    IBOutlet UIButton *btnRefresh;
    IBOutlet UIButton *btnUser;
    IBOutlet UIButton *btnPost;
    
    //Retain current account
    ACAccount *currentAccount;
    
    //Create alert view for data load
    UIAlertView *alert;
    
    IBOutlet UITableView *mainTableView;    //Table view reference
}



-(void)twitterRefresh;


-(TwitterPostInfo*) postInfoFromDictionary:(NSDictionary*)postDictionary;

-(IBAction)onClick:(id)sender;

-(IBAction)done:(UIStoryboardSegue*)segue;


@end