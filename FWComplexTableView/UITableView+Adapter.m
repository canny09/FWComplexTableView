//
//  UITableView+Adapter.m
//  Youlun
//
//  Created by Chin on 14/10/24.
//  Copyright (c) 2014年 Chin. All rights reserved.
//

#import "UITableView+Adapter.h"

@implementation UITableView (Adapter)
- (void)setAdapter:(FWTableViewAdapter *)adapter
{
    [self setDataSource:adapter];
    [self setDelegate:adapter];
    [adapter setView:self];
    [self reloadData];
}
@end
