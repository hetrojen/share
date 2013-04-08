//
//  MainUrunlerViewController.m
//  KilicogluMobile
//
//  Created by mac on 11/2/12.
//  Copyright (c) 2012 com.filosoft. All rights reserved.
//

#import "MainUrunlerViewController.h"
#import  "UrunViewCell.h"
#import "UrunCollectionViewController.h"
#import "PopupMenu.h"
#import  "UrunUtil.h"
#import  "PopupItemObject.h"
#import "UrunListContainerViewController.h"
#import   "UrunDetayViewController.h"
#import "UrunDetayOb.h"
@interface MainUrunlerViewController ()

@end

@implementation MainUrunlerViewController

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

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _imageNames.count+(_imageNames.count-1);
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return  1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static  NSString *cellId;
    UrunViewCell *myCell;
    if( (indexPath.item+1)%2==0){
        cellId=@"MainCell2";
        myCell=(UrunViewCell *) [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
        
        
    }else{
        cellId=@"MainCell1";
        myCell=(UrunViewCell *) [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
       myCell.mainIm.image=[UIImage  imageNamed:[_imageNames objectAtIndex:((indexPath.item+1)/2)]];
        
        
    }
    
    return  myCell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if( (indexPath.item+1)%2==0){
        CGSize ss= CGSizeMake(8, 144);
        return ss;
    }else{
        CGSize ss= CGSizeMake(111, 144);
        return ss;
    }
    
}


- (void)collectionView:(UICollectionView *)colView
didHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell* cell = [colView cellForItemAtIndexPath:indexPath];
    cell.contentView.backgroundColor = [UIColor lightGrayColor];
    
}
- (void)collectionView:(UICollectionView *)colView
didUnhighlightItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell* cell = [colView cellForItemAtIndexPath:indexPath];
    cell.contentView.backgroundColor = nil;

    
    if(indexPath.item==0){
        _selectedUrunKatagori=KIREMITLER;
        
    }
    if(indexPath.item==2){
        _selectedUrunKatagori=CATI_SISTEMLERI;
    }
    
    if(indexPath.item==4){
      
        _selectedUrunKatagori=KIREMIT_LEVHASI;
    }
    if(indexPath.item==6){
        _selectedUrunKatagori=CATI_PENCERESI_CATI_CIKIS;        
        
    }
    if(indexPath.item==8){
        _selectedUrunKatagori=YAMUR_INDIRME_SISTEMLERI;
    }
    if(indexPath.item==10){
      
         _selectedUrunKatagori=TUGLALAR;
    }
    if(indexPath.item==12){
          _selectedUrunKatagori=KIREMIT_IRMIGI;
    }
    if(indexPath.item==14){
         _selectedUrunKatagori=GUNES_PANELI;
    }
    if(indexPath.item==16){
        _selectedUrunKatagori=DIS_CEPE_YALITIM;
    }
    
    if(_selectedUrunKatagori==GUNES_PANELI ||_selectedUrunKatagori==KIREMIT_IRMIGI || _selectedUrunKatagori==KIREMIT_LEVHASI
       || _selectedUrunKatagori==YAMUR_INDIRME_SISTEMLERI){
    
        
        if(_selectedUrunKatagori==GUNES_PANELI){
            UrunDetayOb *ob1=[UrunUtil getDetayObject:URUN_GUNES_PANELI];
            [self.parentViewController  performSegueWithIdentifier: @"mainToUrun" sender:ob1];
        }
        if(_selectedUrunKatagori==KIREMIT_IRMIGI){
            UrunDetayOb *ob1=[UrunUtil getDetayObject:URUN_KIREMIT_IRMIGI];
            [self.parentViewController  performSegueWithIdentifier: @"mainToUrun" sender:ob1];
        }
        if(_selectedUrunKatagori==KIREMIT_LEVHASI){
            UrunDetayOb *ob1=[UrunUtil getDetayObject:URUN_KIREMIT_LEVHASI];
            [self.parentViewController  performSegueWithIdentifier: @"mainToUrun" sender:ob1];
        }
        
        if(_selectedUrunKatagori==YAMUR_INDIRME_SISTEMLERI){
            UrunDetayOb *ob1=[UrunUtil getDetayObject:URUN_YAGMUR_INDIRME];
            [self.parentViewController  performSegueWithIdentifier: @"mainToUrun" sender:ob1];
        }
    }
    else{
        
       if([UrunUtil hasSubList:_selectedUrunKatagori]){
            UIStoryboard *sb = [UIStoryboard storyboardWithName:@"MainStoryboard"
                                                         bundle:nil];
            PopupMenu *detailController = [sb instantiateViewControllerWithIdentifier:@"popupMenuId"];
            
            [detailController setItems:[UrunUtil getListObjects:_selectedUrunKatagori]];
           
            detailController.parent=self.parentViewController;
            detailController.popup=_popCon;
            _popCon = [[UIPopoverController alloc] initWithContentViewController:detailController];
            detailController.popup=_popCon;
            _popCon.popoverContentSize = CGSizeMake(320, 416);
            
            [_popCon presentPopoverFromRect:cell.bounds inView:cell.contentView
                   permittedArrowDirections:UIPopoverArrowDirectionAny
                                   animated:YES];
            
            
        }else{
           
           [self.parentViewController  performSegueWithIdentifier:@"MainToList" sender:self];
        }
    
    }

    
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
 
 


}

@end
