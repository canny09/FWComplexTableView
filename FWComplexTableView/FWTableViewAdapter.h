//
//  TLTableViewAdapter.h
//  Youlun
//
//  Created by Chin on 14/10/24.
//  Copyright (c) 2014年 Chin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface FWTableViewAdapter : NSObject<UITableViewDataSource,UITableViewDelegate>
- (instancetype)initWithDataSource:(NSArray *)dataSource;
- (void)reloadData:(NSArray *)data;
- (void)appendData:(NSArray *)data;
@property (nonatomic, weak)UITableView *view;
@property (nonatomic, readonly)NSMutableArray *dataSource;
@property (nonatomic,copy)void (^didCellSelected)(id cell,NSIndexPath *indexPath);
@property (nonatomic,copy)void (^afterReuseCell)(id cell,NSIndexPath *indexPath);
@property (nonatomic,assign)BOOL deselectedAnimated;

- (void)goTop:(BOOL)animated;
@end
