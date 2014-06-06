//
//  ViewController.h
//  TweetMe
//
//  Created by Russell Gaspard on 6/5/14.
//  Copyright (c) 2014 Russell Gaspard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TwitterPostInfo.h"

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    NSMutableArray *twitterPosts;
    
    
    
    IBOutlet UIButton *btnRefresh;
    IBOutlet UIButton *btnUser;
    IBOutlet UIButton *btnPost;
    
    
    
    
    IBOutlet UITableView *mainTableView;    //Table view reference
}



-(void)twitterRefresh;


-(TwitterPostInfo*) postInfoFromDictionary:(NSDictionary*)postDictionary;


-(IBAction)onClick:(id)sender;



@end