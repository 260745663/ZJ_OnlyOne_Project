//
//  ZKToolViewController.m
//  ZK_OnlyOne_Project
//
//  Created by 01 on 2018/12/13.
//  Copyright © 2018 极客_艾欧尼亚. All rights reserved.
//

#import "ZKToolViewController.h"
#import "WRCustomNavigationBar.h"


#define NAVBAR_COLORCHANGE_POINT (IMAGE_HEIGHT - NAV_HEIGHT*2)
#define IMAGE_HEIGHT 250
#define NAV_HEIGHT 64



@interface ZKToolViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) WRCustomNavigationBar *customNavBar;

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIImageView *topView;
@end

@implementation ZKToolViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    
    self.view.backgroundColor = [UIColor greenColor];
    [self.view addSubview:self.tableView];
    self.tableView.tableHeaderView = self.topView;
    [self.view insertSubview:self.customNavBar aboveSubview:self.tableView];
    [self setupNavBar];
    self.customNavBar.title = @"奥黛丽·赫本";
    [self.customNavBar wr_setBottomLineHidden:YES];
    if (@available(iOS 11.0, *)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    // 设置初始导航栏透明度
    [self.customNavBar wr_setBackgroundAlpha:0];
    [self.customNavBar wr_setLeftButtonWithImage:[UIImage imageNamed:@"back"]];
    
    
}

- (void)setupNavBar
{
    [self.view addSubview:self.customNavBar];
    
    // 设置自定义导航栏背景图片
    self.customNavBar.barBackgroundImage = [UIImage imageNamed:@"bannerA"];
//    [UIImage im];
//    self.customNavBar.backgroundColor = [UIColor colorWithHexString:@"#1296db"];
    // 设置自定义导航栏标题颜色
    self.customNavBar.titleLabelColor = [UIColor whiteColor];
    
    if (self.navigationController.childViewControllers.count != 1) {
        [self.customNavBar wr_setLeftButtonWithTitle:@"<<" titleColor:[UIColor whiteColor]];
    }
}

- (WRCustomNavigationBar *)customNavBar
{
    if (_customNavBar == nil) {
        _customNavBar = [WRCustomNavigationBar CustomNavigationBar];
    }
    return _customNavBar;
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offsetY = scrollView.contentOffset.y;
    if (offsetY > NAVBAR_COLORCHANGE_POINT)
    {
        CGFloat alpha = (offsetY - NAVBAR_COLORCHANGE_POINT) / NAV_HEIGHT;
        [self.customNavBar wr_setBackgroundAlpha:alpha];
    }
    else
    {
        [self.customNavBar wr_setBackgroundAlpha:0];
    }
}


#pragma mark - tableview delegate / dataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 40;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                   reuseIdentifier:nil];
    NSString *str = [NSString stringWithFormat:@"WRNavigationBar %zd",indexPath.row];
    cell.textLabel.text = str;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//    BaseViewController *vc = [BaseViewController new];
//    vc.view.backgroundColor = [UIColor redColor];
//    NSString *str = [NSString stringWithFormat:@"右划返回查看效果 %zd",indexPath.row];
//    vc.customNavBar.title = str;
//    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - getter / setter
- (UITableView *)tableView
{
    if (_tableView == nil) {
        CGRect frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
        _tableView = [[UITableView alloc] initWithFrame:frame
                                                  style:UITableViewStylePlain];
        _tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (UIImageView *)topView
{
    if (_topView == nil) {
        _topView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"zk_tool_headBg"]];
        _topView.frame = CGRectMake(0, 0, self.view.frame.size.width, IMAGE_HEIGHT);
        _topView.contentMode = UIViewContentModeScaleToFill;
    }
    return _topView;
}



@end
