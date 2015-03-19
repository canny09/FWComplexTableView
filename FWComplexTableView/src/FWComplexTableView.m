//
//  FWComplexTableView.m
//  FWComplexController
//
//  Created by Chin on 15/3/17.
//  Copyright (c) 2015年 Chin. All rights reserved.
//

#import "FWComplexTableView.h"
static NSString* const kUndergroundCellIdentifier =
    @"kUndergroundCellIdentifier";
static NSString* const kLoadMoreCellIdentifier =
@"kLoadMoreCellIdentifier";
@interface FWComplexTableView () <UITableViewDelegate, UITableViewDataSource>
{
    FWUndergroundCell *_undergroundCell;
    FWComplexLoadMoreCell *_loadMoreCell;
}
@property (nonatomic, assign) id<UITableViewDelegate> delegatet;
@property (nonatomic, assign) id<UITableViewDataSource> dataSourcet;

@property (nonatomic, assign) NSInteger numberOfSecions;

@property (nonatomic, assign) float undergroundHeight;

@property (nonatomic, assign) BOOL lastRowCalulated;

@property (nonatomic, assign) CGSize contentSizet;

@property (nonatomic, strong)UIScrollView *undergroundScrollView;

@end

@implementation FWComplexTableView
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
  self = [super initWithFrame:frame style:style];
  if (self) {
    [self registerClass:[FWUndergroundCell class]
        forCellReuseIdentifier:kUndergroundCellIdentifier];
    [super setDelegate:self];
    [super setDataSource:self];
      _loadMoreCell = [[FWComplexLoadMoreCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kLoadMoreCellIdentifier];

      __weak FWComplexTableView *me = self;
    _undergroundCell = [[FWUndergroundCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kUndergroundCellIdentifier];
    _undergroundHeight = self.frame.size.height;
      [_undergroundCell setDidPulled:^{
          [me didPullUp];
      }];
    _pullOffset = 50;
  }
  return self;
}
- (void)setDelegate:(id<UITableViewDelegate>)delegate {
  self.delegatet = delegate;
}
- (void)setDataSource:(id<UITableViewDataSource>)dataSource {
  self.dataSourcet = dataSource;
}
- (void)reloadData {
  [super reloadData];
}
- (void)gotop{
    [self setContentOffset:CGPointMake(0, 0) animated:YES];
}
- (FWUndergroundCell *)undergroundCell{
    return _undergroundCell;
}
- (void)setContentSize:(CGSize)contentSize {
  if (_lastRowCalulated) {
    contentSize.height -= (_undergroundHeight + [[_loadMoreCell class] height]);
    self.contentSizet = contentSize;
  }
  [super setContentSize:contentSize];
}
- (UITableView *)tableViewStyle{
    self.undergroundScrollView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, _undergroundHeight) style:UITableViewStylePlain];
    [_undergroundCell setScrollView:_undergroundScrollView];
    return (UITableView *)_undergroundScrollView;
}
- (UICollectionView *)collectionViewStyle:(UICollectionViewLayout *)layout{
    self.undergroundScrollView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, _undergroundHeight) collectionViewLayout:layout];
    [_undergroundCell setScrollView:_undergroundScrollView];
    return (UICollectionView *)_undergroundScrollView;
}

- (void)didPullUp{
    [self setContentOffset:CGPointZero animated:YES];
    [self setScrollEnabled:YES];
}
- (BOOL)isLoadMoreViewCell:(NSIndexPath *)indexPath{
    if (indexPath.section == _numberOfSecions - 2) {
        if (indexPath.row == [self tableView:self numberOfRowsInSection:indexPath.section] - 1) {
            return YES;
        }
    }
    return NO;
}
- (BOOL)isLoadMoreViewSection:(NSInteger)section{
    if (section == _numberOfSecions - 2) {
        return YES;
    }
    return NO;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView*)tableView {
    _numberOfSecions = 1;
    if ([self.dataSourcet respondsToSelector:_cmd]) {
        _numberOfSecions +=
        [self.dataSourcet numberOfSectionsInTableView:tableView];
    } else {
        _numberOfSecions += 1;
    }
    return _numberOfSecions;
}
- (NSInteger)tableView:(UITableView*)tableView
    numberOfRowsInSection:(NSInteger)section {
  if (section == _numberOfSecions - 1) {
    return 1;
  }
  if ([self.dataSourcet respondsToSelector:_cmd]) {
    NSInteger rowForSection =
        [self.dataSourcet tableView:tableView numberOfRowsInSection:section];
      if ([self isLoadMoreViewSection:section]) {
          rowForSection += 1;
      }
    return rowForSection;
  }
  return 0;
}

