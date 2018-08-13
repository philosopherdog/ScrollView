  //
  //  PageViewController.m
  //  ScrollView
  //
  //  Created by steve on 2018-08-13.
  //  Copyright © 2018 steve. All rights reserved.
  //

#import "PageViewController.h"
#import "ScrollViewController.h"

@interface PageViewController ()<UIScrollViewDelegate>
@property (nonatomic, weak) UIScrollView *scrollView;
@property (nonatomic)NSArray<UIImageView*>*imageViews;
@property (nonatomic, weak) UIPageControl *pageControl;
@end

@implementation PageViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  [self setupScrollView];
  [self setupLayout];
  [self setupPageControl];
}

- (void)setupScrollView {
  UIScrollView *sv = [[UIScrollView alloc] init];
  sv.delegate = self;
  sv.scrollsToTop = YES;
  [self.view addSubview:sv];
  self.scrollView = sv;
  self.scrollView.pagingEnabled = YES;
  UIImage *image1 = [UIImage imageNamed:@"chicago.jpg"];
  UIImage *image2 = [UIImage imageNamed:@"montreal.jpg"];
  UIImageView *imageView1 = [[UIImageView alloc] initWithImage:image1];
  imageView1.contentMode = UIViewContentModeScaleAspectFill;
  imageView1.clipsToBounds = YES;
  UIImageView *imageView2 = [[UIImageView alloc] initWithImage:image2];
  
  imageView2.contentMode = UIViewContentModeScaleAspectFill;
  imageView2.clipsToBounds = YES;
  [self.scrollView addSubview:imageView1];
  [self.scrollView addSubview:imageView2];
  
  self.imageViews = @[imageView1, imageView2];
  
  [self setupButtonOnImageView:imageView2];

}

- (void)setupButtonOnImageView:(UIImageView *)imageView {
  imageView.userInteractionEnabled = YES;
  UIButton *button = [[UIButton alloc]init];
  [button setTitle:@"Done" forState:UIControlStateNormal];
  button.backgroundColor = [UIColor orangeColor];
  [button sizeToFit];
//  button.layer.zPosition = 200;
  [imageView addSubview:button];
  button.center = self.view.center;
  [button addTarget:self action:@selector(buttonTapped) forControlEvents:UIControlEventTouchUpInside];
  button.userInteractionEnabled = YES;
  button.enabled = YES;
}

- (void)buttonTapped {
  // Create scrollViewController
  ScrollViewController *scrollViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ScrollViewController"];
  
  // set it as the root controller on the window
  self.view.window.rootViewController = scrollViewController;
}

- (void)setupLayout {
  self.scrollView.translatesAutoresizingMaskIntoConstraints = NO;
  self.imageViews[0].translatesAutoresizingMaskIntoConstraints = NO;
  self.imageViews[1].translatesAutoresizingMaskIntoConstraints = NO;
  
    // scrollView to self.view
  [self.scrollView.topAnchor constraintEqualToAnchor:self.view.topAnchor].active = YES;
  [self.scrollView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor].active = YES;
  [self.scrollView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = YES;
  [self.scrollView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor].active = YES;
  
    // imageView1
  UIImageView *imageView1 = self.imageViews[0];
  [imageView1.topAnchor constraintEqualToAnchor:self.scrollView.topAnchor].active = YES;
  [imageView1.bottomAnchor constraintEqualToAnchor:self.scrollView.bottomAnchor].active = YES;
  [imageView1.leadingAnchor constraintEqualToAnchor:self.scrollView.leadingAnchor].active = YES;
  
    // imageView1 width and height
  
  [imageView1.widthAnchor constraintEqualToAnchor:self.view.widthAnchor].active = YES;
  [imageView1.heightAnchor constraintEqualToAnchor:self.view.heightAnchor].active = YES;
  
    // imageView2
  UIImageView *imageView2 = self.imageViews[1];

  [imageView2.topAnchor constraintEqualToAnchor:self.scrollView.topAnchor].active = YES;
  [imageView2.bottomAnchor constraintEqualToAnchor:self.scrollView.bottomAnchor].active = YES;
  
    //****
  [imageView2.leadingAnchor constraintEqualToAnchor:imageView1.trailingAnchor].active = YES;
  
  [imageView2.trailingAnchor constraintEqualToAnchor:self.scrollView.trailingAnchor].active = YES;
  
    // imageView2 height/width
  
  [imageView2.widthAnchor constraintEqualToAnchor:imageView1.widthAnchor].active = YES;
  [imageView2.heightAnchor constraintEqualToAnchor:imageView1.heightAnchor].active = YES;
}

- (void)setupPageControl {
  UIPageControl *pageControl = [[UIPageControl alloc] init];
  [self.view addSubview:pageControl];
  self.pageControl = pageControl;
  pageControl.layer.zPosition = 100;
  pageControl.backgroundColor = [UIColor blackColor];
  pageControl.alpha = 0.5;
  pageControl.translatesAutoresizingMaskIntoConstraints = NO;
  [pageControl.heightAnchor constraintEqualToConstant:50.0].active = YES;
  [pageControl.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor].active = YES;
  [pageControl.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor].active = YES;
  [pageControl.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = YES;
  pageControl.numberOfPages = self.imageViews.count;
  pageControl.currentPage = 0;
}

#pragma mark - Delegates

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
  
  CGFloat xOffset = scrollView.contentOffset.x;
  CGFloat width = self.view.frame.size.width;
  if (xOffset < width) {
    self.pageControl.currentPage = 0;
  } else {
    NSInteger pageNum = xOffset / self.view.frame.size.width;
    self.pageControl.currentPage = pageNum;
  }
  
}






























@end
