//
//  UrunlerViewController.m
//  KilicogluMobile
//
//  Created by mac on 10/29/12.
//  Copyright (c) 2012 com.filosoft. All rights reserved.
//

#import "UrunlerViewController.h"
#import "MainUrunlerViewController.h"
#import "UrunCollectionViewController.h"
#import "UrunUtil.h"
#import "PopupItemObject.h"
#import  "UrunDetayViewController.h"
#import  "UrunListContainerViewController.h"
@interface UrunlerViewController ()

@end

@implementation UrunlerViewController

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
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([segue.identifier isEqualToString:@"UrunMainList"]) {
        
        NSArray *imageNames=[[NSArray alloc] initWithObjects:@"kiremit_ana_secim1.png",@"catisistem_ana_secim1.png",@"kiremitlevha_seçimsayfaları1",@"catipenceresi_ana_secim1.png",@"yagmur_ana_secim1.png",
                             @"tuglalar_seçimsayfaları1.png",@"kiremitirmigi_ana_secim1.png",@"gunes_ana_secim1.png",@"isiyalitim_ana_secim1.png"
                               ,nil];
        MainUrunlerViewController *listContainer=(MainUrunlerViewController *) segue.destinationViewController;
        listContainer.imageNames=imageNames;
     
    
    }   
    if ([segue.identifier isEqualToString:@"MainToList"] ){
        
          if ([sender isKindOfClass:[MainUrunlerViewController class]]){
        MainUrunlerViewController *mainl=(MainUrunlerViewController *) sender;
        int _selectedUrunKatagori=mainl.selectedUrunKatagori;
        NSArray  *imageList=[UrunUtil getSubListObjects:_selectedUrunKatagori];
        UrunCollectionViewController *listContainer=(UrunCollectionViewController *) segue.destinationViewController;
        [listContainer setImages:imageList];
        listContainer.urunKatagori=_selectedUrunKatagori;
              
          }
        if ([sender isKindOfClass:[PopupItemObject class]]){
            PopupItemObject *ob= (PopupItemObject *)sender;
            UrunListContainerViewController *listContainer=(UrunListContainerViewController *) segue.destinationViewController;
            [listContainer setImages:ob.listOfSubItems];
            listContainer.urunKatagori=ob.katagori;
        }
    }
    
  
    if([segue.identifier isEqualToString:@"mainToUrun"]){
        
        if ([sender isKindOfClass:[PopupItemObject class]]){
        PopupItemObject *ob= (PopupItemObject *)sender;
        UrunDetayViewController *listContainer=(UrunDetayViewController *) segue.destinationViewController;
        [listContainer setDetayOb:ob.detayObject];
        }
         if ([sender isKindOfClass:[UrunDetayOb class]]){
         
             UrunDetayOb *ob= (UrunDetayOb *)sender;
             UrunDetayViewController *listContainer=(UrunDetayViewController *) segue.destinationViewController;
             [listContainer setDetayOb:ob];
         
         
         }
    
    }
    
    
    
}

@end
