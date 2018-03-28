//
//  QWMOrganization.h
//  ios 多级目录
//
//  Created by Apple on 2018/3/27.
//  Copyright © 2018年 qinmei. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

@protocol QWMOrganization <NSObject>

@optional
/*! @brief 组合结构-分支id. */
@property(nonatomic,copy)NSString* branch_id;
/*! @brief 组合结构-分支名称. */
@property(nonatomic,copy)NSString* branch_name;
/*! @brief 组合结构-分支能否展开. */
@property(nonatomic,assign)BOOL state;
/*! @brief 组合结构-子分支. */
@property(nonatomic,strong)NSMutableArray<QWMOrganization>* data;
/*! @brief 组合结构-节点名称. */
@property(nonatomic,copy)NSString* username;
/*! @brief 组合结构-节点id. */
@property(nonatomic,copy)NSString* user_id;
/*! @brief 组合结构-节点头像. */
@property(nonatomic,strong)NSURL* icon;
/*! @brief 组合结构-节点描述. */
@property(nonatomic,copy)NSString* introduce;
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
