//
//  DetailViewController.m
//  TweetMe
//
//  Created by Russell Gaspard on 6/6/14.
//  Copyright (c) 2014 Russell Gaspard. All rights reserved.
//

#import "DetailViewController.h"
#import "TwitterPostInfo.h"

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
    
    tweetLabel.text = self.currentTweet.tweetText;
    
    
    
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
