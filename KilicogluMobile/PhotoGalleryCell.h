//
//  PhotoGalleryCell.h
//  KilicogluMobile
//
//  Created by mac on 11/13/12.
//  Copyright (c) 2012 com.filosoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoGalleryCell : UICollectionViewCell<UIGestureRecognizerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *currentImage;

@property (weak, nonatomic) IBOutlet UIView *scroolview;


@end
