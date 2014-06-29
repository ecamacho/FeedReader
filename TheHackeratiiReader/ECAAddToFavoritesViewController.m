//
//  ECAAddToFavoritesViewController.m
//  TheHackeratiiReader
//
//  Created by Erick Camacho on 6/28/14.
//  Copyright (c) 2014 ecamacho. All rights reserved.
//

#import "ECAAddToFavoritesViewController.h"
#import "ECAFavorite.h"
@interface ECAAddToFavoritesViewController ()
@property (nonatomic, strong) UIAlertView *alertView;

@end

@implementation ECAAddToFavoritesViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
      
  }
  return self;
}

- (void)viewDidLoad
{
  [super viewDidLoad];
}

- (IBAction)addToFavorite:(id)sender
{
  self.alertView = [[UIAlertView alloc] initWithTitle:@""
                                              message:@"The item was added to your favorites"
                                             delegate:self
                                    cancelButtonTitle:@"Ok"
                                    otherButtonTitles:nil];
  [self.alertView show];
}

- (IBAction)cancel:(id)sender
{
  if ([self.delegate respondsToSelector:@selector(didCancel)]) {
    [self.delegate performSelector:@selector(didCancel) withObject:nil];
  }
}

- (void)saveAsFavorite
{
  ECAFavorite *favorite = [ECAFavorite findByName:_favoriteItemData[0]];
  if (!favorite) {
    favorite = [ECAFavorite create];
    favorite.name = _favoriteItemData[0];
  }
  favorite.url = [_favoriteItemData[1] absoluteString];
  [favorite save];
}
#pragma mark - alert delegate methods
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
  [self saveAsFavorite];
  if (alertView == self.alertView) {
    if ([self.delegate respondsToSelector:@selector(didAddedItemToFavorites)]) {
      [self.delegate performSelector:@selector(didAddedItemToFavorites) withObject:nil];
    }
  }
}



@end
