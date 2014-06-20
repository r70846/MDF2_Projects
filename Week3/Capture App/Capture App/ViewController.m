//
//  ViewController.m
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

#import "ViewController.h"
#import "PhotoCapController.h"
#import "VideoCapController.h"
#import<MobileCoreServices/MobileCoreServices.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated
{
    
    //Track navigation - assign destination to "home"
    
    destination = @"home";
    
    [super viewWillAppear:animated];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

///////////////////////////////////////////////////////

-(IBAction)onClick:(id)sender
{
    //Cast the "sender" as a Button
    UIButton *btn = (UIButton*)sender;
    
    if(btn.tag == 0) //Photo Capture
    {
        [self capturePhoto];
    }
    else if(btn.tag == 1) //Video Cap
    {
        [self captureVideo];
    }
    else //Photo Album
    {
        [self displayAlbum];
    }

}

-(void)capturePhoto
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    if(picker != nil)
    {
        //Informs where to look for the photos
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        
        picker.delegate = self; //must implement delegate in my header
        
        //Turn editing on
        picker.allowsEditing = true;
        
        //Show the image picker controller
        [self presentViewController:picker animated:true completion:nil];
        
    }
}


-(void)captureVideo
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    if(picker != nil)
    {
        //Informs where to look for the photos
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        
        //Enable video..
        picker.mediaTypes = @[(NSString*)kUTTypeMovie];
        
        picker.delegate = self; //must implement delegate in my header
        
        //Show the (video)  controller
        [self presentViewController:picker animated:true completion:nil];
        
    }
}

-(void)displayAlbum
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    if(picker != nil)
    {
        //Informs where to look for the photos
        picker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
        
        picker.delegate = self; //must implement delegate in my header
        
        //Turn editing on
        picker.allowsEditing = false;
        
        //Show the image picker controller
        [self presentViewController:picker animated:true completion:nil];
        
    }
}



- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    
    
    NSString *mediaType = [info objectForKey:@"UIImagePickerControllerMediaType"];     //"public.image" or "public.movie"
    

    if([mediaType isEqualToString:@"public.image"])
    {
        capturedImage = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
        
        if(capturedImage != nil)
        {
            
            [picker dismissViewControllerAnimated:true completion:^(void){
                destination = @"photocap";
                [self performSegueWithIdentifier:@"segueToPhotoCap" sender:nil];
                
            }];
            
        }
        
        editedImage = [info objectForKey:@"UIImagePickerControllerEditedImage"];
    }
    else if([mediaType isEqualToString:@"public.movie"])
    {
        //Save my video
        NSURL *pathURL = [info objectForKey:@"UIImagePickerControllerMediaURL"];
        videoPath = [pathURL path];
        
        if(pathURL != nil)
        {
            
            [picker dismissViewControllerAnimated:true completion:^(void){
                destination = @"videocap";
                [self performSegueWithIdentifier:@"segueToVideoCap" sender:nil];
                
            }];
            
        }
    }
    
    
    
}

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    if ([destination  isEqual: @"photocap"] && [identifier isEqualToString:@"segueToPhotoCap"]) {
        return true;
    }
    if ([destination  isEqual: @"videocap"] && [identifier isEqualToString:@"segueToVideoCap"]) {
        return true;
    }
    return false;
}


//Called if we go to a detail view
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{

    
    if([destination isEqualToString:@"photocap"]) //Photo Cap
    {
        PhotoCapController *photoCapController = segue.destinationViewController;
        photoCapController.originalPhoto = capturedImage;
        photoCapController.editedPhoto = editedImage;
    }
     else if([destination isEqualToString:@"videocap"])
     {
        VideoCapController *videoCapController = segue.destinationViewController;
        videoCapController.moviePath = videoPath;
     }
 }

-(IBAction)done:(UIStoryboardSegue*)segue
{
    
}

@end
