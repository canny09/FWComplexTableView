//
//  FWComplexTableView.h
//  FWComplexController
//
//  Created by Chin on 15/3/17.
//  Copyright (c) 2015年 Chin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FWComplexLoadMoreCell.h"
#import "FWUndergroundCell.h"

@interface FWComplexTableView : UITableView {
}

@property (nonatomic, readonly) id<UITableViewDelegate> delegatet;
@property (nonatomic, readonly) id<UITableViewDataSource> dataSourcet;

@property (nonatomic, assign) float pullOffset;

- (UITableView *)tableViewStyle;
- (UICollectionView *)collectionViewStyle:(UICollectionViewLayout *)layout;
- (void)gotop;
- (FWUndergroundCell *)undergroundCell;
@end
