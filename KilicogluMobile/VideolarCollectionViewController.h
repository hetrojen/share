//
//  VideolarCollectionViewController.h
//  KilicogluMobile
//
//  Created by mac on 1/7/13.
//  Copyright (c) 2013 com.filosoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>
@interface VideolarCollectionViewController : UICollectionViewController<UICollectionViewDataSource,UICollectionViewDelegate>{
    ALAssetsLibrary *assetsLibrary;
}
@property NSMutableArray *assets;
@property  ALAssetsGroup *groupN;
@end
