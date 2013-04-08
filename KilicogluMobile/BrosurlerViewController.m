//
//  BrosurlerViewController.m
//  KilicogluMobile
//
//  Created by mac on 10/29/12.
//  Copyright (c) 2012 com.filosoft. All rights reserved.
//

#import "BrosurlerViewController.h"
#import "PDFUIViewViewController.h"
@interface BrosurlerViewController ()

@end

@implementation BrosurlerViewController

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
    //
    
    
    
    
    
    if ([segue.identifier isEqualToString:@"toPdf"] ){
        PDFUIViewViewController *listContainer=(PDFUIViewViewController *) segue.destinationViewController;
        listContainer.fileName=sender;
    }
    
    
    
}
@end
