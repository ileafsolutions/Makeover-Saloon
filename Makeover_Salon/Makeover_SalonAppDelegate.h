//
//  Makeover_SalonAppDelegate.h
//  Makeover_Salon
//
//  Created by MAC 7 on 26/08/13.
//  Copyright (c) 2013 MAC 7. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Chartboost.h"
#import <RevMobAds/RevMobAds.h>
#import "Makeover_saloon_ipone5.h"

@class Makeover_SalonViewController;

@interface Makeover_SalonAppDelegate : UIResponder <UIApplicationDelegate,ChartboostDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) Makeover_saloon_ipone5 *home_iphone5;

@property (strong, nonatomic) Makeover_SalonViewController *viewController;

@end
