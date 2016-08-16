//
//  NYTabBar.m
//  NYMicroblog
//
//  Created by Neil on 16/4/23.
//  Copyright © 2016年 Neil. All rights reserved.
//

#import "NYTabBar.h"
@interface NYTabBar()
@property(nonatomic, weak) UIButton *plusButton;
@end

@implementation NYTabBar
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setUpPlusButton];
        if (!iOS7) {
            self.backgroundImage = [UIImage imageWithName:@"tabbar_background"];
        }
        self.selectionIndicatorImage = [UIImage imageWithName:@"navigationbar_button_background"];
    }
    return self;
}

- (void)setUpPlusButton
{
    UIButton *plusButton = [[UIButton alloc] init];
    // set up background
    [plusButton setBackgroundImage:[UIImage imageWithName:@"tabbar_compose_button"] forState:UIControlStateNormal];
    [plusButton setBackgroundImage:[UIImage imageWithName:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
    // set up icon
    [plusButton setImage:[UIImage imageWithName:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
    [plusButton setImage:[UIImage imageWithName:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateHighlighted];
    [plusButton addTarget:self action:@selector(plusClicked) forControlEvents:UIControlEventTouchUpInside];
    // add
    [self addSubview:plusButton];
    self.plusButton = plusButton;

}

- (void)plusClicked
{
    if ([self.tabBarDelegate respondsToSelector:@selector(tabBarDidClickPlusButton:)]) {
        [self.tabBarDelegate tabBarDidClickPlusButton:self];
    }
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    [self setUpAllTabBarButtonsFrame];
    
    [self setUpPlusButtonFrame];
}

- (void)setUpAllTabBarButtonsFrame
{
    int idx = 0;
    
    for (UIView *tabBarButton in self.subviews) {
        if (![tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) continue;
        
        //set up the frame of that tab bar button
        [self setUpTabBarButtonFrame:tabBarButton AtIndex:idx];
        
        //set up the text color of selected button and others
//        [self setUpTabBarButtonTextColor:tabBarButton AtIndex:idx];
  
        idx++;
    }
}

- (void)setUpTabBarButtonFrame:(UIView *)tabBarButton AtIndex:(int)idx
{
    CGFloat buttonWidth = self.width / (self.items.count + 1);
    CGFloat buttonHeight = self.height;
    
    tabBarButton.width = buttonWidth;
    tabBarButton.height = buttonHeight;
    if (idx >= 2) {
        tabBarButton.x = buttonWidth * (idx + 1);
    }else{
        tabBarButton.x = buttonWidth * idx;
    }
    tabBarButton.y = 0;
}

//- (void)setUpTabBarButtonTextColor:(UIView *)tabBarButton AtIndex:(int)idx
//{
//    int selectedIndex = (int)[self.items indexOfObject:self.selectedItem];
//    
//    for (UILabel *label in tabBarButton.subviews) {
//        //not a label
//        if (![label isKindOfClass:[UILabel class]]) continue;
//        //is a label
//        label.font = [UIFont systemFontOfSize:10];
//        if (selectedIndex == idx) {
//            label.textColor = [UIColor orangeColor];
//        }else{
//            label.textColor = [UIColor blackColor];
//        }
//    }
//
//}

- (void)setUpPlusButtonFrame
{
    self.plusButton.size = self.plusButton.currentBackgroundImage.size;
    
    self.plusButton.center = CGPointMake(self.width / 2, self.height / 2);
}

@end
