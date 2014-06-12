//
//  TweetCell.m
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

#import "TweetCell.h"

@implementation TweetCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)refreshCellWithInfo:(NSString*)tweetString dateTimeString:(NSString*)dateTimeString iconImage:(UIImage*)iconImage
{
    tweetLabel.text = tweetString;
    dateTimeLabel.text = dateTimeString;
    iconView.image = iconImage;
}



@end
