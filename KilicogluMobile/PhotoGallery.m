//
//  PhotoGallery.m
//  KilicogluMobile
//
//  Created by mac on 11/13/12.
//  Copyright (c) 2012 com.filosoft. All rights reserved.
//

#import "PhotoGallery.h"
#import "PhotoGalleryCell.h"
#import <QuartzCore/QuartzCore.h>
@interface PhotoGallery ()

@end

@implementation PhotoGallery


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
  
   // MyFlowLayout *myLayout = [[MyFlowLayout alloc]init];
  // [self.collectionView setCollectionViewLayout:myLayout animated:YES];
    
    //UIGestureRecognizer *pinchRecognizer =
    //[[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(handlePinch:)];
    //  [myLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
   // [self.collectionView addGestureRecognizer:pinchRecognizer];
	// Do any additional setup after loading the view.
   
    
    //ALAsset *asset = [assets objectAtIndex:_index];
    //ALAssetRepresentation *assetRepresentation = [asset defaultRepresentation];
    //UIImage *first = [UIImage imageWithCGImage:[assetRepresentation fullScreenImage] scale:[assetRepresentation scale] orientation:(UIImageOrientation)[assetRepresentation orientation]];
 
    
}

- (IBAction)handlePinch:(UIPinchGestureRecognizer *)sender {
    
    // Get a reference to the flow layout
  
    MyFlowLayout *layout =
    (MyFlowLayout *)self.collectionView.collectionViewLayout;
    
    // If this is the start of the gesture
    if (sender.state == UIGestureRecognizerStateBegan)
    {
        // Get the initial location of the pinch?
        CGPoint initialPinchPoint =
        [sender locationInView:self.collectionView];
        
        //Convert pinch location into a specific cell
        NSIndexPath *pinchedCellPath =
        [self.collectionView indexPathForItemAtPoint:initialPinchPoint];
        
        // Store the indexPath to cell
        layout.currentCellPath = pinchedCellPath;
           curCell=(PhotoGalleryCell *)[self collectionView:self.collectionView cellForItemAtIndexPath:pinchedCellPath];          
    }
    else if (sender.state == UIGestureRecognizerStateChanged)
    {
        // Store the new center location of the selected cell
        layout.currentCellCenter =
        [sender locationInView:self.collectionView];
        // Store the scale value
        layout.currentCellScale = sender.scale;
      
    }
    else
    {
       [self.collectionView performBatchUpdates:^{
            layout.currentCellPath = nil;
            layout.currentCellScale = 1.0;
        } completion:nil];
         
         
    }
   
   // curCell.scroolview.contentSize=curCell.frame.size;
    
/*
    CGPoint initialPinchPoint;
    if([sender state] == UIGestureRecognizerStateBegan) {
        // Reset the last scale, necessary if there are multiple objects with different scales
        lastScale = [sender scale];
         initialPinchPoint =
        [sender locationInView:self.collectionView];
        
        //Convert pinch location into a specific cell
        NSIndexPath *pinchedCellPath =
        [self.collectionView indexPathForItemAtPoint:initialPinchPoint];
        
        // Store the indexPath to cell
        curCell=(PhotoGalleryCell *)[self collectionView:self.collectionView cellForItemAtIndexPath:pinchedCellPath];
        
        
    }
    
    if ([sender state] == UIGestureRecognizerStateBegan ||
        [sender state] == UIGestureRecognizerStateChanged) {
       
        UIImageView *img=(UIImageView *)[curCell.scroolview.subviews objectAtIndex:0];
        CALayer *lay=img.layer;
        CGFloat currentScale = [[lay valueForKeyPath:@"transform.scale"] floatValue];
        
        // Constants to adjust the max/min values of zoom
        const CGFloat kMaxScale = 2.0;
        const CGFloat kMinScale = 1.0;
        
        CGFloat newScale = 1 -  (lastScale - [sender scale]); // new scale is in the range (0-1)
        newScale = MIN(newScale, kMaxScale / currentScale);
        newScale = MAX(newScale, kMinScale / currentScale);
        
        CGAffineTransform transform = CGAffineTransformScale([[sender view] transform], newScale, newScale);
                img.transform = transform;
       
        curCell.scroolview.contentSize = img.frame.size;
         [curCell reloadInputViews];
        lastScale = [sender scale];
    }
  
    
    */
    
    
    
}


