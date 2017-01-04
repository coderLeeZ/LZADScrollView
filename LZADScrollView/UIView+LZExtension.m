//
//  UIView+LZExtension.m
//  
//
//  Created by coderLee on 15/1/3.
//  Copyright © 2015年 coderLee. All rights reserved.
//

#import "UIView+LZExtension.h"

@implementation UIView (LZExtension)

-(CGFloat)lz_width
{
    return self.frame.size.width;
}

-(void)setLz_width:(CGFloat)lz_width
{
    CGRect frame = self.frame;
    frame.size.width = lz_width;
    self.frame = frame;
}

-(CGFloat)lz_height
{
    return self.frame.size.height;
}

-(void)setLz_height:(CGFloat)lz_height
{
    CGRect frame = self.frame;
    frame.size.height = lz_height;
    self.frame = frame;
}

-(CGFloat)lz_x
{
    return self.frame.origin.x;
}

-(void)setLz_x:(CGFloat)lz_x
{
    CGRect frame = self.frame;
    frame.origin.x = lz_x;
    self.frame = frame;
}

-(CGFloat)lz_y
{
    return self.frame.origin.y;
}

-(void)setLz_y:(CGFloat)lz_y
{
    CGRect frame = self.frame;
    frame.origin.y = lz_y;
    self.frame = frame;
}

-(CGFloat)lz_centerX
{
    return self.center.x;
}

-(void)setLz_centerX:(CGFloat)lz_centerX
{
    CGPoint center = self.center;
    center.x = lz_centerX;
    self.center = center;
}

-(CGFloat)lz_centerY
{
    return self.center.y;
}

-(void)setLz_centerY:(CGFloat)lz_centerY
{
    CGPoint center = self.center;
    center.y = lz_centerY;
    self.center = center;
}

@end
