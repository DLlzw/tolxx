//
//  OcBridgingHeader.h
//  Pods
//
//  Created by mac on 2019/11/20.
//

#ifndef OcBridgingHeader_h
#define OcBridgingHeader_h
#import "SVProgressHUD.h"
#import "PagesContainer.h"
#import "MainTitleVc.h"
#import "HeardView.h"


//屏幕的宽度和高度
#define SCREENWIDTH [[UIScreen mainScreen] bounds].size.width
#define SCREENHEIGHT [[UIScreen mainScreen] bounds].size.height

//打印设置
#ifdef DEBUG  //如果是调试模式，自定义如下： “...代表多个参数”
#define ELog(...) NSLog(@"%s 第%d行 \n %@\n\n",__func__,__LINE__,[NSString stringWithFormat:__VA_ARGS__])
#else //如果是发布模式，自定义如下
#define ELog(...)
#endif


#define IPHONE_X ({\
    BOOL isBangsScreen = NO; \
    if (@available(iOS 11.0, *)) { \
    UIWindow *window = [[UIApplication sharedApplication].windows firstObject]; \
    isBangsScreen = window.safeAreaInsets.bottom > 0; \
    } \
    isBangsScreen; \
})

/**
 状态栏的高度
 */
#define SafeAreaTopState (IPHONE_X ? 44 : 20)

/**

*导航栏高度

*/

#define SafeAreaTopHeight (IPHONE_X ? 88 : 64)

/**

*tabbar高度

*/

#define SafeAreaBottomHeight (IPHONE_X ? (49 + 34) : 49)

#define APPThemeColor [UIColor colorWithRed:230/255.0 green:100/255.0 blue:95/255.0 alpha:1.0];

#endif /* OcBridgingHeader_h */

