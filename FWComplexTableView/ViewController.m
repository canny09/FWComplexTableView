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
#import "UITableView+Adapter.h"
#import "UnderGroundAdapter.h"

@interface FWComplexViewAHandler : FWComplexViewHandler
{
}
@end
@implementation FWComplexViewAHandler
- (void)loadMoreChangeState:(FWComplexLoadMoreState)state view:(FWComplexLoadMoreCell *)loadMoreCell{
    
}

- (void)pullDownChangeState:(FWPullDownViewState)state view:(FWPullDownView *)pullDownView{
    
}

- (void)afterView:(UIView *)view{
    if ([view isKindOfClass:[FWUndergroundCell class]]) {
        FWUndergroundCell *cell = (FWUndergroundCell *)view;
        [cell setBackgroundColor:[UIColor purpleColor]];
        [[cell scrollView] setFrame:CGRectMake(0, 40, [cell scrollView].frame.size.width, [cell scrollView].frame.size.height - 40)];
        [[cell scrollView] setBackgroundColor:[UIColor grayColor]];
        
        
        UIView  *lineView = [[UIView alloc] initWithFrame:CGRectMake([cell scrollView].frame.size.width - 40, 60, 20, [cell scrollView].frame.size.height - 40)];
        [lineView setBackgroundColor:[UIColor redColor]];
        [cell addSubview:lineView];
    }
}
@end
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UnderGroundAdapter *_undergroundAdapter;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGRect frame= self.view.bounds;
    _undergroundAdapter = [UnderGroundAdapter new];
    FWComplexTableView *tableView = [[FWComplexTableView alloc] initWithFrame:frame style:UITableViewStylePlain];
    [tableView setPullOffset:100];
    [[tableView tableViewStyle] setAdapter:_undergroundAdapter];
    [tableView setDataSource:self];
    [tableView setDelegate:self];
    [self.view addSubview:tableView];
    
    
    FWComplexViewAHandler *handler = [FWComplexViewAHandler new];
    [tableView.undergroundCell setViewHandler:handler];
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 7;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    [cell setBackgroundColor:[UIColor blackColor]];
    UIImageView  *imageView = (UIImageView *)[cell viewWithTag:1001];
    if (imageView == nil) {
        imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200)];
        [imageView setTag:1001];
        [imageView setClipsToBounds:YES];
        [imageView setContentMode:UIViewContentModeScaleAspectFill];
        [cell addSubview:imageView];
    }
    if (indexPath.section == 0) {
        [cell setBackgroundColor:[UIColor blueColor]];
    }
    NSString *imageName = [NSString stringWithFormat:@"%@.jpg",@(indexPath.row + 1)];
    [imageView setImage:[UIImage imageNamed:imageName]];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 200;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 125;
    }
    return 0;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 175)];
    [imageView setBackgroundColor:[UIColor redColor]];
    return imageView;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
