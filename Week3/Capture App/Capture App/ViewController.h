//
//  ViewController.h
//  Capture App
//
//  Created by Russell Gaspard on 6/19/14.
//  Copyright (c) 2014 Russell Gaspard. All rights reserved.
//
/*
 
 Russ Gaspard
 Week 3
 Mobile Development
 MDF2 1406
 
 */

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate>
{
    
    //To track destination viewController before segue
    NSString *destination;
    
    //To hold images prior to photo save screen
    UIImage *capturedImage;
    UIImage *editedImage;

    //To hold path to video prior to video save screen
    NSString *videoPath;
}


//declare function to handle button clicks
-(IBAction)onClick:(id)sender;

//declare destination function for unwinf segues
-(IBAction)done:(UIStoryboardSegue*)segue;

//declare function for photo capture
-(void)capturePhoto;

//declare function for video capture
-(void)captureVideo;

//declare function for photo album
-(void)displayAlbum;

@end
