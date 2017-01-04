//
//  ViewController.m
//  LZADScrollViewDemo
//
//  Created by shenhuait on 2017/1/3.
//  Copyright © 2017年 shenhuait. All rights reserved.
//

#import "ViewController.h"
#import "LZADScrollView.h"
#import "ImageViewController.h"

#define kScrollViewWidth [UIScreen mainScreen].bounds.size.width
#define kScrollViewHeight kScrollViewWidth/1.95555555555

#define image1 @"https://dn-6uyjdqtm.qbox.me/fb6a641f834b84ec5b12.jpg"
#define image2 @"https://dn-6uyjdqtm.qbox.me/f2aa305d3e35e4a664fa.jpg"
#define image3 @"https://dn-6uyjdqtm.qbox.me/b340906d6849efd003bb.jpg"
#define image4 @"https://dn-6uyjdqtm.qbox.me/bff2722af3b5e39a998e.jpg"

#define image5 @"https://dn-6uyjdqtm.qbox.me/5cdb3ec6a754da297ec5.jpg"
#define image6 @"https://dn-6uyjdqtm.qbox.me/e73d0c18760f944cd4f7.jpg"
#define image7 @"https://dn-6uyjdqtm.qbox.me/f03753191b1fd11672f9.jpg"
#define image8 @"https://dn-6uyjdqtm.qbox.me/01114880a525224de8fb.jpg"

@interface ViewController ()<LZADScrollViewDelegate>

@property (nonatomic, weak)UIScrollView *containerView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpBg];
    
    [self setUpContainerView];
    
    /** ---------使用方法一：本地加载，不带标题的图片轮播器--------- */
    [self setUpNoTitleADScrollView];
    
    /** ---------使用方法二：网络加载，带标题的图片轮播器--------- */
    [self setUpRequestTitleADScrollView];
    
    /** ----使用方法三：网络加载，自定义图片的pageControl的图片轮播器---- */
    [self setUpCustomImagePageControlScrollView];
    
    /** ----使用方法四：只上下滚动展示文字的轮播器---- */
    [self setUpTextScrollView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // 如果你发现你的Scrollview会在viewWillAppear时图片卡在中间位置，你可以调用此方法调整图片位置哦
    //    [Scrollview adjustWhenControllerViewWillAppera];
}


-(void)setUpBg
{
    self.title = @"LZADScrollViewDemo";
    self.view.backgroundColor = [UIColor whiteColor];
    UIImageView *bgImageV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg.jpg"]];
    bgImageV.frame = self.view.bounds;
    [self.view addSubview:bgImageV];
    
}

-(void)setUpContainerView
{
    UIScrollView *containerView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    containerView.contentSize = CGSizeMake(self.view.frame.size.width, 1200);
    [self.view addSubview:containerView];
    _containerView = containerView;
}

-(void)setUpNoTitleADScrollView
{
    NSArray *imageNames = @[@"01.jpg",
                            @"2.jpg",
                            @"4.jpg",
                            @"5.jpg",
                            ];
    
    LZADScrollView *adScrollView = [LZADScrollView scrollViewWithFrame:CGRectMake(0, 64, kScrollViewWidth, kScrollViewHeight) shouldInfiniteLoop:YES imageNamesGroup:imageNames];
    adScrollView.delegate = self;
    adScrollView.pageControlStyle = LZADScrollViewPageContolStyleAnimated;
    [_containerView addSubview:adScrollView];
    adScrollView.scrollDirection = UICollectionViewScrollDirectionVertical;
    //轮播时间间隔，默认1.0秒，可自定义
    //adScrollView.autoScrollTimeInterval = 3.0;

}

-(void)setUpRequestTitleADScrollView
{
    NSArray *imageUrlStrings = @[image1,image2,image3,image4];
    
    NSArray *titles = @[@"在青春最好的年纪，你可以爱一个人",
                        @"但不要等待一个人",
                        @"青春拥有的就是激情",
                        @"激情耗尽了，人就老了"
                        ];
    
    LZADScrollView *adScrollView2 = [LZADScrollView scrollViewWithFrame:CGRectMake(0, 84 + kScrollViewHeight, kScrollViewWidth, kScrollViewHeight) delegate:self placeholderImage:[UIImage imageNamed:@"placeholder"]];
    adScrollView2.imageURLStringsGroup = imageUrlStrings;
    adScrollView2.pageControlAliment = LZADScrollViewPageContolAlimentRight;
    adScrollView2.titlesGroup = titles;
    adScrollView2.currentPageDotColor = [UIColor whiteColor];
    [_containerView addSubview:adScrollView2];
    

    //     block监听点击方式
    //     adScrollView2.clickItemOperationBlock = ^(NSInteger index) {
    //     NSLog(@"----%ld", (long)index);
    //     };

}

-(void)setUpCustomImagePageControlScrollView
{
    NSArray *imageUrlStrings = @[image5,image6,image7,image8];
    
    LZADScrollView *adScrollView3 = [LZADScrollView scrollViewWithFrame:CGRectMake(0, 104 + kScrollViewHeight * 2, kScrollViewWidth, kScrollViewHeight) delegate:self placeholderImage:[UIImage imageNamed:@"placeholder"]];
    adScrollView3.currentPageDotImage = [UIImage imageNamed:@"pageControlCurrentDot"];
    adScrollView3.pageDotImage = [UIImage imageNamed:@"pageControlDot"];
    adScrollView3.imageURLStringsGroup = imageUrlStrings;
    [_containerView addSubview:adScrollView3];

}

-(void)setUpTextScrollView
{
    LZADScrollView *adScrollView4 = [LZADScrollView scrollViewWithFrame:CGRectMake(0, 124 + kScrollViewHeight * 3, kScrollViewWidth, 40) delegate:self placeholderImage:nil];
    adScrollView4.scrollDirection = UICollectionViewScrollDirectionVertical;
    adScrollView4.onlyDisplayText = YES;
    
    NSMutableArray *titlesArray = [NSMutableArray new];
    [titlesArray addObject:@"我是纯文字上下滚动轮播"];
    [titlesArray addObject:@"哈哈,这些美女还够养眼吗"];
    [titlesArray addObject:@"纯文字上下滚动轮播 **** 纯文字轮播图 ****"];
    adScrollView4.titlesGroup = [titlesArray copy];
    
    [_containerView addSubview:adScrollView4];

}

#pragma mark — LZADScrollViewDelegate —
-(void)scrollView:(LZADScrollView *)adScrollView didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@"---点击了第%ld张图片", (long)index);

    NSLog(@"%@",adScrollView.localizationImageNamesGroup[index]);
    
    ImageViewController *imagevc = [[ImageViewController alloc] init];
    
    if (adScrollView.localizationImageNamesGroup.count > 0) {
        imagevc.imageName = adScrollView.localizationImageNamesGroup[index];
    }
    if (adScrollView.imageURLStringsGroup.count > 0) {
        imagevc.imageUrl = [NSURL URLWithString:adScrollView.imageURLStringsGroup[index]];
    }
    if (adScrollView.titlesGroup.count > 0) {
        imagevc.text = adScrollView.titlesGroup[index];
    }
    [self.navigationController pushViewController:imagevc animated:YES];
}

@end
