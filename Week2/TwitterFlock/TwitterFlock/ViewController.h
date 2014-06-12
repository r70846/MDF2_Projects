//
//  ViewController.h
//  TwitterFlock
//
//  Created by Russell Gaspard on 6/12/14.
//  Copyright (c) 2014 Russell Gaspard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Accounts/Accounts.h>
#import <Social/Social.h>

@interface ViewController : UIViewController
{
    
    //Retain current account
    ACAccount *currentAccount;
    
}


-(void)getFriendData;


@end
