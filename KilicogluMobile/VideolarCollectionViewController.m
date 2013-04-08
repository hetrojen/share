//
//  VideolarCollectionViewController.m
//  KilicogluMobile
//
//  Created by mac on 1/7/13.
//  Copyright (c) 2013 com.filosoft. All rights reserved.
//

#import "VideolarCollectionViewController.h"
#import "videolarCell.h"
#import "VideoViewController.h"
@interface VideolarCollectionViewController ()

@end

@implementation VideolarCollectionViewController

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
    [self loadFotos];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)collectionView:(UICollectionView *)colView
     didUnhighlightItemAtIndexPath:(NSIndexPath *)indexPath {
     int index=indexPath.section*7+indexPath.row;
     if(index>=_assets.count){
         return;
     }
         ALAsset *asset = [_assets objectAtIndex:index];
    [self performSegueWithIdentifier:@"toVideo" sender:asset];
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"toVideo"] ){
        
        VideoViewController *listContainer=(VideoViewController *) segue.destinationViewController;
        
        // listContainer.detayOb=_detayOb;
        listContainer.video=sender;
    }
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if(_assets) {
        int index=indexPath.section*7+indexPath.row;       
        static  NSString *cellId;
        videolarCell *myCell;
        cellId=@"videoCell";        
        myCell=(videolarCell *) [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
        
        if(index<_assets.count){
            
            ALAsset *asset = [_assets objectAtIndex:index];
            UIImage *img= [UIImage imageWithCGImage:[asset thumbnail]];
            myCell.videoImage.image=img;
        }else{
            [myCell setHidden:YES];
             myCell.backgroundColor=[UIColor blackColor];
        }
        return myCell;
    }
}


-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    if (_assets) {
        if(_assets.count%7==0){
            return _assets.count/7;
        }else{
            return _assets.count/7+1;
        }
    }else{
        return 0;
    }
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
  
    return 7;
}
/*
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
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
         
         }  
        ALAsset *asset = [_assets objectAtIndex:0];
        UIImage *img= [UIImage imageWithCGImage:[asset thumbnail]];
        
        return  img.size;
    }
    return nil;
}
*/
-(void)loadFotos{
    if (!assetsLibrary) {
        assetsLibrary = [[ALAssetsLibrary alloc] init];
    }
    
    if (!_assets) {
        _assets = [[NSMutableArray alloc] init];
    } else {
        [_assets removeAllObjects];
    }
    ALAssetsGroupEnumerationResultsBlock assetsEnumerationBlock = ^(ALAsset *result, NSUInteger index, BOOL *stop) {
        
        if (result) {
            
            
            if ([[result valueForProperty:ALAssetPropertyType] isEqualToString:ALAssetTypeVideo]) {
                [_assets addObject:result];
                
            }           
            
            }
             else{
                [self.collectionView performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:NO];
              }
    
         };

        
        ALAssetsLibraryGroupsEnumerationResultsBlock listGroupBlock = ^(ALAssetsGroup *group, BOOL *stop) {
            
            if (group) {
                NSString  *groupName=[group valueForProperty:ALAssetsGroupPropertyName];
                NSString  *grupName=@"video";
                
                
                if([groupName isEqualToString:grupName]){
                    
                    _groupN=group;
                    
                    // ALAssetsFilter *onlyPhotosFilter = [ALAssetsFilter allPhotos];
                    // [_groupN setAssetsFilter:onlyPhotosFilter];
                    [_groupN enumerateAssetsUsingBlock:assetsEnumerationBlock];
                    
                }
            }
        };
        
        
        ALAssetsLibraryAccessFailureBlock failureBlock = ^(NSError *error) {
            // AssetsDataIsInaccessibleViewController *assetsDataInaccessibleViewController = [[AssetsDataIsInaccessibleViewController alloc] initWithNibName:@"AssetsDataIsInaccessibleViewController" bundle:nil];
            
            NSString *errorMessage = nil;
            switch ([error code]) {
                case ALAssetsLibraryAccessUserDeniedError:
                case ALAssetsLibraryAccessGloballyDeniedError:
                    errorMessage = @"The user has declined access to it.";
                    break;
                default:
                    errorMessage = @"Reason unknown.";
                    break;
            }
            
            //assetsDataInaccessibleViewController.explanation = errorMessage;
            //[self presentModalViewController:assetsDataInaccessibleViewController animated:NO];
            //[assetsDataInaccessibleViewController release];
        };
        
        NSUInteger groupTypes = ALAssetsGroupAlbum;
        
        [assetsLibrary enumerateGroupsWithTypes:groupTypes usingBlock:listGroupBlock failureBlock:failureBlock];
      
        
}
@end
