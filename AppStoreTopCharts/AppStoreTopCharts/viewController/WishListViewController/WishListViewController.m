//
//  WishListViewController.m
//  AppStoreTopCharts
//
//  Created by Chaithra TV on 29/01/14.
//  Copyright (c) 2014 Chaithra TV. All rights reserved.
//

#import "WishListViewController.h"
#import "WishListCell.h"
#import "TopApp.h"

@interface WishListViewController ()

@end

@implementation WishListViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    self.selectedApps     = [[NSMutableArray alloc]init];
    self.appDictionaryList = [[NSArray arrayWithContentsOfFile:KAppDirectoryPath] mutableCopy];
    
//    converting appdictionary to TopApp object & storing to List
    for(NSDictionary *appDictionary in self.appDictionaryList)
    {
        TopApp *wishListApp =[[TopApp alloc]initTopAppFromAppStoreDictionary:appDictionary];
        [self.selectedApps addObject:wishListApp];
    }
     [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
 
}

#pragma mark - Table view data source

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
    static NSString *CellIdentifier = KWishListCellIdentifier;
    WishListCell *cell = (WishListCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
//    method to display the appInfo in a cell
    [cell displayAppInfoForWishListApp:[self.selectedApps objectAtIndex:indexPath.row]];
    
    return cell;
}

#pragma mark - tableview delegate

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        TopApp *deletingApp =[self.selectedApps objectAtIndex:indexPath.row];
        
//      To check deleting app found in plist
       if([self.appDictionaryList containsObject:deletingApp.appDictionary])
       {
           [self.appDictionaryList removeObject:deletingApp.appDictionary];
           [self.selectedApps removeObject:deletingApp];
           [self.appDictionaryList writeToFile:KAppDirectoryPath atomically:YES];
       }
        
        [self.tableView reloadData];
    }
}

@end
