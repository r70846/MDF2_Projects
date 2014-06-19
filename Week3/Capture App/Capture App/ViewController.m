//
//  ViewController.m
//  Capture App
//
//  Created by Russell Gaspard on 6/19/14.
//  Copyright (c) 2014 Russell Gaspard. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

///////////////////////////////////////////////////////

-(IBAction)onClick:(id)sender
{
    
}

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    return true;
}

//Called if we go to a detail view
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    /*
    //Cast the "sender" as a Button
    UIButton *btn = (UIButton*)sender;
    
    if(btn.tag == 0) //Photo Cap
    {
        [self performSegueWithIdentifier:@"segueToPhotoCap" sender:sender];
    }
    else if(btn.tag == 1) //Video Cap
    {
        [self performSegueWithIdentifier:@"segueToVideoCap" sender:sender];
    }
    else //Photo Album
    {
        [self performSegueWithIdentifier:@"segueToAlbum" sender:sender];
    }
    */
    
    /*
    SelectionViewController *selectionViewController = segue.destinationViewController;
    
    if (selectionViewController != nil)
    {
        
        //Cast the "sender" as a TableView Cell
        //UITableViewCell *cell = (UITableViewCell*)sender;
        //NSIndexPath *indexPath = [calTableView indexPathForCell:cell];
        
        
        //selectionViewController.dataString = [gigWeekArray objectAtIndex:indexPath.row];
    }
     
     */
}

-(IBAction)done:(UIStoryboardSegue*)segue
{
    
}

@end
