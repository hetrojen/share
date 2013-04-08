//
//  VideoViewController.m
//  KilicogluMobile
//
//  Created by mac on 11/7/12.
//  Copyright (c) 2012 com.filosoft. All rights reserved.
//

#import "VideoViewController.h"
#import "UrunDetayViewController.h"
@interface VideoViewController ()

@end

@implementation VideoViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated{
  //NSString *urlStr = [[NSBundle mainBundle] pathForResource:_videoName ofType:@"mov"];
   // NSURL *url = [NSURL fileURLWithPath:urlStr];
   //NSString *moviePath = [bundle pathForResource:videoname ofType:@"mov"];
   // MPMoviePlayerViewController *mp = [[MPMoviePlayerViewController alloc] initWithContentURL:[NSURL URLWithString:urlStr]];
    
    //mp.moviePlayer.scalingMode = MPMovieScalingModeAspectFill;
    
    //[self presentMoviePlayerViewControllerAnimated:mp];

    if(_video){
        videoPlayer =[[MPMoviePlayerViewController alloc] initWithContentURL:[[_video defaultRepresentation] url]];
        [[[self.view subviews] objectAtIndex:0]addSubview:videoPlayer.view];
        videoPlayer.view.frame = self.view.frame;
        [videoPlayer.view setUserInteractionEnabled:YES];
        [videoPlayer.moviePlayer play];
    }
    
    
   // NSString *urlStr = [[NSBundle mainBundle] pathForResource:_videoName ofType:@"mov"];
   // NSURL *url = [NSURL fileURLWithPath:urlStr];
   // videoPlayer = [[MPMoviePlayerController alloc] initWithContentURL:url];
    //[self.view addSubview:videoPlayer.view];

    

}



- (IBAction)back:(UIButton *)sender {
    [videoPlayer.moviePlayer stop];

    [self.navigationController popViewControllerAnimated:YES];
    
}
@end
