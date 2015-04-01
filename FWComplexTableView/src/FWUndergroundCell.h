//
//  FWUndergroundCell.h
//  FWComplexController
//
//  Created by Chin on 15/3/18.
//  Copyright (c) 2015年 Chin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FWComplexViewHandler.h"
static NSInteger const kPullDownTag = 1003;

@class FWPullDownView;
@interface FWUndergroundCell : UITableViewCell {
}
@property (nonatomic, assign) float pullOffset;
@property (nonatomic, weak) UIScrollView *scrollView;

@property (nonatomic, copy) void (^didPulled)();

@property (nonatomic, strong) FWComplexViewHandler *viewHandler;

- (FWPullDownView *)pullDownView;
@end
