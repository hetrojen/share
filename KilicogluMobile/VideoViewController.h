//
//  VideoViewController.h
//  KilicogluMobile
//
//  Created by mac on 11/7/12.
//  Copyright (c) 2012 com.filosoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import "UrunDetayOb.h"
#import <AssetsLibrary/AssetsLibrary.h>
@interface VideoViewController : UIViewController
{
    MPMoviePlayerViewController *videoPlayer;
}
@property NSString *videoName;
@property ALAsset *video;
@property  (nonatomic, retain) UrunDetayOb  *detayOb;
- (IBAction)back:(UIButton *)sender;

@end
