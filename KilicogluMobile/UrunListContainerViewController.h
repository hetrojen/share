//
//  UrunListContainerViewController.h
//  KilicogluMobile
//
//  Created by mac on 10/29/12.
//  Copyright (c) 2012 com.filosoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UrunListContainerViewController : UIViewController
{
    NSArray   *imageNames;
}
-(void) setImages:(NSArray *)imageArray;
@property int  urunKatagori;
- (IBAction)back:(UIButton *)sender;


@end
