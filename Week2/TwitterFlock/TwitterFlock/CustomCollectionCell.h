//
//  CustomCollectionCell.h
//  collectionTest
//
//  Created by Russell Gaspard on 6/10/14.
//  Copyright (c) 2014 Russell Gaspard. All rights reserved.
//
/*
 
 Russ Gaspard
 Week 2
 Mobile Development
 MDF2 1406
 
 */

#import <UIKit/UIKit.h>

@interface CustomCollectionCell : UICollectionViewCell
{
    
    
}


@property(nonatomic, strong)IBOutlet UILabel *textLabel;
@property(nonatomic, strong)IBOutlet UIImageView *cellImageView;

-(void)resetWithLabel:(NSString*)labelText cellImage:(UIImage*)cellImage;




@end
