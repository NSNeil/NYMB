//
//  UIBarButtonItem+Extension.h
//  NYMicroblog
//
//  Created by Neil on 16/4/10.
//  Copyright © 2016年 Neil. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)
+ (UIBarButtonItem *)itemWithImageName:(NSString *)imageName highlightImageName:(NSString *)highlightImageName target:(id)target action:(SEL)action;
@end
