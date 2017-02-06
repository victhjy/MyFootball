//
//  DQDataTeamDetailVC.m
//  MyFootball
//
//  Created by huangjinyang on 16/10/9.
//  Copyright © 2016年 huangjinyang. All rights reserved.
//

#define KHeaderHeight 200.0
#import "DQDataTeamDetailVC.h"
//#import "UINavigationBar+Awesome.h"

@interface DQDataTeamDetailVC ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>
{
    UIView *_header;
    UIImageView *_headerImageView;
    UIView *_lineView;
    UIStatusBarStyle _statStyle;
    UITextField* t;
}
@property(nonatomic,strong)UITableView* tableView;
@property (strong, nonatomic) UIView *header;
@property (strong, nonatomic) UIImageView *headerImageView;
@end
NSString *const cellId = @"cellID";
@implementation DQDataTeamDetailVC

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES];
}
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}
- (void)preparaTopHeadr
{
    _header = [[UIView alloc]initWithFrame:CGRectMake(0, 0,UIScreenWidth, KHeaderHeight)];
    _header.backgroundColor =[MyTools colorWithHexString:@"0xF8F8F8"];
    
    [self.view addSubview:_header];
    
    _headerImageView = [[UIImageView alloc]initWithFrame:_header.bounds];
    _headerImageView.backgroundColor = [MyTools colorWithHexString:@"0x000033"];
    _headerImageView.contentMode = UIViewContentModeScaleAspectFill;
    _headerImageView.clipsToBounds = YES;//图片过大的裁切
    [_header addSubview:_headerImageView];
    //设置图像
    NSURL *url = [NSURL URLWithString:@"http://c.hiphotos.baidu.com/zhidao/pic/item/5ab5c9ea15ce36d3c704f35538f33a87e950b156.jpg"];
    [_headerImageView sd_setImageWithURL:url placeholderImage:IMAGENAME(@"2016")];
    //添加分割线一个像素
    CGFloat height = 1/[UIScreen mainScreen].scale;
    _lineView = [[UIView alloc]initWithFrame:CGRectMake(0, KHeaderHeight, UIScreenWidth, height)];
    _lineView.backgroundColor = [UIColor lightGrayColor];
    [_header addSubview:_lineView];
}

- (void)prepareTableView
{
    UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellId];
    
    [self.view addSubview:tableView];
    //设置标哥的间距
    tableView.contentInset = UIEdgeInsetsMake(200, 0, 0, 0);
    tableView.scrollIndicatorInsets = UIEdgeInsetsMake(200, 0, 0, 0);
}


- (void)viewDidLoad {
    [super viewDidLoad];
    t=[[UITextField alloc]init];
    [self.view addSubview:t];
    [t mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(200, 50));
    }];
    t.backgroundColor=[UIColor grayColor];
    [t addObserver:self forKeyPath:@"text" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
    
    UITextField* t2=[[UITextField alloc]init];
    [self.view addSubview:t2];
    [t2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(100);
        make.centerX.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(200, 50));
    }];
    t2.backgroundColor=[UIColor grayColor];
//    [self initUI];
//    self.automaticallyAdjustsScrollViewInsets = NO;
//    self.view.backgroundColor = [UIColor whiteColor];
    
//    [self prepareTableView];
    
//    [self preparaTopHeadr];
    
//    _statStyle = UIStatusBarStyleLightContent;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if([keyPath isEqualToString:@"isEditing"]) {
        // text has changed
        DQLog(@"123");
        dispatch_queue_t t=dispatch_get_main_queue();
    }
}

-(void)dealloc{
    [t removeObserver:self forKeyPath:@"isFirstResponder"];
}

-(void)initUI{
    self.tableView=[[UITableView alloc]init];
    [self.view addSubview:self.tableView];
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view);
        make.left.right.bottom.equalTo(self.view);
    }];
    //设置标哥的间距
    self.tableView.contentInset = UIEdgeInsetsMake(200, 0, 0, 0);
    self.tableView.scrollIndicatorInsets = UIEdgeInsetsMake(200, 0, 0, 0);

}

#pragma mark - UITableViewDelegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(UITableViewCell* )tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell* cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    cell.textLabel.text=[NSString stringWithFormat:@"%zd",indexPath.row];
    return cell;
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offsety = scrollView.contentOffset.y+scrollView.contentInset.top;
    if (offsety <= 0)
    {
        //放大
        CGRect frame= _header.frame;
        frame.origin.y = 0;
        
        frame.size.height = KHeaderHeight-offsety;
        _header.frame = frame;
        
        frame = _headerImageView.frame;
        frame.size.height = _header.height;;
        _headerImageView.frame = frame;;
        
        
        
        //设置透明度
        _headerImageView.alpha = 1.0;
        //根据透明度修改状态栏颜色
        _statStyle = UIStatusBarStyleLightContent;
        //主动更新状态栏
        [self.navigationController setNeedsStatusBarAppearanceUpdate];
        
    }
    else
    {
        //整体移动
        
        CGRect frame= _header.frame;
        //header的最小y值
        CGFloat min = KHeaderHeight-64;
        frame.origin.y = -MIN(min, offsety);
        
        frame.size.height = KHeaderHeight;
        _header.frame = frame;
        
        frame = _headerImageView.frame;
        frame.size.height = _header.height;;
        _headerImageView.frame = frame;;
        //设置透明度
        CGFloat progress = 1-(offsety/min);
        _headerImageView.alpha = progress;
        NSLog(@"%f",offsety/min);
        //根据透明度修改状态栏颜色
        _statStyle = (progress<0.5)?UIStatusBarStyleDefault:UIStatusBarStyleLightContent;
        //主动更新状态栏
        [self.navigationController setNeedsStatusBarAppearanceUpdate];
        
    }
    
    CGRect frame = _lineView.frame;
    frame.origin.y = _header.height-_lineView.height;
    _lineView.frame = frame;
}
@end
