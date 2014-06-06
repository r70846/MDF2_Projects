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


-(void)twitterRefresh
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
                                    
                                    //Loop though twitter posts
                                    for (NSInteger i=0; i<[twitterFeed count]; i++)
                                    {
                                        
                                        TwitterPostInfo *currentPostInfo = [self postInfoFromDictionary:[twitterFeed objectAtIndex:i]];
                                        if(currentPostInfo != nil)
                                        {
                                            [twitterPosts addObject:currentPostInfo];
                                            
                                            //NSLog(@"TwitterPosts:%@",[twitterPosts description]);
                                        }
                                        
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
    
    //The actual tweet text
    NSString *tweetString = [postDictionary valueForKey:@"text"];
    
    
    //Create my custom object with my custom init method
    TwitterPostInfo *postInfo = [[TwitterPostInfo alloc] initWithPostInfo:nameString userDesc:descString text:tweetString dateTimeInfo:timeDateString];
    
    return postInfo;
}


-(IBAction)onClick:(id)sender
{
    
    //Create built-in Specialized view ocntroller
    SLComposeViewController *slComposeViewController = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
    
    
    [slComposeViewController setInitialText:@"This is default text..."];
    [slComposeViewController addImage:[UIImage imageNamed:@"inFrance.jpg"]];
    
    //Display view controllew
    [self presentViewController:slComposeViewController animated:true completion:nil];
    
}


        //Number of rows in table will equal the number of tweet objects in my data array
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [twitterPosts count];
}


        //Set each custom cell to reflect data from the same index of my tweet objects array
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    
                /*
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CustomCell"];

    if (cell != nil)
    {

        GigDateClass *currentGigDate = [gigDateArray objectAtIndex:indexPath.row];
        
        
        //Create format for day
        NSDateFormatter *dayFormatter = [[NSDateFormatter alloc] init];
        if (dayFormatter != nil)
        {
            [dayFormatter setDateFormat:@"EEE"];
        }
        
        //Build the date into a string based on my day format
        NSString *dateDay = [[NSString alloc] initWithFormat:@"%@", [dayFormatter stringFromDate: currentGigDate.date]];
        
        //Create format for date
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        if (dateFormatter != nil)
        {
            [dateFormatter setDateFormat:@"M/dd/YY"];
        }
        
        //Build the date into a string based on my day format
        NSString *dateDate = [[NSString alloc] initWithFormat:@"%@", [dateFormatter stringFromDate: currentGigDate.date]];
        
        
        [cell refreshCellWithInfo:dateDay dateString:dateDate eventString:currentGigDate.venue cellImage:currentGigDate.flag];

    }
    return cell;
        */
    return nil;
         
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
