//
//  TweetCell.h
//  TweetMe
//
//  Created by Russell Gaspard on 6/5/14.
//  Copyright (c) 2014 Russell Gaspard. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TweetCell : UITableViewCell
{
    
    IBOutlet UILabel *tweetLabel;
    IBOutlet UILabel *dateTimeLabel;
    IBOutlet UIImageView *iconView;
    
}

-(void)refreshCellWithInfo:(NSString*)tweetString dateTimeString:(NSString*)dateTimeString iconImage:(UIImage*)iconImage;

@end
