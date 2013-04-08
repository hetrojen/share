//
//  PopupItemObject.h
//  KilicogluMobile
//
//  Created by mac on 10/31/12.
//  Copyright (c) 2012 com.filosoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UrunDetayOb.h"
@interface PopupItemObject : NSObject

@property NSString  *label;
 @property   NSString  *image;
 @property   BOOL       hasSubItems;
   @property NSArray  *listOfSubItems;
@property  UrunDetayOb *detayObject;
@property int  katagori;
@end
