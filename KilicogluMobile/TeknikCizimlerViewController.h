//
//  TeknikCizimlerViewController.h
//  KilicogluMobile
//
//  Created by mac on 10/29/12.
//  Copyright (c) 2012 com.filosoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import "FotoGaleriViewController.h"
@interface TeknikCizimlerViewController : UIViewController{
    ALAssetsLibrary *assetsLibrary;
    NSMutableArray *assets;
    FotoSliderViewViewController *photoGallery;
        
}

@property (weak, nonatomic) IBOutlet UITabBarItem *teknikCItem;
@property  ALAssetsGroup *groupN;
@end
