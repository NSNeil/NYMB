//
//  NYPopMenu.m
//  NYMicroblog
//
//  Created by Neil on 16/4/22.
//  Copyright © 2016年 Neil. All rights reserved.
//

#import "NYPopMenu.h"
@interface NYPopMenu()
@property (nonatomic, weak) UIImageView *containerView;
@end

@implementation NYPopMenu

- (UIImageView *)containerView
{
    if (!_containerView) {
        UIImageView *containerView = [[UIImageView alloc]init];
        containerView.image = [UIImage imageNamed:@"popover_background"];
//        containerView.width = 217;
//        containerView.height = 300;
        containerView.userInteractionEnabled = YES;
        [self addSubview:containerView];
        self.containerView = containerView;
    }
    return _containerView;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)setArrowPosition:(NYPopMenuArrowPosition)arrowPosition
{
    _arrowPosition = arrowPosition;
    
    switch (arrowPosition) {
        case NYPopMenuArrowPositionCenter:
            self.containerView.image = [UIImage resizedImage:@"popover_background"];
            break;
            
        case NYPopMenuArrowPositionLeft:
            self.containerView.image = [UIImage resizedImage:@"popover_background_left"];
            break;
            
        case NYPopMenuArrowPositionRight:
            self.containerView.image = [UIImage resizedImage:@"popover_background_right"];
            break;
    }
}

+ (instancetype)menu
{
    return [[self alloc]init];
}

-(void)showFrom:(UIView *)from
{
    UIWindow *window = [[UIApplication sharedApplication].windows lastObject];
    
    [window addSubview:self];
    
    self.frame = window.bounds;
    
    CGRect newFrame = [from.superview convertRect:from.frame toView:window];
//    CGRect newFrame = [from convertRect:from.bounds toView:window];
    
    self.containerView.centerX = CGRectGetMidX(newFrame);
    self.containerView.y = CGRectGetMaxY(newFrame);
    
}

-(void)dismiss
{
    if ([self.delegate respondsToSelector:@selector(popMenuDidDismissed:)]) {
        [self.delegate popMenuDidDismissed:self];
    }
    [self removeFromSuperview];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self dismiss];
}

-(void)setContent:(UIView *)content
{
    _content = content;
    content.x = 10;
    content.y = 15;
    
//    content.width = self.containerView.width - 2 * content.x;
    
    self.containerView.height = CGRectGetMaxY(content.frame) + 11;
    self.containerView.width = CGRectGetMaxX(content.frame) + 10;
    
    [self.containerView addSubview:content];
}

- (void)setContentController:(UIViewController *)contentController
{
    _contentController = contentController;
    
    self.content = contentController.view;
}


@end
