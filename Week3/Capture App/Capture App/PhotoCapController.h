//
//  PhotoCapController.h
//  Capture App
//
//  Created by Russell Gaspard on 6/19/14.
//  Copyright (c) 2014 Russell Gaspard. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoCapController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate>
{
    
    IBOutlet UIImageView *photoImageView;
    IBOutlet UIImageView *editedImageView;
    
    IBOutlet UIButton *backButton;
    IBOutlet UIButton *saveButton;
    IBOutlet UILabel *messageLabel;
    
    
    NSInteger attemptedSaves;
    NSInteger errorCount;
    
}


- (IBAction)saveImages:(id)sender;

@property (nonatomic, strong)UIImage *originalPhoto;
@property (nonatomic, strong)UIImage *editedPhoto;

@end
