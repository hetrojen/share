//
//  AnasayfaViewController.m
//  KilicogluMobile
//
//  Created by mac on 10/29/12.
//  Copyright (c) 2012 com.filosoft. All rights reserved.
//

#import "AnasayfaViewController.h"
#import  "UrunListContainerViewController.h"
#import  "PopupMenu.h"
#import "PopupItemObject.h"
#import "UrunDetayViewController.h"
#import  "UrunUtil.h"
@interface AnasayfaViewController ()

@end

@implementation AnasayfaViewController

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
    
    if ([segue.identifier isEqualToString:@"AnaKiremit"]) {
     
        UrunListContainerViewController *listContainer=(UrunListContainerViewController *) segue.destinationViewController;
        [listContainer setImages:[UrunUtil getSubListObjects:KIREMITLER]];
        listContainer.urunKatagori=KIREMITLER;
           
    }
    if ([segue.identifier isEqualToString:@"AnaYalitim"]) {
     
        UrunListContainerViewController *listContainer=(UrunListContainerViewController *) segue.destinationViewController;
        [listContainer setImages:[UrunUtil getSubListObjects:DIS_CEPE_YALITIM]];
           listContainer.urunKatagori=DIS_CEPE_YALITIM;
    
    
    }
    if ([segue.identifier isEqualToString:@"AnaTugla"]) {
     
        UrunListContainerViewController *listContainer=(UrunListContainerViewController *) segue.destinationViewController;
        [listContainer setImages:[UrunUtil getSubListObjects:TUGLALAR]];
        listContainer.urunKatagori=TUGLALAR;
    }
    
    if([segue.identifier isEqualToString:@"ImageDetail"]){
        PopupItemObject *ob= (PopupItemObject *)sender;
        UrunListContainerViewController *listContainer=(UrunListContainerViewController *) segue.destinationViewController;
        [listContainer setImages:ob.listOfSubItems];
           listContainer.urunKatagori=ob.katagori;
    }
    if([segue.identifier isEqualToString:@"urunDetay"]){
        PopupItemObject *ob= (PopupItemObject *)sender;
        UrunDetayViewController *listContainer=(UrunDetayViewController *) segue.destinationViewController;
        [listContainer setDetayOb:ob.detayObject];
      
        
    
        
    }
    
    
    
if ([segue.identifier isEqualToString:@"AnaCati"]) {
    
    
  
   /* NSArray *labelNames=[[NSArray alloc] initWithObjects:@"Baca Şapkası",@"Baca ve Duvar çözümleri",@"Detay Çözümleri",@"Havalandırma Ürünleri",@"Isı ve Su Yalıtımı",@"Mahya Altı Çözümleri",nil];  */
    PopupMenu *listContainer=(PopupMenu *) segue.destinationViewController;
    
    listContainer.parent=self;
    listContainer.popup=[(UIStoryboardPopoverSegue *)segue popoverController];    
    [listContainer  setItems:[UrunUtil getListObjects:CATI_SISTEMLERI]];
    
}}

@end
