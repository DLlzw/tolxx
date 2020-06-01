//
//  TItleVc.m
//  tolxx
//
//  Created by mac on 2020/6/1.
//  Copyright © 2020 mac. All rights reserved.
//

#import "TItleVc.h"

@interface TItleVc ()

@end

@implementation TItleVc

- (void)viewDidLoad {
    [super viewDidLoad];
            self.view.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1 ];
    UILabel * la = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 199, 199)];
    [self.view addSubview:la];
    [la setText:@"wer"];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
