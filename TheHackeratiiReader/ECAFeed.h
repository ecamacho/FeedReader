//
//  ECAFeed.h
//  TheHackeratiiReader
//
//  Created by Erick Camacho on 6/24/14.
//  Copyright (c) 2014 ecamacho. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString * const FEED_URL;

@interface ECAFeed : NSObject

- (void)requestFeed:(void (^)(NSArray *, NSError *))resultBlock;

@end
