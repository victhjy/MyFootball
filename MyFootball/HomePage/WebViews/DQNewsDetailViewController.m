//
//  DQNewsDetailViewController.m
//  MyFootball
//
//  Created by jinx huang on 16/9/7.
//  Copyright © 2016年 huangjinyang. All rights reserved.
//

#import "DQNewsDetailViewController.h"
#import <WebKit/WebKit.h>
#import "DQCommentsVC.h"
#import "DQArticleDetail.h"
@interface DQNewsDetailViewController ()<WKNavigationDelegate,WKUIDelegate,WKScriptMessageHandler,UINavigationControllerDelegate>
@property(nonatomic,strong)UIToolbar* toolBar;
@property(nonatomic,strong)WKWebView* wkWebView;
@property(nonatomic,strong)UILabel* loadingLable;
@property(nonatomic,strong)UILabel* loadErrorLable;
@end

@implementation DQNewsDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configWKWebView];
    // Do any additional setup after loading the view.
}

- (void)dealloc {
    DQLog(DEALLOCSTR);
}

-(void)configWKWebView{
    [self.view addSubview:self.wkWebView];
    self.wkWebView.frame=self.view.bounds;
//    [self.wkWebView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(self.view).mas_offset(UIEdgeInsetsMake(0, 0, 50, 0));
//    }];
//    NSURLRequest* request=[NSURLRequest requestWithURL:[NSURL URLWithString:self.detailModel.url]];
//    NSMutableURLRequest* mutableRequest=[request mutableCopy];
//    [mutableRequest addValue:@"device_id=eyJpdiI6IkNsdjJhdUd4aVJYQlBha3d3cGl0dFdTbU00eU9vcXU2MFZONWlNNWNjbEE9IiwidmFsdWUiOiJDU2pYSEtsVUYrYm9hditXZk4zSnB6ZkFjZzdvM25JVHk0djZ6cjk5SVNVPSIsIm1hYyI6IjNiNThmZWYzMWRjMTk4YTkyMDM4YjYwNjRiNmM1YTVhMjA4M2RkYjBlNDM4YmMyNjJhNTI1OWZiZGFmYmI1MDMifQ%3D%3D; laravel_session=eyJpdiI6ImhaN3pvd1RNeWRRZ0Ywbm85elJvbFhNenk4R3l5MFpDcWtvN2poM3hqcEE9IiwidmFsdWUiOiJIdkhqcjgxcGZUMFdaYnJBMFY4TXo0SFl5K2hqTklaQWpMMzVReTZjdmVcL0xuUTdmbXNcL01lXC9objZlSEIxVjQzV1Mwb3hHc3RqM1hObjBwQlZvTmVYdz09IiwibWFjIjoiODQwY2I4MzMzOWJjYmQzMzRhZmVhZDQ1YzBjODQ2ZDFlMmQxODBmYzJhOGE1MzQ3NThkMzQyOGI4N2NjZGFiNCJ9" forHTTPHeaderField:@"Cookie"];
//    
//    [mutableRequest addValue:@"ZpUDJ4pc8QuyckYG0C39qnKqiRICvxOI9Sxzbp8U3iWq0lUUFxCjpVMpJZd2JaNd" forHTTPHeaderField:@"Authorization"];
    
//    request=[mutableRequest copy];
//    [self.wkWebView loadRequest:request];
//    DQLog(@"DQD WKWebView url %@",self.detailModel.url);
    
    
//    [self.view addSubview:self.toolBar];
//    [self.toolBar mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.bottom.mas_equalTo(self.view);
//        make.width.mas_equalTo(UIScreenWidth);
//        make.top.mas_equalTo(self.wkWebView.mas_bottom);
//    }];
//    
//    self.loadingLable=[UILabel new];
//    self.loadingLable.text=@"努力加载中";
//    self.loadingLable.font=[UIFont systemFontOfSize:15];
//    self.loadingLable.textColor=ThemeColor;
//    
//    self.loadErrorLable=[UILabel new];
//    self.loadErrorLable.text=@"加载失败";
//    self.loadErrorLable.font=[UIFont systemFontOfSize:15];
//    self.loadErrorLable.textColor=ThemeColor;
//    
//    [self.view addSubview:self.loadingLable];
//    [self.view addSubview:self.loadErrorLable];
//    
//    [self.loadingLable mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerX.equalTo(self.view);
//        make.centerY.equalTo(self.view);
//    }];
//    [self.loadErrorLable mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.equalTo(self.view);
//        make.centerX.equalTo(self.view);
//    }];
//    self.loadErrorLable.hidden=YES;
//    self.loadingLable.hidden=YES;
}

