//
//  ImportantLive.m
//  MyFootball
//
//  Created by huangjinyang on 16/9/2.
//  Copyright © 2016年 huangjinyang. All rights reserved.
//

#import "ImportantLive.h"
#import "DQDrawTool.h"
#import "DQDrawView.h"
#import <Photos/Photos.h>
@interface ImportantLive ()   //<UITableViewDelegate,UITableViewDataSource>
//@property(nonatomic,strong)UITableView* tableView;
@property(nonatomic,strong)UIColor* pathColor;
@property(nonatomic,assign)CGFloat pathWidth;
@property(nonatomic,strong)UISlider* slider;
@property(nonatomic,strong)    DQDrawView* drawView;

@property(nonatomic,strong)NSMutableArray* paths;

@property(nonatomic,strong)UIBarButtonItem* save;
@property(nonatomic,strong)UIBarButtonItem* cancel;
@property(nonatomic,strong)UIBarButtonItem* clear;

@end

@implementation ImportantLive

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    [self initData];
    [self createUI]; 
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated{
    self.save=[[UIBarButtonItem alloc]initWithTitle:@"保存" style:UIBarButtonItemStyleDone target:self action:@selector(saveAction:)];
    self.cancel=[[UIBarButtonItem alloc]initWithTitle:@"撤销" style:UIBarButtonItemStyleDone target:self action:@selector(cancelAction:)];
    self.clear=[[UIBarButtonItem alloc]initWithTitle:@"清除" style:UIBarButtonItemStyleDone target:self action:@selector(clearAction:)];
    
    self.navigationItem.rightBarButtonItems=@[self.save,self.cancel,self.clear];
}


-(void)initData{
    self.pathColor=ThemeColor;
    self.pathWidth=5.0;
    
    self.paths=[NSMutableArray new];

}

-(void)createUI{
    UISlider* slider=[UISlider new];
    [self.view addSubview:slider];
    slider.frame=CGRectMake(0, 64, UIScreenWidth, 20);
    slider.maximumValue=10;
    slider.minimumValue=1;
    [slider addTarget:self action:@selector(changedWidth:) forControlEvents:UIControlEventValueChanged];
    
    self.drawView=[DQDrawView new];
    self.drawView.pathColor=self.pathColor;
//    self.drawView.path=self.paths;
    self.drawView.pathWith=slider.value;
    self.drawView.userInteractionEnabled=YES;
//    [self.drawView drawRect:CGRectMake(0, 64, UIScreenWidth, UIScreenHeight-64-49)];
    self.drawView.frame=CGRectMake(0, 84, UIScreenWidth, UIScreenHeight-64-49);
    [self.view addSubview:self.drawView];
    self.drawView.path=[NSMutableArray new];
    self.drawView.backgroundColor=[UIColor whiteColor];
    
}

-(void)changedWidth:(UISlider* )sender{
    self.drawView.pathWith=sender.value;
}

-(void)saveAction:(UIBarButtonItem*)sender{
    UIGraphicsBeginImageContextWithOptions(self.drawView.frame.size, NO, 0.0);
    [self.drawView.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage* image=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [self saveImageToAlbum:image];
    
}
-(void)clearAction:(UIBarButtonItem*)sender{
    [self.drawView.path removeAllObjects];
    [self.drawView setNeedsDisplay];
}
-(void)cancelAction:(UIBarButtonItem*)sender{
    if(self.drawView.path.count>0){
        [self.drawView.path removeObjectAtIndex:self.drawView.path.count-1];
        [self.drawView setNeedsDisplay];
    }
}

-(void)saveImageToAlbum:(UIImage* )image{
    MBProgressHUD * hud=[[MBProgressHUD alloc]initWithView:self.view];
    [hud show:YES];
    dispatch_time_t delayTime=dispatch_time(DISPATCH_TIME_NOW, (int64_t) 3.0*NSEC_PER_SEC);
    dispatch_after(delayTime, dispatch_get_main_queue(), ^{
        [hud hide:YES];
    });

    [[PHPhotoLibrary sharedPhotoLibrary] performChanges:^{
        [PHAssetChangeRequest creationRequestForAssetFromImage:image];
    } completionHandler:^(BOOL success, NSError * _Nullable error) {
        if (success) {
                UIAlertView* alert=[[UIAlertView alloc]initWithTitle:@"保存成功" message:nil delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
                [alert show];
        }
    }];
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
