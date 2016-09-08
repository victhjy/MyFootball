//
//  DQNewsDetailViewController.h
//  MyFootball
//
//  Created by jinx huang on 16/9/7.
//  Copyright © 2016年 huangjinyang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DQChineseTeamModel.h"
@interface DQNewsDetailViewController : UIViewController
@property(nonatomic,strong)DQChineseTeamListModel* detailModel;

//flag
@property(nonatomic,assign)BOOL showCommentLabel;

@end
