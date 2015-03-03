//
//  ViewController.m
//  WebViewGoback
//
//  Created by 李永强 on 15/3/3.
//  Copyright (c) 2015年 tongbaotu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong,nonatomic)IBOutlet  UIWebView * webView  ;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSURL *url =[NSURL URLWithString:@"http://news.baidu.com"];
    NSURLRequest *request =[NSURLRequest requestWithURL:url];
    [_webView loadRequest:request];
    UIBarButtonItem * backButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"back" style:UIBarButtonItemStylePlain target:self action:@selector(backButtonItemEvent:)];
     UIBarButtonItem * closeButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"close" style:UIBarButtonItemStylePlain target:self action:@selector(closeButtonItemEvent:)];

    self.navigationItem.leftBarButtonItems = @[backButtonItem,closeButtonItem];

}

//  返回上一步 不能返回直接跳出界面
-(void)backButtonItemEvent:(UIBarButtonItem *)item {
    if ([_webView canGoBack]) {
         [_webView goBack];
    } else {
        [self.navigationController popViewControllerAnimated:YES];
    }


}
// 跳出界面
-(void)closeButtonItemEvent:(UIBarButtonItem *)item{
    [self.navigationController popViewControllerAnimated:YES];
    
}

@end
