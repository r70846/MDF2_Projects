//
//  CustomCollectionCell.m
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

#import "CustomCollectionCell.h"

@implementation CustomCollectionCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


-(void)resetWithLabel:(NSString*)labelText cellImage:(UIImage*)cellImage
{
    self.textLabel.text = labelText;
    self.cellImageView.image = cellImage;
}






/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
