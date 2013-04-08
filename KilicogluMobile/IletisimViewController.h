//
//  IletisimViewController.h
//  KilicogluMobile
//
//  Created by mac on 10/29/12.
//  Copyright (c) 2012 com.filosoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IletisimViewController : UIViewController{
    NSString *imageName;
}
- (IBAction)yetkili:(UIButton *)sender;
- (IBAction)distributor:(UIButton *)sender;
- (IBAction)kilicogluyetkili:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UITabBarItem *iletsimIm;



@end
