//
//  ViewController.m
//  ViewTransparent
//
//  Created by xiangronghua on 2017/8/24.
//  Copyright © 2017年 xiangronghua. All rights reserved.
//

#import "ViewController.h"
#import "DrawView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    imageView.backgroundColor = [UIColor redColor];
    imageView.image = [UIImage imageNamed:@"车贷版首页已注册.jpg"];
    [self.view addSubview:imageView];
    
    DrawView *drawView = [[DrawView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    drawView.type = DrawViewTypeThree;
    [self.view addSubview:drawView];
}





@end
