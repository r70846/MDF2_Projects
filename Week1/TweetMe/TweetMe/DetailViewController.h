//
//  DetailViewController.h
//  TweetMe
//
//  Created by Russell Gaspard on 6/6/14.
//  Copyright (c) 2014 Russell Gaspard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TwitterPostInfo.h"

@interface DetailViewController : UIViewController
{
    IBOutlet UILabel *tweetLabel;
    IBOutlet UILabel *dateTimeLabel;
}

//Set the object property
@property (nonatomic, strong) TwitterPostInfo *currentTweet;


@end
