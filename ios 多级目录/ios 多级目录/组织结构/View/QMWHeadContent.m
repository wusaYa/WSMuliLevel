//
//  QMWHeadContent.m
//  ios 多级目录
//
//  Created by Apple on 2018/3/27.
//  Copyright © 2018年 qinmei. All rights reserved.
//

#import "QMWHeadContent.h"

#import "QMWStroke.h"

@interface QMWHeadContent ()

@property(nonatomic,strong)UILabel* contentLB;

@end

@implementation QMWHeadContent

-(void)setContent:(NSString *)content{
    self.contentLB.text=content;
    _content=content;
}

-(UILabel*)contentLB{
    if (!_contentLB) {
        _contentLB=[[UILabel alloc]initWithFrame:CGRectMake(10, 10, 100, 30)];
        _contentLB.textColor=[UIColor redColor];
    }
    return _contentLB;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor=[UIColor groupTableViewBackgroundColor];
        [self addSubview:self.contentLB];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if (_model.childCount==0) {
        return;
    }
    if (_model.state) {
        CGRect frame= self.frame;
        frame.size.height=44*_model.childCount+frame.size.height;
        self.frame=frame;
        if ([self.superview isKindOfClass:[QMWHeadContent class]]) {
            [(QMWHeadContent*)self.superview upDateFrameUp];
        }
        if (self.subviews.count==1) {
            for (int i = 0; i<_model.childCount; i++) {
                QMWHeadContent* content=[[QMWHeadContent alloc]initWithFrame:CGRectMake(0, 44+44*i, [UIScreen mainScreen].bounds.size.width, 44)];
                content.content=((QMWStroke*)_model.data[i][0]).branch_name;
                if (_model.data.count!=0) {
                    content.model=_model.data[i][i];
                }
                [self addSubview:content];
            }
        }
        _model.state=!_model.state;
    }else{
        if ([self.superview isKindOfClass:[QMWHeadContent class]]) {
            [(QMWHeadContent*)self.superview upDateFrameDown];
        }
        CGRect frame= self.frame;
        frame.size.height=44;
        self.frame=frame;
        _model.state=!_model.state;
    }
}
-(void)upDateFrameUp{
    CGRect superframe= self.frame;
    CGFloat height = 0.0;
    for (NSArray* arry in _model.data) {
        for (QMWStroke* stroke in arry) {
            height=height+stroke.selfFrame;
        }
    }
    superframe.size.height=44*_model.childCount+height;
    self.frame=superframe;
}
-(void)upDateFrameDown{
    CGRect superframe= self.frame;
    superframe.size.height=superframe.size.height-44*_model.childCount;
    self.frame=superframe;
}
@end
