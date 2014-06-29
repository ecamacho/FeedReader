//
//  ECAAddToFavoritesViewController.h
//  TheHackeratiiReader
//
//  Created by Erick Camacho on 6/28/14.
//  Copyright (c) 2014 ecamacho. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ECAAddToFavoritesDelegate <NSObject>

- (void)didAddedItemToFavorites;

- (void)didCancel;

@end

@interface ECAAddToFavoritesViewController : UIViewController <UIAlertViewDelegate>

@property (nonatomic, strong) NSArray *favoriteItemData;
@property (nonatomic, weak) id<ECAAddToFavoritesDelegate> delegate;

@end
