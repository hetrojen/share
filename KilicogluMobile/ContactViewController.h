//
//  ContactViewController.h
//  KilicogluMobile
//
//  Created by mac on 12/6/12.
//  Copyright (c) 2012 com.filosoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContactViewController : UIViewController{
    UIImageView *imageView;

}

- (IBAction)close:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIScrollView *scrool;



@property NSString *imageName;


@end
