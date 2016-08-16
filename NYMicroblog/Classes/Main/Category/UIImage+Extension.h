//
//  UIImage+Extension.h
//  NYMicroblog
//
//  Created by Neil on 16/4/10.
//  Copyright © 2016年 Neil. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)
/**
 *  adapt the pic according to the iOS6\7 platform
 **/
+ (UIImage *)imageWithName:(NSString *)name;
/**
 *  return a stretchable image
 **/
+ (UIImage *)resizedImage:(NSString *)name;

@end
