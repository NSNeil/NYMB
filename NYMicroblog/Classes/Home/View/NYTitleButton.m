//
//  NYTitleButton.m
//  NYMicroblog
//
//  Created by Neil on 16/4/22.
//  Copyright © 2016年 Neil. All rights reserved.
//

#import "NYTitleButton.h"

@implementation NYTitleButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //center the inner image
        self.imageView.contentMode = UIViewContentModeCenter;
        //align the text
        self.titleLabel.textAlignment = NSTextAlignmentRight;
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.titleLabel.font = NYNavigationTitleFont;
        self.adjustsImageWhenHighlighted = NO;
    }
    return self;
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageY = 0;
    CGFloat imageW = self.height;
    CGFloat imageH = imageW;
    CGFloat imageX = self.width - imageW;
    return CGRectMake(imageX, imageY, imageW, imageH);
}

-(CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleY = 0;
    CGFloat titleW = self.width - self.height;
    CGFloat titleH = self.height;
    CGFloat titleX = 0;
    return CGRectMake(titleX, titleY, titleW, titleH);
}

@end
