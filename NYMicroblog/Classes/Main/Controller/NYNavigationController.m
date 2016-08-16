//
//  NYNavigationController.m
//  NYMicroblog
//
//  Created by Neil on 16/4/10.
//  Copyright © 2016年 Neil. All rights reserved.
//

#import "NYNavigationController.h"

@implementation NYNavigationController

+(void)initialize  //invoke once, when the class is initialized
{
    [self setUpNavigationBarTheme];
    
    [self setUpBarButtonItemTheme];
}

+ (void)setUpNavigationBarTheme
{
    //set the navigationbar's theme here
    UINavigationBar *appearance = [UINavigationBar appearance];
//    [appearance setBackgroundImage:[UIImage imageWithName:@"navigationbar_back"] forBarMetrics:UIBarMetricsDefault];
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor blackColor];
    textAttrs[NSFontAttributeName] = NYNavigationTitleFont;
    
    [appearance setTitleTextAttributes:textAttrs];
}

+ (void)setUpBarButtonItemTheme
{
    /**set up the text attribute**/
    //change the appearance of all the UIBarButtonItem
    UIBarButtonItem *appearance = [UIBarButtonItem appearance];
    
    //set the attribute of the text in normal state
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor orangeColor];
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:16];
//    //set the nomal state shadow
//    NSShadow *itemShadow = [[NSShadow alloc]init];
//    [itemShadow setShadowColor:[UIColor magentaColor]];
//    [itemShadow setShadowOffset:CGSizeMake(0.8, 0.8)];
//    textAttrs[NSShadowAttributeName] = itemShadow;
    [appearance setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    
    //set the attribute of the text in highlighted state
    NSMutableDictionary *highlightedTextAttrs = [NSMutableDictionary dictionaryWithDictionary:textAttrs];
    highlightedTextAttrs[NSForegroundColorAttributeName] = [UIColor blueColor];
    //set the hignlighted state shadow
    NSShadow *itemShadow = [[NSShadow alloc]init];
    [itemShadow setShadowColor:[UIColor magentaColor]];
    [itemShadow setShadowOffset:CGSizeMake(0.8, 0.8)];
    highlightedTextAttrs[NSShadowAttributeName] = itemShadow;
    [appearance setTitleTextAttributes:highlightedTextAttrs forState:UIControlStateHighlighted];
    
    //set the attribute of the text in highlighted state
    NSMutableDictionary *disabledTextAttrs = [NSMutableDictionary dictionaryWithDictionary:textAttrs];
    highlightedTextAttrs[NSForegroundColorAttributeName] = [UIColor lightGrayColor];
//    //set the disabled state shadow
//    NSShadow *itemShadow = [[NSShadow alloc]init];
//    [itemShadow setShadowColor:[UIColor magentaColor]];
//    [itemShadow setShadowOffset:CGSizeMake(0.8, 0.8)];
//    highlightedTextAttrs[NSShadowAttributeName] = itemShadow;
    [appearance setTitleTextAttributes:disabledTextAttrs forState:UIControlStateHighlighted];
    
    /**set up the button background**/
//[appearance setBackgroundImage:<#(nullable UIImage *)#> forState:<#(UIControlState)#> barMetrics:<#(UIBarMetrics)#>]
}
/**
 *  intercept all the childVC pushed in
 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0) {  //if the VC pushed in is not the first VC
        viewController.hidesBottomBarWhenPushed = YES;
        //add two button on its child view's navigation bar
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImageName:@"navigationbar_back" highlightImageName:@"navigationbar_back_highlighted" target:self action:@selector(back)];
        viewController.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImageName:@"navigationbar_more" highlightImageName:@"navigationbar_more_highlighted" target:self action:@selector(more)];
    }
    
    //If overwrite the method inherited from father class, when the method is called(even by the object created by the father class), the implementation in the child class is called, in this case, this very pushViewConrtoller:animated:
    [super pushViewController:viewController animated:animated];
}

- (void)back
{
    //self is the navigation controller of all of its childVC
    [self popViewControllerAnimated:YES];
}

- (void)more
{
    [self popToRootViewControllerAnimated:YES];
}
@end