-(void)configNavigationItem{
   
    UILabel* commentLabel=[UILabel new];
    commentLabel.text=[NSString stringWithFormat:@"%zd条评论",self.detailModel.comments_total];
    commentLabel.font=[UIFont systemFontOfSize:12];
    CGSize labelSize=[MyTools string:commentLabel.text boundingRectWithSize:CGSizeMake(320, 0) font:commentLabel.font];
    commentLabel.textColor=[UIColor whiteColor];

    UIButton* commentButton=[[UIButton alloc]init];
    commentButton.frame=CGRectMake(0, 0, labelSize.width+5, labelSize.height+5);
    [commentButton setTitle:[NSString stringWithFormat:@"%zd条评论",self.detailModel.comments_total] forState:UIControlStateNormal];
    commentButton.tintColor=[UIColor whiteColor];
    commentButton.titleLabel.font=commentLabel.font;
    commentButton.layer.borderWidth=1;
    commentButton.layer.borderColor=[MyTools colorWithHexString:@"0x4ad267"].CGColor;
    commentButton.backgroundColor=[UIColor clearColor];
    [commentButton addTarget:self action:@selector(goToComment) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem* rightButton=[[UIBarButtonItem alloc]initWithCustomView:commentButton];
    self.navigationItem.rightBarButtonItem=rightButton;
    
}

-(void)goToComment{
    DQCommentsVC* commentVC=[[DQCommentsVC alloc]init];
    commentVC.articleModel=self.detailModel;
    [self.navigationController pushViewController:commentVC animated:YES];
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
    
    //加载完成后再显示右上角的评论数
     [self configNavigationItem];
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
// 在发送请求之前，决定是否跳转
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler{
    if ([[navigationAction.request.URL.absoluteString substringToIndex:4] isEqualToString:@"dong"]) {
        decisionHandler(WKNavigationActionPolicyCancel);
        NSLog(@"响应前%@",navigationAction.request.URL.absoluteString);
        __block DQArticleDetail* articleModel;
        __weak typeof(self) weakself=self;
        NSCharacterSet *cs = [[NSCharacterSet characterSetWithCharactersInString:@"0123456789"] invertedSet];
        NSString *resultStr = [[navigationAction.request.URL.absoluteString componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
        NSString* absoluteUrlString=[NSString stringWithFormat:@"%@%@",APIGetArticleFromId,resultStr];
        [[DQAFNetManager sharedManager] requestWithMethod:GET WithPath:absoluteUrlString WithParams:nil WithSuccessBlock:^(NSDictionary *dic) {
            articleModel=[DQArticleDetail mj_objectWithKeyValues:dic];
            DQChineseTeamListModel* detailModel=[DQChineseTeamListModel new];
            detailModel.url=articleModel.url;
            detailModel.articleId=articleModel.articleId.integerValue;
            detailModel.comments_total=articleModel.comments_total;
            
            DQNewsDetailViewController* detailVC=[DQNewsDetailViewController new];
            detailVC.detailModel=detailModel;
            [weakself.navigationController pushViewController:detailVC animated:YES];
            
        } WithFailurBlock:^(NSError *error) {
            DQLog(@"Error,%@",error);
        }];
    }
    else{
        decisionHandler(WKNavigationActionPolicyAllow);
    }
    
}

#pragma mark  UINaviDelegate


#pragma mark WKScriptMessageHandler
-(void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message{
    NSLog(@"%@",message);
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

-(UIToolbar* )toolBar{
    if (!_toolBar) {
        _toolBar=[UIToolbar new];
        _toolBar.backgroundColor=[MyTools colorWithHexString:@"0xefefef"];
        
        UILabel* label=[UILabel new];
        label.text=@" ✒ 没事写两句";
        label.textColor=[UIColor grayColor];
        label.font=[UIFont systemFontOfSize:14];
        label.backgroundColor=[UIColor whiteColor];
        label.layer.masksToBounds=YES;
        label.layer.cornerRadius=2;

        [_toolBar addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.equalTo(_toolBar).offset(8);
            make.bottom.mas_equalTo(_toolBar).offset(-8);
            make.width.mas_equalTo(UIScreenWidth*2/3);
        }];
    }
    return _toolBar;
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
