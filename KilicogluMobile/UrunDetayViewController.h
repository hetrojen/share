//
//  UrunDetayViewController.h
//  KilicogluMobile
//
//  Created by mac on 11/1/12.
//  Copyright (c) 2012 com.filosoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UrunDetayOb.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import "FotoGaleri.h"
#import "VideoViewController.h"

@interface UrunDetayViewController : UIViewController{
    ALAssetsLibrary *assetsLibrary;
       NSMutableArray *assets;    
    FotoGaleri   *fotoGaleri;
    BOOL  performed,tovideo;
    VideoViewController *videoView;
     
    ALAsset *video;
}
@property (weak, nonatomic) IBOutlet UIImageView *titleImage;
@property (weak, nonatomic) IBOutlet UIImageView *mainImage;
@property  (nonatomic, retain) UrunDetayOb  *detayOb;
@property int senderS;
@property  ALAssetsGroup *groupN;
@property  BOOL  isfromSekil;
- (IBAction)toGalery:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollViewRef;

- (IBAction)back:(UIButton *)sender;
- (IBAction)toVideo:(UIButton *)sender;
- (IBAction)aksesuar:(UIButton *)sender;

- (IBAction)uygulamaSekil:(UIButton *)sender;



@end
