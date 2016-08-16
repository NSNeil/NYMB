//
//  NYTabBar.h
//  NYMicroblog
//
//  Created by Neil on 16/4/23.
//  Copyright © 2016年 Neil. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NYTabBar;
@protocol NYTabBarDelegate <NSObject>

@optional
- (void)tabBarDidClickPlusButton:(NYTabBar *)tabBar;

@end

@interface NYTabBar : UITabBar
@property (nonatomic, weak) id<NYTabBarDelegate> tabBarDelegate;
@end
