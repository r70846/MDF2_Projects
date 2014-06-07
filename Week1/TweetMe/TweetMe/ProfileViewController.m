//
//  ProfileViewController.m
//  TweetMe
//
//  Created by Russell Gaspard on 6/6/14.
//  Copyright (c) 2014 Russell Gaspard. All rights reserved.
//

#import "ProfileViewController.h"
#import <Accounts/Accounts.h>
#import <Social/Social.h>


@interface ProfileViewController ()

@end

@implementation ProfileViewController

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
    // Twitter Documentation  /////////////////////////////
    //https://dev.twitter.com/docs/api/1.1/get/users/show
    ///////////////////////////////////////////////////////
    
    
    [self displayProfileData:@"" descString:@"" numFollower:nil numFriend:nil];

    
    [self getUserData];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

-(void)getUserData
{
    

    
    
    ACAccountStore *accountStore = [[ACAccountStore alloc] init];
    
    if(accountStore != nil)
    {
        ACAccountType *accountType = [accountStore accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierTwitter];
        if(accountType != nil)
        {
            [accountStore requestAccessToAccountsWithType:accountType options:nil completion:^(BOOL granted, NSError *error) {
                if(granted)
                {
                    //Success
                    NSArray *twitterAccounts = [accountStore accountsWithAccountType:accountType];
                    if(twitterAccounts != nil)
                    {
                        ACAccount *currentAccount = [twitterAccounts objectAtIndex:0];
                        if(currentAccount != nil)
                        {
                            
                            //Twitter API call
                            
                            //NSString *requestString = @"https://api.twitter.com/1.1/statuses/user_timeline.json";
                            NSString *requestString = @"https://api.twitter.com/1.1/users/show.json";
                            
                            //Set up parameters for call (really just single screen_name param
                            NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:@"russellmgaspard", @"screen_name",nil];
                            
                            
                            SLRequest *request = [SLRequest requestForServiceType:SLServiceTypeTwitter requestMethod:SLRequestMethodGET URL:[NSURL URLWithString:requestString] parameters:params];
                            
                            //Authenticate request
                            [request setAccount:currentAccount];
                            
                            //Actually perform the request
                            
                            
                            [request performRequestWithHandler:^(NSData *responseData, NSHTTPURLResponse *urlResponse, NSError *error) {
                                
                                
                                
                                //http status code 200 = "OK"
                                if(error == nil && [urlResponse statusCode] == 200)
                                {
                                    
                                    NSDictionary *userData = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:nil];

                                    NSString *name = [userData objectForKey:@"name"];
                                    NSString *desc =[userData objectForKey:@"description"];
                                    NSNumber *followers = [userData objectForKey:@"followers_count"];
                                    NSNumber *friends = [userData objectForKey:@"followers_count"];
                                    
                                    //Pass date to display function
                                    [self displayProfileData:name descString:desc numFollower:followers numFriend:friends];
                                    
                                }
                            }];
                            
                        }
                    }
                }
                else
                {
                    //The user says no
                }
            }];
        }
    }
}


-(void)displayProfileData:(NSString*)nameString descString:(NSString*)descString numFollower:(NSNumber*)numFollower numFriend:(NSNumber*)numFriend
{
    nameLabel.text = nameString;
    descriptionLabel.text = descString;
    numFollowersLabel.text = [numFollower stringValue];
    numFriendsLabel.text = [numFriend stringValue];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
