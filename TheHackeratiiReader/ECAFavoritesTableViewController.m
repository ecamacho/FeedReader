//
//  ECAFavoritesTableViewController.m
//  TheHackeratiiReader
//
//  Created by Erick Camacho on 6/28/14.
//  Copyright (c) 2014 ecamacho. All rights reserved.
//

#import "ECAFavoritesTableViewController.h"
#import "ECAFavorite.h"
#import "ECAFavoriteViewController.h"

@interface ECAFavoritesTableViewController ()
@property (nonatomic, strong) NSArray* favorites;
@end

@implementation ECAFavoritesTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
  self = [super initWithStyle:style];
  if (self) {
    self.navigationItem.title = @"Feed Reader";
    self.title = @"Favorites";
  }
  return self;
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  [self.tableView registerClass:[UITableViewCell class]
         forCellReuseIdentifier:@"FavoriteCell"];

}

- (void)viewDidAppear:(BOOL)animated
{
  [super viewDidAppear:animated];
  self.favorites = [ECAFavorite findAll];
  [self.tableView reloadData];
}
#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return [self.favorites count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FavoriteCell"
                                                          forIndexPath:indexPath];    
  ECAFavorite *favorite = self.favorites[indexPath.row];
  cell.textLabel.text = favorite.name;
  return cell;
}

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  ECAFavoriteViewController *favoriteController = [[ECAFavoriteViewController alloc] init];
  ECAFavorite *favorite = self.favorites[indexPath.row];
  favoriteController.favoriteURL = [NSURL URLWithString:favorite.url];
  [self.navigationController pushViewController:favoriteController animated:YES];
}


@end
