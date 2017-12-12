//
//  LeftView.m
//  PSDrawerController
//
//  Created by 雷亮 on 16/8/8.
//  Copyright © 2016年 Leiliang. All rights reserved.
//

#import "LeftView.h"
#import "PSDrawerManager.h"
#import "UIView+leoAdd.h"

static NSString *const reUse = @"reUse";

#define kBackgroundColor [UIColor colorWithRed:13.f / 255.f green:184.f / 255.f blue:246.f / 255.f alpha:1]

@interface LeftView () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UIView *bgView;

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray <NSArray *>*dataArray;
@property (nonatomic, strong) UIImageView *imageView;

@property (strong, nonatomic) UIView *headerView;

@property(strong,nonatomic)UITapGestureRecognizer *labTGR1;

@end

@implementation LeftView

- (instancetype)sharedInstance{
    return [[self class] sharedInstance];
}

+ (instancetype)sharedInstance{
    static dispatch_once_t once;
    
    static id __singleton__;
    
    dispatch_once( &once, ^{
        
        __singleton__ = [[self alloc] initWithFrame:CGRectMake(-[UIScreen mainScreen].bounds.size.width, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
        
    } );
    
    return __singleton__;
}


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.labTGR1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(fireNext:)];
        [self addGestureRecognizer:_labTGR1];
        
        self.bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width*3/4, [UIScreen mainScreen].bounds.size.height)];
        self.bgView.backgroundColor = kBackgroundColor;
        [self addSubview:_bgView];
        
        self.dataArray = @[@[[UIImage imageNamed:@"sidebar_business_1"], @"订单记录"],
                           @[[UIImage imageNamed:@"sidebar_purse_1"], @"我的钱包"],
                           @[[UIImage imageNamed:@"sidebar_decoration_1"], @"收件信箱"],
//                           sidebar_decoration_1
                           @[[UIImage imageNamed:@"sidebar_favorit_1"], @"邀请有奖"],
                           @[[UIImage imageNamed:@"sidebar_album_1"], @"我的司机"],
                           @[[UIImage imageNamed:@"sidebar_file_1"], @"客服中心"],
                           @[[UIImage imageNamed:@"sidebar_setting_1"], @"更多设置"]];
        
        
        self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.width, self.height) style:UITableViewStylePlain];
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.scrollEnabled = NO;
        [self.bgView addSubview:_tableView];
        
        _tableView.tableHeaderView = self.headerView;
        _tableView.tableFooterView = [[UIView alloc] init];
    }
    return self;
}

- (void)fireNext:(UIButton *)sender{
    
    [self hiddenMenuView];
    
}

#pragma mark -
#pragma mark - tableView procotol methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reUse];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reUse];
        cell.backgroundColor = [UIColor clearColor];
        cell.textLabel.textColor = [UIColor darkGrayColor];
        
        UIView *selectedBackgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.width, 44)];
        selectedBackgroundView.backgroundColor = [UIColor whiteColor];
        cell.selectedBackgroundView = selectedBackgroundView;
    }
    cell.imageView.image = self.dataArray[indexPath.row][0];
    cell.textLabel.text = self.dataArray[indexPath.row][1];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self hiddenMenuView];
    // 显示中间控制器
    [[PSDrawerManager instance] resetShowType:PSDrawerManagerShowCenter];
}

#pragma mark -
#pragma mark - headerView
- (UIView *)headerView {
    
    if (!_headerView) {
        
        _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.width, 200)];
        
        
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"headerImg"]];
        imageView.size = CGSizeMake(60, 60);
        imageView.left = self.width*3/8-30;
        imageView.top = 64;
//        imageView.clipsToBounds = YES;
//        imageView.layer.cornerRadius = imageView.width / 2;
//        imageView.layer.borderColor = [UIColor whiteColor].CGColor;
//        imageView.layer.borderWidth = 2.f;
        [_headerView addSubview:imageView];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, imageView.top + 70, self.width*3/4, 20)];
        label.textColor = [UIColor darkGrayColor];
        label.font = [UIFont boldSystemFontOfSize:20];
        label.textAlignment = NSTextAlignmentCenter;
        label.text = @"136****8181";
        [_headerView addSubview:label];
        
    }
    
    return _headerView;
}

-(void)hiddenMenuView{
    dispatch_async(dispatch_get_main_queue(), ^{
        
        [UIView animateWithDuration:0.4 animations:^{
            
            self.alpha = 1.0;
            
            self.transform = CGAffineTransformTranslate(CGAffineTransformIdentity,0, 0);
            
        }];
    });
    }
-(void)showMenuView{
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        [UIView animateWithDuration:0.4 animations:^{
            self.alpha = 1.0;
            
            self.transform = CGAffineTransformTranslate(CGAffineTransformIdentity,[UIScreen mainScreen].bounds.size.width, 0);
            
        }];
    });
    
    UISwipeGestureRecognizer *turnLeft = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(turnToLeft)];
    turnLeft.direction=UISwipeGestureRecognizerDirectionLeft;//控制方向向左
    [self addGestureRecognizer:turnLeft];
    
}

-(void)turnToLeft{
    //添加手指向左滑动屏幕时执行的操作
    [self hiddenMenuView];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
