//
//  ViewController.h
//  Capture App
//
//  Created by Russell Gaspard on 6/19/14.
//  Copyright (c) 2014 Russell Gaspard. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate>
{
    
    
    NSString *destination;
    UIImage *capturedImage;
    UIImage *editedImage;
}


-(IBAction)onClick:(id)sender;

-(IBAction)done:(UIStoryboardSegue*)segue;


-(void)capturePhoto;

@end
