//
//  LZADScrollView.h
//  LZADScrolleView
//
//  Created by coderLee on 2015/1/3.
//  Copyright © 2015年 coderLee. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    LZADScrollViewPageContolAlimentRight,
    LZADScrollViewPageContolAlimentCenter
} LZADScrollViewPageContolAliment;

typedef enum {
    LZADScrollViewPageContolStyleClassic,        // 系统自带经典样式
    LZADScrollViewPageContolStyleAnimated,       // 动画效果pagecontrol
    LZADScrollViewPageContolStyleNone            // 不显示pagecontrol
} LZADScrollViewPageContolStyle;



@class LZADScrollView;
@protocol LZADScrollViewDelegate <NSObject>

@optional
/**
 点击图片是调用
 */
-(void)scrollView:(LZADScrollView *)adScrollView didSelectItemAtIndex:(NSInteger)index;

/**
 图片滚动调用
 */
-(void)scrollView:(LZADScrollView *)adScrollView didScrollToIndex:(NSInteger)index;

@end


@interface LZADScrollView : UIView

/** 本地图片轮播初始化方式 */
+(instancetype)scrollViewWithFrame:(CGRect)frame delegate:(id<LZADScrollViewDelegate>)delegate placeholderImage:(UIImage *)placeholderImage;

+ (instancetype)scrollViewWithFrame:(CGRect)frame imageURLStringsGroup:(NSArray *)imageURLStringsGroup;


/** 本地图片轮播初始化方式 */
+ (instancetype)scrollViewWithFrame:(CGRect)frame imageNamesGroup:(NSArray *)imageNamesGroup;

/** 本地图片轮播初始化方式2,infiniteLoop:是否无限循环 */
+ (instancetype)scrollViewWithFrame:(CGRect)frame shouldInfiniteLoop:(BOOL)infiniteLoop imageNamesGroup:(NSArray *)imageNamesGroup;



/** ------------🌟🌟🌟数据源接口-Start🌟🌟🌟---------- */

/** 网络图片 url string 数组 */
@property (nonatomic, strong) NSArray *imageURLStringsGroup;

/** 每张图片对应要显示的文字数组 */
@property (nonatomic, strong) NSArray *titlesGroup;

/** 本地图片数组 */
@property (nonatomic, strong) NSArray *localizationImageNamesGroup;

/** ------------🌟🌟🌟数据源接口-End🌟🌟🌟---------- */




/** ------------🌟🌟🌟滚动控制接口-Start🌟🌟🌟---------- */

/** 自动滚动间隔时间,默认2s */
@property (nonatomic, assign) CGFloat autoScrollTimeInterval;

/** 是否无限循环,默认Yes */
@property (nonatomic,assign) BOOL infiniteLoop;

/** 是否自动滚动,默认Yes */
@property (nonatomic,assign) BOOL autoScroll;

/** 图片滚动方向，默认为水平滚动 */
@property (nonatomic, assign) UICollectionViewScrollDirection scrollDirection;

@property (nonatomic, weak) id<LZADScrollViewDelegate> delegate;

/** block方式监听点击 */
@property (nonatomic, copy) void (^clickItemOperationBlock)(NSInteger currentIndex);

/** block方式监听滚动 */
@property (nonatomic, copy) void (^itemDidScrollOperationBlock)(NSInteger currentIndex);

/** 解决viewWillAppear时出现时轮播图卡在一半的问题，在控制器viewWillAppear时调用此方法 */
- (void)adjustWhenControllerViewWillAppera;

/** ------------🌟🌟🌟滚动控制接口-End🌟🌟🌟---------- */





/** ----------🌟🌟🌟自定义样式接口-Start🌟🌟🌟-------- */

/** 轮播图片的ContentMode，默认为 UIViewContentModeScaleToFill */
@property (nonatomic, assign) UIViewContentMode bannerImageViewContentMode;

/** 占位图，用于网络未加载到图片时 */
@property (nonatomic, strong) UIImage *placeholderImage;

/** 是否显示分页控件 */
@property (nonatomic, assign) BOOL showPageControl;

/** 是否在只有一张图时隐藏pagecontrol，默认为YES */
@property(nonatomic) BOOL hidesForSinglePage;

/** 只展示文字轮播 */
@property (nonatomic, assign) BOOL onlyDisplayText;

/** pagecontrol 样式，默认为动画样式 */
@property (nonatomic, assign) LZADScrollViewPageContolStyle pageControlStyle;

/** 分页控件位置 */
@property (nonatomic, assign) LZADScrollViewPageContolAliment pageControlAliment;

/** 分页控件距离轮播图的底部间距（在默认间距基础上）的偏移量 */
@property (nonatomic, assign) CGFloat pageControlBottomOffset;

/** 分页控件距离轮播图的右边间距（在默认间距基础上）的偏移量 */
@property (nonatomic, assign) CGFloat pageControlRightOffset;

/** 分页控件小圆标大小 */
@property (nonatomic, assign) CGSize pageControlDotSize;

/** 当前分页控件小圆标颜色 */
@property (nonatomic, strong) UIColor *currentPageDotColor;

/** 其他分页控件小圆标颜色 */
@property (nonatomic, strong) UIColor *pageDotColor;

/** 当前分页控件小圆标图片 */
@property (nonatomic, strong) UIImage *currentPageDotImage;

/** 其他分页控件小圆标图片 */
@property (nonatomic, strong) UIImage *pageDotImage;

/** 轮播文字label字体颜色 */
@property (nonatomic, strong) UIColor *titleLabelTextColor;

/** 轮播文字label字体大小 */
@property (nonatomic, strong) UIFont  *titleLabelTextFont;

/** 轮播文字label背景颜色 */
@property (nonatomic, strong) UIColor *titleLabelBackgroundColor;

/** 轮播文字label高度 */
@property (nonatomic, assign) CGFloat titleLabelHeight;

/** ------------🌟🌟🌟自定义样式接口-End🌟🌟🌟---------- */





/** ------------🌟🌟🌟清除缓存接口-Start🌟🌟🌟---------- */

/** 清除图片缓存（此次升级后统一使用SDWebImage管理图片加载和缓存）  */
+ (void)clearImagesCache;

/** 清除图片缓存（兼容旧版本方法） */
- (void)clearCache;

/** -------------🌟🌟🌟清除缓存接口-End🌟🌟🌟----------- */
@end
