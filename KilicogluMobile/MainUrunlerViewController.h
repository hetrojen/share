//
//  MainUrunlerViewController.h
//  KilicogluMobile
//
//  Created by mac on 11/2/12.
//  Copyright (c) 2012 com.filosoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainUrunlerViewController : UICollectionViewController<UICollectionViewDataSource,UICollectionViewDelegate>
@property NSArray *imageNames;
@property UIPopoverController  *popCon;
@property int selectedUrunKatagori;
@end