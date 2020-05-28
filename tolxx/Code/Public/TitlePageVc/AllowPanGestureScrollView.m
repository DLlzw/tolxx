//
//  AllowPanGestureScrollView.m
//  wuyong
//
//  Created by mac on 2020/5/8.
//  Copyright © 2020 mac. All rights reserved.
//

#import "AllowPanGestureScrollView.h"

@implementation AllowPanGestureScrollView

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    
    if ([gestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]] &&
        [otherGestureRecognizer isKindOfClass:[UIScreenEdgePanGestureRecognizer class]]) {
        
        return YES;
    } else {
        return  NO;
    }
}

@end
