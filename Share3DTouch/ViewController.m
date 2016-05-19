//
//  ViewController.m
//  Share3DTouch
//
//  Created by jens on 16/5/15.
//  Copyright © 2016年 张建帅. All rights reserved.
//

#import "ViewController.h"
#import "TouchViewController.h"

@interface ViewController () <UIViewControllerPreviewingDelegate>


@property (weak, nonatomic) IBOutlet UILabel *testLabel;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //因为label的交互默认是关闭的,要实现重按label达到3d touch的效果需要先打开交互
    _testLabel.userInteractionEnabled = YES;
    
    //判断设备是否支持3d touch
    if (self.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable) {
        NSLog(@"支持");
        //注册3dtouch的peek(预览) 和 pop 功能
        [self registerForPreviewingWithDelegate:self sourceView:self.testLabel];
        
    }else {
        NSLog(@"不支持");
    }
}

#pragma mark ---UIViewControllerPreviewingDelegate
/** peek预览 */
- (nullable UIViewController *)previewingContext:(id <UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location {
    
    //获取重按的坐标 <转换坐标>
//    CGPoint p = [self.view convertPoint:location fromView:self.view];
    //判断重按的坐标的y是否大于300, 大于300实现3dtouch效果.
//    if (p.y >= 300) {
        //弹出视图的初始位置,sourceRect是peek触发时的高亮区域,这个区域内的view会高亮显示,其余部分会模糊掉
        previewingContext.sourceRect = CGRectMake(0, 0, 100, 100);
        
        TouchViewController *touchVC = [[TouchViewController alloc] init];
        return touchVC;
        
//    }else {
//        return nil;
//    }

}

/** pop功能 */
- (void)previewingContext:(id <UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit {
    [self showViewController:viewControllerToCommit sender:self];
}

//移动or压力改变的回调
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSArray *array = [touches allObjects];
    UITouch *touch = (UITouch *)[array lastObject];
    
    //压力值
    NSLog(@"%.2lf", touch.force);
    self.testLabel.text = [NSString stringWithFormat:@"%.2lf", touch.force];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
