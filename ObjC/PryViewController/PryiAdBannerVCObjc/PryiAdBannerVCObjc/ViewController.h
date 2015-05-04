//
//  ViewController.h
//  PryiAdBannerVCObjc
//
//  Created by Henry AT on 5/4/15.
//  Copyright (c) 2015 Apps4s. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <iAd/iAd.h>

@interface ViewController : UIViewController <ADBannerViewDelegate>

@property (nonatomic, strong) ADBannerView *iAdView;

@end

