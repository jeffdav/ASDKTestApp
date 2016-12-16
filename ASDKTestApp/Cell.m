//
//  Cell.m
//  ASDKTestApp
//
//  Created by Jeffrey Davis on 12/7/16.
//  Copyright © 2016 jeffdav. All rights reserved.
//

#import "Cell.h"

#import <PINRemoteImage/PINAnimatedImage.h>

static NSString *frame = @"https://d14jf0tks233zb.cloudfront.net/styles/738476040438940684/frames/c33c76f2-0719-44ba-8a4d-0ddbe8408625.png";

@interface Cell () <ASNetworkImageNodeDelegate>

@property(nonatomic, strong) ASNetworkImageNode *imageNode;
@property(nonatomic, assign) CGFloat ratio;

@end

@implementation Cell

- (instancetype)initWithURL:(NSString *)url {
  if (self = [super init]) {
    CGFloat ratio = 0.666666666666667;
    self.ratio = ratio;

    ASNetworkImageNode *imageNode = [[ASNetworkImageNode alloc] init];

    self.imageNode = imageNode;
    self.imageNode.URL = [NSURL URLWithString:url];
    self.imageNode.shouldCacheImage = NO;
    self.imageNode.layerBacked = YES;
    self.imageNode.zPosition = 1;
    self.imageNode.delegate = self;
    self.imageNode.style.width = ASDimensionMakeWithFraction(1.0);

    self.automaticallyManagesSubnodes = YES;
  }
  return self;
}

- (void)didLoad {
  [super didLoad];
  self.backgroundColor = [UIColor blueColor];
}

- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize {
  ASRatioLayoutSpec *imageLayoutSpec = [ASRatioLayoutSpec ratioLayoutSpecWithRatio:self.ratio child:self.imageNode];
  imageLayoutSpec.style.width = ASDimensionMakeWithFraction(1.0);
  return imageLayoutSpec;
}

- (void)imageNode:(ASNetworkImageNode *)imageNode didLoadImage:(UIImage *)image {
  if (image) {
    self.ratio = image.size.height / image.size.width;
    [self.imageNode setNeedsLayout];
  } else if (imageNode.animatedImage) {
    if (imageNode.animatedImage.coverImageReady) {
      image = imageNode.animatedImage.coverImage;
      self.ratio = image.size.height / image.size.width;
      [self.imageNode setNeedsLayout];
    } else if ([imageNode.animatedImage isKindOfClass:[PINAnimatedImage class]]) {
      PINAnimatedImage *animatedImage = (PINAnimatedImage *)imageNode.animatedImage;
      animatedImage.infoCompletion = ^(PINImage *coverImage) {
        self.ratio = coverImage.size.height / coverImage.size.width;
        [self.imageNode setNeedsLayout];
      };
    }
  }
}

@end
