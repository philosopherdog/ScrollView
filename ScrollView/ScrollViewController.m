//
//  ViewController.m
//  ScrollView
//
//  Created by steve on 2018-08-12.
//  Copyright © 2018 steve. All rights reserved.
//

#import "ScrollViewController.h"

@interface ScrollViewController ()<UIScrollViewDelegate>
@property (nonatomic, weak) UIScrollView *scrollView;
@end

@implementation ScrollViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  [self setupScrollView];
  [self setupScrollViewZoom];
}

#define imageViewTag 200

- (void)setupScrollView {
  UIScrollView *scrollView = [[UIScrollView alloc] init];
  [self.view addSubview: scrollView];
  self.scrollView = scrollView;
  UIImage *image = [UIImage imageNamed:@"cats.jpg"];
  UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
  [self.scrollView addSubview: imageView];
  imageView.tag = imageViewTag;
}

- (void)setupScrollViewZoom {
  // make ourselves the delegate
  self.scrollView.delegate = self;
  // set min/max zoom scale
  self.scrollView.minimumZoomScale = 0.2;
  self.scrollView.maximumZoomScale = 3.0;
  
}

- (void)viewWillLayoutSubviews {
  self.scrollView.frame = self.view.frame;
  self.scrollView.contentSize = [self.scrollView viewWithTag:imageViewTag].intrinsicContentSize;
  CGFloat top = self.view.safeAreaInsets.top;
  self.scrollView.contentInset = UIEdgeInsetsMake(-top, 0, 0, 0);
}

#pragma mark - Delegates

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
  return [self.scrollView viewWithTag:imageViewTag];
}


@end
