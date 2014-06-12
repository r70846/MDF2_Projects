//
//  TweetCell.h
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

@interface TweetCell : UITableViewCell
{
    
    IBOutlet UILabel *tweetLabel;
    IBOutlet UILabel *dateTimeLabel;
    IBOutlet UIImageView *iconView;
    
}

-(void)refreshCellWithInfo:(NSString*)tweetString dateTimeString:(NSString*)dateTimeString iconImage:(UIImage*)iconImage;

@end
