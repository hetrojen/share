//
//  PDFUIViewViewController.m
//  KilicogluMobile
//
//  Created by mac on 11/28/12.
//  Copyright (c) 2012 com.filosoft. All rights reserved.
//

#import "PDFUIViewViewController.h"

@interface PDFUIViewViewController ()

@end

@implementation PDFUIViewViewController

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
    NSString *path = [[NSBundle mainBundle] pathForResource:_fileName ofType:@"pdf"];
    NSURL *url = [NSURL fileURLWithPath:path];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_webview loadRequest:request];
    
    _webview.scalesPageToFit=YES;
    _webview.scrollView.zoomScale = 4.0;


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)geri:(id)sender {
      [self.navigationController popViewControllerAnimated:YES];    
}
@end
