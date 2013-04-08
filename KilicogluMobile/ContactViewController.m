//
//  ContactViewController.m
//  KilicogluMobile
//
//  Created by mac on 12/6/12.
//  Copyright (c) 2012 com.filosoft. All rights reserved.
//

#import "ContactViewController.h"

@interface ContactViewController ()

@end

@implementation ContactViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
     imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:_imageName]];
    [ imageView setUserInteractionEnabled:YES];
    //[imageView setCenter:_scrollViewRef.center];
 
    [_scrool setContentSize:imageView.frame.size];
    [_scrool addSubview:imageView];
    
}
-(void)viewWillAppear:(BOOL)animated{
    if ([_imageName isEqualToString:@"kilicoglu_yetkilileri2.png"] ) {
        imageView.center=self.view.center;
    };
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

  

- (IBAction)close:(UIButton *)sender {
    
    [self dismissModalViewControllerAnimated:YES];
}
@end
