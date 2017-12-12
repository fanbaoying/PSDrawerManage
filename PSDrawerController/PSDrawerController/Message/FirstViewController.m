//
//  FirstViewController.m
//  PSDrawerController
//
//  Created by 范保莹 on 2017/11/28.
//  Copyright © 2017年 Leiliang. All rights reserved.
//

#import "FirstViewController.h"

#import "LeftView.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"点击" style:UIBarButtonItemStyleDone target:self action:@selector(showLeftView)];
    
    self.navigationItem.title = @"首页";
    
    
    
    UISwipeGestureRecognizer *turnRight =
    [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(TurnToRight)];
    turnRight.direction=UISwipeGestureRecognizerDirectionRight;//控制方向向右
    [self.view addGestureRecognizer:turnRight];
    
}

-(void)showLeftView{
    [[LeftView sharedInstance] showMenuView];
    
}



-(void)TurnToRight{
    //添加手指向右滑动屏幕时执行的操作
    [[LeftView sharedInstance] showMenuView];
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
