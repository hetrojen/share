//
//  PopupMenu.h
//  KilicogluMobile
//
//  Created by mac on 10/30/12.
//  Copyright (c) 2012 com.filosoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PopupMenu : UITableViewController{
    NSMutableArray *items;
    NSArray *imageList;
  
}

@property    UIViewController   *parent;
@property  NSString *segueId;
@property  UIPopoverController *popup;
- (void)setItems:(NSMutableArray *)p_items;
@end
