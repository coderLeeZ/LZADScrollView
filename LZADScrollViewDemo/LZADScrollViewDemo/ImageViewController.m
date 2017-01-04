//
//  ImageViewController.m
//  LZADScrollViewDemo
//
//  Created by shenhuait on 2017/1/3.
//  Copyright © 2017年 shenhuait. All rights reserved.
//

#import "ImageViewController.h"
#import "UIImageView+WebCache.h"

#define kScreenW [UIScreen mainScreen].bounds.size.width
#define kScreenH [UIScreen mainScreen].bounds.size.height

@interface ImageViewController ()

@property (nonatomic, weak)UIImageView *imageView;

@end

@implementation ImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setUpImageView];
    [self setUpTextView];
}

-(void)setUpImageView
{
    CGFloat imageW = kScreenW;
    CGFloat imageH = imageW/1.95555555555;
    CGFloat imageY = (kScreenH - imageH) * 0.5;
    NSLog(@"imageW=%f,imageH=%f,imageY=%f,",imageW,imageH,imageY);
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.frame = CGRectMake(0, imageY, imageW, imageH);
    if (_imageName) {
        imageView.image = [UIImage imageNamed:_imageName];
    }
    if (_imageUrl) {
        [imageView sd_setImageWithURL:_imageUrl];
    }
    [self.view addSubview:imageView];
    _imageView = imageView;
}

-(void)setUpTextView
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 84, kScreenW, 40)];
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:0.2];
    if (_text) {
        label.text = _text;
    }
    [self.view addSubview:label];
}

@end
