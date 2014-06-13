//
//  TwitterPostInfo.h
//  accountsTest
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

#import <Foundation/Foundation.h>

@interface TwitterPostInfo : NSObject
{
    
    //Created At
    //NSString *dateTime;
    //NSString *userScreenName;
    //NSString *userDescription;
   // NSString *tweetText;
    
    
}

@property (nonatomic, readonly)NSString *dateTime;
@property (nonatomic, readonly)NSString *userScreenName;
@property (nonatomic, readonly)NSString *userDescription;
@property (nonatomic, readonly)NSString *posterName;
@property (nonatomic, readonly)NSString *tweetText;


-(id)initWithPostInfo:(NSString*)screenName userDesc:(NSString*)userDesc poster:(NSString*)poster text:(NSString*)text dateTimeInfo:(NSString*)dateTimeInfo;


@end
