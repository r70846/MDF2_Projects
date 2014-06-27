//
//  ViewController.h
//  Movie Time
//
//  Created by Russell Gaspard on 6/26/14.
//  Copyright (c) 2014 Russell Gaspard. All rights reserved.
//
/*
 
 Russ Gaspard
 Week 4
 Mobile Development
 MDF2 1406
 
 */

#import <UIKit/UIKit.h>
#import "MovieInfo.h"
#import "TheaterInfo.h"

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    
    
    NSMutableArray *theaterList;
    
    IBOutlet UITableView *mainTableView;    //Table view reference
}

-(IBAction)done:(UIStoryboardSegue*)segue;

-(void)loadData;

@end
