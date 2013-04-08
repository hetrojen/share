//
//  FotoGalleryView.h
//  KilicogluMobile
//
//  Created by mac on 1/7/13.
//  Copyright (c) 2013 com.filosoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>
@interface FotoGalleryView :  UIViewController <UIScrollViewDelegate>{
    int  fotoIndex;
}
@property NSMutableArray *assets;
//@property  UIImage *imageRef;
@property (nonatomic, strong) IBOutlet UIScrollView *scrollView;
@end
