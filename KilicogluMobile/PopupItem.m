//
//  PopupItem.m
//  KilicogluMobile
//
//  Created by mac on 10/30/12.
//  Copyright (c) 2012 com.filosoft. All rights reserved.
//

#import "PopupItem.h"

@implementation PopupItem

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
