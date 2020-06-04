//
//  HeardView.m
//  tolxx
//
//  Created by mac on 2020/6/2.
//  Copyright © 2020 mac. All rights reserved.
//

#import "HeardView.h"

@implementation HeardView

-(id)init{
    if (self = [super init]) {
        self.frame = CGRectMake(0, 0, SCREENWIDTH, SafeAreaTopHeight);
        self.backgroundColor = [UIColor colorWithRed:230.0/255.0f green:100.0/255.0f blue:95.0/255.0f alpha:1.0];
        UIView * SafeView = [[UIView alloc]initWithFrame:CGRectMake(0, SafeAreaTopState, self.frame.size.width, SafeAreaTopHeight-SafeAreaTopState)];
        self.SafeView = SafeView;
        [self addSubview:self.SafeView];
      
    }
    return self;
}

@end
