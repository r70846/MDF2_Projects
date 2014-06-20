//
//  VideoCapController.h
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

@interface VideoCapController : UIViewController
{
    
    //Outlets for buttons and user messages
    IBOutlet UIButton *backButton;
    IBOutlet UIButton *saveButton;
    
    IBOutlet UILabel *instructionLabel;
    IBOutlet UILabel *messageLabel;
    
    
}

//declare function to save video
- (IBAction)saveVideo:(id)sender;

//properties to recieve and hold video URL string
@property (nonatomic, strong)NSString *moviePath;

@end
