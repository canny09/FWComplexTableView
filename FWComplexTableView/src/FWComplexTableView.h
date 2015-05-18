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

typedef NS_ENUM(NSInteger, FWComplexTableViewState) {
    FWComplexTableViewStateTopShow,
    FWComplexTableViewStateBottomShow,
};


@interface FWComplexTableView : UITableView {
}

@property (nonatomic, readonly) id<UITableViewDelegate> delegatet;
@property (nonatomic, readonly) id<UITableViewDataSource> dataSourcet;

@property (nonatomic,copy)void (^didStateChanged)(FWComplexTableView *,FWComplexTableViewState);
@property (nonatomic, assign)float pullOffset;
@property (nonatomic, assign)float startScrollingOffset;
@property (nonatomic, assign)float endScrollingOffset;
@property (nonatomic, assign,readonly)FWComplexTableViewState state;


- (void)disablePullUp;
- (UITableView *)tableViewStyle;
- (UICollectionView *)collectionViewStyle:(UICollectionViewLayout *)layout;
- (void)gotop;
- (FWUndergroundCell *)undergroundCell;
- (FWComplexLoadMoreCell *)loadMoreCell;
@end
