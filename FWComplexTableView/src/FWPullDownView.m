//
//  FWPullDownView.m
//  FWComplexController
//
//  Created by Chin on 15/3/18.
//  Copyright (c) 2015年 Chin. All rights reserved.
//

#import "FWPullDownView.h"
#import "FWComplexViewHandler.h"

@interface FWPullDownView () {
  UILabel *_textLabel;
}
@end

@implementation FWPullDownView
- (instancetype)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];
  if (self) {
    [self setBackgroundColor:[UIColor yellowColor]];
    _textLabel =
        [[UILabel alloc] initWithFrame:CGRectMake(0, frame.size.height - 30,
                                                  frame.size.width, 30)];
    [self addSubview:_textLabel];
      
      _state = -1;
      [self setState:FWPullDownViewStateNormal];
  }
  return self;
}
- (void)setFrame:(CGRect)frame {
  [super setFrame:frame];
  [_textLabel
      setFrame:CGRectMake(0, frame.size.height - 30, frame.size.width, 30)];
  [_textLabel setTextAlignment:NSTextAlignmentCenter];
}
- (void)setState:(FWPullDownViewState)state {
  if (_state == state) {
    return;
  }
  _state = state;

  if (state == FWPullDownViewStateNormal) {
    [_textLabel setText:NSLocalizedString(@"FWPullDownViewStateNormal", nil)];
  } else if (state == FWPullDownViewStateDragged) {
    [_textLabel setText:NSLocalizedString(@"FWPullDownViewStateDragged", nil)];
  } else if (state == FWPullDownViewStateDragging) {
    [_textLabel setText:NSLocalizedString(@"FWPullDownViewStateDragging", nil)];
  }
  [_viewHandler pullDownChangeState:_state view:self];
}
- (void)setViewHandler:(FWComplexViewHandler *)viewHandler {
  _viewHandler = viewHandler;
  [_viewHandler setView:self];
}

@end
