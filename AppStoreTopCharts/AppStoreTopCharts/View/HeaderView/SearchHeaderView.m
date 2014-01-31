//
//  SearchHeaderView.m
//  AppStoreTopCharts
//
//  Created by Chaithra TV on 24/01/14.
//  Copyright (c) 2014 Chaithra TV. All rights reserved.
//

#import "SearchHeaderView.h"

@implementation SearchHeaderView

#pragma mark - UISearchBar delegate Methods
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
     [searchBar resignFirstResponder];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *) searchBar
{
    [searchBar resignFirstResponder];
}

-(void)searchBar:(UISearchBar*)searchBar textDidChange:(NSString *)searchText
{
//    searching  for each character
   [self.delegate didSearchForApps:searchBar.text reference:searchBar];
}

@end
