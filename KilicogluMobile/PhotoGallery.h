//
//  PhotoGallery.h
//  KilicogluMobile
//
//  Created by mac on 11/13/12.
//  Copyright (c) 2012 com.filosoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import "MyFlowLayout.h"
#import "PhotoGalleryCell.h"
@interface PhotoGallery : UICollectionViewController <UICollectionViewDataSource,UICollectionViewDelegate,UIGestureRecognizerDelegate>{
    CGFloat lastScale;
    CGFloat previousRotation;
    CGFloat previousScale;
    CGFloat beginX;
    CGFloat beginY;
  PhotoGalleryCell *curCell;
}
@property UIImageView *currentImage;
@property NSMutableArray *assets;

- (IBAction)buyut:(UIPinchGestureRecognizer *)sender;



@end
