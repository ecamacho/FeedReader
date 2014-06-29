//
//  ECAEntryViewController.m
//  TheHackeratiiReader
//
//  Created by Erick Camacho on 6/24/14.
//  Copyright (c) 2014 ecamacho. All rights reserved.
//

#import "ECAEntryViewController.h"
#import "ECAFavoritesActivity.h"

@interface ECAEntryViewController ()


@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UITextView *summaryTextView;

@end

@implementation ECAEntryViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(share)];
  }
  return self;
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  self.title = _entry[@"im:name"][@"label"];
  self.titleLabel.text = _entry[@"im:name"][@"label"];
  self.priceLabel.text = _entry[@"im:price"][@"label"];
  self.summaryTextView.text = _entry[@"summary"][@"label"];
  [self downloadImage];
}

- (void) downloadImage
{
  NSString *imageUrl = _entry[@"im:image"][2][@"label"];
  NSURLSession *session = [NSURLSession sharedSession];
  NSURLSessionDownloadTask *imageTask =
  [session downloadTaskWithURL:[NSURL URLWithString:imageUrl]
   
             completionHandler:^(NSURL *location,
                                 NSURLResponse *response,
                                 NSError *error) {
               UIImage *downloadedImage =
               [UIImage imageWithData:
                [NSData dataWithContentsOfURL:location]];
               dispatch_async(dispatch_get_main_queue(), ^{
                 self.imageView.image = downloadedImage;
               });
             }];
  
  [imageTask resume];
}

#pragma mark - share functionality
- (void)share
{
  ECAFavoritesActivity *favoritesActivity = [[ECAFavoritesActivity alloc] init];
  NSString *text = self.title;
  NSURL *url = [NSURL URLWithString:_entry[@"link"][@"attributes"][@"href"]];

  
  UIActivityViewController *controller =
  [[UIActivityViewController alloc]
   initWithActivityItems:@[text, url]
   applicationActivities:@[favoritesActivity]];
  
  [self presentViewController:controller animated:YES completion:nil];
}
@end
