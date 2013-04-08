//
//  UrunCollectionViewController.m
//  KilicogluMobile
//
//  Created by mac on 10/29/12.
//  Copyright (c) 2012 com.filosoft. All rights reserved.
//

#import "UrunCollectionViewController.h"
#import  "UrunViewCell.h"
#import "UrunDetayViewController.h"
#import "UrunUtil.h"
@interface UrunCollectionViewController ()

@end

@implementation UrunCollectionViewController

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

-(void) setImages:(NSArray *)imageArray{
    imageNames=imageArray;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
 
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return imageNames.count+(imageNames.count-1);
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return  1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static  NSString *cellId;
    UrunViewCell *myCell;
    if( (indexPath.item+1)%2==0){
     cellId=@"UrunCellH1";
        myCell=(UrunViewCell *) [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
        
        
        }else{
              cellId=@"UrunCellH";
            myCell=(UrunViewCell *) [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
            myCell.imageInCell.image=[UIImage  imageNamed:[imageNames objectAtIndex:((indexPath.item+1)/2)]];
            
          
          }

       return  myCell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
  
    if( (indexPath.item+1)%2==0){
        CGSize ss= CGSizeMake(8, 100);
        return ss;
    }else{
        CGSize ss= CGSizeMake(106, 100);
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
   
        detayOb=[UrunUtil getDetayObject:_urunKatagori withObjectIndex:indexPath.item];
    
  
    if(indexPath.item%2==0){
        [[self parentViewController] performSegueWithIdentifier:@"detayFromList" sender:detayOb] ;
    }
    
    
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    //


  

    
    if ([segue.identifier isEqualToString:@"urunToList"] ){
            UrunCollectionViewController *listContainer=(UrunCollectionViewController *) segue.destinationViewController;
            [listContainer setImages:[UrunUtil getSubListObjects:_urunKatagori]];
            listContainer.urunKatagori=_urunKatagori;
                    
    }



}
@end
