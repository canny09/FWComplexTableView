//
//  FWComplexViewHandler.h
//  FWComplexController
//
//  Created by Chin on 15/3/19.
//  Copyright (c) 2015年 Chin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "FWComplexLoadMoreCell.h"
#import "FWPullDownView.h"

@interface FWComplexViewHandler : NSObject
@property (nonatomic, weak) UIView *view;

- (void)loadMoreChangeState:(FWComplexLoadMoreState)state
                       view:(FWComplexLoadMoreCell *)loadMoreCell;
- (void)pullDownChangeState:(FWPullDownViewState)state
                       view:(FWPullDownView *)pullDownView;
@end
