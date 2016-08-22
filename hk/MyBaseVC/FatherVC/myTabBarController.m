//
//  myTabBarController.m
//  UITabBarController zidingyiDemo
//
//  Created by QF on 15-6-16.
//  Copyright (c) 2015年 QF. All rights reserved.
//

#import "myTabBarController.h"


@interface myTabBarController ()

@property(nonatomic,strong)UIViewController *currentViewController;

@property (nonatomic,strong) UIButton * currentSelectedButton;
@property (nonatomic,strong) NSArray * vcArray;
@property (nonatomic,strong) NSArray * photoArray;
@property (nonatomic,strong) NSArray * titleArray;
@property (nonatomic,strong) NSArray * selectedPhotoArray;

@property(nonatomic,strong) UIImageView * mainView;
@property(nonatomic,strong) UIImageView * MButtonView;
@property (nonatomic,strong) UIButton * XFanButton;

@end

@implementation myTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)setTabBarControllerWithVCArray:(NSArray *)vcArray andPhotoArray:(NSArray *)photoArray selectedPhotoArray:(NSArray *)selectedPhotoArray titleArray:(NSArray *)titleArray{
    
    UIViewController *fVC = [[[vcArray objectAtIndex:0]alloc]init];
    
    fVC.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 50);
    
    //将fVC设置为当前控制器
    self.currentViewController = fVC;
    [self.view addSubview:fVC.view];
    [self addChildViewController:fVC];
    
    self.photoArray = photoArray;
    self.titleArray = titleArray;
    self.vcArray = vcArray;
    self.selectedPhotoArray = selectedPhotoArray;
    
    //必须要都有值
    if (!(self.photoArray.count > 0 && self.titleArray.count > 0 && self.vcArray.count > 0)) {
        return;
    }
    [self setTabBar];
}


-(void)setTabBar{
    //设置tabBar的背景颜色
    self.tabBarBgImageView = [[UIImageView alloc]init];
    self.tabBarBgImageView.frame = CGRectMake(0, self.view.frame.size.height - 50, self.view.frame.size.width, 50);
    self.tabBarBgImageView.userInteractionEnabled = YES;
    self.tabBarBgImageView.backgroundColor = kTabBarColor;
    //self.tabBarBgImageView.image=[UIImage imageNamed:@"fgxx.png"];
    [self.view addSubview:self.tabBarBgImageView];
    
    UIButton * fanButton=[[UIButton alloc] initWithFrame:CGRectMake((screenWidth-54)/2, 0, 54, 70)];
    //fanButton.backgroundColor=[UIColor redColor];
    [fanButton setImage:[UIImage imageNamed:@"bottom_my_hungryking_btn"] forState:UIControlStateNormal];
    [fanButton addTarget:self action:@selector(clickFanButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.tabBarBgImageView addSubview:fanButton];
    
    //设置底部栏的四个按钮
    for (int i = 0; i < self.photoArray.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        if (i<2) {
            button.frame  = CGRectMake(i*((screenWidth-54)/4)+5, 5, ((screenWidth-54)/4)-10, 40);
        }
        else
        {
            button.frame  = CGRectMake((i-2)*((screenWidth-54)/4)+((screenWidth-54)/2+54+5), 5, ((screenWidth-54)/4)-10, 40);
        }
        //button.backgroundColor=[UIColor redColor];
        [button setTitle:[self.titleArray objectAtIndex:i] forState:UIControlStateNormal];
        
        [button setImage:[UIImage imageNamed:[self.photoArray objectAtIndex:i]] forState:UIControlStateNormal];
        
        [button setImage:[UIImage imageNamed:[self.selectedPhotoArray objectAtIndex:i]] forState:UIControlStateSelected];
        
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        button.titleLabel.font = [UIFont systemFontOfSize:12];
        
        
        
        //设置图片和文字位置
        button.imageEdgeInsets = UIEdgeInsetsMake(-10, -8, 0, -35);
        button.titleEdgeInsets = UIEdgeInsetsMake(0, -47, -35, 0);
        
        if (i==0) {
            
            button.titleEdgeInsets = UIEdgeInsetsMake(0, -37, -35, 0);
        }
        if (i==self.photoArray.count-1) {
            
            button.titleEdgeInsets = UIEdgeInsetsMake(0, -57, -35, 0);
        }
        
        button.tag = i;
        
        if (button.tag == 0) {
            button.selected = YES;
            self.currentSelectedButton = button;
        }
        
        [button addTarget:self action:@selector(vcChangeButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.tabBarBgImageView addSubview:button];
    }
    
    
}

#pragma mark - 响应点击button切换视图事件
-(void)vcChangeButtonClick:(UIButton *)button{
    //先把当前的vc释放掉
    [self.currentViewController.view removeFromSuperview];
    [self.currentViewController removeFromParentViewController];
    
    self.currentSelectedButton.selected = NO;
    
    for (int i = 0; i < self.photoArray.count; i++) {
        if (i == button.tag) {
            UIViewController *fVC = [[[self.vcArray objectAtIndex:i]alloc]init];
            
            fVC.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 50);
            
            //将fVC设置为当前控制器
            self.currentViewController = fVC;
            
            [self.view addSubview:fVC.view];
            
            [self addChildViewController:fVC];
            
            button.selected = YES;
            self.currentSelectedButton = button;
        }
    }
}

-(void)clickFanButton:(UIButton *)fan
{
    NSLog(@"fan");
    self.mainView=[[UIImageView alloc] initWithFrame:CGRectMake(0, screenHeight, screenWidth, 250)];
    //self.mainView.backgroundColor=[UIColor orangeColor];
    self.mainView.userInteractionEnabled=YES;
    [self.view addSubview:self.mainView];
    
    [UIView beginAnimations:@"" context:nil];
    [UIView setAnimationDuration:0.3];
    CGRect r=self.mainView.frame;
    r.origin.y-=250;
    self.mainView.frame=r;
    [UIView commitAnimations];
    
    self.MButtonView=[[UIImageView alloc] initWithFrame:CGRectMake(0, 30, screenWidth, 220)];
    self.MButtonView.backgroundColor=[UIColor redColor];
    self.MButtonView.userInteractionEnabled=YES;
    [self.mainView addSubview:self.MButtonView];
    
    
    
    self.XFanButton=[[UIButton alloc] initWithFrame:CGRectMake((screenWidth-54)/2, 0, 54, 70)];
    //self.XFanButton.backgroundColor=[UIColor orangeColor];
    [self.XFanButton setImage:[UIImage imageNamed:@"bottom_my_hungryking_btn"] forState:UIControlStateNormal];
    [self.XFanButton addTarget:self action:@selector(clickXFanButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.mainView addSubview:self.XFanButton];
}

-(void)clickXFanButton:(UIButton *)fan
{
    [UIView beginAnimations:@"" context:nil];
    [UIView setAnimationDuration:0.3];
    CGRect r=self.mainView.frame;
    r.origin.y+=250;
    self.mainView.frame=r;
    [UIView commitAnimations];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
