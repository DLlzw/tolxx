//
//  topBarButton.m
//  wuyong
//
//  Created by mac on 2020/4/16.
//  Copyright © 2020 mac. All rights reserved.
//

#import "topBarButton.h"
#define BADGE_WIDTH (13)
#define TitleFontSize (13)
#define ColorNormalDefault [UIColor blackColor];
#define ColorSelectedDefault [UIColor redColor];
@implementation topBarButton
-(instancetype)init{
    self = [super init];
    if(self){
        _colorNormal = ColorNormalDefault;
        _colorSelectd = ColorSelectedDefault;
        [self setTitleColor:_colorNormal forState:UIControlStateNormal];
        [self setTitleColor:_colorSelectd forState:UIControlStateSelected];
        [self.titleLabel setFont:[UIFont systemFontOfSize:TitleFontSize]];
    }
    return self;
}
-(void)setSelected:(BOOL)selected{
    [super setSelected:selected];

    if(selected){
        [self setTitleColor:_colorSelectd forState:UIControlStateNormal];
        UIFont *font = [UIFont systemFontOfSize:TitleFontSize+1 weight:UIFontWeightBold];
        [self.titleLabel setFont:font];
    }else{
        [self setTitleColor:_colorNormal forState:UIControlStateNormal];
        UIFont *font = [UIFont systemFontOfSize:TitleFontSize weight:normal];
        [self.titleLabel setFont:font];
    }
}
@end
