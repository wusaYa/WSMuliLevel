//
//  QMWStroke.m
//  ios 多级目录
//
//  Created by Apple on 2018/3/27.
//  Copyright © 2018年 qinmei. All rights reserved.
//

#import "QMWStroke.h"

#import <MJExtension.h>

@implementation QMWStroke

-(instancetype)init{
    if (self= [super init]) {
        _data=[[NSMutableArray alloc]init];
    }
    return self;
}

-(NSInteger)childCount{
    return _data.count;
}
-(CGFloat)selfFrame{
    if (_state) {
        return 44*self.childCount;
    }else{
        return 44;
    }
}
//NSString -> NSDate, nil -> @""【过滤字典的值（比如字符串日期处理为NSDate、字符串nil处理为@""）】
- (id)mj_newValueFromOldValue:(id)oldValue property:(MJProperty *)property
{
    if ([property.name isEqualToString:@"publisher"]) {
        if (oldValue == nil) return @"";
    } else if (property.type.typeClass == [NSDate class]) {
        NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
        fmt.dateFormat = @"yyyy-MM-dd";
        return [fmt dateFromString:oldValue];
    }else if (property.type.typeClass == [NSString class]){
        if (oldValue == nil) return @"";
        if (oldValue == NULL) return @"";
        if ([oldValue isKindOfClass:[NSNull class]]) return @"";
    }
    return oldValue;
}
@end
