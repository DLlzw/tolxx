#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
@protocol PagesContainerTopBarDelegate;

@interface PagesContainerTopBar : UIView
@property (nonatomic,weak) id<PagesContainerTopBarDelegate> target;
@property (nonatomic,assign) CGFloat buttonMargin;
#pragma mark -update sytle
-(void)setBackgroundImage:(UIImage *)image;
-(void)setBackgroundImageHidden:(BOOL)ishidden;
-(void)setCursorPosition:(CGFloat)percent;
-(void)updateContentWithTitles:(NSArray *)titles;
-(void)setIsButtonAligmentLeft:(BOOL)isAlignmentLeft;
-(void)setShowSeperateLines:(BOOL)showSeperateLines;
-(void)setSelectedIndex:(NSInteger)index;
-(NSInteger)getSelectedIndex;
// 设置滑块的颜色
-(void)setCursorColor:(UIColor *)color;
// 设置滑块宽度
-(void)setCursorWidth:(CGFloat)width;
// 设置滑块长度
-(void)setCursorHeight:(CGFloat)height;
// 设置按钮选中和未选中
-(void)setTextColor:(UIColor *)nomalColor andSelectedColor:(UIColor *)selectedColor;


@end

@protocol PagesContainerTopBarDelegate <NSObject>

@optional
// 选中topBar的一项
- (void)topBarSelectIndex:(NSInteger)index;

// 重复点击topBar时会调用该方法
- (void)topBarSelectIndicator:(NSInteger)index;
@end
NS_ASSUME_NONNULL_END
