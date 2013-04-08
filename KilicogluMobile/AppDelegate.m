//
//  AppDelegate.m
//  KilicogluMobile
//
//  Created by mac on 10/29/12.
//  Copyright (c) 2012 com.filosoft. All rights reserved.
//

#import "AppDelegate.h"
#import "AnasayfaNavigationController.h"
#import "AnasayfaViewController.h" 
#import  "KurumsalNavigationController.h"
#import "UrunlerNavigationController.h"
#import "BrosurlerNavigationController.h"
#import  "TeknikCizimlerViewController.h"
#import   "TumUrunlerNavigationController.h"
#import   "TeknikcizimlerNavigationController.h"
#import "IletisimViewController.h"
#import "VideolarNavigationcontroller.h"
@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    UITabBarController *tabBar = (UITabBarController *)self.window.rootViewController;
    
    UITabBar  *mytab=tabBar.tabBar;
    
 [mytab setExclusiveTouch:YES];    
   

    
    //
    AnasayfaNavigationController *anasayfaNav= (AnasayfaNavigationController *)[[tabBar viewControllers] objectAtIndex:0];
    KurumsalNavigationController   *kurumsal=(KurumsalNavigationController *) [[tabBar viewControllers] objectAtIndex:1];
    UrunlerNavigationController  *urunlerNav=(UrunlerNavigationController *) [[tabBar viewControllers] objectAtIndex:2];
    //UygulamalarViewController  *uygulamalar=(UygulamalarViewController *) [[tabBar viewControllers] objectAtIndex:3];
    //FotoGalerisiViewController  *fotoGalari=(FotoGalerisiViewController *) [[tabBar viewControllers] objectAtIndex:4];
    BrosurlerNavigationController  *brosurler=(BrosurlerNavigationController *)  [[tabBar viewControllers] objectAtIndex:3];
    TeknikcizimlerNavigationController *teknikcizimler =(TeknikcizimlerNavigationController *) [[tabBar viewControllers] objectAtIndex:4];
    TumUrunlerNavigationController *tumUrunler=(TumUrunlerNavigationController *) [[tabBar viewControllers] objectAtIndex:5];
    VideolarNavigationcontroller   *videolar=(VideolarNavigationcontroller *) [[tabBar viewControllers] objectAtIndex:6];
    IletisimViewController     *iletisimV=(IletisimViewController *) [[tabBar viewControllers] objectAtIndex:7];
    
    UIImage *anasayfa = [UIImage imageNamed:@"menu_anasayfa1.png"];
    [[anasayfaNav anasayfaItem] setFinishedSelectedImage:anasayfa withFinishedUnselectedImage:anasayfa];
    
    UIImage *kurumsalIm= [UIImage imageNamed:@"menu_kurumsal.png"];
    [[kurumsal kurumsalIm] setFinishedSelectedImage:kurumsalIm withFinishedUnselectedImage:kurumsalIm];
    
    UIImage *urunlerIm= [UIImage imageNamed:@"menu_urunler.png"];
    [[urunlerNav urunlerItem] setFinishedSelectedImage:urunlerIm withFinishedUnselectedImage:urunlerIm];
    

    
    
  //  UIImage *fofoGIm= [UIImage imageNamed:@"menu_fotogaleri.png"];
   // [[fotoGalari fotoGalItem] setFinishedSelectedImage:fofoGIm withFinishedUnselectedImage:fofoGIm];
    
    UIImage *brosurIm= [UIImage imageNamed:@"menu_brosurler.png"];
    [[brosurler brosurIm] setFinishedSelectedImage:brosurIm withFinishedUnselectedImage:brosurIm];
    
    UIImage *teknikIm= [UIImage imageNamed:@"menu_teknik_cizimler.png"];
    [[teknikcizimler teknikCItem] setFinishedSelectedImage:teknikIm withFinishedUnselectedImage:teknikIm];
  
    UIImage *tumUrunlerIm= [UIImage imageNamed:@"menu_tum_cati.png"];
    //   [[uygulamalar uygulamalarItem] setFinishedSelectedImage:uygulamalarIm withFinishedUnselectedImage:uygulamalarIm];
    [[tumUrunler tumUrunlerIm] setFinishedSelectedImage:tumUrunlerIm withFinishedUnselectedImage:tumUrunlerIm];
    
    UIImage  *videolarIm=[UIImage imageNamed:@"video_30x30.png"];
    [[videolar iconc]setFinishedSelectedImage:videolarIm withFinishedUnselectedImage:videolarIm];
   
    UIImage *imgIL=[UIImage imageNamed:@"menu_iletisim.png"];
    [[iletisimV iletsimIm] setFinishedSelectedImage:imgIL withFinishedUnselectedImage:imgIL];
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
