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
    
    //set up main array to hold custom theater objetcs
    NSMutableArray *theaterList;
    
    //provide table view reference
    IBOutlet UITableView *mainTableView;
}

//provide a place to come home to for "unwind" segue
-(IBAction)done:(UIStoryboardSegue*)segue;

//set up function to load custom objects and arrays on start
-(void)loadData;

@end
