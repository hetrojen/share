//
//  FotoSliderViewViewController.m
//  KilicogluMobile
//
//  Created by mac on 1/8/13.
//  Copyright (c) 2013 com.filosoft. All rights reserved.
//

#import "FotoSliderViewViewController.h"

@interface FotoSliderViewViewController ()

@end

@implementation FotoSliderViewViewController

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

  /*  if(self.navigationController.navigationBarHidden==YES){
        self.navigationController.navigationBarHidden=NO;
    }*/
    if(!_root){
        _closeBut.hidden=YES;
    }
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    ALAsset *asset = [_assets objectAtIndex:_index];
    ALAssetRepresentation *assetRepresentation = [asset defaultRepresentation];
    UIImage *img = [UIImage imageWithCGImage:[assetRepresentation fullScreenImage] scale:[assetRepresentation scale] orientation:(UIImageOrientation)[assetRepresentation orientation]];
    UIImageView *imgView=[self getImageView:img];
    imgView.userInteractionEnabled=YES;
    imgView.center=self.view.center;
    
    NSArray *viewsToRemove = _scroolView.subviews;
    for (UIView *v in viewsToRemove) {
        if(![v isKindOfClass:[UIButton class]]){
            [v removeFromSuperview];
        }
        
    }
    [self addGestureRecognizerToView:imgView];
    //[self.view addSubview:imgView];
    _scroolView.backgroundColor=[UIColor blackColor];
    [_scroolView addSubview:imgView];
    currentImage=imgView;
    _scroolView.minimumZoomScale=1.0;
    _scroolView.maximumZoomScale=2.0;
    _scroolView.contentSize=CGSizeMake(imgView.frame.size.width, imgView.frame.size.height);
    
    
}
-(void)scrollViewDidZoom:(UIScrollView *)scrollView{
    UIView *subView=[scrollView.subviews objectAtIndex:0];
    
    CGFloat offsetX = (scrollView.bounds.size.width > scrollView.contentSize.width)?
    
    (scrollView.bounds.size.width - scrollView.contentSize.width) * 0.5 : 0.0;
    
    CGFloat offsetY = (scrollView.bounds.size.height > scrollView.contentSize.height)?
    (scrollView.bounds.size.height - scrollView.contentSize.height) * 0.5 : 0.0;
    
    
    subView.center = CGPointMake(scrollView.contentSize.width * 0.5 + offsetX,
                                 scrollView.contentSize.height * 0.5 + offsetY);
    
}
    - (void) addGestureRecognizerToView:(UIView *)view{
    UISwipeGestureRecognizer *oneFingerSwipeLeft = [[UISwipeGestureRecognizer alloc]
                                                    initWithTarget:self
                                                    action:@selector(ileri:)];
    [oneFingerSwipeLeft setDirection:UISwipeGestureRecognizerDirectionLeft];
    [[self view] addGestureRecognizer:oneFingerSwipeLeft];
    
    UISwipeGestureRecognizer *oneFingerSwipeRight = [[UISwipeGestureRecognizer alloc]
                                                     initWithTarget:self
                                                     action:@selector(geri:)];
    [oneFingerSwipeRight setDirection:UISwipeGestureRecognizerDirectionRight];
    
    [view addGestureRecognizer:oneFingerSwipeLeft];
    [view addGestureRecognizer:oneFingerSwipeRight];

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)geri:(UISwipeGestureRecognizer *)sender {
    if(_index<=0){
        return;
    }
    
    //UIStoryboard *storyboard = self.storyboard;
    //FotoSliderViewViewController *svc = [storyboard instantiateViewControllerWithIdentifier:@"fotoSlider"];
    //_index--;
    //svc.index=_index;
    //svc.assets=_assets;
    //[self.navigationController popToViewController:svc animated:YES];
    //_index--;
    //previousScreen.index=_index;
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)ileri:(UISwipeGestureRecognizer *)sender {
    if(_index>=_assets.count-1){
        return;
    }
    
    UIStoryboard *storyboard = self.storyboard;
    FotoSliderViewViewController *svc = [storyboard instantiateViewControllerWithIdentifier:@"fotoSlider"];
  
    svc.index=_index+1;
    svc.assets=_assets;
    svc.root=_root;
   // previousScreen=self;
    [self.navigationController pushViewController:svc animated:YES];
    
}
-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return  currentImage;
}



- (UIImageView *)getImageView:(UIImage* )first{
    UIImageView     *imageView;
    NSInteger with= first.size.width;
    NSInteger he=first.size.height;
    if(with<=990 && he<=650){
        
        imageView=[[UIImageView alloc] initWithImage:first];
        
    }else{
        float   rw = (float)with/990;
        float    rh=(float)he/650;
        if(rw==rh){
            CGRect reck=CGRectMake(0, 0, 990, 650);
            imageView=[[UIImageView alloc] initWithFrame:reck];
            imageView.image=first;
            
        }
        if(rw<rh){
            NSInteger nw= (int)with/rh;
            NSInteger nh=(int)he/rh;
            
            CGRect reck=CGRectMake(0, 0, nw, nh);
            imageView=[[UIImageView alloc] initWithFrame:reck];
            imageView.image=first;
            
        }
        if(rh<rw){
            NSInteger nw= (int)with/rw;
            NSInteger nh=(int)he/rw;
            CGRect reck=CGRectMake(0, 0, nw, nh);
            imageView=[[UIImageView alloc] initWithFrame:reck];
            imageView.image=first;
            
        }
        
        
        
    }
    return imageView;
}
- (IBAction)back:(UIButton *)sender {
        [self.navigationController popViewControllerAnimated:YES];
    }

- (IBAction)close:(UIButton *)sender {
    if(_root){
         [self.navigationController popToViewController:_root animated:YES];        
    }
   
}


@end
