//
//  Makeover_SalonAppDelegate.m
//  Makeover_Salon
//
//  Created by MAC 7 on 26/08/13.
//  Copyright (c) 2013 MAC 7. All rights reserved.
//

#import "Makeover_SalonAppDelegate.h"

#import "Makeover_saloon_ipone5.h"
#import "Makeover_SalonViewController_iPadView.h"
#import "Makeover_SalonViewController_iPhone4.h"

@implementation Makeover_SalonAppDelegate
@synthesize home_iphone5;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    [RevMobAds startSessionWithAppID:@"5257a5bcb600c84f0d000051"];
//    [RevMobAds session].testingMode = RevMobAdsTestingModeWithAds;
    
    UINavigationController *nav;//=[[UINavigationController alloc]init];
    Makeover_SalonViewController_iPhone4 *home_iphone4=[[Makeover_SalonViewController_iPhone4 alloc]initWithNibName:@"Makeover_SalonViewController_iPhone4" bundle:nil];
    
    home_iphone5=[[Makeover_saloon_ipone5 alloc]initWithNibName:@"Makeover_saloon_ipone5" bundle:nil];
    
    Makeover_SalonViewController_iPadView *home_ipad=[[Makeover_SalonViewController_iPadView alloc]initWithNibName:@"Makeover_SalonViewController_iPadView" bundle:nil];    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {              
        if([[ UIScreen mainScreen ] bounds ].size.height>480)
        {
            nav=[[UINavigationController alloc]initWithRootViewController:home_iphone5];

        }
        else{
                nav=[[UINavigationController alloc]initWithRootViewController:home_iphone4];
        }           
    }
    else
    {     nav=[[UINavigationController alloc]initWithRootViewController:home_ipad];
      
    }    
    self.window.rootViewController = nav;//self.viewController;
    [self.window makeKeyAndVisible];
    return YES;
    
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    
    NSCalendar *calendar = [NSCalendar autoupdatingCurrentCalendar] ;
    
    NSDateComponents *componentsForReferenceDate =
    
    [calendar components:(NSDayCalendarUnit | NSYearCalendarUnit | NSMonthCalendarUnit ) fromDate:[NSDate date]];
    
   /* [componentsForReferenceDate setDay:16] ;
    [componentsForReferenceDate setMonth:11] ;
    [componentsForReferenceDate setYear:2013] ;*/
    
    NSDate *referenceDate = [calendar dateFromComponents:componentsForReferenceDate] ;
    
    // set components for time 7:00 a.m.
    
    NSDateComponents *componentsForFireDate =    
    [calendar components:(NSYearCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit| NSSecondCalendarUnit ) fromDate: referenceDate];
    
    [componentsForFireDate setHour: 10] ;
    [componentsForFireDate setMinute:17] ;
    [componentsForFireDate setSecond:0] ;
    
    NSDate *fireDateOfNotification = [calendar dateFromComponents: componentsForFireDate];
    
    // Create the notification
    
    UILocalNotification *notification = [[UILocalNotification alloc]  init] ;
    
    notification.fireDate = fireDateOfNotification ;
    notification.timeZone = [NSTimeZone localTimeZone] ;
    notification.alertBody = [NSString stringWithFormat: @"Good Morning! Have a great day!"] ;
    notification.alertAction = @"go back";
    notification.userInfo= [NSDictionary dictionaryWithObject:[NSString stringWithFormat:@"Some information"] forKey:@"information"];
    notification.repeatInterval= NSDayCalendarUnit ;
    notification.soundName = UILocalNotificationDefaultSoundName;
    notification.applicationIconBadgeNumber = 1;
    [[UIApplication sharedApplication] scheduleLocalNotification:notification] ;

    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{


//  [[RevMobAds session] showBanner];    
    Chartboost *cb = [Chartboost sharedChartboost];
    cb.appId = @"5257963a17ba47307b000007";
    cb.appSignature = @"6ac17a8eefe31deefc23c8a04320412c58517cd3";    
    // Required for use of delegate methods. See "Advanced Topics" section below.
    cb.delegate = self;    
    // Begin a user session. Must not be dependent on user actions or any prior network requests.
    // Must be called every time your app becomes active.
    [cb startSession];    
    // Show an interstitial
    [cb showInterstitial];
//  [cb cacheInterstitial];

    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}
- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
