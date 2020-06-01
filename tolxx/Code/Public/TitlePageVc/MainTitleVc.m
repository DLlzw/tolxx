//
//  MainTitleVc.m
//  tolxx
//
//  Created by mac on 2020/6/1.
//  Copyright © 2020 mac. All rights reserved.
//

#import "MainTitleVc.h"
#import "PagesContainerTopBar.h"
#import "AllowPanGestureScrollView.h"
#import "TItleVc.h"
#define TOPBAR_HEIGHT 34
@interface MainTitleVc ()<UIScrollViewDelegate,PagesContainerTopBarDelegate>
@property (nonatomic,strong) UIScrollView * scrollView;
@property (nonatomic,strong) PagesContainerTopBar *topBar;

@end

@implementation MainTitleVc

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    CGSize size = self.view.frame.size;
    CGFloat scrollViewHeight = size.height - TOPBAR_HEIGHT;
    _topBar = [[PagesContainerTopBar alloc]init];
    _topBar.frame = CGRectMake(0, TOPBAR_HEIGHT, size.width, TOPBAR_HEIGHT);
    [_topBar updateContentWithTitles:_arrayViews];
    _topBar.target = self;
    [_topBar setIsButtonAligmentLeft:true];
    [_topBar setCursorColor:[UIColor whiteColor]];
    [_topBar setCursorHeight:3];
    [_topBar setTextColor:[UIColor blackColor] andSelectedColor:[UIColor colorWithRed:230/255.0 green:100/255.0 blue:95/255.0 alpha:1.0]];
    [_topBar setShowSeperateLines:true];
    [self.view addSubview:_topBar];
    _scrollView = [[UIScrollView alloc]init];
    _scrollView.frame = CGRectMake(0, TOPBAR_HEIGHT*2, size.width, scrollViewHeight);
     _scrollView.delegate = self;
     _scrollView.pagingEnabled = YES;
     _scrollView.showsHorizontalScrollIndicator = NO;
     [_scrollView setScrollsToTop:NO];
     [_scrollView setAlwaysBounceVertical:NO];
     [_scrollView setAlwaysBounceHorizontal:NO];
     [_scrollView setBounces:NO];

    _scrollView.contentSize = CGSizeMake(size.width*[_arrayViews count], scrollViewHeight);
    _scrollView.backgroundColor = [UIColor whiteColor];
     [self.view addSubview:self.scrollView];


    [self setUpAllChildVc];
    TItleVc * ti = self.childViewControllers[0];

    [self addChildViewController:ti];
    [_scrollView addSubview:ti.view];
    
}


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    //获取当前角标
    NSInteger i = scrollView.contentOffset.x / scrollView.frame.size.width;
    //2.把对应子控制器的View添加上去
    [self addOneViewController:i];
}

-(void)setUpAllChildVc{
    for (int i=0; i<_arrayViews.count; i++) {
        [self addChildViewController:[[TItleVc alloc] init]];
        
    }
}
-(void)topBarSelectIndex:(NSInteger)index{
//    NSLog(@"%ld",(long)index);
    [self addOneViewController:index];
}
- (void)addOneViewController:(NSInteger)i {
    UIViewController *childVC = self.childViewControllers[i];
    //如果View已经被加载直接返回
//    if (childVC.view.superview) return;
    if (childVC.viewIfLoaded) return; //ios 9.0之后可以使用
    CGFloat childViewW = self.scrollView.bounds.size.width;
    CGFloat childViewH = self.scrollView.bounds.size.height;;
    CGFloat childViewX = i * childViewW;
    childVC.view.frame = CGRectMake(childViewX, 0, childViewW, childViewH);
    [self.scrollView addSubview:childVC.view];
}

-(void)setArrayViews:(NSArray *)arrayViews{
    _arrayViews = arrayViews;
}
@end