-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    return YES;
}

-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return  YES;
}

-(BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    return  YES;
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    int i=0;
    i++;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if(_assets){
        
     /*   ALAsset *asset = [_assets objectAtIndex:indexPath.item];
        ALAssetRepresentation *assetRepresentation = [asset defaultRepresentation];
        UIImage *first = [UIImage imageWithCGImage:[assetRepresentation fullScreenImage] scale:[assetRepresentation scale] orientation:(UIImageOrientation)[assetRepresentation orientation]];
        NSInteger with= first.size.width;
        NSInteger he=first.size.height;
        if(with<=800 && he<=550){
            return  CGSizeMake(with, he);
        }
        float   rw = (float)with/800;
        float    rh=(float)he/550;
        if(rw==rh){
            return  CGSizeMake(800, 550);
        }
        if(rw<rh){
            NSInteger nw= (int)with/rh;
            NSInteger nh=(int)he/rh;
            return  CGSizeMake(nw,nh);
        }
        if(rh<rw){
            NSInteger nw= (int)with/rw;
            NSInteger nh=(int)he/rw;
            return  CGSizeMake(nw,nh);
        
        }  */
          return  CGSizeMake(990, 650);     
     }
  

}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
 
    if(_assets) {
        
        ALAsset *asset = [_assets objectAtIndex:indexPath.item];
        
        ALAssetRepresentation *assetRepresentation = [asset defaultRepresentation];
        
       
   
        
     
        
       
        
        
       UIImage *first = [UIImage imageWithCGImage:[assetRepresentation fullScreenImage] scale:[assetRepresentation scale] orientation:(UIImageOrientation)[assetRepresentation orientation]];
        
        
        static  NSString *cellId;
        PhotoGalleryCell *myCell;
        cellId=@"photocell";
               
        myCell=(PhotoGalleryCell *) [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
        
        
        
        UIImageView *imageView; 
      
        
        
        
        
     
      
      

        
  
            
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
    
                    //
                  
        if(indexPath.item>2){
            imageView.center=myCell.scroolview.center;
        }
       
        for (UIView *subview in  myCell.scroolview.subviews){
            [subview removeFromSuperview];
        }
           [ imageView setUserInteractionEnabled:YES];
           [ imageView setMultipleTouchEnabled:YES];
        [myCell.scroolview addSubview:imageView];
         
       // myCell.scroolview.contentSize=imageView.frame.size;
     
        return myCell;
        //_currentImage=myCell.currentImage;
       // _currentImage.image=first;
      //  UIPinchGestureRecognizer *pinchGes=[[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(resize:)];
       // [pinchGes setDelegate:myCell];
       // [pinchGes setDelaysTouchesBegan:YES];
       // UIPanGestureRecognizer *panGes=[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(move:)];
       // [panGes setDelegate:self];
        //[panGes setDelaysTouchesBegan:YES];
        //[_currentImage setUserInteractionEnabled:YES];
        //[_currentImage setMultipleTouchEnabled:YES];
        //[_currentImage addGestureRecognizer:pinchGes];
        //[_currentImage addGestureRecognizer:panGes  ];
        
      
    }

     
    }

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return  1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if(_assets){
        return _assets.count;
    
    }else{
        return 0;
    }
    
}
/*

- (void)resize:(UIPinchGestureRecognizer *)gestureRecognizer {
    
    
    
    
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
        
        
        
        
    }
}
*/

/*
- (UIEdgeInsets)collectionView:
(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(5, 5, 5, 5);
}*/

/*
- (void)move:(UIPanGestureRecognizer *)recognizer {
    
    CGPoint newCenter = [recognizer translationInView:self.view];
    
	if([recognizer state] == UIGestureRecognizerStateBegan) {
        
		beginX = _currentImage.center.x;
		beginY = _currentImage.center.y;
	}
    
	newCenter = CGPointMake(beginX + newCenter.x, beginY + newCenter.y);
    
	[_currentImage setCenter:newCenter];}

     
    */


- (IBAction)buyut:(UIPinchGestureRecognizer *)sender {
    int i=0;
    i++;
}
@end
