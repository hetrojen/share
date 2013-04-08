//
//  FotoGaleriViewController.m
//  KilicogluMobile
//
//  Created by mac on 1/23/13.
//  Copyright (c) 2013 com.filosoft. All rights reserved.
//

#import "FotoGaleriViewController.h"
#import "FotoSliderViewViewController.h"
@interface FotoGaleriViewController ()

@end

@implementation FotoGaleriViewController

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
    
    if ([segue.identifier isEqualToString:@"fotoo"] ){
        
        FotoSliderViewViewController *listContainer=(FotoSliderViewViewController *) segue.destinationViewController;
        
        
        
        listContainer.assets=_assets;
        
        
        
    }
    
}
- (IBAction)close:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
