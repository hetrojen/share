//
//  TeknikCizimlerViewController.m
//  KilicogluMobile
//
//  Created by mac on 10/29/12.
//  Copyright (c) 2012 com.filosoft. All rights reserved.
//

#import "TeknikCizimlerViewController.h"

@interface TeknikCizimlerViewController ()

@end

@implementation TeknikCizimlerViewController

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
             
                
            }
            if ([[result valueForProperty:ALAssetPropertyType] isEqualToString:ALAssetTypePhoto]) {
                [assets addObject:result];
            }
            
        }else{
          
            
                [self performSegueWithIdentifier:@"toFotoGG" sender:assets];
            
            
         
            
        }
    };
    
    
    
    
    
    ALAssetsLibraryGroupsEnumerationResultsBlock listGroupBlock = ^(ALAssetsGroup *group, BOOL *stop) {
        
        if (group) {
            if([[group valueForProperty:ALAssetsGroupPropertyName] isEqualToString:@"teknikcizim"]){
                
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
    
    if ([segue.identifier isEqualToString:@"toFotoGG"] ){
        
        FotoSliderViewViewController *listContainer=(FotoSliderViewViewController *) segue.destinationViewController;
        
        listContainer.assets=sender;
        listContainer.root=nil;
        
    }
    
    
  /*  if ([segue.identifier isEqualToString:@"teknikG"] ){
        
        PhotoGallery *listContainer=(PhotoGallery *) segue.destinationViewController;
        
          photoGallery=listContainer;
        if(assets!=nil && photoGallery==nil){
            photoGallery.assets=assets;
        }
    
        
    }*/
}
-(void)viewWillAppear:(BOOL)animated{
    }

@end
