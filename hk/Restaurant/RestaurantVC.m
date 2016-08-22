//
//  RestaurantVC.m
//  hk
//
//  Created by User01 on 15/11/17.
//  Copyright © 2015年 User01. All rights reserved.
//

#import "RestaurantVC.h"

@interface RestaurantVC ()

@property (nonatomic,strong) UISegmentedControl * segmentC;

@end

@implementation RestaurantVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self danhenlan];
}

-(void)danhenlan
{
    [self.leftButton setImage:[UIImage imageNamed:@"common_map_btn"] forState:UIControlStateNormal];
    [self.rightButton setImage:[UIImage imageNamed:@"common_cart_btn"] forState:UIControlStateNormal];
    
    self.segmentC = [[UISegmentedControl alloc]initWithItems:@[@"大胃王送餐",@"餐厅外送",@"自取"]];
    self.segmentC.frame = CGRectMake(50, 7, screenWidth-100, 30);
    self.segmentC.tintColor=[UIColor whiteColor];
    self.segmentC.selectedSegmentIndex=1;
    [self.segmentC addTarget:self action:@selector(segmentClick:) forControlEvents:UIControlEventValueChanged];
    [self.titleLabel addSubview:self.segmentC];
}

-(void)segmentClick:(UISegmentedControl *)segment{
    
    if (segment.selectedSegmentIndex==0) {
        NSLog(@"111");
    }
    else if(segment.selectedSegmentIndex==1){
        NSLog(@"222");
    }
    else{
        NSLog(@"333");
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
