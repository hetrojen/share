//
//  FotoGaleri.m
//  KilicogluMobile
//
//  Created by mac on 11/8/12.
//  Copyright (c) 2012 com.filosoft. All rights reserved.
//

#import "FotoGaleri.h"
#import <QuartzCore/QuartzCore.h>
#import "UrunDetayViewController.h"
#import "PhotoGallery.h"
@interface FotoGaleri ()

@end

@implementation FotoGaleri

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)viewWillLayoutSubviews{
    [self prepareForGallery];
}

-(void) prepareForGallery{
    
   
    
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
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
   

    
    if ([segue.identifier isEqualToString:@"toGallery"] ){
         
        PhotoGallery *listContainer=(PhotoGallery *) segue.destinationViewController;
        _gallery=listContainer;
        if(_assets!=nil){
            _gallery.assets=_assets;
        }
        
    }
    
    
    
}
/*

- (IBAction)ileri:(UISwipeGestureRecognizer *)sender {
   
    
    if(_index<(_images.count-1)){
        
        ALAsset *asset = [assets objectAtIndex:_index];
        ALAssetRepresentation *assetRepresentation = [asset defaultRepresentation];        
        UIImage *first = [UIImage imageWithCGImage:[assetRepresentation fullScreenImage] scale:[assetRepresentation scale] orientation:(UIImageOrientation)[assetRepresentation orientation]];
        
                
        
        CABasicAnimation *crossFade = [CABasicAnimation animationWithKeyPath:@"contents"];
        crossFade.duration = 2.0;
        crossFade.fromValue = (id)(first.CGImage);     //   UIImage  *first=[UIImage  imageNamed:[_images objectAtIndex:_index]];
            
        
        
         _index++;
        
        ALAsset *asset1 = [assets objectAtIndex:_index];        
        ALAssetRepresentation *assetRepresentation1 = [asset defaultRepresentation];        
        UIImage *second = [UIImage imageWithCGImage:[assetRepresentation fullScreenImage] scale:[assetRepresentation scale] orientation:(UIImageOrientation)[assetRepresentation orientation]];
        
        
       // UIImage  *second=[UIImage  imageNamed:[_images objectAtIndex:_index]];
        crossFade.toValue = (id)(second.CGImage);
        
             [_currentImage.layer addAnimation:crossFade forKey:@"animateContents"];
  
        _currentImage.image=second;
           
    }
}  */
/*

- (IBAction)geri:(UISwipeGestureRecognizer *)sender {
    if(_index>0){
        ALAsset *asset = [assets objectAtIndex:_index];
        ALAssetRepresentation *assetRepresentation = [asset defaultRepresentation];
        UIImage *first = [UIImage imageWithCGImage:[assetRepresentation fullScreenImage] scale:[assetRepresentation scale] orientation:(UIImageOrientation)[assetRepresentation orientation]];
        
        
        
        CABasicAnimation *crossFade = [CABasicAnimation animationWithKeyPath:@"contents"];
        crossFade.duration = 2.0;
        crossFade.fromValue = (id)(first.CGImage);     //   UIImage  *first=[UIImage  imageNamed:[_images objectAtIndex:_index]];
        
        
        
        _index--;
        
        //ALAsset *asset1 = [assets objectAtIndex:_index];
        //ALAssetRepresentation *assetRepresentation1 = [asset defaultRepresentation];
        UIImage *second = [UIImage imageWithCGImage:[assetRepresentation fullScreenImage] scale:[assetRepresentation scale] orientation:(UIImageOrientation)[assetRepresentation orientation]];
        
        
        // UIImage  *second=[UIImage  imageNamed:[_images objectAtIndex:_index]];
        crossFade.toValue = (id)(second.CGImage);
        
        [_currentImage.layer addAnimation:crossFade forKey:@"animateContents"];
        
        _currentImage.image=second;
    }
    
}  */



-(void)viewWillAppear:(BOOL)animated{

   // [_currentImage addGestureRecognizer:_solS];
   // [_currentImage addGestureRecognizer:_sagS];
}


//- (IBAction)resize:(UIPinchGestureRecognizer *)gestureRecognizer {
   /* float scale =recognizer.scale;
    if([recognizer state] == UIGestureRecognizerStateEnded) {
        
		previousScale = 1.0;
		return;
	}
    

	CGFloat newScale = 1.0 - (previousScale - [recognizer scale]);
 
    
	CGAffineTransform currentTransformation = _currentImage.transform;
	CGAffineTransform newTransform = CGAffineTransformScale(currentTransformation, newScale, newScale);
    
    _currentImage.transform = newTransform;
    
	previousScale = [recognizer scale]; */
/*
if([gestureRecognizer state] == UIGestureRecognizerStateBegan) {
    // Reset the last scale, necessary if there are multiple objects with different scales
    lastScale = [gestureRecognizer scale];
}

if ([gestureRecognizer state] == UIGestureRecognizerStateBegan ||
    [gestureRecognizer state] == UIGestureRecognizerStateChanged) {
    CALayer *lay=[gestureRecognizer view].layer;
    CGFloat currentScale = [[lay valueForKeyPath:@"transform.scale"] floatValue];
    
    // Constants to adjust the max/min values of zoom
    const CGFloat kMaxScale = 2.0;
    const CGFloat kMinScale = 1.0;
    
    CGFloat newScale = 1 -  (lastScale - [gestureRecognizer scale]); // new scale is in the range (0-1)
    newScale = MIN(newScale, kMaxScale / currentScale);
    newScale = MAX(newScale, kMinScale / currentScale);
    CGAffineTransform transform = CGAffineTransformScale([[gestureRecognizer view] transform], newScale, newScale);
    [gestureRecognizer view].transform = transform;
    
    lastScale = [gestureRecognizer scale];
   
    
}
    if([gestureRecognizer state]==UIGestureRecognizerStateEnded){
        const CGFloat kMaxScale = 2.0;
        const CGFloat kMinScale = 1.0;
        CGFloat newScale = 1 -  (lastScale - [gestureRecognizer scale]); // new scale is in the range (0-1)
        CALayer *lay=[gestureRecognizer view].layer;
        CGFloat currentScale = [[lay valueForKeyPath:@"transform.scale"] floatValue];
        newScale = MIN(newScale, kMaxScale / currentScale);
        newScale = MAX(newScale, kMinScale / currentScale);
        
        CGFloat stateR=[gestureRecognizer scale];
        
        
        if(currentScale==1){
            [_currentImage removeGestureRecognizer:_panR];
            [_currentImage addGestureRecognizer:_solS];
            [_currentImage addGestureRecognizer:_sagS];
        }else{
            
            [_currentImage addGestureRecognizer:_panR];
            [_currentImage removeGestureRecognizer:_solS];
            [_currentImage removeGestureRecognizer:_sagS];
        }
        
        
    }

    
    
} 


- (IBAction)move:(UIPanGestureRecognizer *)recognizer {
    
    CGPoint newCenter = [recognizer translationInView:self.view];
    
	if([recognizer state] == UIGestureRecognizerStateBegan) {
        
		beginX = _currentImage.center.x;
		beginY = _currentImage.center.y;
	}
    
	newCenter = CGPointMake(beginX + newCenter.x, beginY + newCenter.y);
    
	[_currentImage setCenter:newCenter];
}
*/


- (IBAction)back:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}


@end
