//
//  FWComplexLoadMoreView.m
//  FWComplexController
//
//  Created by Chin on 15/3/18.
//  Copyright (c) 2015年 Chin. All rights reserved.
//

#import "FWComplexLoadMoreCell.h"
#import "FWComplexViewHandler.h"

@interface FWComplexLoadMoreCell()

@end


@implementation FWComplexLoadMoreCell
@synthesize state = _state;
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.textLabel setText:@"loadmore"];
        [self.textLabel setTextColor:[UIColor blackColor]];
        [self.contentView setBackgroundColor:[UIColor yellowColor]];
    }
    return self;
}
- (void)setState:(FWComplexLoadMoreState)state{
    if (_state == state) {
        return;
    }
    if (state == FWComplexLoadMoreStateDragged) {
        [self.textLabel setText:@"FWComplexLoadMoreStateDragged"];
    }else if(state == FWComplexLoadMoreStateDragging){
        [self.textLabel setText:@"FWComplexLoadMoreStateDragging"];
    }else{
        [self.textLabel setText:@"FWComplexLoadMoreStateNormal"];
    }
    _state = state;
    [_viewHandler loadMoreChangeState:_state view:self];
}
- (void)setViewHandler:(FWComplexViewHandler *)viewHandler{
    _viewHandler = viewHandler;
    [_viewHandler setView:self];
}
+ (float)height{
    return 40;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
