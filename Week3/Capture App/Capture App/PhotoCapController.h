//
//  PhotoCapController.h
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

@interface PhotoCapController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate>
{
    //Outlets for image view
    IBOutlet UIImageView *photoImageView;
    IBOutlet UIImageView *editedImageView;
    
    //Outlets for buttons and user message
    IBOutlet UIButton *backButton;
    IBOutlet UIButton *saveButton;
    IBOutlet UILabel *messageLabel;
    
    //Keep track of errors/saves for message display
    NSInteger attemptedSaves;
    NSInteger errorCount;
    
}

//declare function to save images
- (IBAction)saveImages:(id)sender;


//properties to recieve and hold images from capture and edit
@property (nonatomic, strong)UIImage *originalPhoto;
@property (nonatomic, strong)UIImage *editedPhoto;

@end
