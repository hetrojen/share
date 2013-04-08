//
//  BrosurlerCollectionViewController.m
//  KilicogluMobile
//
//  Created by mac on 11/28/12.
//  Copyright (c) 2012 com.filosoft. All rights reserved.
//

#import "BrosurlerCollectionViewController.h"
#import "BrosurCell.h"
#import "PDFUIViewViewController.h"
@interface BrosurlerCollectionViewController ()

@end

@implementation BrosurlerCollectionViewController

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
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return  2;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    return 5;
}
- (void)collectionView:(UICollectionView *)colView
didUnhighlightItemAtIndexPath:(NSIndexPath *)indexPath {
    NSString *brosur;
    if(indexPath.section==0 && indexPath.item==0){
        brosur=@"1bt_4faba88279a0a";
        
    }
    if(indexPath.section==0 && indexPath.item==1){
        brosur=@"2bt_4fab79d06f018";
        
    }
    if(indexPath.section==0 && indexPath.item==2){
        brosur=@"3bt_4fab7961e3bd8";
        
    }
    
    if(indexPath.section==0 && indexPath.item==3){
        brosur=@"4bt_4e520d6f5a755";
        
    }
    
    if(indexPath.section==0 && indexPath.item==4){
       brosur=@"5bt_4fab79ed8f877";
        
    }
    if(indexPath.section==1 && indexPath.item==0){
       brosur=@"6bt_4ccfd1d5cf725";
        
    }
    
    if(indexPath.section==1 && indexPath.item==1){
        brosur=@"7bt_4ccfd163b5aa3";
        
    }
    
    if(indexPath.section==1 && indexPath.item==2){
        brosur=@"8bt_506bf6422ab06";
        
    }
    if(indexPath.section==1 && indexPath.item==3){
       brosur=@"9bt_4ccfccfa266fe";
        
    }
    if(indexPath.section==1 && indexPath.item==4){
       brosur=@"ffff.jpg";
        
        
    }
    [self.parentViewController performSegueWithIdentifier:@"toPdf" sender:brosur];
    
    }
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    
    
    if ([segue.identifier isEqualToString:@"toGallery"] ){
        
        PDFUIViewViewController *listContainer=(PDFUIViewViewController *) segue.destinationViewController;
        listContainer.fileName=sender;
        
    }
    
    
    
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    static  NSString *cellId;
    BrosurCell *myCell;
    cellId=@"BrosurCell";
     myCell=(BrosurCell *) [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    UIImage *im;
    if(indexPath.section==0 && indexPath.item==0){
        im=[UIImage imageNamed:@"1bt_4faba87412b7e.jpg"];
            
     }
    if(indexPath.section==0 && indexPath.item==1){
        im=[UIImage imageNamed:@"2bt_4ef42afbd1adf.jpg"];
        
    }
    if(indexPath.section==0 && indexPath.item==2){
        im=[UIImage imageNamed:@"3bt_4fab799f9d6f9.jpg"];
        
    }
    
    if(indexPath.section==0 && indexPath.item==3){
        im=[UIImage imageNamed:@"4bt_4ccfd642a2040.jpg"];
        
    }
    
    if(indexPath.section==0 && indexPath.item==4){
        im=[UIImage imageNamed:@"5bt_4fab7a39de03b.jpg"];
        
    }
    if(indexPath.section==1 && indexPath.item==0){
        im=[UIImage imageNamed:@"6bt_4ccfe7ce0bd86.jpg"];
        
    }
    
    if(indexPath.section==1 && indexPath.item==1){
        im=[UIImage imageNamed:@"7bt_4ccfe7c2e832f.jpg"];
        
    }
    
    if(indexPath.section==1 && indexPath.item==2){
        im=[UIImage imageNamed:@"8bt_506c424c281d6.jpg"];
        
    }
    if(indexPath.section==1 && indexPath.item==3){
        im=[UIImage imageNamed:@"9bt_4ccfe7a89f796.jpg"];
        
    }
    if(indexPath.section==1 && indexPath.item==4){
        im=[UIImage imageNamed:@"ffff.jpg"];
        
        
    }
    myCell.image.image=im;
    myCell.label.text=@"";
    
return  myCell;

}

@end
