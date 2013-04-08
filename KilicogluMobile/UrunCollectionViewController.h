//
//  UrunCollectionViewController.h
//  KilicogluMobile
//
//  Created by mac on 10/29/12.
//  Copyright (c) 2012 com.filosoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import  "UrunDetayOb.h"

@interface UrunCollectionViewController : UICollectionViewController<UICollectionViewDataSource,UICollectionViewDelegate>


    {
        NSArray  *imageNames;
        UrunDetayOb  *detayOb;
        
    }
-(void) setImages:(NSArray *)imageArray;
@property int  urunKatagori;
@end
