//
//  ViewController.m
//  Arc-UIBezierPath
//
//  Created by 黄海燕 on 16/8/10.
//  Copyright © 2016年 huanghy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 200)];
    bgView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:bgView];
    CGSize finalSize = CGSizeMake(CGRectGetWidth(bgView.frame),200);
    CGFloat layerHeight = finalSize.height*0.6;
    CAShapeLayer *layer = [[CAShapeLayer alloc]init];
    UIBezierPath *bezier = [[UIBezierPath alloc]init];
    [bezier moveToPoint:(CGPointMake(0, finalSize.height - layerHeight))];
    [bezier addLineToPoint:CGPointMake(0, finalSize.height - 1)];
    [bezier addLineToPoint:CGPointMake(finalSize.width, finalSize.height - 1)];
    [bezier addLineToPoint:CGPointMake(finalSize.width, finalSize.height - layerHeight)];
    [bezier addQuadCurveToPoint:CGPointMake(0,finalSize.height - layerHeight) controlPoint:CGPointMake(finalSize.width / 2, (finalSize.height - layerHeight)-60)];
    layer.path = bezier.CGPath;
    layer.fillColor = [UIColor whiteColor].CGColor;
    [bgView.layer addSublayer:layer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
