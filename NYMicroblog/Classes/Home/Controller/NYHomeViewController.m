//
//  NYHomeViewController.m
//  NYMicroblog
//
//  Created by Neil on 16/4/10.
//  Copyright © 2016年 Neil. All rights reserved.
//

#import "NYHomeViewController.h"
#import "HMOneViewController.h"
#import "NYTitleButton.h"
#import "NYPopMenu.h"
#import "NYTitleMenuViewController.h"

@interface NYHomeViewController()<NYPopMenuDelegate>
@end

@implementation NYHomeViewController 
-(void)viewDidLoad
{
    [super viewDidLoad];
    
    //set the bar button items
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImageName:@"navigationbar_friendsearch" highlightImageName:@"navigationbar_friendsearch_highlighted" target:self action:@selector(friendSearch)];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImageName:@"navigationbar_pop" highlightImageName:@"navigationbar_pop_highlighted" target:self action:@selector(pop)];
    
    //set the title button in the middle of the navigation bar
    NYTitleButton *titleButton = [[NYTitleButton alloc]init];
    //set the text
    [titleButton setTitle:@"Home" forState:UIControlStateNormal];
    //set the image
    [titleButton setImage:[UIImage imageWithName:@"navigationbar_arrow_down"] forState:UIControlStateNormal];
    [titleButton setBackgroundImage:[UIImage resizedImage:@"navigationbar_filter_background_highlighted"] forState:UIControlStateHighlighted];
    //set the frame(bounds is (0, 0) fixed)
    titleButton.width = 100;
    titleButton.height = 30;
    //listen to the click event
    [titleButton addTarget:self action:@selector(titleClicked:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.titleView = titleButton;
    
    UIButton *btn = [[UIButton alloc]init];
    
    [self.view addSubview:btn];
}

- (void)titleClicked:(UIButton *)titleButton
{
    //set the arrow to up
    [titleButton setImage:[UIImage imageWithName:@"navigationbar_arrow_up"] forState:UIControlStateNormal];
    
    NYPopMenu *menu = [NYPopMenu menu];
//    menu.arrowPosition = NYPopMenuArrowPositionLeft;
    menu.delegate = self;
    
    NYTitleMenuViewController *vc = [[NYTitleMenuViewController alloc]init];
    vc.view.height = 44 * 6;
    vc.view.width = 300;
    menu.contentController = vc;
    
    [menu showFrom:titleButton];
}

#pragma mark - PopMenuDelegate Methods
- (void)popMenuDidDismissed:(NYPopMenu *)popMenu
{
    NYTitleButton *titleButton = (NYTitleButton *)self.navigationItem.titleView;
    [titleButton setImage:[UIImage imageWithName:@"navigationbar_arrow_down"] forState:UIControlStateNormal];
}

- (void)pop
{
    NYLog(@"pop---");
}

- (void)friendSearch
{
    NYLog(@"friendSearch---");
    HMOneViewController *one = [[HMOneViewController alloc]init];
    one.title = @"OneVC";
    [self.navigationController pushViewController:one animated:YES];
}

#pragma mark - Table view data source
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
    cell.textLabel.text = [NSString stringWithFormat:@"Fake Data----%ld",(long)indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%@",self.navigationController);
    UIViewController *newVc = [[UIViewController alloc] init];
    newVc.view.backgroundColor = [UIColor redColor];
    newVc.title = @"NewVC";
    [self.navigationController pushViewController:newVc animated:YES];
}
@end
