/*!头文件基本信息。每个源代码文件的头文件最开头。

@header QMWDot.h

@abstract 源代码文件的基本描述

@author Created by Apple on 2018/3/27.

@version 1.00 2018/3/27Creation(此文档的版本信息)

  Copyright © 2018年 qinmei. All rights reserved.

*/

#import <Foundation/Foundation.h>

#import "QWMOrganization.h"

@interface QMWDot : NSObject<QWMOrganization>

/*! @brief 组合结构-节点名称. */
@property(nonatomic,copy)NSString* username;
/*! @brief 组合结构-节点id. */
@property(nonatomic,copy)NSString* user_id;
/*! @brief 组合结构-节点头像. */
@property(nonatomic,strong)NSURL* icon;
/*! @brief 组合结构-节点描述. */
@property(nonatomic,copy)NSString* introduce;

@end
