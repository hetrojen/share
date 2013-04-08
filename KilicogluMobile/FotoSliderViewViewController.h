//
//  FotoSliderViewViewController.h
//  KilicogluMobile
//
//  Created by mac on 1/8/13.
//  Copyright (c) 2013 com.filosoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>
@interface FotoSliderViewViewController : UIViewController <UIScrollViewDelegate>{
  
    FotoSliderViewViewController *previousScreen;
    UIImageView  *currentImage;
   
}
@property NSMutableArray *assets;
@property  int index;
@property (weak, nonatomic) IBOutlet UIScrollView *scroolView;
@property  UIViewController  *root;
- (IBAction)back:(UIButton *)sender;
- (IBAction)close:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *closeBut;


@end
