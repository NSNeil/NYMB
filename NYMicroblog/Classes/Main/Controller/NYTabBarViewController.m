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
#import "NYTabBar.h"
#import "NYComposeViewController.h"

@interface NYTabBarViewController ()<NYTabBarDelegate>

@end

@implementation NYTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addCustomTabBar];
    
    [self addAllChildVCs];
    
    //once the view controller is changed, call tabBarController:didSelectViewController:
//    self.delegate = self;
}

//- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
//{
//    [self.tabBar setNeedsLayout];
//}

- (void)addCustomTabBar
{
    NYTabBar *customTabBar = [[NYTabBar alloc]init];
    customTabBar.tabBarDelegate = self;
    
    //if the system property is readonly, set it using KVC
    [self setValue:customTabBar forKey:@"tabBar"];
}

- (void)addAllChildVCs
{
    NYHomeViewController *home = [[NYHomeViewController alloc]init];
    [self addOneChildVc:home title:@"Home" imageName:@"tabbar_home" selectedImageName:@"tabbar_home_selected"];
    
    NYMassegeViewController *message = [[NYMassegeViewController alloc]init];
    [self addOneChildVc:message title:@"Message" imageName:@"tabbar_message_center" selectedImageName:@"tabbar_message_center_selected"];
    
    NYDiscoverViewController *discover = [[NYDiscoverViewController alloc]init];
    [self addOneChildVc:discover title:@"Discover" imageName:@"tabbar_discover" selectedImageName:@"tabbar_discover_selected"];
    
    NYProfileViewController *profile = [[NYProfileViewController alloc]init];
    [self addOneChildVc:profile title:@"Profile" imageName:@"tabbar_profile" selectedImageName:@"tabbar_profile_selected"];
}

- (void)addOneChildVc:(UIViewController *)childVc title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName
{
    /*** if do this, viewDidLoad is called before navigation bar is initialized so setting the self.navigationItem.rightBarButtonItem.enabled to NO in the viewDidLoad has no impact to the rightBarButtonItem.
    childVc.view.backgroundColor = NYRandomColor;        
     ***/
    
    //set the title
//    childVc.tabBarItem.title = title;
//    childVc.navigationItem.title = title;
    childVc.title = title;
    
    childVc.tabBarItem.image = [UIImage imageWithName:imageName];
    
    //set the normal text color of the tabBarItem
    NSMutableDictionary *textAttribute = [NSMutableDictionary dictionary];
    textAttribute[NSForegroundColorAttributeName] = [UIColor blackColor];
    textAttribute[NSFontAttributeName] = [UIFont systemFontOfSize:10];
    [childVc.tabBarItem setTitleTextAttributes:textAttribute forState:UIControlStateNormal];
    //set the selected text color of the tabBarItem
    NSMutableDictionary *selectedTextAttribute = [NSMutableDictionary dictionary];
    selectedTextAttribute[NSForegroundColorAttributeName] = [UIColor orangeColor];
    [childVc.tabBarItem setTitleTextAttributes:selectedTextAttribute forState:UIControlStateSelected];
    
    //set the selected image
    UIImage *selectedImage = [UIImage imageWithName:selectedImageName];
    if (iOS7) {
        selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    childVc.tabBarItem.selectedImage = selectedImage;
    
    //embed the UIViewController(TableViewController) inside the UINavigationController so every UITableViewController has a navigation bar
    NYNavigationController *nav = [[NYNavigationController alloc]initWithRootViewController:childVc];
    [self addChildViewController:nav];
}

#pragma mark - NYTabBarDelegate
- (void)tabBarDidClickPlusButton:(NYTabBar *)tabBar
{
    NYComposeViewController *compose = [[NYComposeViewController alloc]init];
    NYNavigationController *nav = [[NYNavigationController alloc]initWithRootViewController:compose];
    
    [self presentViewController:nav animated:YES completion:nil];
}
@end
