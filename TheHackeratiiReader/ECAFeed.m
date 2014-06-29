//
//  ECAFeed.m
//  TheHackeratiiReader
//
//  Created by Erick Camacho on 6/24/14.
//  Copyright (c) 2014 ecamacho. All rights reserved.
//

#import "ECAFeed.h"

NSString * const FEED_URL = @"http://ax.itunes.apple.com/WebObjects/MZStoreServices.woa/ws/RSS/topgrossingapplications/sf=143441/limit=25/json";

@implementation ECAFeed


- (void)requestFeed:(void (^)(NSArray *, NSError *))resultBlock
{
  NSURLSession *session = [NSURLSession sharedSession];
  [[session dataTaskWithURL:[NSURL URLWithString:FEED_URL]
          completionHandler:^(NSData *data,
                              NSURLResponse *response,
                              NSError *error) {
            if (!error) {
              NSHTTPURLResponse *httpResp = (NSHTTPURLResponse*) response;
              if (httpResp.statusCode == 200) {
                NSError *jsonError;
                NSDictionary *feedEntries =
                [NSJSONSerialization JSONObjectWithData:data
                                                options:NSJSONReadingAllowFragments
                                                  error:&jsonError];
                if (!jsonError) {
                  NSArray *entries = feedEntries[@"feed"][@"entry"];
                  NSLog(@"feedEntries class %@", [entries class]);
                  resultBlock(entries, jsonError);
                } else {
                  NSLog(@"error parsing json %@", jsonError);
                  resultBlock(nil, jsonError);
                }
              }
            } else {
              resultBlock(nil, error);
            }
      
          }] resume];
}

@end
