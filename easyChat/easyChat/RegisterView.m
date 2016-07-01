//
//  RegisterView.m
//  easyChat
//
//  Created by mac on 16/7/1.
//  Copyright © 2016年 艾尼维亚. All rights reserved.
//

#import "RegisterView.h"

@interface RegisterView ()

@end

@implementation RegisterView

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title=@"注册";
}
- (IBAction)registerButton:(id)sender {
    if ([_userName.text isEqualToString:@""] || [_password.text isEqualToString:@""]) {

        UIAlertController*alertController = [UIAlertController alertControllerWithTitle:@"警告"message:@"账号密码不能为空"preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction*cancelAction=[UIAlertAction actionWithTitle:@"取消"style:UIAlertActionStyleCancel handler:nil];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"好的"style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:cancelAction];
        [alertController addAction:okAction];
        [self presentViewController:alertController animated:YES completion:nil];
        
    }else if (_password.text !=_confirmPw.text) {
        UIAlertController*alertController = [UIAlertController alertControllerWithTitle:@"警告"message:@"两次输入密码不一致"preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction*cancelAction=[UIAlertAction actionWithTitle:@"取消"style:UIAlertActionStyleCancel handler:nil];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"好的"style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:cancelAction];
        [alertController addAction:okAction];
        [self presentViewController:alertController animated:YES completion:nil];

    }else{
        NSMutableURLRequest *request1=[[NSMutableURLRequest alloc] init];
        [request1 setURL:[NSURL URLWithString:@"http://192.168.1.23:8080/st/s"]];
        
        NSString *bodyStr=[NSString stringWithFormat:@"command=ST_R&name=%@&psw=%@",_userName.text,_password.text];
        [request1 setHTTPBody:[bodyStr dataUsingEncoding:NSUTF8StringEncoding]];
        [request1 setHTTPMethod:@"POST"];
        
        [NSURLConnection sendAsynchronousRequest:request1 queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
            NSDictionary *infoDic=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            if ([infoDic[@"result"] isEqualToString:@"0"]) {
                NSString *error=[NSString stringWithFormat:@"%@",infoDic[@"error"]];
                UIAlertController*alertController = [UIAlertController alertControllerWithTitle:@"警告"message:error preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction*cancelAction=[UIAlertAction actionWithTitle:@"取消"style:UIAlertActionStyleCancel handler:nil];
                UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"好的"style:UIAlertActionStyleDefault handler:nil];
                [alertController addAction:cancelAction];
                [alertController addAction:okAction];
                [self presentViewController:alertController animated:YES completion:nil];
            }else{
                UIAlertController*alertController = [UIAlertController alertControllerWithTitle:@"提示"message:@"恭喜你，注册成功" preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction*cancelAction=[UIAlertAction actionWithTitle:@"取消"style:UIAlertActionStyleCancel handler:nil];
                UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"好的"style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                    [self.navigationController popViewControllerAnimated:YES];
                }];
                [alertController addAction:cancelAction];
                [alertController addAction:okAction];
                [self presentViewController:alertController animated:YES completion:nil];
                
            }
        }];
    }
    
    
    
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
