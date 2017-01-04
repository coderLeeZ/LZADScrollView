//
//  LZBstractDotView.h
//  LZADScrolleView
//
//  Created by coderLee on 2015/1/3.
//  Copyright © 2015年 coderLee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LZBstractDotView : UIView
/**
 *  A method call let view know which state appearance it should take. Active meaning it's current page. Inactive not the current page.
 *
 *  @param active BOOL to tell if view is active or not
 */
- (void)changeActivityState:(BOOL)active;
@end
