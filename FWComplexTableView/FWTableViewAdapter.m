//
//  TLTableViewAdapter.m
//  Youlun
//
//  Created by Chin on 14/10/24.
//  Copyright (c) 2014年 Chin. All rights reserved.
//

#import "FWTableViewAdapter.h"
@interface FWTableViewAdapter()
@property (nonatomic,strong) NSMutableArray *dataSource;
@end

@implementation FWTableViewAdapter
+ (instancetype)instance{
    return [[[self class] alloc] initWithDataSource:@[]];
}
- (instancetype)initWithDataSource:(NSArray *)dataSource
{
    self = [super init];
    if (self) {
        self.dataSource = [NSMutableArray arrayWithArray:dataSource];
        self.deselectedAnimated = NO;
    }
    return self;
}
- (void)goTop:(BOOL)animated{
    [self.view setContentOffset:CGPointZero animated:animated];
}
- (void)reloadData:(NSArray *)data
{
    self.dataSource = [data mutableCopy];
    [self.view reloadData];
}
- (void)appendData:(NSArray *)data
{
    [self.dataSource addObjectsFromArray:data];
    [self.view reloadData];
}

- (void)setView:(UITableView *)view
{
    _view = view;
    [self afterSetView];
}

- (void)afterSetView
{
    
}
- (void)cellSelected:(NSIndexPath *)indexPath
{
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:_deselectedAnimated];
    [self cellSelected:indexPath];
    if (self.didCellSelected) {
        self.didCellSelected([tableView cellForRowAtIndexPath:indexPath],indexPath);
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_dataSource count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    return cell;
}

@end
