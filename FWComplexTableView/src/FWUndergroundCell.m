//
//  FWUndergroundCell.m
//  FWComplexController
//
//  Created by Chin on 15/3/18.
//  Copyright (c) 2015年 Chin. All rights reserved.
//

#import "FWUndergroundCell.h"
#import "FWPullDownView.h"
@interface FWUndergroundCell()
{
    FWPullDownView  *_pullDownView;
}
@property (nonatomic,assign)FWPullDownViewState state;
@end
@implementation FWUndergroundCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        _pullDownView = [[FWPullDownView alloc] initWithFrame:CGRectMake(0, -30, self.frame.size.width, 30)];
        [_pullDownView setTag:kPullDownTag];
        _pullOffset = 100;

    }
    return self;
}
- (void)setState:(FWPullDownViewState)state{
    if (_state == state) {
        return;
    }
    _state = state;
     if(state == FWPullDownViewStateDragged){
         [_scrollView setContentOffset:CGPointZero];
         if (_didPulled) {
             _didPulled();
         }
    }
    
    [_pullDownView setState:_state];
}
- (FWPullDownView *)pullDownView{
    return _pullDownView;
}
- (void)setViewHandler:(FWComplexViewHandler *)viewHandler{
    _viewHandler = viewHandler;
    [_viewHandler setView:self];
}

- (void)setScrollView:(UIScrollView *)scrollView{
    if (_scrollView == scrollView) {
        return;
    }
    [self clear];
    _scrollView = scrollView;
    [self.contentView addSubview:_scrollView];
    [_pullDownView setFrame:CGRectMake(0, -200, _scrollView.frame.size.width, 200)];
    [_scrollView addSubview:_pullDownView];
    [_scrollView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
}
- (void)clear{
    [_pullDownView removeFromSuperview];
    [_scrollView removeObserver:self forKeyPath:@"contentOffset"];
    [_scrollView removeFromSuperview];
}
- (void)awakeFromNib {
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    CGPoint point = [[change objectForKey:NSKeyValueChangeNewKey] CGPointValue];
    if (point.y < -_pullOffset) {
        if(_scrollView.isDragging){
            [self setState:FWPullDownViewStateDragging];
        }else{
            [self setState:FWPullDownViewStateDragged];
        }
    }else{
        [self setState:FWPullDownViewStateNormal];
    }
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}
- (void)dealloc
{
    [self clear];
}
@end
