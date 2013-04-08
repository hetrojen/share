//
//  KurumsalViewController.h
//  KilicogluMobile
//
//  Created by mac on 10/29/12.
//  Copyright (c) 2012 com.filosoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import "FotoGaleri.h"
#import "VideoViewController.h"
@interface KurumsalViewController : UIViewController{
    ALAssetsLibrary *assetsLibrary;
    NSMutableArray *assets;
    //FotoGaleri   *fotoGaleri;
    BOOL performed,toVideo;
    VideoViewController *videoView;
    NSString *albumName;
    ALAsset *video;
}
@property  ALAssetsGroup *groupN;
@property (weak, nonatomic) IBOutlet UITabBarItem *kurumsalItem;
- (IBAction)doSirket:(UIButton *)sender;
- (IBAction)doTarihce:(UIButton *)sender;
- (IBAction)doKalite:(UIButton *)sender;

- (IBAction)doKurumsalVideo:(UIButton *)sender;

@end
