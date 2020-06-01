//
//  MainTitleVc.h
//  tolxx
//
//  Created by mac on 2020/6/1.
//  Copyright © 2020 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol MainTitleVcDelegate <NSObject>

@optional
/** page切换 */
- (void)pageContainder;

@end
@interface MainTitleVc : UIViewController
@property (nonatomic,weak)id<MainTitleVcDelegate>delegate;
/** 标题数组 */
@property (nonatomic, strong) NSArray *arrayViews;
@end

NS_ASSUME_NONNULL_END
