//
//  FotoGaleri.h
//  KilicogluMobile
//
//  Created by mac on 11/8/12.
//  Copyright (c) 2012 com.filosoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UrunDetayOb.h"
#import "PhotoGallery.h"
#import <AssetsLibrary/AssetsLibrary.h>
@interface FotoGaleri : UIViewController
{
   // CGFloat lastScale;
   // CGFloat previousRotation;
    
   // CGFloat beginX;
   // CGFloat beginY;
   // ALAssetsLibrary *assetsLibrary;
   // ALAssetsGroup *groupN;
    //NSMutableArray *assets;
    
}
//@property NSArray *images;
//@property int index;

//- (IBAction)geri:(UISwipeGestureRecognizer *)sender;
//- (IBAction)ileri:(UISwipeGestureRecognizer *)sender;


//- (IBAction)resize:(UIPinchGestureRecognizer *)sender;
//@property (weak, nonatomic) IBOutlet UIImageView *currentImage;
//- (IBAction)move:(UIPanGestureRecognizer *)sender;
//@property (strong, nonatomic) IBOutlet UIPanGestureRecognizer *panR;
//@property (strong, nonatomic) IBOutlet UISwipeGestureRecognizer *solS;
//@property (strong, nonatomic) IBOutlet UISwipeGestureRecognizer *sagS;
@property  (nonatomic, retain) UrunDetayOb  *detayOb;
@property PhotoGallery *gallery;
@property NSMutableArray *assets;
//@property  ALAssetsGroup *groupN;
//@property  NSMutableArray *assets;
- (IBAction)back:(UIButton *)sender;


@end
