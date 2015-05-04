//
//  ViewController.m
//  PryiAdBannerVCObjc
//
//  Created by Henry AT on 5/4/15.
//  Copyright (c) 2015 Apps4s. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


@synthesize iAdView;


- (void)viewDidLoad {
  [super viewDidLoad];
  // ----
  // Get device screen size
  CGRect screenBounds = [[UIScreen mainScreen] bounds];
  
  // Setup iAd view
  iAdView = [[ADBannerView alloc] initWithFrame:CGRectZero];
  
  iAdView.delegate=self; // Imoprtante!! And have you done this?
  
  [iAdView setFrame:CGRectMake(0, 0, iAdView.bounds.size.width, iAdView.bounds.size.height)];
  iAdView.center = CGPointMake(screenBounds.size.width / 2, screenBounds.size.height - (iAdView.bounds.size.height / 2));
  [self.view addSubview:iAdView];
  iAdView.alpha = 0.0;
  
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}








#pragma mark -
#pragma mark - Metodo del Delegado

// And have you included these iAd methods to handle when an ad is received or not?


-(void)bannerViewDidLoadAd:(ADBannerView *)banner {
  NSLog(@"iAd received ad, Cargo Correctamente..");
  // Show ad
  [UIView beginAnimations:nil context:NULL];
  iAdView.alpha = 1.0;
  [UIView commitAnimations];
}

-(void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error {
  NSLog(@"iAd failed, Hubo Error");
  // Hide ad
  [UIView beginAnimations:nil context:NULL];
  iAdView.alpha = 0.0;
  [UIView commitAnimations];
}

-(void)bannerViewWillLoadAd:(ADBannerView *)banner{
  NSLog(@"Cargara el Anuncio..");

}

-(BOOL)bannerViewActionShouldBegin:(ADBannerView *)banner willLeaveApplication:(BOOL)willLeave{
  return true;
}

-(void)bannerViewActionDidFinish:(ADBannerView *)banner{
  NSLog(@"bannerViewAction DidFinish: Volvio despues de su interacion con el Anuncio");
}

@end
