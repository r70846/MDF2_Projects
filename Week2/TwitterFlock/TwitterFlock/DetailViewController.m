//
//  DetailViewController.m
//  TwitterFlock
//
//  Created by Russell Gaspard on 6/12/14.
//  Copyright (c) 2014 Russell Gaspard. All rights reserved.
//

#import "DetailViewController.h"
#import "FollowerInfo.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    
    nameLabel.text = self.currentFriend.screenName;
    imageView.image = self.currentFriend.avatarImage;
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
