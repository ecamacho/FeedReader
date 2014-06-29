//
//  ECAFavorite.h
//  TheHackeratiiReader
//
//  Created by Erick Camacho on 6/28/14.
//  Copyright (c) 2014 ecamacho. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface ECAFavorite : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * url;

+ (ECAFavorite *)create;
+ (ECAFavorite *)findByName:(NSString *)name;
+ (NSArray *)findAll;

- (void)save;
@end
