//
//  ViewController.m
//  ASDKTestApp
//
//  Created by Jeffrey Davis on 12/7/16.
//  Copyright © 2016 jeffdav. All rights reserved.
//

#import "ViewController.h"

#import "Cell.h"

static NSString *image = @"https://d14jf0tks233zb.cloudfront.net/stories/929895342231520378/8a9522cf-99f6-4c04-84a2-5a15c80670e6.jpeg";
static NSString *gif = @"https://d14jf0tks233zb.cloudfront.net/stories/929895342231520378/7208d950-9b55-4d7f-8fbf-e67ea7b49535.gif";

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];

  self.view.backgroundColor = [UIColor orangeColor];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
  return 2;
}

- (ASCellNodeBlock)collectionView:(ASCollectionView *)collectionView nodeBlockForItemAtIndexPath:(NSIndexPath *)indexPath {
  return ^{
    ASCellNode *cell = nil;
    switch (indexPath.item) {
      case 0:
        cell = [[Cell alloc] initWithURL:image];
        break;
      case 1:
        cell = [[Cell alloc] initWithURL:gif];
        break;
      default:
        cell = [[Cell alloc] init];
        break;
    }

    cell.style.width = ASDimensionMakeWithFraction(1.0);
    return cell;
  };
}

@end
