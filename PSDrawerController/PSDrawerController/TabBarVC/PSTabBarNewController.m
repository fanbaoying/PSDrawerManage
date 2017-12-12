//
//  PSTabBarNewController.m
//  PSDrawerController
//
//  Created by 范保莹 on 2017/11/27.
//  Copyright © 2017年 Leiliang. All rights reserved.
//

#import "PSTabBarNewController.h"

#import "FirstViewController.h"
#import "LeftView.h"

#import "PSDrawerManager.h"

@interface PSTabBarNewController () <UITabBarControllerDelegate>

@end

@implementation PSTabBarNewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.delegate = self;
    
    UIViewController *viewController = [[FirstViewController alloc] init];
    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
    [self addChildViewController:navigationController];
    
    
//    [[UIApplication sharedApplication].delegate.window insertSubview:[LeftView sharedInstance] belowSubview:self.view];
    [self.view addSubview:[LeftView sharedInstance]];
    
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
