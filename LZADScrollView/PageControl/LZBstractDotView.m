//
//  LZBstractDotView.m
//  LZADScrolleView
//
//  Created by coderLee on 2015/1/3.
//  Copyright © 2015年 coderLee. All rights reserved.
//

#import "LZBstractDotView.h"

@implementation LZBstractDotView

- (id)init
{
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:[NSString stringWithFormat:@"You must override %@ in %@", NSStringFromSelector(_cmd), self.class]
                                 userInfo:nil];
}


- (void)changeActivityState:(BOOL)active
{
    @throw [NSException exceptionWithName:NSInternalInconsistencyException
                                   reason:[NSString stringWithFormat:@"You must override %@ in %@", NSStringFromSelector(_cmd), self.class]
                                 userInfo:nil];
}

@end
