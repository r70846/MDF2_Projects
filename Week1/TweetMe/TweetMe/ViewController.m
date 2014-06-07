//
//  ViewController.m
//  TweetMe
//
//  Created by Russell Gaspard on 6/5/14.
//  Copyright (c) 2014 Russell Gaspard. All rights reserved.
//

#import "ViewController.h"
#import <Accounts/Accounts.h>
#import <Social/Social.h>
#import "TwitterPostInfo.h"
#import "TweetCell.h"
#import "DetailViewController.h"
#import "ProfileViewController.h"

//Twitter REST API Documentation ///////////
//https://dev.twitter.com/docs/api/1.1
////////////////////////////////////////////

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    
    //Create array to hold twitter post objects
    twitterPosts = [[NSMutableArray alloc] init];
    
    
    [self twitterRefresh];
    
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}


- (void)viewWillAppear:(BOOL)animated {

    
    
    [super viewWillAppear:animated];
    //[self->mainTableView reloadData]; // to reload selected cell
}


-(void)twitterRefresh
{
    
    //Makes ure we start over with an empty array
    [twitterPosts removeAllObjects ];
    
    
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
                            NSString *requestString = @"https://api.twitter.com/1.1/statuses/user_timeline.json";
                            
                            SLRequest *request = [SLRequest requestForServiceType:SLServiceTypeTwitter requestMethod:SLRequestMethodGET URL:[NSURL URLWithString:requestString] parameters:nil];
                            
                            //Authenticate request
                            [request setAccount:currentAccount];
                            
                            //Actually perform the request
                            [request performRequestWithHandler:^(NSData *responseData, NSHTTPURLResponse *urlResponse, NSError *error) {
                                
                                //http status code 200 = "OK"
                                if(error == nil && [urlResponse statusCode] == 200)
                                {
                                    //Consult twitter documentation to determine if data is Array or Dictionary
                                    NSArray *twitterFeed = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:nil];
                                    
                                    
                                   // NSLog(@"Twitter feed: %@", [twitterFeed description]);
                                    
                                    //Loop though twitter posts
                                    for (NSInteger i=0; i<[twitterFeed count]; i++)
                                    {
                                        
                                        TwitterPostInfo *currentPostInfo = [self postInfoFromDictionary:[twitterFeed objectAtIndex:i]];
                                        if(currentPostInfo != nil)
                                        {
                                            [twitterPosts addObject:currentPostInfo];
                                            
                                            //NSLog(@"TwitterPosts:%d",[twitterPosts count]);
                                        }
                                        
                                        //Reload the table after the data is loaded
                                        [mainTableView reloadData];
                                        

                                        //May qualify as a hack - scrolling to top seems to assist initial data load
                                        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
                                        
                                        [mainTableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:NO];
                                    }
                                
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



-(TwitterPostInfo*) postInfoFromDictionary:(NSDictionary*)postDictionary
{
    
    
    //date and time info
    NSString *timeDateString = [postDictionary valueForKey:@"created_at"];
    
    //user info from internal dictionary
    NSDictionary *userInfoDictionary = [postDictionary objectForKey:@"user"];
    NSString *nameString = [userInfoDictionary valueForKey:@"screen_name"];
    NSString *descString = [userInfoDictionary valueForKey:@"description"];
    NSString *posterString = [userInfoDictionary valueForKey:@"name"];
    NSString *tweetString = [postDictionary valueForKey:@"text"];
    
    
    NSLog(@"%@",posterString);
    
    //Create my custom object with my custom init method
    TwitterPostInfo *postInfo = [[TwitterPostInfo alloc] initWithPostInfo:nameString userDesc:descString poster:posterString text:tweetString dateTimeInfo:timeDateString];
    
    return postInfo;
}


-(IBAction)onClick:(id)sender
{
    
    UIButton *btn = (UIButton*) sender;
    
    if(btn.tag == 1)
    {
        
        [self twitterRefresh];
    }
    else if(btn.tag == 2)
    {
        //Create built-in Specialized view ocntroller
        SLComposeViewController *slComposeViewController = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
        
        
        [slComposeViewController setInitialText:@"Posted from TweetMe: "];
        //[slComposeViewController addImage:[UIImage imageNamed:@"birdL.png"]];
        
        //Display view controllew
        [self presentViewController:slComposeViewController animated:true completion:nil];
    }
}


        //Number of rows in table will equal the number of tweet objects in my data array
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [twitterPosts count];
}


        //Set each custom cell to reflect data from the same index of my tweet objects array
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    TweetCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TweetCell"];

    if (cell != nil)
    {
        TwitterPostInfo *currentPost = [twitterPosts objectAtIndex:indexPath.row];
        [cell refreshCellWithInfo:currentPost.tweetText dateTimeString:currentPost.dateTime iconImage:[UIImage imageNamed:@"birdR.png"]];
    }
    else
    {
        NSLog(@"cell is nil");
    }

    return cell;
         
}

//Called when we go to the detail view
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    
    // Make sure your segue name in storyboard is the same as this line
    if ([[segue identifier] isEqualToString:@"segueToUserView"])
    {
        ProfileViewController *profileViewController = segue.destinationViewController;

        if (profileViewController != nil)
        {
            //Set the sceenname property in profile view to account profile name
            profileViewController.currentAccount = currentAccount;
            
        }
    }
    else //segueToDetailView
    {
        DetailViewController *detailViewController = segue.destinationViewController;
    
        if (detailViewController != nil)
        {
            //Cast the "sender" as a TableView Cell
            UITableViewCell *cell = (UITableViewCell*)sender;
            NSIndexPath *indexPath = [mainTableView indexPathForCell:cell];
        
            //Get TwitterPostInfo object from the array based on the item in the tableview we clicked on
            TwitterPostInfo *currentTweet = [twitterPosts objectAtIndex:indexPath.row];
        
            //Set the currentTweet property in detail view to the chosen one
            detailViewController.currentTweet = currentTweet;
        }
    }
}

-(IBAction)done:(UIStoryboardSegue*)segue
{
    //DetailViewController *detailView = segue.sourceViewController;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
