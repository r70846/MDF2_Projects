//
//  CustomTableCell.h
//  Movie Time
//
//  Created by Russell Gaspard on 6/26/14.
//  Copyright (c) 2014 Russell Gaspard. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableCell : UITableViewCell
{
    
}

@property (nonatomic, strong)IBOutlet UILabel *cellLabel;
@property (nonatomic, strong)IBOutlet UILabel *timeOne;
@property (nonatomic, strong)IBOutlet UILabel *timeTwo;
@property (nonatomic, strong)IBOutlet UILabel *timeThree;
@property (nonatomic, strong)IBOutlet UIImageView *movieImage;

@end
