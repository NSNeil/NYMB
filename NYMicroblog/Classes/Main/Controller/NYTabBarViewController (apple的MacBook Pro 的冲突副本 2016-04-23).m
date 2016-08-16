//
//  NYTabBarViewController.m
//  NYMicroblog
//
//  Created by Neil on 16/4/9.
//  Copyright © 2016年 Neil. All rights reserved.
//

#import "NYTabBarViewController.h"
#import "NYHomeViewController.h"
#import "NYMassegeViewController.h"
#import "NYDiscoverViewController.h"
#import "NYProfileViewController.h"
#import "NYNavigationController.h"


@interface NYTabBarViewController ()

@end

@implementation NYTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
     NYHomeViewController *home = [[NYHomeViewController alloc]init];
    [self addOneChildVc:home title:@"Home" imageName:@"tabbar_home" selectedImageName:@"tabbar_home_selected"];
    
    NYMassegeViewController *message = [[NYMassegeViewController alloc]init];
    [self addOneChildVc:message title:@"Message" imageName:@"tabbar_message_center" selectedImageName:@"tabbar_message_center_selected"];
    
    NYDiscoverViewController *discover = [[NYDiscoverViewController alloc]init];
    [self addOneChildVc:discover title:@"Discover" imageName:@"tabbar_discover" selectedImageName:@"tabbar_discover_selected"];
    
    NYProfileViewController *profile = [[NYProfileViewController alloc]init];
    [self addOneChildVc:profile title:@"Profile" imageName:@"tabbar_profile" selectedImageName:@"tabbar_profile_selected"];
    
//    self.tabBar.backgroundImage = [UIImage imageWithName:@"tabbar_background"];

}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
uitabba
}

- (void)addOneChildVc:(UIViewController *)childVc title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    //if do this, viewDidLoad is called before navigation bar is initialized so setting the self.navigationItem.rightBarButtonItem.enabled to NO in the viewDidLoad has no impact to the rightBarButtonItem.
//    childVc.view.backgroundColor = NYRandomColor;
    //set the title
//    childVc.tabBarItem.title = title;
//    childVc.navigationItem.title = title;
    childVc.title = title;
    
    childVc.tabBarItem.image = [UIImage imageWithName:imageName];
    UIImage *selectedImage = [UIImage imageWithName:selectedImageName];
    if (iOS7) {
        selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    childVc.tabBarItem.selectedImage = selectedImage;
    //embed the UIViewController(TableViewController) inside the UINavigationController so every UITableViewController has a navigation bar
    NYNavigationController *nav = [[NYNavigationController alloc]initWithRootViewController:childVc];
    [self addChildViewController:nav];
}

@end
