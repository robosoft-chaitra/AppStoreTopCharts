//
//  WishListViewController.m
//  AppStoreTopCharts
//
//  Created by Chaithra TV on 29/01/14.
//  Copyright (c) 2014 Chaithra TV. All rights reserved.
//

#import "TAWishListViewController.h"
#import "TAWishListCell.h"

@interface TAWishListViewController ()

@end

@implementation TAWishListViewController

#pragma mark - View methods
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    self.appDocumentDirectoryPath = [[ NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]stringByAppendingPathComponent:@"WishList.plist"];

}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    self.selectedApps      = [[NSMutableArray alloc]init];
    self.appDictionaryList = [[NSArray arrayWithContentsOfFile:self.appDocumentDirectoryPath] mutableCopy];
    
//    converting appdictionary to TopApp object & storing to List
    for(NSDictionary *appDictionary in self.appDictionaryList)
    {
        TopApp *wishListApp =[[TopApp alloc]initTopAppFromAppStoreDictionary:appDictionary];
        [self.selectedApps addObject:wishListApp];
    }
     [self.tableView reloadData];
}

#pragma mark - Tableview data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.selectedApps count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    TAWishListCell *cell = (TAWishListCell*)[tableView dequeueReusableCellWithIdentifier:TAWishListCellIndentifier forIndexPath:indexPath];
    
//    method to display the appInfo in a cell
    [cell displayAppInfoForWishListApp:[self.selectedApps objectAtIndex:indexPath.row]];
    
    return cell;
}

#pragma mark - Tableview delegate

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
//    method to delete app from Plist Permanently
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        TopApp *deletingApp =[self.selectedApps objectAtIndex:indexPath.row];
        
//      To check deleting app found in plist
       if([self.appDictionaryList containsObject:deletingApp.appInfoDictionary])
       {
           [self.appDictionaryList removeObject:deletingApp.appInfoDictionary];
           [self.selectedApps removeObject:deletingApp];
           [self.appDictionaryList writeToFile:self.appDocumentDirectoryPath atomically:YES];
       }
        
        [self.tableView reloadData];
    }
}

@end
