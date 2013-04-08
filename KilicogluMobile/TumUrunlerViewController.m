//
//  TumUrunlerViewController.m
//  KilicogluMobile
//
//  Created by mac on 10/29/12.
//  Copyright (c) 2012 com.filosoft. All rights reserved.
//

#import "TumUrunlerViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "UrunDetayOb.h"
#import "UrunDetayViewController.h"
#import "UrunUtil.h"
@interface TumUrunlerViewController ()


@end
@implementation TumUrunlerViewController


- (void)viewDidLoad
{   [super viewDidLoad];

   // [self.contentView setAutoresizesSubviews:YES];

    for (UIView *subview in self.contentView.subviews)
    {
        if(subview.tag>0 && subview.tag<32){
             UITapGestureRecognizer *pinchGes=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(toDetail:)];
          //  [pinchGes setDelegate:self];
            [pinchGes setDelaysTouchesBegan:YES];
            if( [subview gestureRecognizers].count ==0){
                [subview addGestureRecognizer:pinchGes];
            }
            
        }
 
             
    }
    _scroolview.minimumZoomScale=1.0;
    _scroolview.maximumZoomScale=2.0;
    _scroolview.contentSize=CGSizeMake(_contentView.frame.size.width, _contentView.frame.size.height);
}
/*
-(void)viewWillAppear:(BOOL)animated{
    //  self.scroolview.contentSize = self.contentView.frame.size;
    [super viewWillAppear:YES];
 
}  */
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
   // self.scroolview.contentSize = self.contentView.frame.size;
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
-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return  _contentView;
}
/*
- (IBAction)resize:(UIPinchGestureRecognizer *)gestureRecognizer {
    
    
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
     self.scroolview.contentSize = self.contentView.frame.size;
    //  self.scroolview.contentSize = self.contentView.frame.size;
}

*/


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"toDetailFromT"]){

        UrunDetayViewController *listContainer=(UrunDetayViewController *) segue.destinationViewController;
        [listContainer setDetayOb:sender];      
        
    }
}
- (void)toDetail:(UITapGestureRecognizer *)sender {
    UrunDetayOb *ob=[[UrunDetayOb alloc]init];
    UIImageView *imgsrc= (UIImageView *) [sender view];
    NSInteger idf=[imgsrc tag];
    /*ob.titleImageN=nil;
    ob.mainImageN=nil;
    ob.videoName=nil;
    ob.fotos=nil; */
  
    idf+=100;
    if(idf==URUN_YAKASER){
        return;
    }
    ob= [UrunUtil getDetayObject:idf];
   /*
    if([idf isEqualToString:@"but2"]){
        ob.titleImageN=@"akdeniz_baslik3.png";
        ob.mainImageN=@"akdeniz_birlesik3.png";
    }
   if([idf isEqualToString:@"but1"]){
        ob.titleImageN=@"alaturka_baslik.png";
        ob.mainImageN=@"alaturka_birlesik.png";
    }
   if([idf isEqualToString:@"but16"]){
        ob.titleImageN=@"granada_baslik.png";
        ob.mainImageN=@"granada_birlesik.png";
        ob.videoName=@"deneme";
        ob.albumName=@"granada";
   }

    if([idf isEqualToString:@"but1"]){
        ob.titleImageN=@"kilicoglu_baslik.png";
        ob.mainImageN=@"kilicoglu1_birlesik.png";
    }
    if([idf isEqualToString:@"but1"]){
        ob.titleImageN=@"valensiya_baslik.png";
        ob.mainImageN=@"valensiya_birlesik.png";
    }
    if([idf isEqualToString:@"but1"]){
        ob.titleImageN=@"hitit_baslik.png";
        ob.mainImageN=@"hitit_atesi_birlesik.png";
    }
    if([idf isEqualToString:@"but1"]){
        ob.titleImageN=@"frigya_baslik.png";
        ob.mainImageN=@"frigya_atesi_birlesik.png";
    }
    
    if([idf isEqualToString:@"but1"]){
        ob.titleImageN=@"truva_baslik.png";
        ob.mainImageN=@"truva_atesi_birlesik.png";
    }*/
    
    
    
    
    //
    
    [self performSegueWithIdentifier:@"toDetailFromT" sender:ob];
}
/*
- (IBAction)move:(UIPanGestureRecognizer *)recognizer {

    CGPoint newCenter = [recognizer translationInView:[recognizer view]];
   /*
    if( (beginX + newCenter.x)<0  || (beginY + newCenter.y)<0  ||  (beginX + newCenter.x)>990 || (beginX + newCenter.x)>650 ){
        return;
    }
 
	if([recognizer state] == UIGestureRecognizerStateBegan) {
        
		beginX = [recognizer view] .center.x;
		beginY = [recognizer view] .center.y;
	}
  
    
	newCenter = CGPointMake(beginX + newCenter.x, beginY + newCenter.y);
    
	[[recognizer view] setCenter:newCenter];

}  */

@end
