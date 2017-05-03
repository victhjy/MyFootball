//
//  DQAdVC.m
//  MyFootball
//
//  Created by huangjinyang on 17/5/2.
//  Copyright © 2017年 huangjinyang. All rights reserved.
//

#import "DQAdVC.h"
#import <WebKit/WebKit.h>
@interface DQAdVC ()<WKNavigationDelegate,WKUIDelegate,WKScriptMessageHandler>
@property(nonatomic,strong)WKWebView* wkWebView;
@property(nonatomic,strong)UILabel* loadingLable;
@property(nonatomic,strong)UILabel* loadErrorLable;
@end

@implementation DQAdVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configWKWebView];
    // Do any additional setup after loading the view.
}

-(void)configWKWebView{
    [self.view addSubview:self.wkWebView];
    [self.wkWebView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).mas_offset(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    NSURLRequest* request=[NSURLRequest requestWithURL:[NSURL URLWithString:self.urlStr]];
    NSMutableURLRequest* mutableRequest=[request mutableCopy];
    [mutableRequest addValue:@"device_id=eyJpdiI6IkNsdjJhdUd4aVJYQlBha3d3cGl0dFdTbU00eU9vcXU2MFZONWlNNWNjbEE9IiwidmFsdWUiOiJDU2pYSEtsVUYrYm9hditXZk4zSnB6ZkFjZzdvM25JVHk0djZ6cjk5SVNVPSIsIm1hYyI6IjNiNThmZWYzMWRjMTk4YTkyMDM4YjYwNjRiNmM1YTVhMjA4M2RkYjBlNDM4YmMyNjJhNTI1OWZiZGFmYmI1MDMifQ%3D%3D; laravel_session=eyJpdiI6ImhaN3pvd1RNeWRRZ0Ywbm85elJvbFhNenk4R3l5MFpDcWtvN2poM3hqcEE9IiwidmFsdWUiOiJIdkhqcjgxcGZUMFdaYnJBMFY4TXo0SFl5K2hqTklaQWpMMzVReTZjdmVcL0xuUTdmbXNcL01lXC9objZlSEIxVjQzV1Mwb3hHc3RqM1hObjBwQlZvTmVYdz09IiwibWFjIjoiODQwY2I4MzMzOWJjYmQzMzRhZmVhZDQ1YzBjODQ2ZDFlMmQxODBmYzJhOGE1MzQ3NThkMzQyOGI4N2NjZGFiNCJ9" forHTTPHeaderField:@"Cookie"];
    
    [mutableRequest addValue:@"ZpUDJ4pc8QuyckYG0C39qnKqiRICvxOI9Sxzbp8U3iWq0lUUFxCjpVMpJZd2JaNd" forHTTPHeaderField:@"Authorization"];
    
    request=[mutableRequest copy];
    [self.wkWebView loadRequest:request];
    DQLog(@"DQD WKWebView url %@",self.urlStr);
    
    self.loadingLable=[UILabel new];
    self.loadingLable.text=@"努力加载中";
    self.loadingLable.font=[UIFont systemFontOfSize:15];
    self.loadingLable.textColor=ThemeColor;
    
    self.loadErrorLable=[UILabel new];
    self.loadErrorLable.text=@"加载失败";
    self.loadErrorLable.font=[UIFont systemFontOfSize:15];
    self.loadErrorLable.textColor=ThemeColor;
    
    [self.view addSubview:self.loadingLable];
    [self.view addSubview:self.loadErrorLable];
    
    [self.loadingLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.centerY.equalTo(self.view);
    }];
    [self.loadErrorLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.view);
        make.centerX.equalTo(self.view);
    }];
    self.loadErrorLable.hidden=YES;
    self.loadingLable.hidden=YES;
}

#pragma mark WKWebView delegate

// 页面开始加载时调用
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation{
    DQLog(@"准备开始");
    self.loadingLable.hidden=NO;
}
// 当内容开始返回时调用
- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation{
    DQLog(@"提交导航");
}
// 页面加载完成之后调用
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    self.loadingLable.hidden=YES;
    DQLog(@"结束导航");
}
// 页面加载失败时调用
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation{
    NSLog(@"加载失败");
    self.loadErrorLable.hidden=NO;
}

// 接收到服务器跳转请求之后调用
- (void)webView:(WKWebView *)webView didReceiveServerRedirectForProvisionalNavigation:(WKNavigation *)navigation{
    
}
// 在收到响应后，决定是否跳转
- (void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler{
    if ([[navigationResponse.response.URL.absoluteString substringToIndex:4] isEqualToString:@"dong"]) {
        decisionHandler(WKNavigationResponsePolicyCancel);
        NSLog(@"响应后%@",navigationResponse.response.URL.absoluteString);
    }
    else{
        decisionHandler(WKNavigationResponsePolicyAllow);
    }
    
}


#pragma mark getter&&setter

-(WKWebView* )wkWebView{
    if (!_wkWebView) {
        
        WKWebViewConfiguration* config = [WKWebViewConfiguration new];
        //注册js方法
        [config.userContentController addScriptMessageHandler:self name:@"herf"];
        _wkWebView=[[WKWebView alloc]initWithFrame:self.view.bounds configuration:config];;
        _wkWebView.navigationDelegate=self;
    }
    return _wkWebView;
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
