//
//  ECAFeedTableViewController.m
//  TheHackeratiiReader
//
//  Created by Erick Camacho on 6/24/14.
//  Copyright (c) 2014 ecamacho. All rights reserved.
//

#import "ECAFeedTableViewController.h"
#import "ECAEntryViewController.h"

#import "ECAFeed.h"

@interface ECAFeedTableViewController ()

@property (nonatomic, strong) ECAFeed *feed;
@property (nonatomic, strong) NSArray *entries;


@end

@implementation ECAFeedTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
  self = [super initWithStyle:style];
  if (self) {
    self.feed = [[ECAFeed alloc] init];
    self.title = @"Feed";
    self.navigationItem.title = @"Feed Reader";
  }
  return self;
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  
  [self.tableView registerClass:[UITableViewCell class]
         forCellReuseIdentifier:@"EntryCell"];
  
  __weak ECAFeedTableViewController *safeSelf = self;
  [self.feed requestFeed:^(NSArray *feedEntries, NSError *error) {
    if (!error) {
      dispatch_async(dispatch_get_main_queue(), ^{
        safeSelf.entries = feedEntries;
        [safeSelf.tableView reloadData];
      });
    }
    
  }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
 return [self.entries count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"EntryCell" forIndexPath:indexPath];
  NSDictionary *entry = self.entries[indexPath.row];
  cell.textLabel.text = entry[@"im:name"][@"label"];
  return cell;
}

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  ECAEntryViewController *entryController = [[ECAEntryViewController alloc] init];
  entryController.entry = self.entries[indexPath.row];
  [self.navigationController pushViewController:entryController animated:YES];
}



@end
