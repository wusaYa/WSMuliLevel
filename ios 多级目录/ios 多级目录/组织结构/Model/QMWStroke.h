/*!头文件基本信息。每个源代码文件的头文件最开头。

@header QMWStroke.h

@abstract 源代码文件的基本描述

@author Created by Apple on 2018/3/27.

@version 1.00 2018/3/27Creation(此文档的版本信息)

  Copyright © 2018年 qinmei. All rights reserved.

*/

#import <Foundation/Foundation.h>

#import "QWMOrganization.h"

#import "QMWStroke.h"

@interface QMWStroke : NSObject<QWMOrganization>

NS_ASSUME_NONNULL_BEGIN

@property(nonatomic,copy)NSString* branch_id;

@property(nonatomic,copy)NSString* branch_name;

@property(nonatomic,assign)BOOL state;

@property(nonatomic,assign)NSInteger rate;

NS_ASSUME_NONNULL_END

@property(nonatomic,strong)NSMutableArray<NSMutableArray<QMWStroke*>*>* _Nullable data;

/*!
	@method childCount
	@abstract  组合结构-获取当前分支节点个数.
	@discussion 组合结构-获取当前分支节点个数.
 @result NSInteger
 */
-(NSInteger)childCount;

/*!
	@method selfFrame
	@abstract  组合结构-获取当前分支frame.
	@discussion 组合结构-获取当前分支frame.
 @result CGFloat
 */
-(CGFloat)selfFrame;
@end
