//
//  DrawView.m
//  ViewTransparent
//
//  Created by xiangronghua on 2017/8/24.
//  Copyright © 2017年 xiangronghua. All rights reserved.
//

#import "DrawView.h"

@implementation DrawView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //设置 背景为clear
        self.backgroundColor = [UIColor clearColor];
        self.opaque = NO;
    }
    return self;
}

- (void)setType:(DrawViewType)type {
    if (type) {
        _type = type;
    }
}

- (void)drawRect:(CGRect)rect {
    if (self.type == DrawViewTypeOne) {
        [self setupSquare:rect];
    }
    else if (self.type == DrawViewTypeTwo) {
        [self setupThePrototype:rect];
    }
    else {
        [self setupThePrototype_02:rect];
    }
}

- (void)setupSquare:(CGRect)rect {
    [[UIColor colorWithWhite:0 alpha:0.5] setFill];
    //半透明区域
    UIRectFill(rect);
    
    //透明的区域
    CGRect holeRection = CGRectMake(100, 200, 200, 200);
    /** union: 并集
     CGRect CGRectUnion(CGRect r1, CGRect r2)
     返回并集部分rect
     */
    
    /** Intersection: 交集
     CGRect CGRectIntersection(CGRect r1, CGRect r2)
     返回交集部分rect
     */
    CGRect holeiInterSection = CGRectIntersection(holeRection, rect);
    [[UIColor clearColor] setFill];
    
    //CGContextClearRect(ctx, <#CGRect rect#>)
    //绘制
    //CGContextDrawPath(ctx, kCGPathFillStroke);
    UIRectFill(holeiInterSection);
}

- (void)setupThePrototype:(CGRect)rect {
    
    //中间镂空的矩形框
    CGRect myRect =CGRectMake(100,200,200, 200);
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    //背景色
    //[[UIColor colorWithPatternImage:[UIImage imageNamed:@"1.jpg"]] set];
    [[UIColor colorWithWhite:0 alpha:0.5] set];
    CGContextAddRect(ctx, rect);
    CGContextFillPath(ctx);
    
    //设置清空模式
    /**
     kCGBlendModeClear,
     kCGBlendModeCopy,
     kCGBlendModeSourceIn,
     kCGBlendModeSourceOut,
     kCGBlendModeSourceAtop,
     kCGBlendModeDestinationOver,
     kCGBlendModeDestinationIn,
     kCGBlendModeDestinationOut,
     kCGBlendModeDestinationAtop,
     kCGBlendModeXOR,
     kCGBlendModePlusDarker,
     kCGBlendModePlusLighter
     */
    CGContextSetBlendMode(ctx, kCGBlendModeClear);
    
    //画圆
    CGContextAddEllipseInRect(ctx, myRect);
    
    //填充
    CGContextFillPath(ctx);
}

- (void)setupThePrototype_02:(CGRect)rect {
    //中间镂空的矩形框
    CGRect myRect =CGRectMake(100,200,200, 200);
    
    //背景
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:0];
    //镂空
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithOvalInRect:myRect];
    [path appendPath:circlePath];
    [path setUsesEvenOddFillRule:YES];
    
    CAShapeLayer *fillLayer = [CAShapeLayer layer];
    fillLayer.path = path.CGPath;
    fillLayer.fillRule = kCAFillRuleEvenOdd;
    fillLayer.fillColor = [UIColor blackColor].CGColor;
    fillLayer.opacity = 0.5;
    [self.layer addSublayer:fillLayer];
}

@end
