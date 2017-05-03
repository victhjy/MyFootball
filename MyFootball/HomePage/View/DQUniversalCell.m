//
//  DQUniversalCell.m
//  MyFootball
//
//  Created by jinx huang on 17/5/1.
//  Copyright © 2017年 huangjinyang. All rights reserved.
//

#import "DQUniversalCell.h"
#import "DQHotNewsModel.h"
@implementation DQUniversalCell

- (void)awakeFromNib {
    [super awakeFromNib];

    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)prepareForReuse {
    [super prepareForReuse];
    self.left_lbl.text=nil;
    self.right_lbl.text=nil;
    self.left_lbl.layer.borderWidth=0;
    self.left_lbl.layer.borderColor=[UIColor clearColor].CGColor;
    
    self.right_lbl.layer.borderWidth=0;
    self.right_lbl.layer.borderColor=[UIColor clearColor].CGColor;
    [super prepareForReuse];
}

-(void)bindData:(DQHotNewsSingleItem *)item{
    self.title_lbl.text=item.title;
    self.context_lbl.text=item.itemDescription;
    [self.contentImage sd_setImageWithURL:[NSURL URLWithString:item.thumb] placeholderImage:IMAGENAME(@"test")];
    if (item.top) {
        self.right_lbl.hidden=NO;
        self.right_lbl.text=@"置顶";
        self.right_lbl.textColor=ThemeColor;
        self.right_lbl.layer.borderColor=ThemeColor.CGColor;
        self.right_lbl.layer.borderWidth=1;
        
        if (item.label) {
            self.left_lbl.hidden=NO;
            self.left_lbl.text=item.label;
            self.left_lbl.textColor=[MyTools colorWithHexString:item.label_color];
            self.left_lbl.layer.borderColor=self.left_lbl.textColor.CGColor;
            self.left_lbl.layer.borderWidth=1;
            self.comment_lbl.text=[NSString stringWithFormat:@"%ld评论",item.comments_total];
            self.comment_lbl.textColor=[UIColor lightGrayColor];
            self.comment_lbl.hidden=NO;
        }
        else{
            self.left_lbl.hidden=NO;
            self.left_lbl.text=[NSString stringWithFormat:@"%ld评论",item.comments_total];
            self.left_lbl.textColor=[UIColor lightGrayColor];
            self.comment_lbl.hidden=YES;
        }
    }
    else{
        if (item.label) {
            self.right_lbl.hidden=NO;
            self.right_lbl.text=item.label;
            self.right_lbl.textColor=[MyTools colorWithHexString:item.label_color];
            self.right_lbl.layer.borderColor=self.right_lbl.textColor.CGColor;
            self.right_lbl.layer.borderWidth=1;
            
            
            self.left_lbl.text=[NSString stringWithFormat:@"%ld评论",item.comments_total];
            self.left_lbl.textColor=[UIColor lightGrayColor];
            self.comment_lbl.hidden=YES;
            
            if(item.is_ad){
                self.left_lbl.hidden=YES;
            }
            else{
                self.left_lbl.hidden=NO;
            }
        }
        else{
            self.left_lbl.hidden=YES;
            self.right_lbl.hidden=NO;
            self.right_lbl.text=[NSString stringWithFormat:@"%ld评论",item.comments_total];
            self.right_lbl.textColor=[UIColor lightGrayColor];
            self.comment_lbl.hidden=YES;
        }
    }
    
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
    [self updateConstraints];
    [self layoutIfNeeded];

}

@end
