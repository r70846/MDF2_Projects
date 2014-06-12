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

@interface ViewController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource>
{
    
    NSMutableArray *twitterFollowers;
    
    
    
    IBOutlet UICollectionView *mainCollectionView;    //Collection view reference
}


-(void)getFriendData;


@end
