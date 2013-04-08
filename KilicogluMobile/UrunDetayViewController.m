
//
//  UrunDetayViewController.m
//  KilicogluMobile
//
//  Created by mac on 11/1/12.
//  Copyright (c) 2012 com.filosoft. All rights reserved.
//

#import "UrunDetayViewController.h"
#import "FotoGaleri.h"
#import "VideoViewController.h"
#import "AnasayfaViewController.h"
#import "UrunlerViewController.h";
#import "UrunListContainerViewController.h"
#import "TumUrunlerViewController.h"
#import "UrunUtil.h"
#import "FotoGalleryView.h"
#import "FotoSliderViewViewController.h"
@interface UrunDetayViewController ()

@end

@implementation UrunDetayViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{     self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        
        
            }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
   // _mainImage.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
   // _titleImage.autoresizingMask= UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
   
  
    
    UIImage  *titleim=[UIImage  imageNamed:[_detayOb titleImageN]];
    //UIImage  *mainim=[UIImage imageNamed:[_detayOb  mainImageN]];
  
    _titleImage.image=titleim;

  
   // CGRect frame2=CGRectMake(_mainImage.frame.origin.x, _mainImage.frame.origin.y,mainim.size.width, mainim.size.height);
    //[_mainImage setFrame:frame2];
   // [_mainImage setBounds:frame2];
    //_mainImage.image=mainim;
    //CGFloat contentOffset = 0.0f;
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[_detayOb  mainImageN]]];
    [ imageView setUserInteractionEnabled:YES];
   //[imageView setCenter:_scrollViewRef.center];
    [_scrollViewRef setContentSize:imageView.frame.size];
    [_scrollViewRef addSubview:imageView];

 
   
    

}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    performed=NO;
    tovideo=NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) loadFotos{
    if (!assetsLibrary) {
        assetsLibrary = [[ALAssetsLibrary alloc] init];
    }
    
    if (!assets) {
        assets = [[NSMutableArray alloc] init];
    } else {
        [assets removeAllObjects];
    }
    ALAssetsGroupEnumerationResultsBlock assetsEnumerationBlock = ^(ALAsset *result, NSUInteger index, BOOL *stop) {
   
        if (result) {
            
                
            if ([[result valueForProperty:ALAssetPropertyType] isEqualToString:ALAssetTypeVideo]) {
                video=result;
                if(tovideo){
                    tovideo=NO;
                    performed=YES;
                    [self performSegueWithIdentifier:@"toVideo" sender:nil];
                }
            }
            if ([[result valueForProperty:ALAssetPropertyType] isEqualToString:ALAssetTypePhoto]) {
                 [assets addObject:result];
            }
           
        }else{
       
            if(assets &&  assets.count>0 && !performed){
                [self performSegueWithIdentifier:@"toFotoG" sender:assets];
            }
        }
    };
    
 
    
    
    
    ALAssetsLibraryGroupsEnumerationResultsBlock listGroupBlock = ^(ALAssetsGroup *group, BOOL *stop) {
        
        if (group) {
            NSString  *groupName=[group valueForProperty:ALAssetsGroupPropertyName];
            NSString  *grupName=_detayOb.albumName;
            if(_isfromSekil){
                NSString  *albumname=_detayOb.videosekilAlbum;
                grupName=albumname;
            }
            
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

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{

    if ([segue.identifier isEqualToString:@"toFotoGaleri"] ){
       
        FotoGaleri *listContainer=(FotoGaleri *) segue.destinationViewController;
      
        fotoGaleri=listContainer;
        if(assets!=nil && fotoGaleri.gallery==nil){
            fotoGaleri.assets=assets;
        }
        if(assets!=nil && fotoGaleri.gallery!=nil && fotoGaleri.gallery==nil){
            fotoGaleri.gallery.assets=assets;
        }
    
    }
    if ([segue.identifier isEqualToString:@"toFotoG"] ){
        
        FotoSliderViewViewController *listContainer=(FotoSliderViewViewController *) segue.destinationViewController;
     
        listContainer.assets=sender;
        listContainer.root=self;
        
    }
    if ([segue.identifier isEqualToString:@"toAksesuar"] ){
        
        UrunDetayViewController *listContainer=(UrunDetayViewController *) segue.destinationViewController;
        
        listContainer.detayOb=[UrunUtil getDetayObject:_detayOb.aksesuarId];
        
        
    }    if ([segue.identifier isEqualToString:@"toVideo"] ){
        
        VideoViewController *listContainer=(VideoViewController *) segue.destinationViewController;

       // listContainer.detayOb=_detayOb;
        videoView=listContainer;
        if(video!=nil && videoView.video==nil){
            videoView.video=video;
        }
        
    }
}
- (IBAction)toGalery:(UIButton *)sender {
    
         _isfromSekil=NO;    
        [self loadFotos];
      
}
- (IBAction)back:(UIButton *)sender {
  /*  NSString *storyBoarId;
     if ([_caller isKindOfClass:[AnasayfaViewController class]]){
        storyBoarId=@"anasayfaViewId";
     } if ([_caller isKindOfClass:[UrunlerViewController class]]){
         storyBoarId=@"urunlerViewId";
     }    //UrunListContainerViewController
    if ([_caller isKindOfClass:[UrunListContainerViewController class]]){
        storyBoarId=@"urunListViewId";
    }
    if ([_caller isKindOfClass:[TumUrunlerViewController class]]){
        storyBoarId=@"tumUrunlerViewId";
    } */
 
    
   // UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
   // UIViewController *vc = [mainStoryboard instantiateViewControllerWithIdentifier:storyBoarId];
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)toVideo:(UIButton *)sender {
          tovideo=YES;
         [self loadFotos];
    
   
    
    }

- (IBAction)aksesuar:(UIButton *)sender {
    if(_detayOb.hasAksesuar){
        [self  performSegueWithIdentifier:@"toAksesuar" sender:nil];
    }
    
}

- (IBAction)uygulamaSekil:(UIButton *)sender {
    _isfromSekil=YES;
    [self loadFotos];
          
        
   
    
   }
@end










