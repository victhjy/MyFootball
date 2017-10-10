//
//  LovedCommunityVC.m
//  MyFootball
//
//  Created by huangjinyang on 16/9/2.
//  Copyright © 2016年 huangjinyang. All rights reserved.
//
#define color(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]

#import "LovedCommunityVC.h"
#import "ZLPhotoActionSheet.h"
#import <Photos/Photos.h>
#import "ZLCollectionCell.h"
#import "ZLPhotoModel.h"
#import "ZLPhotoManager.h"
#import "ZLPhotoBrowser.h"
#import "ZLShowBigImgViewController.h"
#import "ZLThumbnailViewController.h"
#import "ZLNoAuthorityViewController.h"
#import "ToastUtils.h"
#import "ZLEditViewController.h"

#include "AssetsLibrary/ALAssetsLibrary.h"
#include "AssetsLibrary/ALAssetRepresentation.h"
@interface LovedCommunityVC ()<UIImagePickerControllerDelegate,
UINavigationControllerDelegate>

@property (strong, nonatomic) CADisplayLink *displayLink;

@property (strong, nonatomic) CAShapeLayer *shapeLayer;

@property (strong, nonatomic) UIBezierPath *path;

@property (strong, nonatomic) CAShapeLayer *shapeLayer2;

@property (strong, nonatomic) UIBezierPath *path2;

@property (strong, nonatomic) CAGradientLayer *gradientLayer;

@property (strong, nonatomic) CAGradientLayer *gradientLayer2;

@property (nonatomic, strong) NSArray *arrDataSources;
@property (nonatomic, strong) NSMutableArray<UIImage *> *lastSelectPhotos;
@property (nonatomic, strong) NSMutableArray<PHAsset *> *lastSelectAssets;
@property(nonatomic, strong) UIImagePickerController *imagePickerController;

@property(nonatomic,weak)UITextField* t;
@property(nonatomic,strong)UIImageView* imageV;

@end

@implementation LovedCommunityVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    [self initUI];
    // Do any additional setup after loading the view.
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];

}


-(void)initUI{
    _shapeLayer = [CAShapeLayer layer];
    _shapeLayer.frame = CGRectMake(0, 100, 375, 150);
    
    _shapeLayer2 = [CAShapeLayer layer];
    _shapeLayer2.frame = CGRectMake(0, 100, 375, 150);
    
    _displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(drawPath)];
    [_displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    
    [self addGradient1];
    [self addGradient2];
    
    UITextField* t=[[UITextField alloc]init];
    [self.view addSubview:t];
    t.frame=CGRectMake(0, 0, 300, 30);
    t.center=self.view.center;
    t.layer.borderWidth=1;
    self.t=t;
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    CGPoint touchP = [[touches anyObject] locationInView:self.view];
    if (touchP.y < 250) {
        [self.navigationController presentViewController:self.imagePickerController animated:YES completion:nil];
    }
    else if (touchP.y < self.view.height/2){
        if (self.t.hidden) {
            self.imageV.hidden=YES;
            self.t.hidden=NO;
        }
        else{
            if (self.t.text.length>0) {
                UIImage* QRImage=[MyTools generateQRCode:self.t.text];
                self.t.hidden=YES;
                
                self.imageV=[[UIImageView alloc]initWithImage:QRImage];
                [self.view addSubview:self.imageV];
                self.imageV.center=self.view.center;
                self.imageV.hidden=NO;
            }
            else{
                [MyTools showText:@"没输入啊" inView:self.view];
            }
        }
    }
}



