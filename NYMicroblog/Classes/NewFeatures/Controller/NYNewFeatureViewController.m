//
//  NYNewFeatureViewController.m
//  NYMicroblog
//
//  Created by Neil on 16/4/23.
//  Copyright © 2016年 Neil. All rights reserved.
//

#define NYNewFeatureImageCount 4

#import "NYNewFeatureViewController.h"
#import "NYTabBarViewController.h"

@interface NYNewFeatureViewController ()<UIScrollViewDelegate>
@property (nonatomic, weak) UIPageControl * pageControl;
@end

@implementation NYNewFeatureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpScrollView];
    [self setUpPageControl];
}

- (void)setUpScrollView
{
    UIScrollView *scrollView = [[UIScrollView alloc]init];
    scrollView.frame = self.view.frame;
    scrollView.delegate = self;
    [self.view addSubview:scrollView];
    
    CGFloat imageViewW = scrollView.width;
    CGFloat imageViewH = scrollView.height;
    
    for (int i = 0; i < NYNewFeatureImageCount; i++) {
        UIImageView *imageView = [[UIImageView alloc]init];
        NSString *imageName = [NSString stringWithFormat:@"new_feature_%d", i + 1];
        
        imageView.image = [UIImage imageWithName:imageName];
        [scrollView addSubview:imageView];
        
        imageView.y = 0;
        imageView.width = imageViewW;
        imageView.height = imageViewH;
        imageView.x = i * imageViewW;
        
        if (i == NYNewFeatureImageCount - 1) {
            [self setupLastImageView:imageView];
        }
    }
    
    scrollView.contentSize = CGSizeMake(NYNewFeatureImageCount * imageViewW, 0);
    scrollView.pagingEnabled = YES;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.backgroundColor = NYColor(246, 246, 246);
}

- (void)setUpPageControl
{
    UIPageControl *pageControl = [[UIPageControl alloc]init];
    pageControl.numberOfPages = NYNewFeatureImageCount;
    pageControl.centerX = self.view.width * 0.5;
    pageControl.centerY = self.view.height - 30;
    [self.view addSubview:pageControl];
    
    pageControl.currentPageIndicatorTintColor = NYColor(253, 98, 42);
    pageControl.pageIndicatorTintColor = NYColor(189, 189, 189);
    self.pageControl = pageControl;
}

- (void)setupLastImageView:(UIImageView *)imageView
{
    imageView.userInteractionEnabled = YES;
    
    [self setUpStartButton:imageView];
    
    [self setUpShareButton:imageView];
}

- (void)setUpShareButton:(UIImageView *)imageView
{
    UIButton *shareButton = [[UIButton alloc]init];
    [imageView addSubview:shareButton];
    
    [shareButton setTitle:@"Share to my friends" forState:UIControlStateNormal];
    [shareButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [shareButton setImage:[UIImage imageWithName:@"new_feature_share_false"] forState:UIControlStateNormal];
    [shareButton setImage:[UIImage imageWithName:@"new_feature_share_true"] forState:UIControlStateSelected];
    [shareButton addTarget:self action:@selector(share:) forControlEvents:UIControlEventTouchUpInside];
    
    shareButton.size = CGSizeMake(230, 35);
    shareButton.centerX = self.view.width * 0.5;
    shareButton.centerY = self.view.height * 0.7;
    
    shareButton.titleEdgeInsets = UIEdgeInsetsMake(0, 15, 0, 0);
    
}

- (void)share:(UIButton *)shareButton
{
    shareButton.selected = !shareButton.isSelected;
//    UIImage *falseImage = [UIImage imageWithName:@"new_feature_share_false"];
//    if(shareButton.currentImage.CGImage == falseImage.CGImage){
//        [shareButton setImage:[UIImage imageWithName:@"new_feature_share_true"] forState:UIControlStateNormal];
//    }else{
//        [shareButton setImage:falseImage forState:UIControlStateNormal];
//    }
}

- (void)setUpStartButton:(UIImageView *)imageView
{
    UIButton *startButton = [[UIButton alloc] init];
    [imageView addSubview:startButton];
    

    [startButton setBackgroundImage:[UIImage imageWithName:@"new_feature_finish_button"] forState:UIControlStateNormal];
    [startButton setBackgroundImage:[UIImage imageWithName:@"new_feature_finish_button_highlighted"] forState:UIControlStateHighlighted];
    
    
    startButton.size = startButton.currentBackgroundImage.size;
    startButton.centerX = self.view.width * 0.5;
    startButton.centerY = self.view.height * 0.8;
    
    
    [startButton setTitle:@"Start" forState:UIControlStateNormal];
    [startButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [startButton addTarget:self action:@selector(start) forControlEvents:UIControlEventTouchUpInside];
}

- (void)start
{
    NYTabBarViewController *vc = [[NYTabBarViewController alloc]init];
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    
    window.rootViewController =vc;
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat rawPage = scrollView.contentOffset.x / scrollView.width;
    
    int intPage = (int)(rawPage + 0.5);
    
    self.pageControl.currentPage = intPage;
}
@end
