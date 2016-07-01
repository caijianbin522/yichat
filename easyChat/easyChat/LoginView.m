//
//  LoginView.m
//  easyChat
//
//  Created by mac on 16/7/1.
//  Copyright © 2016年 艾尼维亚. All rights reserved.
//

#import "LoginView.h"
#import "RegisterView.h"
#import "HomePage.h"
#import "NewsView.h"
#import "FileView.h"
#import "PersonView.h"
@interface LoginView ()

@end

@implementation LoginView

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title=@"登录";
    self.navigationItem.hidesBackButton = YES; 
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)registerButton:(id)sender {
    RegisterView *VC1=[[RegisterView alloc]init];
    [self.navigationController pushViewController:VC1 animated:YES];
}
- (IBAction)loginButton:(id)sender {
    NSMutableURLRequest *request1=[[NSMutableURLRequest alloc] init];
    [request1 setURL:[NSURL URLWithString:@"http://192.168.1.23:8080/st/s"]];
    
    NSString *bodyStr=[NSString stringWithFormat:@"command=ST_L&name=%@&psw=%@",_name.text,_password.text];
    [request1 setHTTPBody:[bodyStr dataUsingEncoding:NSUTF8StringEncoding]];
    [request1 setHTTPMethod:@"POST"];
    
    [NSURLConnection sendAsynchronousRequest:request1 queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        NSLog(@"%@",[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding]);
        NSDictionary *dicinfo=[NSJSONSerialization JSONObjectWithData:data options:NSUTF8StringEncoding error:nil];
        if ([dicinfo[@"result"] isEqualToString:@"1"]) {
            [UIView animateWithDuration:2 animations:^{
                
                [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:self.view.window cache:YES];
                HomePage *VC1=[[HomePage alloc]init];
                [self.navigationController pushViewController:VC1 animated:YES];
                
            }];
            [self jump];
        }
    }];
}

-(void)jump{
    HomePage *VC1=[[HomePage alloc]init];
    UINavigationController *nav1=[[UINavigationController alloc]initWithRootViewController:VC1];
    VC1.tabBarItem.image=[UIImage imageNamed:@"main@2x.png"];
    VC1.tabBarItem.selectedImage=[UIImage imageNamed:@"main@2x.png"];
    VC1.tabBarItem.title=@"主页";
    NewsView *VC2=[[NewsView alloc]init];
    UINavigationController *nav2=[[UINavigationController alloc]initWithRootViewController:VC2];
    VC2.tabBarItem.image=[UIImage imageNamed:@"news@2x.png"];
    VC2.tabBarItem.selectedImage=[UIImage imageNamed:@"news@2x.png"];
    VC2.tabBarItem.title=@"新闻";
    FileView *VC3=[[FileView alloc]init];
    UINavigationController *nav3=[[UINavigationController alloc]initWithRootViewController:VC3];
    VC3.tabBarItem.image=[UIImage imageNamed:@"file@2x.png"];
    VC3.tabBarItem.selectedImage=[UIImage imageNamed:@"file@2x.png"];
    VC3.tabBarItem.title=@"文件";
    PersonView *VC4=[[PersonView alloc]init];
    UINavigationController *nav4=[[UINavigationController alloc]initWithRootViewController:VC4];
    VC4.tabBarItem.image=[UIImage imageNamed:@"person@2x.png"];
    VC4.tabBarItem.selectedImage=[UIImage imageNamed:@"person@2x.png"];
    VC4.tabBarItem.title=@"个人";
    
    UITabBarController *tabBarControl=[[UITabBarController alloc]init];
    tabBarControl.viewControllers=@[nav1,nav2,nav3,nav4];
    self.view.window.rootViewController=tabBarControl;
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