- (void)drawPath {
    static double i = 0;
    
    CGFloat A = 10.f;//A振幅
    CGFloat k = 0;//y轴偏移
//    CGFloat ω = 0.03
    CGFloat ω = 0.05;//角速度ω变大，则波形在X轴上收缩（波形变紧密）；角速度ω变小，则波形在X轴上延展（波形变稀疏）。不等于0
    CGFloat φ = 0 + i;//初相，x=0时的相位；反映在坐标系上则为图像的左右移动。
    //y=Asin(ωx+φ)+k
    
    _path = [UIBezierPath bezierPath];
    _path2 = [UIBezierPath bezierPath];
    
    [_path moveToPoint:CGPointZero];
    [_path2 moveToPoint:CGPointZero];
    for (int i = 0; i < 376; i ++) {
        CGFloat x = i;
        CGFloat y = A * sin(ω*x+φ)+k;
        CGFloat y2 = A * cos(ω*x+φ)+k;
        [_path addLineToPoint:CGPointMake(x, y)];
        [_path2 addLineToPoint:CGPointMake(x, y2)];
    }
    [_path addLineToPoint:CGPointMake(375, -100)];
    [_path addLineToPoint:CGPointMake(0, -100)];
    _path.lineWidth = 1;
    
    _shapeLayer.path = _path.CGPath;
    
    [_path2 addLineToPoint:CGPointMake(375, -100)];
    [_path2 addLineToPoint:CGPointMake(0, -100)];
    _path2.lineWidth = 1;
    
    _shapeLayer2.path = _path2.CGPath;
    
    i += 0.1;
    if (i > M_PI * 2) {
        i = 0;//防止i越界
    }
    _gradientLayer.mask = _shapeLayer;
    _gradientLayer2.mask = _shapeLayer2;
}

- (void)addGradient1 {
    //139 70 83
    //174 252 217
    _gradientLayer = [CAGradientLayer layer];
    NSInteger count = 20;
    NSMutableArray *colors = [NSMutableArray array];
    NSMutableArray *locations = [NSMutableArray array];
    for (NSInteger i = 0; i < count ; i ++) {
        UIColor *color = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:0.3];
        [colors addObject:(__bridge id)color.CGColor];
        [locations addObject:@(i /(CGFloat)count)];
    }
    //颜色数组
    _gradientLayer.colors = colors;
    //可以不设置
    _gradientLayer.locations = locations;
    //startPoint endPoint 确定条纹方向 不设置 默认水平默认值[.5,0]和[.5,1]
    _gradientLayer.startPoint = CGPointMake(0, 0);
    _gradientLayer.endPoint = CGPointMake(1, 1);
    
    _gradientLayer.type = kCAGradientLayerAxial;
    
    _gradientLayer.frame = CGRectMake(0, 0, 375, 150);
    
    [self.view.layer addSublayer:_gradientLayer];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"colors"];
    
    animation.duration = 2;
    
    animation.repeatCount = MAXFLOAT;
    
    NSMutableArray *toValue = [NSMutableArray array];
    
    for (NSInteger i = 0; i < count ; i ++) {
        
        UIColor *color = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:0.3];
        
        [toValue addObject:(__bridge id)color.CGColor];
        
    }
    animation.autoreverses = YES;
    animation.toValue = toValue;
    [_gradientLayer addAnimation:animation forKey:@"gradientLayer"];
    
}
- (void)addGradient2 {
    
    _gradientLayer2 = [CAGradientLayer layer];
    NSInteger count = 20;
    NSMutableArray *colors = [NSMutableArray array];
    NSMutableArray *locations = [NSMutableArray array];
    for (NSInteger i = 0; i < count ; i ++) {
        UIColor *color = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:0.3];
        [colors addObject:(__bridge id)color.CGColor];
        [locations addObject:@(i /(CGFloat)count)];
    }
    //颜色数组
    _gradientLayer2.colors = colors;
    //可以不设置
    _gradientLayer2.locations = locations;
    //startPoint endPoint 确定条纹方向 不设置 默认水平默认值[.5,0]和[.5,1]
    _gradientLayer2.startPoint = CGPointMake(1, 0);
    _gradientLayer2.endPoint = CGPointMake(0, 1);
    
    _gradientLayer2.type = kCAGradientLayerAxial;
    
    _gradientLayer2.frame = CGRectMake(0, 0, 375, 150);
    
    [self.view.layer addSublayer:_gradientLayer2];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"colors"];
    
    animation.duration = 2;
    
    animation.repeatCount = MAXFLOAT;
    
    NSMutableArray *toValue = [NSMutableArray array];
    
    for (NSInteger i = 0; i < count ; i ++) {
        
        UIColor *color = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:0.3];
        
        [toValue addObject:(__bridge id)color.CGColor];
        
    }
    animation.autoreverses = YES;
    animation.toValue = toValue;
    [_gradientLayer2 addAnimation:animation forKey:@"gradientLayer"];
    
}

