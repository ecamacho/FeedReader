//
//  ECAAppDelegate.h
//  TheHackeratiiReader
//
//  Created by Erick Camacho on 6/24/14.
//  Copyright (c) 2014 ecamacho. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ECAAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) UITabBarController *tabBarController;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
