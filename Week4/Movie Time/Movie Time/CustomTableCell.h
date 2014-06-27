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

//create reference to my UI Elements
@property (nonatomic, strong)IBOutlet UILabel *cellLabel;
@property (nonatomic, strong)IBOutlet UILabel *showtimesLabel;
@property (nonatomic, strong)IBOutlet UIImageView *movieImage;

@end
