//
//  ViewController.m
//  flickrClient
//
//  Created by fumiharu on 2014/05/02.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"
#import "MainTableViewCell.h"
#import "DetailViewController.h"
#import "Params.h"

@interface ViewController (){
    NSArray *photos, *photo, *farm, *ids, *secret, *server, *title;
    NSDictionary *dic;
}
@property (strong, nonatomic) IBOutlet UITextField *searchField;
@property (strong, nonatomic) IBOutlet UITableView *resultTableView;
- (IBAction)searchButton:(id)sender;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [_resultTableView registerNib:[UINib nibWithNibName:@"MainTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    
    NSString *query = [NSString stringWithFormat:kUrl, kApiKey, _searchField.text];
    NSURL *url = [NSURL URLWithString:query];
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    
    NSURLResponse *res;
    id data = [NSURLConnection sendSynchronousRequest:req returningResponse:&res error:nil];

    NSDictionary *allObj = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
//    NSData *obj = [NSJSONSerialization dataWithJSONObject:data options:0 error:nil];
    photos = [allObj objectForKey:@"photos"];
    photo = [photos valueForKey:@"photo"];
    farm = [photo valueForKeyPath:@"farm"];
    ids = [photo valueForKeyPath:@"id"];
    secret = [photo valueForKeyPath:@"secret"];
    server = [photo valueForKeyPath:@"server"];
    title = [photo valueForKeyPath:@"title"];
    NSLog(@"aaa+%@", photo);
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
//    return [[photos valueForKey:@"pages"]count];
    return 1;
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return [photos valueForKey:@"total"];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [title count];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 200;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MainTableViewCell *cell = [_resultTableView dequeueReusableCellWithIdentifier:@"cell"];
    NSString *mainFarms = [farm objectAtIndex:indexPath.row];
    NSString *mainServers = [server objectAtIndex:indexPath.row];
    NSString *mainIdss = [ids objectAtIndex:indexPath.row];
    NSString *mainSecrets = [secret objectAtIndex:indexPath.row];

    cell.mainPhotoImage.image = nil;
    
    if (cell == nil) {
        cell = [[MainTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    dispatch_queue_t q_global, q_main;
    q_global = dispatch_get_global_queue(0, 0);
    q_main = dispatch_get_main_queue();
    
    dispatch_async(q_global, ^{
        NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:kPhotoURL, mainFarms, mainServers, mainIdss, mainSecrets]]];
        
        dispatch_async(q_main, ^{
            cell.mainPhotoTitle.text = [title objectAtIndex:indexPath.row];
            cell.mainPhotoImage.image = [UIImage imageWithData:imageData];
            [cell layoutSubviews];
        });
    });
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    dic = [photo objectAtIndex:indexPath.row];
    UIViewController *detailView = [[DetailViewController alloc]initWithNibName:@"DetailViewController" bundle:nil param:dic];
    [self.navigationController pushViewController:detailView animated:YES];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)searchButton:(id)sender {
    [self viewDidLoad];
    [_resultTableView reloadData];
    [_searchField endEditing:YES];
    
}
@end
