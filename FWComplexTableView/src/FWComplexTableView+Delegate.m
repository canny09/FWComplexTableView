//
//  FWComplexTableView+Delegate.m
//  FWComplexController
//
//  Created by Chin on 15/3/17.
//  Copyright (c) 2015年 Chin. All rights reserved.
//

#import "FWComplexTableView+Delegate.h"
#define Excute_Filter(A)                         \
  if ([self.delegatet respondsToSelector:_cmd]) { \
    A;                                           \
  }
@implementation FWComplexTableView (Delegate)
- (void)tableView:(UITableView *)tableView
      willDisplayCell:(UITableViewCell *)cell
    forRowAtIndexPath:(NSIndexPath *)indexPath {
  Excute_Filter([self.delegatet tableView:tableView
                         willDisplayCell:cell
                       forRowAtIndexPath:indexPath]);
}
- (void)tableView:(UITableView *)tableView
    willDisplayHeaderView:(UIView *)view
               forSection:(NSInteger)section {
  Excute_Filter([self.delegatet tableView:tableView
                   willDisplayHeaderView:view
                              forSection:section]);
}
- (void)tableView:(UITableView *)tableView
    willDisplayFooterView:(UIView *)view
               forSection:(NSInteger)section {
  Excute_Filter([self.delegatet tableView:tableView
                   willDisplayFooterView:view
                              forSection:section])
}
- (void)tableView:(UITableView *)tableView
    didEndDisplayingCell:(UITableViewCell *)cell
       forRowAtIndexPath:(NSIndexPath *)indexPath {
  Excute_Filter([self.delegatet tableView:tableView
                    didEndDisplayingCell:cell
                       forRowAtIndexPath:indexPath]);
}
- (void)tableView:(UITableView *)tableView
    didEndDisplayingHeaderView:(UIView *)view
                    forSection:(NSInteger)section {
  Excute_Filter([self.delegatet tableView:tableView
              didEndDisplayingHeaderView:view
                              forSection:section]);
}
- (void)tableView:(UITableView *)tableView
    didEndDisplayingFooterView:(UIView *)view
                    forSection:(NSInteger)section {
  Excute_Filter([self.delegatet tableView:tableView
              didEndDisplayingFooterView:view
                              forSection:section]);
}
//
//// Variable height support
//
//
//// Use the estimatedHeight methods to quickly calcuate guessed values which
///will allow for fast load times of the table.
//// If these methods are implemented, the above -tableView:heightForXXX calls
///will be deferred until views are ready to be displayed, so more expensive
///logic can be placed there.

//- (CGFloat)tableView:(UITableView *)tableView
//    estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
//  Excute_Filter(return
//                [self.delegatet tableView:tableView
//                    estimatedHeightForRowAtIndexPath:indexPath];) return 44;
//}
//- (CGFloat)tableView:(UITableView *)tableView
//    estimatedHeightForHeaderInSection:(NSInteger)section {
//  Excute_Filter(return
//                [self.delegatet tableView:tableView
//                    estimatedHeightForHeaderInSection:section];) return 0;
//}
//- (CGFloat)tableView:(UITableView *)tableView
//    estimatedHeightForFooterInSection:(NSInteger)section {
//  Excute_Filter(return
//                [self.delegatet tableView:tableView
//                    estimatedHeightForFooterInSection:section];) return 0;
//}
//
//// Section header & footer information. Views are preferred over title should
///you decide to provide both
//

//
//// Accessories (disclosures).
//
- (void)tableView:(UITableView *)tableView
    accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath {
  Excute_Filter([self.delegatet tableView:tableView
                    accessoryButtonTappedForRowWithIndexPath:indexPath];)
}
//
//// Selection
//
//// -tableView:shouldHighlightRowAtIndexPath: is called when a touch comes down
///on a row.
//// Returning NO to that message halts the selection process and does not cause
///the currently selected row to lose its selected look while the touch is down.
- (BOOL)tableView:(UITableView *)tableView
    shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath {
  Excute_Filter(return
                [self.delegatet tableView:tableView
                    shouldHighlightRowAtIndexPath:indexPath];) return YES;
}
- (void)tableView:(UITableView *)tableView
    didHighlightRowAtIndexPath:(NSIndexPath *)indexPath {
  Excute_Filter(
      return
      [self.delegatet tableView:tableView didHighlightRowAtIndexPath:indexPath];)
}
- (void)tableView:(UITableView *)tableView
    didUnhighlightRowAtIndexPath:(NSIndexPath *)indexPath {
  Excute_Filter([self.delegatet tableView:tableView
                    didUnhighlightRowAtIndexPath:indexPath];)
}
//
//// Called before the user changes the selection. Return a new indexPath, or
///nil, to change the proposed selection.
- (NSIndexPath *)tableView:(UITableView *)tableView
    willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  Excute_Filter(return
                [self.delegatet tableView:tableView
                    willSelectRowAtIndexPath:indexPath];) return indexPath;
}
- (NSIndexPath *)tableView:(UITableView *)tableView
    willDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
  Excute_Filter(return
                [self.delegatet tableView:tableView
                    willDeselectRowAtIndexPath:indexPath];) return indexPath;
}
//// Called after the user changes the selection.
- (void)tableView:(UITableView *)tableView
    didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  Excute_Filter(
      [self.delegatet tableView:tableView didSelectRowAtIndexPath:indexPath];)
}
- (void)tableView:(UITableView *)tableView
    didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
  Excute_Filter(
      [self.delegatet tableView:tableView didDeselectRowAtIndexPath:indexPath];)
}
@end
