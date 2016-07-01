//
//  ViewController.m
//  easyChat
//
//  Created by mac on 16/7/1.
//  Copyright © 2016年 艾尼维亚. All rights reserved.
//

#import "ViewController.h"
#import "LoginView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationController.navigationBarHidden=YES;
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:self.view.frame];
    imageView.image=[UIImage imageNamed:@"Default"];
    [self.view addSubview:imageView];
    
    

    [UIView animateWithDuration:0.5 animations:^{
        imageView.alpha=0.5;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.5 animations:^{
            
            [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:self.view.window cache:YES];
            LoginView *VC1=[[LoginView alloc]init];
            [self.navigationController pushViewController:VC1 animated:YES];
            self.navigationController.navigationBarHidden=NO;
            
        }];
    }];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
