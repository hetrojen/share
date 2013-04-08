//
//  TumUrunlerViewController.h
//  KilicogluMobile
//
//  Created by mac on 10/29/12.
//  Copyright (c) 2012 com.filosoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TumUrunlerViewController : UIViewController<UIScrollViewDelegate>{
     CGFloat lastScale;
    CGFloat beginX;
    CGFloat beginY;
}
@property (weak, nonatomic) IBOutlet UIImageView *imageM;
- (IBAction)resize:(UIPinchGestureRecognizer *)sender;


- (IBAction)toDetail:(UITapGestureRecognizer *)sender;


@property (strong, nonatomic) IBOutlet UIScrollView *scroolview;

@property (weak, nonatomic) IBOutlet UIView *contentView;


@end
