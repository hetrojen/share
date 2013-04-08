//
//  FotoGalleryView.m
//  KilicogluMobile
//
//  Created by mac on 1/7/13.
//  Copyright (c) 2013 com.filosoft. All rights reserved.
//

#import "FotoGalleryView.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import <QuartzCore/QuartzCore.h>
@interface FotoGalleryView ()
@property (nonatomic, strong) UIImageView *imageView;

- (void)centerScrollViewContents;
- (void)scrollViewDoubleTapped:(UITapGestureRecognizer*)recognizer;
- (void)scrollViewTwoFingerTapped:(UITapGestureRecognizer*)recognizer;
@end

@implementation FotoGalleryView

@synthesize scrollView = _scrollView;

@synthesize imageView = _imageView;

- (void)centerScrollViewContents {
    CGSize boundsSize = self.scrollView.bounds.size;
    CGRect contentsFrame = self.imageView.frame;
    
    if (contentsFrame.size.width < boundsSize.width) {
        contentsFrame.origin.x = (boundsSize.width - contentsFrame.size.width) / 2.0f;
    } else {
        contentsFrame.origin.x = 0.0f;
    }
    
    if (contentsFrame.size.height < boundsSize.height) {
        contentsFrame.origin.y = (boundsSize.height - contentsFrame.size.height) / 2.0f;
    } else {
        contentsFrame.origin.y = 0.0f;
    }
    
    self.imageView.frame = contentsFrame;
}

- (void)scrollViewDoubleTapped:(UITapGestureRecognizer*)recognizer {
    // Get the location within the image view where we tapped
    CGPoint pointInView = [recognizer locationInView:self.imageView];
    
    // Get a zoom scale that's zoomed in slightly, capped at the maximum zoom scale specified by the scroll view
    CGFloat newZoomScale = self.scrollView.zoomScale * 1.5f;
    newZoomScale = MIN(newZoomScale, self.scrollView.maximumZoomScale);
    
    // Figure out the rect we want to zoom to, then zoom to it
    CGSize scrollViewSize = self.scrollView.bounds.size;
    
    CGFloat w = scrollViewSize.width / newZoomScale;
    CGFloat h = scrollViewSize.height / newZoomScale;
    CGFloat x = pointInView.x - (w / 2.0f);
    CGFloat y = pointInView.y - (h / 2.0f);
    
    CGRect rectToZoomTo = CGRectMake(x, y, w, h);
    
    [self.scrollView zoomToRect:rectToZoomTo animated:YES];
}

- (void)scrollViewTwoFingerTapped:(UITapGestureRecognizer*)recognizer {
    // Zoom out slightly, capping at the minimum zoom scale specified by the scroll view
    CGFloat newZoomScale = self.scrollView.zoomScale / 1.5f;
    newZoomScale = MAX(newZoomScale, self.scrollView.minimumZoomScale);
    [self.scrollView setZoomScale:newZoomScale animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Set a nice title
    self.title = @"Image";
    
    // Set up the image we want to scroll & zoom and add it to the scroll view
    UIImage *image;
  
        //image = [UIImage imageNamed:@"photo1.png"];
   
    
    self.imageView = [[UIImageView alloc] initWithImage:image];
    self.imageView.frame = (CGRect){.origin=CGPointMake(0.0f, 0.0f), .size=image.size};
    [self.scrollView addSubview:self.imageView];
    
    // Tell the scroll view the size of the contents
    self.scrollView.contentSize = image.size;
    
    UITapGestureRecognizer *doubleTapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(scrollViewDoubleTapped:)];
    doubleTapRecognizer.numberOfTapsRequired = 2;
    doubleTapRecognizer.numberOfTouchesRequired = 1;
    [self.scrollView addGestureRecognizer:doubleTapRecognizer];
    
    UITapGestureRecognizer *twoFingerTapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(scrollViewTwoFingerTapped:)];
    twoFingerTapRecognizer.numberOfTapsRequired = 1;
    twoFingerTapRecognizer.numberOfTouchesRequired = 2;
    [self.scrollView addGestureRecognizer:twoFingerTapRecognizer];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    // Set up the minimum & maximum zoom scales
    CGRect scrollViewFrame = self.scrollView.frame;
    CGFloat scaleWidth = scrollViewFrame.size.width / self.scrollView.contentSize.width;
    CGFloat scaleHeight = scrollViewFrame.size.height / self.scrollView.contentSize.height;
    CGFloat minScale = MIN(scaleWidth, scaleHeight);
    
    self.scrollView.minimumZoomScale = minScale;
    self.scrollView.maximumZoomScale = 1.0f;
    self.scrollView.zoomScale = minScale;
    
    [self centerScrollViewContents];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (UIView*)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    // Return the view that we want to zoom
    return self.imageView;
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView {
    // The scroll view has zoomed, so we need to re-center the contents
    [self centerScrollViewContents];
}

