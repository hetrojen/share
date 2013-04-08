//
//  IletisimViewController.m
//  KilicogluMobile
//
//  Created by mac on 10/29/12.
//  Copyright (c) 2012 com.filosoft. All rights reserved.
//

#import "IletisimViewController.h"
#import "ContactViewController.h"
@interface IletisimViewController ()

@end

@implementation IletisimViewController

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


- (IBAction)yetkili:(UIButton *)sender {
    imageName=@"kılıçoglu_yetkili_servis1.png";
    [self performSegueWithIdentifier:@"toContacts" sender:nil];
}

- (IBAction)distributor:(UIButton *)sender {
    imageName=@"kılıçoglu_dist1.png";
    [self performSegueWithIdentifier:@"toContacts" sender:nil];
}

- (IBAction)kilicogluyetkili:(UIButton *)sender {
    imageName=@"kilicoglu_yetkilileri2.png";    
     [self performSegueWithIdentifier:@"toContacts" sender:nil];
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"toContacts"] ){
         ContactViewController *listContainer=(ContactViewController*) segue.destinationViewController;
        listContainer.imageName=imageName;
    }
    
    
}
@end
