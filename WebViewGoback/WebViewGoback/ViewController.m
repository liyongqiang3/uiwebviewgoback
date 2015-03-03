//
//  ViewController.m
//  WebViewGoback
//
//  Created by 李永强 on 15/3/3.
//  Copyright (c) 2015年 tongbaotu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIWebViewDelegate>
{
    NSMutableArray * dataArray ;
}
@property (strong,nonatomic)IBOutlet  UIWebView * webView  ;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    dataArray = [[NSMutableArray alloc]init];
    NSURL *url =[NSURL URLWithString:@"http://news.baidu.com"];
    NSURLRequest *request =[NSURLRequest requestWithURL:url];
    [_webView loadRequest:request];
    UIBarButtonItem * backButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"back" style:UIBarButtonItemStylePlain target:self action:@selector(backButtonItemEvent:)];
     UIBarButtonItem * closeButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"close" style:UIBarButtonItemStylePlain target:self action:@selector(closeButtonItemEvent:)];
    [dataArray addObject:backButtonItem];
    [dataArray addObject:closeButtonItem];

//    self.navigationItem.leftBarButtonItems = @[backButtonItem,closeButtonItem];
    self.navigationItem.leftBarButtonItem = backButtonItem ;

}

//  返回上一步 不能返回直接跳出界面
-(void)backButtonItemEvent:(UIBarButtonItem *)item {
    if ([_webView canGoBack]) {
         [_webView goBack];
        self.navigationItem.leftBarButtonItems = dataArray;
    } else {
        [self.navigationController popViewControllerAnimated:YES];
    }


}
// 跳出界面
-(void)closeButtonItemEvent:(UIBarButtonItem *)item{
    [self.navigationController popViewControllerAnimated:YES];
    
}

@end
