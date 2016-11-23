//
//  ViewController.m
//  下拉菜单
//
//  Created by Leo的Mac on 16/11/23.
//  Copyright © 2016年 LYW. All rights reserved.
//

#import "ViewController.h"
#import "LYWPullDownMenu.h"
#import "LYWMenuButton.h"
#import "LYWFirstTableViewController.h"
#import "LYWSecondTableViewController.h"

#define LYWWeidth [UIScreen mainScreen].bounds.size.width
#define LYWHeight [UIScreen mainScreen].bounds.size.height

@interface ViewController ()<LYWPullDownMenuDataSource>

@property (nonatomic, strong) NSArray *titles;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    LYWPullDownMenu *menu = [[LYWPullDownMenu alloc] init];
    menu.frame = CGRectMake(0, 0, LYWWeidth, 44);
    [self.view addSubview:menu];
    
    menu.dataSource = self;
    _titles = @[@"善水融",@"南瓜马车"];
    
    [self setupAllChildViewController];
}

#pragma mark - 添加子控制器
- (void)setupAllChildViewController
{
    LYWFirstTableViewController *first = [[LYWFirstTableViewController alloc] init];
    LYWSecondTableViewController *second = [[LYWSecondTableViewController alloc] init];
    [self addChildViewController:first];
    [self addChildViewController:second];
}

/**
 *  下拉菜单有多少列
 *
 *  @param pullDownMenu 下拉菜单
 *
 *  @return 下拉菜单有多少列
 */
- (NSInteger)numberOfColsInMenu:(LYWPullDownMenu *)pullDownMenu
{
    return 2;
}

/**
 *  下拉菜单每列按钮外观
 *
 *  @param pullDownMenu 下拉菜单
 *  @param index        第几列
 *
 *  @return 下拉菜单每列按钮外观
 */
// 返回下拉菜单每列按钮
- (UIButton *)pullDownMenu:(LYWPullDownMenu *)pullDownMenu buttonForColAtIndex:(NSInteger)index
{
    LYWMenuButton *button = [LYWMenuButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:_titles[index] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithRed:25 /255.0 green:143/255.0 blue:238/255.0 alpha:1] forState:UIControlStateSelected];
    [button setImage:[UIImage imageNamed:@"标签-向下箭头"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"标签-向上箭头"] forState:UIControlStateSelected];
    
    return button;
}

/**
 *  下拉菜单每列对应的控制器
 *
 *  @param pullDownMenu 下拉菜单
 *  @param index        第几列
 *
 *  @return 下拉菜单每列对应的控制器
 */
- (UIViewController *)pullDownMenu:(LYWPullDownMenu *)pullDownMenu viewControllerForColAtIndex:(NSInteger)index
{
    return self.childViewControllers[index];
}

/**
 *  下拉菜单每列对应的高度
 *
 *  @param pullDownMenu 下拉菜单
 *  @param index        第几列
 *
 *  @return 下拉菜单每列对应的高度
 */
- (CGFloat)pullDownMenu:(LYWPullDownMenu *)pullDownMenu heightForColAtIndex:(NSInteger)index
{
    // 第1列 高度
    if (index == 0) {
        return 176;
    }
    
    // 第2列 高度
    return 396;
    

}

@end