- (ZLPhotoActionSheet *)getPas
{
    ZLPhotoActionSheet *actionSheet = [[ZLPhotoActionSheet alloc] init];
    //如果调用的方法没有传sender，则该属性必须提前赋值
    actionSheet.sender = self;
    
    actionSheet.arrSelectedAssets =self.lastSelectAssets;
    
    weakify(self);
    [actionSheet setSelectImageBlock:^(NSArray<UIImage *> * _Nonnull images, NSArray<PHAsset *> * _Nonnull assets, BOOL isOriginal) {
        strongify(weakSelf);
        strongSelf.arrDataSources = images;
        strongSelf.lastSelectAssets = assets.mutableCopy;
        strongSelf.lastSelectPhotos = images.mutableCopy;
//        [strongSelf.collectionView reloadData];
        
        
        
        NSLog(@"image:%@", images);
    }];
    
    return actionSheet;
}
#pragma mark - UIImagePickerController代理方法
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [picker dismissViewControllerAnimated:YES completion:nil];
//    UIImage *image= [info objectForKey:UIImagePickerControllerOriginalImage];//获取图片
//    
//    if (!image){return;}
    
    NSURL *imageURL = [info valueForKey:UIImagePickerControllerReferenceURL];
    
    ALAssetsLibraryAssetForURLResultBlock resultblock = ^(ALAsset *myasset)   {
        ALAssetRepresentation *representation = [myasset defaultRepresentation];
        NSDictionary * dic = [representation metadata];
        NSLog(@"meta=%@",dic);
        
        NSString *fileName = [representation filename];
        NSLog(@"fileName : %@",fileName);
        
        
        if (dic && dic.allKeys.count < 100 && dic[@"{GPS}"]) {
            dic  = dic[@"{GPS}"];
            UITextView *tv = [[UITextView alloc]initWithFrame:CGRectMake(0, UIScreenHeight/2+10, UIScreenWidth, UIScreenHeight/2-50)];
            tv.text = [MyTools convertToJsonData:dic];
            tv.scrollEnabled = YES;
            [self.view addSubview:tv];
        }
        else{
            [MyTools showText:@"无位置信息" inView:self.view];
        }

    };
    
    ALAssetsLibrary* assetslibrary = [[ALAssetsLibrary alloc] init]  ;
    [assetslibrary assetForURL:imageURL
                   resultBlock:resultblock
                  failureBlock:nil];
    
//    CGImageSourceRef imageSource = CGImageSourceCreateWithURL((CFURLRef)imageURL, NULL);
//    if (imageSource) {
//        CFDictionaryRef imageInfo = CGImageSourceCopyPropertiesAtIndex(imageSource, 0,NULL);
//        NSDictionary *exifDic = (__bridge NSDictionary *)CFDictionaryGetValue(imageInfo, kCGImagePropertyExifDictionary) ;
//        
//        
//        UITextView *tv = [[UITextView alloc]initWithFrame:CGRectMake(0, UIScreenHeight/2+40, UIScreenWidth, UIScreenHeight/2-50)];
//        tv.text = [MyTools convertToJsonData:exifDic];
//        tv.scrollEnabled = YES;
//        tv.editable = YES;
//        [self.view addSubview:tv];
//    }
//    else{
//        [MyTools showText:@"无位置信息" inView:self.view];
//    }
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker;
{
    [picker dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark - Getter

-(NSMutableArray *)lastSelectAssets{
    if (!_lastSelectAssets) {
        _lastSelectAssets = [NSMutableArray new];
    }
    return _lastSelectAssets;
}

-(UIImagePickerController *)imagePickerController
{
    if (!_imagePickerController)
    {
        _imagePickerController = [[UIImagePickerController alloc] init];
        _imagePickerController.modalPresentationStyle = UIModalPresentationCurrentContext;
        _imagePickerController.delegate = self;
        _imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    return _imagePickerController;
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
