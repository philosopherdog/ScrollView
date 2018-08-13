  //
  //  PageViewController.m
  //  ScrollView
  //
  //  Created by steve on 2018-08-13.
  //  Copyright © 2018 steve. All rights reserved.
  //

#import "PageViewController.h"

@interface PageViewController ()<UIScrollViewDelegate>
@property (nonatomic, weak) UIScrollView *scrollView;
@property (nonatomic, weak) UIImageView *imageView1;
@property (nonatomic, weak) UIImageView *imageView2;


@end

@implementation PageViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  [self setupScrollView];
  [self setupLayout];
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
  self.imageView1 = imageView1;
  self.imageView2 = imageView2;
}

- (void)setupLayout {
  self.scrollView.translatesAutoresizingMaskIntoConstraints = NO;
  self.imageView1.translatesAutoresizingMaskIntoConstraints = NO;
  self.imageView2.translatesAutoresizingMaskIntoConstraints = NO;
  
    // scrollView to self.view
  [self.scrollView.topAnchor constraintEqualToAnchor:self.view.topAnchor].active = YES;
  [self.scrollView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor].active = YES;
  [self.scrollView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = YES;
  [self.scrollView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor].active = YES;
  
    // imageView1
  
  [self.imageView1.topAnchor constraintEqualToAnchor:self.scrollView.topAnchor].active = YES;
  [self.imageView1.bottomAnchor constraintEqualToAnchor:self.scrollView.bottomAnchor].active = YES;
  [self.imageView1.leadingAnchor constraintEqualToAnchor:self.scrollView.leadingAnchor].active = YES;
  
    // imageView1 width and height
  
  [self.imageView1.widthAnchor constraintEqualToAnchor:self.view.widthAnchor].active = YES;
  [self.imageView1.heightAnchor constraintEqualToAnchor:self.view.heightAnchor].active = YES;
  
    // imageView2
  [self.imageView2.topAnchor constraintEqualToAnchor:self.scrollView.topAnchor].active = YES;
  [self.imageView2.bottomAnchor constraintEqualToAnchor:self.scrollView.bottomAnchor].active = YES;
  
    //****
  [self.imageView2.leadingAnchor constraintEqualToAnchor:self.imageView1.trailingAnchor].active = YES;
  
  [self.imageView2.trailingAnchor constraintEqualToAnchor:self.scrollView.trailingAnchor].active = YES;
  
    // imageView2 height/width
  
  [self.imageView2.widthAnchor constraintEqualToAnchor:self.imageView1.widthAnchor].active = YES;
  [self.imageView2.heightAnchor constraintEqualToAnchor:self.imageView1.heightAnchor].active = YES;
}

#pragma mark - Delegates



- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
  
}



- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
  
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
  
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
  
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView  {
  
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
  
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
  
}


- (BOOL)scrollViewShouldScrollToTop:(UIScrollView *)scrollView {
  return YES;
}

- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView  {
  
}




























@end