- (UITableViewCell*)tableView:(UITableView*)tableView
        cellForRowAtIndexPath:(NSIndexPath*)indexPath {
  if (indexPath.section == _numberOfSecions - 1) {
      return _undergroundCell;
  }
  if ([self.dataSourcet respondsToSelector:_cmd]) {
      if ([self isLoadMoreViewCell:indexPath]) {
          return _loadMoreCell;
      }
    return
        [self.dataSourcet tableView:tableView cellForRowAtIndexPath:indexPath];
  }
  return nil;
}

- (CGFloat)tableView:(UITableView*)tableView
    heightForRowAtIndexPath:(NSIndexPath*)indexPath {
  if (indexPath.section == _numberOfSecions - 1) {
    _lastRowCalulated = YES;
    return _undergroundHeight;
  }
    if ([self isLoadMoreViewCell:indexPath]) {
        return [[_loadMoreCell class] height];
    }
  if ([self.delegatet respondsToSelector:_cmd]) {
    return
        [self.delegatet tableView:tableView heightForRowAtIndexPath:indexPath];
  }
  return self.rowHeight;
}
- (CGFloat)tableView:(UITableView*)tableView
    heightForFooterInSection:(NSInteger)section {
  if (section == _numberOfSecions - 1) {
    return 0;
  }
  if ([self.delegatet respondsToSelector:_cmd]) {
    return
        [self.delegatet tableView:tableView heightForFooterInSection:section];
  }
  return 0;
}
- (CGFloat)tableView:(UITableView*)tableView
    heightForHeaderInSection:(NSInteger)section {
  if (section == _numberOfSecions - 1) {
    return 0;
  }
  if ([self.delegatet respondsToSelector:_cmd]) {
    return
        [self.delegatet tableView:tableView heightForHeaderInSection:section];
  }
  return 0;
}

- (UIView*)tableView:(UITableView*)tableView
    viewForHeaderInSection:(NSInteger)section {
  if (section == _numberOfSecions - 1) {
      return nil;
  }
  if ([self.delegatet respondsToSelector:_cmd]) {
    return [self.delegatet tableView:tableView viewForHeaderInSection:section];
  }
  return nil;
}

- (UIView*)tableView:(UITableView*)tableView
    viewForFooterInSection:(NSInteger)section {
  if (section == _numberOfSecions - 1) {
    return nil;
  }
  if ([self.delegatet respondsToSelector:_cmd]) {
    return [self.delegatet tableView:tableView viewForFooterInSection:section];
  }
  return nil;
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if ((scrollView.contentOffset.y >
        _contentSizet.height - self.frame.size.height + _pullOffset) && scrollView.isDragging) {
        [_loadMoreCell setState:FWComplexLoadMoreStateDragging];
    }else{
        [_loadMoreCell setState:FWComplexLoadMoreStateNormal];
    }
    
    if ([self.delegatet respondsToSelector:_cmd]) {
        [self.delegatet scrollViewDidScroll:scrollView];
    }
}
- (void)scrollViewDidEndDragging:(UIScrollView*)scrollView
                  willDecelerate:(BOOL)decelerate {
  if (CGSizeEqualToSize(CGSizeZero, _contentSizet)) {
    return;
  }
  if (scrollView.contentOffset.y >
      _contentSizet.height - self.frame.size.height + _pullOffset) {
    [self setScrollEnabled:NO];
      [_loadMoreCell setState:FWComplexLoadMoreStateDragged];
    dispatch_async(dispatch_get_main_queue(), ^{
        [scrollView
         setContentOffset:CGPointMake(0, _contentSizet.height + [[_loadMoreCell class] height])
         animated:YES];
    });
  }
    if ([self.delegatet respondsToSelector:_cmd]) {
        [self.delegatet scrollViewDidEndDragging:scrollView willDecelerate:decelerate];
    }
}
@end
