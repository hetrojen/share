//
//  KurumsalViewController.m
//  KilicogluMobile
//
//  Created by mac on 10/29/12.
//  Copyright (c) 2012 com.filosoft. All rights reserved.
//

#import "KurumsalViewController.h"
#import "FotoSliderViewViewController.h"
#import "VideoViewController.h"
@interface KurumsalViewController ()

@end

@implementation KurumsalViewController




- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
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
                
                if([albumName isEqualToString:@"sirket_profili"]){
                    video=result;
                    if(toVideo){
                        toVideo=NO;
                        performed=YES;
                        [self performSegueWithIdentifier:@"kurumsalToVideo" sender:nil];
                       
                    }
                                       
                }
                
                
            }
            if ([[result valueForProperty:ALAssetPropertyType] isEqualToString:ALAssetTypePhoto]) {
                [assets addObject:result];
            }
            
        }else{
            if(assets &&  assets.count>0 && !performed){
               [self performSegueWithIdentifier:@"kurumsalToFoto" sender:nil];
            }
        }
    };
    
    
    
    
    
    ALAssetsLibraryGroupsEnumerationResultsBlock listGroupBlock = ^(ALAssetsGroup *group, BOOL *stop) {
        
        if (group) {
            NSString  *groupName=[group valueForProperty:ALAssetsGroupPropertyName];
                       
            if([groupName isEqualToString:albumName]){
                
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
    [super viewWillAppear:YES];
    toVideo=NO;
    performed=NO;
}
- (IBAction)doSirket:(UIButton *)sender {

        albumName=@"sirket_profili";
        [self loadFotos];
   
    
  //  [self performSegueWithIdentifier:@"kurumsalToFoto" sender:nil];
}

- (IBAction)doTarihce:(UIButton *)sender {
    

        albumName=@"tarihce";
        [self loadFotos];
 
    
  //  [self performSegueWithIdentifier:@"kurumsalToFoto" sender:nil];
}

- (IBAction)doKalite:(UIButton *)sender {
    
        albumName=@"kalite";
        [self loadFotos];
   
    
   // [self performSegueWithIdentifier:@"kurumsalToFoto" sender:nil];
}

- (IBAction)doKurumsalVideo:(UIButton *)sender {
   
         albumName=@"sirket_profili";
    toVideo=YES;
        [self loadFotos];
   
    
    
  //  [self performSegueWithIdentifier:@"kurumsalToVideo" sender:nil];
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([segue.identifier isEqualToString:@"kurumsalToFoto"] ){
        
        FotoSliderViewViewController *listContainer=(FotoSliderViewViewController *) segue.destinationViewController;
        
       
        
            listContainer.assets=assets;
            listContainer.root=self;
        
        
    }
    
    if ([segue.identifier isEqualToString:@"kurumsalToVideo"] ){
        
        VideoViewController *listContainer=(VideoViewController *) segue.destinationViewController;
        
        // listContainer.detayOb=_detayOb;
        videoView=listContainer;
        if(video!=nil && videoView.video==nil){
            videoView.video=video;
        }
        
    }
}

@end
