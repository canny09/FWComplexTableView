//
//  FWComplexTableView+DataSource.m
//  FWComplexController
//
//  Created by Chin on 15/3/18.
//  Copyright (c) 2015年 Chin. All rights reserved.
//

#import "FWComplexTableView+DataSource.h"
#define Excute_Filter(A)                                                       \
  if ([self.dataSourcet respondsToSelector:_cmd]) {                            \
    A;                                                                         \
  }
@implementation FWComplexTableView (DataSource)

//
- (NSString *)tableView:(UITableView *)tableView
    titleForHeaderInSection:(NSInteger)section {
  Excute_Filter(return [self.dataSourcet tableView:tableView
                           titleForHeaderInSection:section];) return nil;
}
- (NSString *)tableView:(UITableView *)tableView
    titleForFooterInSection:(NSInteger)section {
  Excute_Filter(return [self.dataSourcet tableView:tableView
                           titleForFooterInSection:section];) return nil;
}
//
//// Editing
//
//// Individual rows can opt out of having the -editing property set for them.
/// If not implemented, all rows are assumed to be editable.
- (BOOL)tableView:(UITableView *)tableView
    canEditRowAtIndexPath:(NSIndexPath *)indexPath {
  Excute_Filter(return [self.dataSourcet tableView:tableView
                             canEditRowAtIndexPath:indexPath];) return NO;
}
//
//// Moving/reordering
//
//// Allows the reorder accessory view to optionally be shown for a particular
/// row. By default, the reorder control will be shown only if the datasource
/// implements -tableView:moveRowAtIndexPath:toIndexPath:
- (BOOL)tableView:(UITableView *)tableView
    canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
  Excute_Filter(return [self.dataSourcet tableView:tableView
                             canMoveRowAtIndexPath:indexPath];) return NO;
}
//
//// Index
//
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
  Excute_Filter(
      return
      [self.dataSourcet sectionIndexTitlesForTableView:tableView]) return nil;
}
- (NSInteger)tableView:(UITableView *)tableView
    sectionForSectionIndexTitle:(NSString *)title
                        atIndex:(NSInteger)index {
  Excute_Filter(return [self.dataSourcet tableView:tableView
                           sectionForSectionIndexTitle:title
                                               atIndex:index];) return index;
}
//
//// Data manipulation - insert and delete support
//
//// After a row has the minus or plus button invoked (based on the
/// UITableViewCellEditingStyle for the cell), the dataSource must commit the
/// change
//// Not called for edit actions using UITableViewRowAction - the action's
/// handler will be invoked instead
- (void)tableView:(UITableView *)tableView
    commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
     forRowAtIndexPath:(NSIndexPath *)indexPath {
  Excute_Filter([self.dataSourcet tableView:tableView
                         commitEditingStyle:editingStyle
                          forRowAtIndexPath:indexPath];)
}
//
//// Data manipulation - reorder / moving support
//
- (void)tableView:(UITableView *)tableView
    moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath
           toIndexPath:(NSIndexPath *)destinationIndexPath {
  Excute_Filter([self.dataSourcet tableView:tableView
                         moveRowAtIndexPath:sourceIndexPath
                                toIndexPath:destinationIndexPath])
}
@end
