//
//  FWComplexTableView+ScrollDelegate.m
//  FWComplexController
//
//  Created by Chin on 15/3/18.
//  Copyright (c) 2015年 Chin. All rights reserved.
//

#import "FWComplexTableView+ScrollDelegate.h"
#define Excute_Filter(A)                                                       \
  if ([self.delegatet respondsToSelector:_cmd]) {                              \
    A;                                                                         \
  }
@implementation FWComplexTableView (ScrollDelegate)
- (void)scrollViewDidZoom:(UIScrollView *)scrollView {
  Excute_Filter([self.delegatet scrollViewDidZoom:scrollView];)
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
  Excute_Filter([self.delegatet scrollViewWillBeginDragging:scrollView];)
}
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView
                     withVelocity:(CGPoint)velocity
              targetContentOffset:(inout CGPoint *)targetContentOffset {
  Excute_Filter([self.delegatet scrollViewWillEndDragging:scrollView
                                             withVelocity:velocity
                                      targetContentOffset:targetContentOffset];)
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView {
  Excute_Filter([self.delegatet scrollViewWillBeginDecelerating:scrollView];)
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
  Excute_Filter([self.delegatet scrollViewDidEndDecelerating:scrollView];)
}
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
  Excute_Filter([self.delegatet scrollViewDidEndScrollingAnimation:scrollView];)
}
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
  Excute_Filter(
      return
      [self.delegatet viewForZoomingInScrollView:scrollView];) return nil;
}
- (void)scrollViewWillBeginZooming:(UIScrollView *)scrollView
                          withView:(UIView *)view {
  Excute_Filter(
      [self.delegatet scrollViewWillBeginZooming:scrollView withView:view];)
}
- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView
                       withView:(UIView *)view
                        atScale:(CGFloat)scale {
  Excute_Filter([self.delegatet scrollViewDidEndZooming:scrollView
                                               withView:view
                                                atScale:scale];)
}

- (BOOL)scrollViewShouldScrollToTop:(UIScrollView *)scrollView {
  Excute_Filter(return [self.delegatet scrollViewShouldScrollToTop:scrollView]);
  return YES;
}
- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView {
  Excute_Filter(return [self.delegatet scrollViewDidScrollToTop:scrollView];)
}
@end
