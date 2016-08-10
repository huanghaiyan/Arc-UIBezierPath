# Arc-UIBezierPath

![1455416445749925.png](http://upload-images.jianshu.io/upload_images/726092-b6bf3d7e6f0b9d51.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

主要实现红框里的效果
实现思路：
很明显它可以用 CAShapeLayer + UIBezierPath 来做，思路大概是这样，先移动到左上方的位置，然后向下划线，然后往右划线，然后往上划线，
还剩一个盖子，这个盖子就用一个控制点控制曲率，非常简单，代码如下：

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
