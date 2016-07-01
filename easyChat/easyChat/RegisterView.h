//
//  RegisterView.h
//  easyChat
//
//  Created by mac on 16/7/1.
//  Copyright © 2016年 艾尼维亚. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisterView : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UITextField *confirmPw;
@property (weak, nonatomic) IBOutlet UITextField *nickName;
@property (weak, nonatomic) IBOutlet UITextField *email;
@end
