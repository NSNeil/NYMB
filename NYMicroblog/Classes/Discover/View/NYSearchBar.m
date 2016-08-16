//
//  NYSearchBar.m
//  NYMicroblog
//
//  Created by apple on 16/4/12.
//  Copyright © 2016年 Neil. All rights reserved.
//

#import "NYSearchBar.h"

@implementation NYSearchBar

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.background = [UIImage resizedImage:@"searchbar_textfield_background"];
        //set the content to vertically aligned
        self.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        //set the magnifier on the left
        UIImageView *leftView = [[UIImageView alloc]init];
        leftView.image = [UIImage imageWithName:@"searchbar_textfield_search_icon"];
        leftView.frame = CGRectMake(0, 0, leftView.image.size.width + 10, leftView.image.size.height);
        leftView.contentMode = UIViewContentModeCenter;
        self.leftView = leftView;
        //set the leftView to show always
        self.leftViewMode = UITextFieldViewModeAlways;
        self.clearButtonMode = UITextFieldViewModeAlways;
    }
    return self;
}


+ (instancetype)searchBar
{
    return [[self alloc]init];
}

@end
