//
//  UnderGroundAdapter.m
//  FWComplexTableView
//
//  Created by Chin on 15/4/2.
//  Copyright (c) 2015年 Chin. All rights reserved.
//

#import "UnderGroundAdapter.h"

@implementation UnderGroundAdapter
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [super tableView:tableView cellForRowAtIndexPath:indexPath];
    [[cell textLabel] setText:@"AAAA"];
    return cell;
}
@end
