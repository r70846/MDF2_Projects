//
//  ProfileViewController.h
//  TweetMe
//
//  Created by Russell Gaspard on 6/6/14.
//  Copyright (c) 2014 Russell Gaspard. All rights reserved.
//
/*
 
 Russ Gaspard
 Week 1
 Mobile Development
 MDF2 1406
 
 */

#import <UIKit/UIKit.h>
#import <Accounts/Accounts.h>
#import <Social/Social.h>

@interface ProfileViewController : UIViewController
{
    
    IBOutlet UILabel *nameLabel;
    IBOutlet UILabel *descriptionLabel;
    IBOutlet UILabel *numFollowersLabel;
    IBOutlet UILabel *numFriendsLabel;
    
}

-(void)displayProfileData:(NSString*)nameString descString:(NSString*)descString numFollower:(NSNumber*)numFollower numFriend:(NSNumber*)numFriend;


//Set the object property
@property (nonatomic, strong) ACAccount *currentAccount;

-(void)getUserData;


@end
