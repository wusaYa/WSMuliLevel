//
//  QMWCELL.h
//  ios 多级目录
//
//  Created by Apple on 2018/3/28.
//  Copyright © 2018年 qinmei. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "QMWStroke.h"

@interface QMWCELL : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *contentLB;
@property (weak, nonatomic) IBOutlet UIImageView *headIM;

@property (strong, nonatomic)QMWStroke *model;

@end
