//
//  MainTableViewCell.h
//  flickrClient
//
//  Created by fumiharu on 2014/05/03.
//  Copyright (c) 2014年 fumiharu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *mainPhotoImage;
@property (strong, nonatomic) IBOutlet UILabel *mainPhotoTitle;

@end
