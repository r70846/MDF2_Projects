//
//  PhotoCapController.m
//  Capture App
//
//  Created by Russell Gaspard on 6/19/14.
//  Copyright (c) 2014 Russell Gaspard. All rights reserved.
//

#import "PhotoCapController.h"
//#import <MobileCoreServices/MobileCoreServices.h>

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
    
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (void)saveImages
{
    //Save to my photo album programmtically
    
    UIImageWriteToSavedPhotosAlbum(self.originalPhoto, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
    UIImageWriteToSavedPhotosAlbum(self.editedPhoto, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);

}


//Callback for photo
- (void)image:(UIImage *) image didFinishSavingWithError:(NSError *) error contextInfo:(void *) contextInfo
{
    //Callback: Image save to photo album was suvccessful or something went wrong..
}

@end
