//
//  FWPullDownView.h
//  FWComplexController
//
//  Created by Chin on 15/3/18.
//  Copyright (c) 2015年 Chin. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FWComplexViewHandler;
typedef NS_ENUM(NSInteger, FWPullDownViewState) {
  FWPullDownViewStateNormal,
  FWPullDownViewStateDragging,
  FWPullDownViewStateDragged
};

@interface FWPullDownView : UIView
@property (nonatomic, assign) FWPullDownViewState state;

@property (nonatomic, strong) FWComplexViewHandler *viewHandler;
@end
