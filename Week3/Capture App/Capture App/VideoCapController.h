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
    IBOutlet UIButton *backButton;
    IBOutlet UIButton *saveButton;
    
    IBOutlet UILabel *instructionLabel;
    IBOutlet UILabel *messageLabel;
    
    
}

- (IBAction)saveVideo:(id)sender;


@property (nonatomic, strong)NSString *moviePath;

@end
