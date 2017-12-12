//
//  MessageViewController.m
//  PSDrawerController
//
//  Created by 雷亮 on 16/8/8.
//  Copyright © 2016年 Leiliang. All rights reserved.
//

#import "MessageViewController.h"
#import "UIView+leoAdd.h"
#import "LeftView.h"

#import "PSDrawerManager.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width

@interface MessageViewController ()

@property (nonatomic, strong) UISegmentedControl *segmentedControl;
@property (nonatomic, strong) UISearchBar *searchBar;

@end

@implementation MessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"点击" style:UIBarButtonItemStyleDone target:self action:@selector(showLeftView)];
    
    self.navigationItem.title = @"首页";
    
    UISwipeGestureRecognizer *turnLeft = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(turnToLeft)];
    turnLeft.direction=UISwipeGestureRecognizerDirectionLeft;//控制方向向左
    [[self view] addGestureRecognizer:turnLeft];
    
    UISwipeGestureRecognizer *turnRight =
    [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(TurnToRight)];
    turnRight.direction=UISwipeGestureRecognizerDirectionRight;//控制方向向右
    [self.view addGestureRecognizer:turnRight];
    
//    self.segmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"消息", @"电话"]];
//    self.segmentedControl.width = 120;
//    self.segmentedControl.selectedSegmentIndex = 0;
//    self.navigationItem.titleView = self.segmentedControl;
//
//    self.searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 44)];
//    self.searchBar.placeholder = @"搜索";
//    [self.tableView addSubview:self.searchBar];
}

-(void)showLeftView{
    [[LeftView sharedInstance] showMenuView];
    
}

-(void)turnToLeft{
    //添加手指向左滑动屏幕时执行的操作
    [[LeftView sharedInstance] hiddenMenuView];
}

-(void)TurnToRight{
    //添加手指向右滑动屏幕时执行的操作
    [[LeftView sharedInstance] showMenuView];
}


//- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    [self.searchBar resignFirstResponder];
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    return 0;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    return 0;
//}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
