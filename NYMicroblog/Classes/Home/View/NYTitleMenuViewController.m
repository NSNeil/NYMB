//
//  NYTitleMenuViewControllerTableViewController.m
//  NYMicroblog
//
//  Created by Neil on 16/4/22.
//  Copyright © 2016年 Neil. All rights reserved.
//

#import "NYTitleMenuViewController.h"

@interface NYTitleMenuViewController ()

@end

@implementation NYTitleMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    if (indexPath.row == 0) {
        cell.textLabel.text = @"Friends";
    }else if (indexPath.row == 1) {
        cell.textLabel.text = @"BestFriends";
    }
    else if (indexPath.row == 2) {
        cell.textLabel.text = @"GoodFriends";
    }
    return cell;
}



@end
