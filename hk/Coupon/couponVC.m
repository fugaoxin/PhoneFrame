//
//  couponVC.m
//  hk
//
//  Created by User01 on 15/11/17.
//  Copyright © 2015年 User01. All rights reserved.
//

#import "couponVC.h"

@interface couponVC ()

@end

@implementation couponVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.titleLabel.text=@"我的订单";
    self.titleLabel.textColor=[UIColor blackColor];
    //self.view.backgroundColor=[UIColor redColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
