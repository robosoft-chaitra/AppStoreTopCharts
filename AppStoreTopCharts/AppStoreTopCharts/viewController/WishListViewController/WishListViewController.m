//
//  WishListViewController.m
//  AppStoreTopCharts
//
//  Created by Chaithra TV on 29/01/14.
//  Copyright (c) 2014 Chaithra TV. All rights reserved.
//

#import "WishListViewController.h"
#import "WishListCell.h"

@interface WishListViewController ()

@end

@implementation WishListViewController

#pragma mark - View methods
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    self.selectedApps      = [[NSMutableArray alloc]init];
    self.appDictionaryList = [[NSArray arrayWithContentsOfFile:KAppDirectoryPath] mutableCopy];
    
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
    
    WishListCell *cell = (WishListCell*)[tableView dequeueReusableCellWithIdentifier:KWishListCellIdentifier forIndexPath:indexPath];
    
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
           [self.appDictionaryList writeToFile:KAppDirectoryPath atomically:YES];
       }
        
        [self.tableView reloadData];
    }
}

@end
