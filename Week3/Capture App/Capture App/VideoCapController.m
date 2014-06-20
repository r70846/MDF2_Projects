//
//  VideoCapController.m
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

#import "VideoCapController.h"

@interface VideoCapController ()

@end

@implementation VideoCapController
@synthesize moviePath;

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
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveVideo:(id)sender
{
    //Save to my photo album programmtically
    UISaveVideoAtPathToSavedPhotosAlbum(self.moviePath, self, @selector(video:didFinishSavingWithError:contextInfo:), nil);
    
}

//Callback for video
- (void)video:(UIImage *) videoPath didFinishSavingWithError:(NSError *) error contextInfo:(void *) contextInfo
{
    //Callback: Image save to photo album was suv=ccessful or something went wrong..
    if(error == nil)
    {
        //nothing went wrong - save message
        instructionLabel.text = @"Click Back for Home Screen";
        messageLabel.text = @"Video Saved";
        messageLabel.hidden = false;
        
        //adjust button titles/states
        saveButton.enabled = false;
        [backButton setTitle:@"Back" forState:normal];
    }
    else
    {
        //Let the user know that something went wrong
        messageLabel.text = @"Error: Not Saved";
        messageLabel.hidden = false;
    }
}



@end
