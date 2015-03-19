//
//  ViewController.m
//  FWComplexTableView
//
//  Created by Chin on 15/3/19.
//  Copyright (c) 2015年 Chin. All rights reserved.
//

#import "ViewController.h"
#import "FWComplexTableView.h"
#import "FWComplexLoadMoreCell.h"

@interface FWComplexViewAHandler : FWComplexViewHandler

@end
@implementation FWComplexViewAHandler
- (void)loadMoreChangeState:(FWComplexLoadMoreState)state view:(FWComplexLoadMoreCell *)loadMoreCell{
    
}

- (void)pullDownChangeState:(FWPullDownViewState)state view:(FWPullDownView *)pullDownView{
    
}

- (void)afterView:(UIView *)view{
    if ([view isKindOfClass:[FWUndergroundCell class]]) {
        FWUndergroundCell *cell = (FWUndergroundCell *)view;
        [[cell scrollView] setFrame:CGRectMake(0, 40, [cell scrollView].frame.size.width, [cell scrollView].frame.size.height - 40)];
    }
}
@end
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGRect frame= self.view.bounds;
    FWComplexTableView *tableView = [[FWComplexTableView alloc] initWithFrame:frame style:UITableViewStylePlain];
    [tableView setPullOffset:100];
    [tableView tableViewStyle];
    [tableView setDataSource:self];
    [tableView setDelegate:self];
    [self.view addSubview:tableView];
    
    
    FWComplexViewAHandler *handler = [FWComplexViewAHandler new];
    [tableView.undergroundCell setViewHandler:handler];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 3;
    }
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    [cell setBackgroundColor:[UIColor blackColor]];
    if (indexPath.section == 0) {
        [cell setBackgroundColor:[UIColor blueColor]];
    }
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 60;
    }
    return 0;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
