//
//  UrunListContainerViewController.m
//  KilicogluMobile
//
//  Created by mac on 10/29/12.
//  Copyright (c) 2012 com.filosoft. All rights reserved.
//

#import "UrunListContainerViewController.h"
#import "UrunCollectionViewController.h"
#import "UrunDetayViewController.h"
@interface UrunListContainerViewController ()

@end

@implementation UrunListContainerViewController

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
-(void) setImages:(NSArray *)imageArray{
    imageNames=imageArray;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    
    if ([segue.identifier isEqualToString:@"detayFromList"]) {
        
        UrunDetayViewController *listContainer=(UrunDetayViewController *) segue.destinationViewController;
        listContainer.detayOb=sender;
               
    }
    
    if ([segue.identifier isEqualToString:@"UrunList"]) {
      
        UrunCollectionViewController *listContainer=(UrunCollectionViewController *) segue.destinationViewController;
        [listContainer setImages:imageNames];
        listContainer.urunKatagori=_urunKatagori;
    }


}

- (IBAction)back:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
