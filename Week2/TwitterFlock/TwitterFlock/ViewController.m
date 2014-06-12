//
//  ViewController.m
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

#import "ViewController.h"
#import <Accounts/Accounts.h>
#import <Social/Social.h>
#import "FollowerInfo.h"
#import "CustomCollectionCell.h"
#import "DetailViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    
    //Build alert view for user who declines to access Twitter
    noConnection = [[UIAlertView alloc] initWithTitle:@"Connection Unavailable" message:@"Twitter Flock cannot access Twitter without Internet conncetion." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    
    //Build alert view for user who declines to access Twitter
    accessDenied = [[UIAlertView alloc] initWithTitle:@"Access Denied" message:@"The Twitter Flock app cannot function without access to your Twitter acount" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    
    
    
    //Create array to hold twitter friends (FollowerInfo objects)
    twitterFollowers = [[NSMutableArray alloc] init];
    
    //Run API call and load data
    [self getFriendData];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [twitterFollowers count];
    //return 10;
    
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    //Build custom cell
    CustomCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"idCell" forIndexPath:indexPath];
    
    if(cell != nil)
    {
        //Populate custom cell based on associated FollowerInfo object
        FollowerInfo *friend = [twitterFollowers objectAtIndex:indexPath.row];
        [cell resetWithLabel:friend.screenName cellImage:friend.avatarImage];
        
    }
    return cell;
}


//Called when we go to the detail view
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    DetailViewController *detailViewController = segue.destinationViewController;
        
    if (detailViewController != nil)
    {
        //Cast the "sender" as a CollectionView Cell
        UICollectionViewCell *cell = (UICollectionViewCell*)sender;
        NSIndexPath *indexPath = [mainCollectionView indexPathForCell:cell];
            
        //Get FollowerInfo object from the array based on the item in the tableview we clicked on
        FollowerInfo *currentFriend = [twitterFollowers objectAtIndex:indexPath.row];
            
        //Set the currentTweet property in detail view to the chosen one
        detailViewController.currentFriend = currentFriend;
    }
}


-(void)getFriendData
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
                        //Take the first twitter account in the list
                        ACAccount *currentAccount = [twitterAccounts objectAtIndex:0];
                        
                        if(currentAccount != nil)
                        {
                            
                            //Twitter API call to retrieve friend list
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
                                    //Dictionary Object to hold entire data return Twitter JSON
                                    NSDictionary *returnData = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:nil];
                                    
                                    //Array to hold only the "users" data from Twitter JSON return
                                    NSArray *friendsArray =  [returnData objectForKey:@"users"];
                                    
                                    //Loop though friends
                                    for (NSInteger i=0; i<[friendsArray count]; i++)
                                    {
                                        
                                        //Dictionary Object to hold data on current friend from Twitter JSON return
                                        NSDictionary *friendData = [friendsArray objectAtIndex:i];
                                        
                                        if(friendData != nil)
                                        {
                                            //Create my custom object to hold friend data once retrieved
                                            FollowerInfo *currentFollower = [[FollowerInfo alloc] init];
                                        
                                            //Pass screen_name from JSON to my custom object
                                            currentFollower.screenName = [friendData objectForKey:@"screen_name"];

                                            //Retrieve image from the URL string in twitter's JSON data to my custom object
                                            NSString *imageString = [friendData objectForKey:@"profile_image_url"];
                                            NSURL *imageURL = [NSURL URLWithString:imageString];
                                            NSData *imageData = [[NSData alloc] initWithContentsOfURL:imageURL];
                                            currentFollower.avatarImage = [UIImage imageWithData:imageData];
                                            
                                            //Add the new FollowerInfo object to my array
                                            [twitterFollowers addObject:currentFollower];
                                        }
                                    }
                                    //Reload the collection view after the data is loaded
                                    [mainCollectionView reloadData];
                                }
                                else
                                {
                                    //Display Alert View for connection error
                                    [noConnection show];
                                    
                                    //NSLog(@"Error:%@", [error description]);
                                }
                            }];
                            
                        }
                    }
                }
                else
                {
                    //The user says no - display associate Alert View
                    [accessDenied show];
                }
            }];
        }
    }
}


-(IBAction)done:(UIStoryboardSegue*)segue
{
    //DetailViewController *detailView = segue.sourceViewController;
}

@end
