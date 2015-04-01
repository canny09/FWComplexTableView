//
//  FWComplexLoadMoreView.h
//  FWComplexController
//
//  Created by Chin on 15/3/18.
//  Copyright (c) 2015年 Chin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FWComplexViewHandler;
typedef NS_ENUM(NSInteger, FWComplexLoadMoreState) {
  FWComplexLoadMoreStateNormal,
  FWComplexLoadMoreStateDragging,
  FWComplexLoadMoreStateDragged
};

@interface FWComplexLoadMoreCell : UITableViewCell
@property (nonatomic, assign) FWComplexLoadMoreState state;
@property (nonatomic, strong) FWComplexViewHandler *viewHandler;
+ (float)height;
@end