/*
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
*/
/*
- (IBAction)ileri:(UISwipeGestureRecognizer *)sender {
    
    
    if(fotoIndex<(_assets.count-1)){
      
        ALAsset *asset = [_assets objectAtIndex:fotoIndex];
        ALAssetRepresentation *assetRepresentation = [asset defaultRepresentation];
        UIImage *first = [UIImage imageWithCGImage:[assetRepresentation fullScreenImage] scale:[assetRepresentation scale] orientation:(UIImageOrientation)[assetRepresentation orientation]];
        
        UIImageView *imageView1=[self getImageView:first];
        
        CABasicAnimation *crossFade = [CABasicAnimation animationWithKeyPath:@"contents"];
        crossFade.duration = 2.0;
        crossFade.fromValue = (id)imageView1.image.CGImage;     //   UIImage  *first=[UIImage  imageNamed:[_images objectAtIndex:_index]];
        
        
        
        fotoIndex++;
        
        ALAsset *asset1 = [_assets objectAtIndex:fotoIndex];
        ALAssetRepresentation *assetRepresentation1 = [asset1 defaultRepresentation];
        UIImage *second = [UIImage imageWithCGImage:[assetRepresentation1 fullScreenImage] scale:[assetRepresentation scale] orientation:(UIImageOrientation)[assetRepresentation orientation]];
        UIImageView *imageView2=[self getImageView:second];
        
        // UIImage  *second=[UIImage  imageNamed:[_images objectAtIndex:_index]];
        crossFade.toValue = (id)imageView2.image.CGImage;
        
        [imageView1.layer addAnimation:crossFade forKey:@"animateContents"];
        
        UIView* subview;
        while ((subview = [[self.view subviews] lastObject]) != nil)
            [subview removeFromSuperview];
        
      
        imageView2.userInteractionEnabled=YES;
        imageView2.center=self.view.center;
        [self.view addSubview:imageView2];
    }
}  */
 /*
 - (IBAction)geri:(UISwipeGestureRecognizer *)sender {
 if(fotoIndex>0){
     ALAsset *asset = [_assets objectAtIndex:fotoIndex];
     ALAssetRepresentation *assetRepresentation = [asset defaultRepresentation];
     UIImage *first = [UIImage imageWithCGImage:[assetRepresentation fullScreenImage] scale:[assetRepresentation scale] orientation:(UIImageOrientation)[assetRepresentation orientation]];
     
     UIImageView *imageView1=[self getImageView:first];
     
     CABasicAnimation *crossFade = [CABasicAnimation animationWithKeyPath:@"contents"];
     crossFade.duration = 2.0;
     crossFade.fromValue = (id)imageView1.image.CGImage;     //   UIImage  *first=[UIImage  imageNamed:[_images objectAtIndex:_index]];
     
     
     
     fotoIndex--;
     
     ALAsset *asset1 = [_assets objectAtIndex:fotoIndex];
     ALAssetRepresentation *assetRepresentation1 = [asset1 defaultRepresentation];
     UIImage *second = [UIImage imageWithCGImage:[assetRepresentation1 fullScreenImage] scale:[assetRepresentation scale] orientation:(UIImageOrientation)[assetRepresentation orientation]];
     UIImageView *imageView2=[self getImageView:second];
     
     // UIImage  *second=[UIImage  imageNamed:[_images objectAtIndex:_index]];
     crossFade.toValue = (id)imageView2.image.CGImage;
     
     [imageView1.layer addAnimation:crossFade forKey:@"animateContents"];
     
     UIView* subview;
     while ((subview = [[self.view subviews] lastObject]) != nil)
         [subview removeFromSuperview];
    imageView2.center=self.view.center;
     imageView2.userInteractionEnabled=YES;
     [self.view addSubview:imageView2];

 }
 
 }*/
@end
