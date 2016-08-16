//
//  NYPopMenu.h
//  NYMicroblog
//
//  Created by Neil on 16/4/22.
//  Copyright © 2016年 Neil. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    NYPopMenuArrowPositionCenter = 0,
    NYPopMenuArrowPositionLeft = 1,
    NYPopMenuArrowPositionRight = 2
} NYPopMenuArrowPosition;

@class NYPopMenu;

@protocol NYPopMenuDelegate <NSObject>

@optional
- (void)popMenuDidDismissed:(NYPopMenu *)popMenu;
@end

@interface NYPopMenu : UIView
@property (nonatomic, weak) id<NYPopMenuDelegate> delegate;
//
//@property (nonatomic, assign, getter = isDimBackground) BOOL dimBackground;
//
@property (nonatomic, assign) NYPopMenuArrowPosition arrowPosition;

/**
 *  Initialization Methods
 */
//- (instancetype)initWithContentView:(UIView *)contentView;
+ (instancetype)menu;

- (void)showFrom:(UIView *)from;

- (void)dismiss;
///**
// *  Set the Background Image of the Menu
// */
//- (void)setBackground:(UIImage *)background;
//
///**
// *  Show Menu
// */
//- (void)showInRect:(CGRect)rect;
//
///**
// *  Close Menu
// */
//- (void)dismiss;

@property(nonatomic, strong) UIView *content;
@property(nonatomic, strong) UIViewController *contentController;


@end
