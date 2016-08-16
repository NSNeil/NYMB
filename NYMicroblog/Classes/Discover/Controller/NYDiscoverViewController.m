//
//  NYDiscoverViewController.m
//  NYMicroblog
//
//  Created by Neil on 16/4/10.
//  Copyright © 2016年 Neil. All rights reserved.
//

#import "NYDiscoverViewController.h"
#import "NYSearchBar.h"
@implementation NYDiscoverViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    NYSearchBar *searchBar = [NYSearchBar searchBar];
    searchBar.frame = CGRectMake(0, 0, 380, 27);
    
    self.navigationItem.titleView = searchBar;
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"Fake Discover Data----%ld",(long)indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%@",self.navigationController);
    UIViewController *newVc = [[UIViewController alloc] init];
    newVc.view.backgroundColor = [UIColor yellowColor];
    newVc.title = @"NewVC";
    [self.navigationController pushViewController:newVc animated:YES];
}

@end
