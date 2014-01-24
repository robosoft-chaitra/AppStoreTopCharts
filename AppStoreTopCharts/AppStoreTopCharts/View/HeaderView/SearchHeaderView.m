//
//  SearchHeaderView.m
//  AppStoreTopCharts
//
//  Created by Chaithra TV on 24/01/14.
//  Copyright (c) 2014 Chaithra TV. All rights reserved.
//

#import "SearchHeaderView.h"

@implementation SearchHeaderView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
   
    [searchBar resignFirstResponder];
    [self.delegate didFinishedSearchigForApp:searchBar.text];

}

- (void)searchBarCancelButtonClicked:(UISearchBar *) searchBar
{
    [searchBar resignFirstResponder];
}

-(void)searchBar:(UISearchBar*)searchBar textDidChange:(NSString *)searchText
{
   [self.delegate searchAppByNameInGrid:searchBar.text];
}

@end
