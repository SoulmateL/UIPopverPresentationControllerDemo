//
//  ViewController.m
//  UIPopverPresentationController
//
//  Created by 俊杰  廖 on 2017/2/7.
//  Copyright © 2017年 俊杰  廖. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIPopoverPresentationControllerDelegate>
@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) UIPopoverPresentationController *popover;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *rightBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.button = [UIButton buttonWithType:UIButtonTypeSystem];
    self.button.frame = CGRectMake(100, 100, 100, 40);
    [self.button addTarget:self action:@selector(testAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.button];
    self.button.backgroundColor = [UIColor redColor];
}
- (IBAction)testAction2:(id)sender {
    UIViewController * testVC = [[UIViewController alloc] init];
    // 设置大小
    testVC.preferredContentSize = CGSizeMake(100, 200);
    // 设置 Sytle
    testVC.modalPresentationStyle = UIModalPresentationPopover;
    
    self.popover = testVC.popoverPresentationController;
    self.popover.delegate = self;
    
    self.popover.backgroundColor = [UIColor blueColor];
    self.rightBtn =
    // 需要通过 sourceView 来判断位置的
    self.popover.barButtonItem = self.rightBtn;
    // 箭头方向
    self.popover.permittedArrowDirections = UIPopoverArrowDirectionUp;
    // 设置代理
    [self presentViewController:testVC animated:YES completion:nil];
}

- (void)testAction:(UIButton *)sender{
    
    /*
    //初始化内容视图控制器
    UIViewController *contentVC = [[UIViewController alloc]init];
    //设置大小
    contentVC.preferredContentSize = CGSizeMake(110, 160);
    
    // 设置弹出效果
    contentVC.modalPresentationStyle = UIModalPresentationPopover;
    //初始化一个popover
    self.popover = contentVC.popoverPresentationController;
    self.popover.delegate = self;
    //设置弹出视图的颜色
    self.popover.backgroundColor = [UIColor greenColor];
    //设置popover的来源按钮（以button谁为参照）
    self.popover.sourceView = self.button;
    //设置弹出视图的位置（以button谁为参照）
    self.popover.sourceRect = self.button.bounds;
    //箭头的方向 设置成UIPopoverArrowDirectionAny 会自动转换方向
    self.popover.permittedArrowDirections = UIPopoverArrowDirectionUp;
    //模态出弹框
    [self presentViewController:contentVC animated:YES completion:nil];//推出popover
    */
    
    
    UIViewController * testVC = [[UIViewController alloc] init];
    // 设置大小
    testVC.preferredContentSize = CGSizeMake(200, 200);
    // 设置 Sytle
    testVC.modalPresentationStyle = UIModalPresentationPopover;

    self.popover = testVC.popoverPresentationController;
    self.popover.delegate = self;

    self.popover.backgroundColor = [UIColor blueColor];
    
    // 需要通过 sourceView 来判断位置的
    self.popover.sourceView = self.button;
    // 指定箭头所指区域的矩形框范围（位置和尺寸）,以sourceView的左上角为坐标原点
    // 这个可以 通过 Point 或  Size 调试位置
    self.popover.sourceRect = self.button.bounds;
    // 箭头方向
    self.popover.permittedArrowDirections = UIPopoverArrowDirectionUp;
    // 设置代理
    [self presentViewController:testVC animated:YES completion:nil];
}


-(UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller{
    return UIModalPresentationNone; //不适配
}

- (BOOL)popoverPresentationControllerShouldDismissPopover:(UIPopoverPresentationController *)popoverPresentationController{
    return YES;   //点击蒙版popover消失， 默认YES
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
