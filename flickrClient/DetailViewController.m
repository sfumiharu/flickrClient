//
//  DetailViewController.m
//  flickrClient
//
//  Created by fumiharu on 2014/05/04.
//  Copyright (c) 2014年 fumiharu. All rights reserved.
//

#import "DetailViewController.h"
#import "Params.h"

@interface DetailViewController (){
    NSDictionary *param;
    NSArray *detailFarm, *detailids, *detailSecret, *detailServer, *detailTitle;
    
}
@property (strong, nonatomic) IBOutlet UIImageView *detailPhotoImage;
@property (strong, nonatomic) IBOutlet UILabel *detailPhotoTitle;
@property (strong, nonatomic) IBOutlet UITableView *detailComment;

@end

@implementation DetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil param:(NSDictionary *)aparam
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        param = aparam;
        NSLog(@"%@", param);
    }
    return  self;
//    NSLog(@"pa+%@", param);
    // Do any additional setup after loading the view from its nib.
}

-(void)viewDidLoad{
    NSString *detailFarms = [param valueForKey:@"farm"];
    NSString *detailServers = [param valueForKey:@"server"];
    NSString *detailIds = [param valueForKey:@"id"];
    NSString *detailSecrets = [param valueForKey:@"secret"];
    NSString *detailTitles = [param valueForKey:@"title"];
    
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:kPhotoURL, detailFarms, detailServers, detailIds, detailSecrets]]];
    _detailPhotoImage.image = [UIImage imageWithData:data];
    
    _detailPhotoTitle.text = detailTitles;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
