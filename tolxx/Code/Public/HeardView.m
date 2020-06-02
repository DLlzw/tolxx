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
        self.backgroundColor = [UIColor redColor];
      
    }
    return self;
}

@end
