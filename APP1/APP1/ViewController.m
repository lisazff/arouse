//
//  ViewController.m
//  APP1
//
//  Created by TsCwLife on 17/1/5.
//  Copyright © 2017年 CwLife. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self evokeOtherApp];
}


- (void)evokeOtherApp {
    //app2是应用的唯一的scheme
    NSURL *url = [NSURL URLWithString:@"shark.video://lanch?key=param"];
    
    if ([[UIApplication sharedApplication] canOpenURL:url]) {
        
        
        if ([[UIApplication sharedApplication] respondsToSelector:@selector(openURL:options:completionHandler:)]) {
            //iOS 10.0+
            [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:^(BOOL success) {
            }];
        }else{
            //iOS 2~10
            [[UIApplication sharedApplication] openURL:url];
        }
    }
    else
    {
        //一般是没有安装
        NSLog(@"跳转下载app链接");
    }
}


@end
