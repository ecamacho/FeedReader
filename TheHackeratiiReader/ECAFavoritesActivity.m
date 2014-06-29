//
//  ECAFavoritesActivity.m
//  TheHackeratiiReader
//
//  Created by Erick Camacho on 6/28/14.
//  Copyright (c) 2014 ecamacho. All rights reserved.
//

#import "ECAFavoritesActivity.h"
#import "ECAAddToFavoritesViewController.h"

@interface ECAFavoritesActivity()
@property (nonatomic, strong) NSArray *activityItems;
@property (nonatomic, strong) ECAAddToFavoritesViewController *addToFavoritesViewController;
@end
@implementation ECAFavoritesActivity

- (NSString *)activityType
{
  return @"com.hackeratii.favorites";
}

- (NSString *)activityTitle
{
  return @"Add to favorites";
}

- (UIImage *)activityImage
{
  return [UIImage imageNamed:@"star"];
}

- (BOOL)canPerformWithActivityItems:(NSArray *)activityItems;
{
  return YES;
}

- (void)prepareWithActivityItems:(NSArray *)activityItems
{
  self.activityItems = activityItems;
}

- (UIViewController *)activityViewController
{
  NSLog(@"activity items %@", _activityItems);
  self.addToFavoritesViewController = [[ECAAddToFavoritesViewController alloc] init];
  self.addToFavoritesViewController.delegate = self;
  self.addToFavoritesViewController.favoriteItemData = _activityItems;
  return self.addToFavoritesViewController;
}


#pragma mark add to favorites delegate methods
- (void)didAddedItemToFavorites
{
  [self activityDidFinish:YES];
}

- (void)didCancel
{
  [self activityDidFinish:YES];
}


@end
