//
//  FWComplexViewHandler.m
//  FWComplexController
//
//  Created by Chin on 15/3/19.
//  Copyright (c) 2015年 Chin. All rights reserved.
//

#import "FWComplexViewHandler.h"

@implementation FWComplexViewHandler
- (void)setView:(UIView *)view{
    _view = view;
    [self afterView:_view];
}
- (void)loadMoreChangeState:(FWComplexLoadMoreState)state view:(FWComplexLoadMoreCell *)loadMoreCell{
    
}

- (void)pullDownChangeState:(FWPullDownViewState)state view:(FWPullDownView *)pullDownView{
    
}

- (void)afterView:(UIView *)view{
    
}
@end
