//
//  ECAFavorite.m
//  TheHackeratiiReader
//
//  Created by Erick Camacho on 6/28/14.
//  Copyright (c) 2014 ecamacho. All rights reserved.
//

#import "ECAFavorite.h"
#import "ECAAppDelegate.h"

@implementation ECAFavorite

@dynamic name;
@dynamic url;

+ (ECAFavorite *)create
{
  NSManagedObjectContext *objectContext = [self objectContext];
  ECAFavorite *favorite = [NSEntityDescription insertNewObjectForEntityForName:@"ECAFavorite"
   inManagedObjectContext:objectContext];
  return favorite;
}

+ (ECAFavorite *)findByName:(NSString *)name
{
  NSManagedObjectContext *objectContext = [self objectContext];
  NSFetchRequest *request = [[NSFetchRequest alloc] init];
  NSEntityDescription *entity =
  [NSEntityDescription entityForName:@"ECAFavorite" inManagedObjectContext:objectContext];
  [request setEntity:entity];
  NSPredicate *predicate =
  [NSPredicate predicateWithFormat:@"name == %@", name];
  [request setPredicate:predicate];
  NSArray *array = [objectContext executeFetchRequest:request error:NULL];
  if ([array count] > 0) {
    return array[0];
  }
  return nil;
}

+ (NSArray *)findAll
{
  NSManagedObjectContext *objectContext = [self objectContext];
  NSFetchRequest *request = [[NSFetchRequest alloc] init];
  NSEntityDescription *entity =
  [NSEntityDescription entityForName:@"ECAFavorite" inManagedObjectContext:objectContext];
  [request setEntity:entity];
  NSError *error;
  NSArray *favorites = [objectContext executeFetchRequest:request error:&error];
  NSLog(@"error %@", error);
  return favorites;
}

- (void)save
{
  NSManagedObjectContext *objectContext = [self objectContext];
  [objectContext save:NULL];
}

+ (NSManagedObjectContext *) objectContext
{
  ECAAppDelegate *delegate = (ECAAppDelegate *)[[UIApplication sharedApplication] delegate];
  return [delegate managedObjectContext];
}

- (NSManagedObjectContext *) objectContext
{
  ECAAppDelegate *delegate = (ECAAppDelegate *)[[UIApplication sharedApplication] delegate];
  return [delegate managedObjectContext];
}

@end
