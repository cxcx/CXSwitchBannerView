//
//  CXSwitchBannerView.m
//  switchBanner
//
//  Created by renhe_cx on 12/14/15.
//  Copyright © 2015 cx. All rights reserved.
//

#import "CXSwitchBannerView.h"
#import "CXSwitchBannerViewDelegate.h"
#define SCREEN_WIDTH         [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT         [[UIScreen mainScreen] bounds].size.height

@interface CXSwitchBannerView ()
@property (nonatomic, strong) NSMutableArray* imageviews;
@property (nonatomic, assign) NSInteger* index;
@property (nonatomic, strong) CXSwitchBannerViewDelegate* delegateController;
@property (nonatomic, assign) CGPoint leftUpCouner;
@end

@implementation CXSwitchBannerView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (instancetype)initWithBannersImages:(NSArray *)images withFrame:(CGRect)frame andCounerPoint:(CGPoint)point
{
    self = [self initWithFrame:frame];
    if (self) {
        for (UIImage* image in images) {
            [self.imageviews addObject:[[UIImageView alloc] initWithImage:image]];
        }
        self.contentSize = CGSizeMake(self.frame.size.width * [images count], self.frame.size.height);
        self.delegateController = [[CXSwitchBannerViewDelegate alloc] init];
        self.leftUpCouner = point;
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
}

- (void)setupSubItems
{
    if (!_imageviews) {
        return;
    }
    NSInteger index = 0;
    for (UIImageView* imageView in _imageviews) {
        [self addSubview:imageView];
        [imageView setFrame:CGRectMake(_leftUpCouner.x + index * imageView.frame.size.width, _leftUpCouner.y, self.frame.size.width - 2 * _leftUpCouner.x, self.frame.size.height - 2 * _leftUpCouner.y)];
        index++;
    }
}

@end
