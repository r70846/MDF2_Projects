//
//  ViewController.m
//  TwitterFlock
//
//  Created by Russell Gaspard on 6/12/14.
//  Copyright (c) 2014 Russell Gaspard. All rights reserved.
//

#import "ViewController.h"
#import <Accounts/Accounts.h>
#import <Social/Social.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [self getFriendData];
    
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)getFriendData
{
    
    //Display alert view
    //[alert show];
    
    //Makes ure we start over with an empty array
    //[twitterPosts removeAllObjects ];
    
    //Load/reload table with no data
    //[mainTableView reloadData];
    
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
                        //Take the first twitter account in the list
                        //ACAccount *currentAccount
                        currentAccount = [twitterAccounts objectAtIndex:0];
                        
                        if(currentAccount != nil)
                        {
                            
                            //Twitter API call to retrieve timeline
                            //NSString *requestString = @"https://api.twitter.com/1.1/statuses/user_timeline.json";
                            
                            
                            //NSString *requestString = @"https://api.twitter.com/1.1/friends/list.json cursor=-1&skip_status=true&include_user_entities=false";
                            
                            NSString *requestString = @"https://api.twitter.com/1.1/friends/list.json";
                            
                            
                            //Set up parameters for call (really just single screen_name param
                            NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:currentAccount.username, @"screen_name",@"-1",@"cursor",@"true",@"skip_status",@"false",@"include_user_entities",nil];
                            
                            SLRequest *request = [SLRequest requestForServiceType:SLServiceTypeTwitter requestMethod:SLRequestMethodGET URL:[NSURL URLWithString:requestString] parameters:params];

                            //Authenticate request
                            [request setAccount:currentAccount];
                            
                            //Actually perform the request
                            [request performRequestWithHandler:^(NSData *responseData, NSHTTPURLResponse *urlResponse, NSError *error) {
                                
                                //http status code 200 = "OK"
                                if(error == nil && [urlResponse statusCode] == 200)
                                {
                                    //Consult twitter documentation to determine if data is Array or Dictionary
                                   // NSArray *friendData = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:nil];
                                    
                                    
                                    NSDictionary *returnData = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:nil];
                                    
                                    //NSLog(@"Friend Data:%@",[returnData description]);
                                    
                                    NSArray *friendsArray =  [returnData objectForKey:@"users"];
                                    
                                    //NSLog(@"Friends Array:%@",[friendsArray description]);
                                    
                                    NSDictionary *friendData = [friendsArray objectAtIndex:0];
                                    
                                    NSLog(@"Friends Array:%@",[friendData description]);
                                    
                                    //Loop though friends
                                    for (NSInteger i=0; i<[friendsArray count]; i++)
                                    {
                                        

                                        
                                        
                                        
                                        /* TWITTER POST STUFF
                                        TwitterPostInfo *currentPostInfo = [self postInfoFromDictionary:[twitterFeed objectAtIndex:i]];
                                        
                                        if(currentPostInfo != nil)
                                        {
                                            [twitterPosts addObject:currentPostInfo];
                                            
                                        }
                                        */
                                        
                                        /*  TABLE STUFF
                                         
                                        //Reload the table after the data is loaded
                                        [mainTableView reloadData];
                                        
                                        
                                        //May qualify as a hack - scrolling to top seems to assist initial data load
                                        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
                                        [mainTableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
                                        */
                                    }
                                    
                                }
                                else
                                {
                                    NSLog(@"Error:%@", [error description]);
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


@end
