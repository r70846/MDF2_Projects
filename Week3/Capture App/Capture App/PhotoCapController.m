//
//  PhotoCapController.m
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

#import "PhotoCapController.h"

@interface PhotoCapController ()

@end

@implementation PhotoCapController
@synthesize originalPhoto, editedPhoto;


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

    photoImageView.image = self.originalPhoto;
    editedImageView.image = self.editedPhoto;
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}


- (void)viewWillAppear:(BOOL)animated
{
    
    //Initialize my counter variables
    attemptedSaves = 0;
    errorCount = 0;
    
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (IBAction)saveImages:(id)sender
{
    //Save to my photo album programmtically
    UIImageWriteToSavedPhotosAlbum(self.originalPhoto, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
    UIImageWriteToSavedPhotosAlbum(self.editedPhoto, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);

}


//Callback for photo
- (void)image:(UIImage *) image didFinishSavingWithError:(NSError *) error contextInfo:(void *) contextInfo
{
    //iterate save attempts - this should equal two before we take action due to "original" and "edited"
    attemptedSaves++;
    
    if(attemptedSaves == 2)
    {
    
        //Callback: Image save to photo album was suvccessful or something went wrong..
        if(error == nil && errorCount == 0)
        {
            //nothing went wrong
            messageLabel.text = @"Photos Saved";
            messageLabel.hidden = false;
            saveButton.enabled = false;
            [backButton setTitle:@"Back" forState:normal];
            
        }
        else
        {
            //something went wrong
            messageLabel.text = @"Error: Not Saved";
            messageLabel.hidden = false;
            
            //Start count over in case user trys again to save
            errorCount = 0;
            attemptedSaves =0;
        }
    }
    else
    {   //add an errors to my count
        if(error != nil){errorCount++;};
    }
}

@end
