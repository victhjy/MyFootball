//
//  DQDrawView.m
//  MyFootball
//
//  Created by huangjinyang on 17/3/14.
//  Copyright © 2017年 huangjinyang. All rights reserved.
//

#import "DQDrawView.h"
#import "DQDrawTool.h"
@implementation DQDrawView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

*/
- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    CGContextRef currentContentText=UIGraphicsGetCurrentContext();
    
    for (int i=0; i<self.path.count; i++) {
        DQDrawTool* tool=self.path[i];
        CGMutablePathRef path=CGPathCreateMutable();
        
        for (int j=0; j<tool.path.count; j++) {
            CGPoint point=[tool.path[j] CGPointValue];
            if (j==0) {
                CGPathMoveToPoint(path, &CGAffineTransformIdentity, point.x, point.y);
            }
            else{
                CGPathAddLineToPoint(path, &CGAffineTransformIdentity, point.x, point.y);
            }
        }
        CGContextSetStrokeColorWithColor(currentContentText, tool.pathColor.CGColor);
        CGContextSetLineWidth(currentContentText, tool.pathWith);
        CGContextAddPath(currentContentText, path);
        CGContextStrokePath(currentContentText);
//        CGPathRelease(path);
    }
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    DQDrawTool* tool=[DQDrawTool new];
    tool.pathColor=self.pathColor;
    tool.pathWith=self.pathWith;
    tool.path=[NSMutableArray new];
    [self.path addObject:tool];
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    DQDrawTool* lastTool=[self.path lastObject];
    CGPoint movePoint=[[touches anyObject]locationInView:self];
    [lastTool.path addObject:[NSValue valueWithCGPoint:movePoint]];
    
    [self setNeedsDisplay];
}

@end
