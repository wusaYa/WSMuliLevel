//
//  QMWHeadContent.h
//  ios 多级目录
//
//  Created by Apple on 2018/3/27.
//  Copyright © 2018年 qinmei. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "QWMOrganization.h"

@interface QMWHeadContent : UIView

@property(nonatomic,strong)id<QWMOrganization> model;

@property(nonatomic,copy)NSString* content;

-(void)upDateFrameUp;

-(void)upDateFrameDown;
@end
