//
//  ViewController.m
//  Capture App
//
//  Created by Russell Gaspard on 6/19/14.
//  Copyright (c) 2014 Russell Gaspard. All rights reserved.
//

#import "ViewController.h"
#import "PhotoCapController.h"

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
        
        
        
        //[self performSegueWithIdentifier:@"segueToPhotoCap" sender:sender];
    }

}

-(void)capturePhoto
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    if(picker != nil)
    {
        //Informs where to look for the photos
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        
        //Must #import<MobileCoreServices/MobileCoreServices.h> and add line below to enable video..
        //picker.mediaTypes = @[(NSString*)kUTTypeMovie];
        
        picker.delegate = self; //must implement delegate in my header
        
        //Turn editing on
        picker.allowsEditing = true;
        
        //Show the image picker controller
        [self presentViewController:picker animated:true completion:nil];
        
    }
}


- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
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
 
    /*
    if(editedImage != nil)
    {
       // editedImageView.image = editedImage;
        
        NSLog(@"made it here!");
    }
    */
    
    //Save to my photo album programmtically
    
    //UIImageWriteToSavedPhotosAlbum(selectedImage, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
    //UIImageWriteToSavedPhotosAlbum(editedImage, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
    
    //NSLog(@"info=%@",info);
}

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    if ([destination  isEqual: @"photocap"] && [identifier isEqualToString:@"segueToPhotoCap"]) {
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
     
         /*
    else if(btn.tag == 1) //Video Cap
    {
        [self performSegueWithIdentifier:@"segueToVideoCap" sender:sender];
    }
    else //Photo Album
    {
        [self performSegueWithIdentifier:@"segueToAlbum" sender:sender];
    }
    */
    
    /*
    SelectionViewController *selectionViewController = segue.destinationViewController;
    
    if (selectionViewController != nil)
    {
        
        //Cast the "sender" as a TableView Cell
        //UITableViewCell *cell = (UITableViewCell*)sender;
        //NSIndexPath *indexPath = [calTableView indexPathForCell:cell];
        
        
        //selectionViewController.dataString = [gigWeekArray objectAtIndex:indexPath.row];
    }
     
     */
}

-(IBAction)done:(UIStoryboardSegue*)segue
{
    
}

@end
