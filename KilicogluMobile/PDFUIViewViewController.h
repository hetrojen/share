//
//  PDFUIViewViewController.h
//  KilicogluMobile
//
//  Created by mac on 11/28/12.
//  Copyright (c) 2012 com.filosoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PDFUIViewViewController : UIViewController
- (IBAction)geri:(id)sender;
@property (weak, nonatomic) IBOutlet UIWebView *webview;
@property  NSString  *fileName;
@end
