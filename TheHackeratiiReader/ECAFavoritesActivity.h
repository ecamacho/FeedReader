//
//  ECAFavoritesActivity.h
//  TheHackeratiiReader
//
//  Created by Erick Camacho on 6/28/14.
//  Copyright (c) 2014 ecamacho. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ECAAddToFavoritesViewController.h"

@interface ECAFavoritesActivity : UIActivity <ECAAddToFavoritesDelegate>

- (NSString *)activityType;
- (NSString *)activityTitle;
- (UIImage *)activityImage;
- (BOOL)canPerformWithActivityItems:(NSArray *)activityItems;
- (void)prepareWithActivityItems:(NSArray *)activityItems;
- (UIViewController *)activityViewController;


@end
