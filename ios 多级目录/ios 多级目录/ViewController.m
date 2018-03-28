//
//  ViewController.m
//  ios 多级目录
//
//  Created by Apple on 2018/3/27.
//  Copyright © 2018年 qinmei. All rights reserved.
//

#import "ViewController.h"

#import "QWMOrganization.h"

#import "QMWHeadContent.h"

#import "QMWStroke.h"

#import <MJExtension.h>
#import "SBJSON.h"

#import "QMWCELL.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)NSMutableArray<QMWStroke*>* items;

@property(nonatomic,strong)NSMutableArray<QMWStroke*>* lists;

@property(nonatomic,strong)UITableView* tableView;

@end

@implementation ViewController

-(UITableView*)tableView{
    if (!_tableView) {
        _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
        _tableView.delegate=self;
        _tableView.dataSource=self;
        _tableView.rowHeight=44;
        [_tableView registerNib:[UINib nibWithNibName:@"QMWCELL" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"cell"];
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _items=[[NSMutableArray alloc]init];
    _lists=[[NSMutableArray alloc]init];
    NSString* path=[[NSBundle mainBundle] pathForResource:@"data" ofType:@"json"];
    NSString* jsonStr=[NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    SBJSON* sb=[SBJSON new];
    NSDictionary* dic=[sb objectWithString:jsonStr error:nil];
    [QMWStroke mj_setupObjectClassInArray: ^ NSDictionary * {
        return @ {
            @"data": @"QMWStroke"
        };
    }];
    for (NSArray* dics in dic[@"data"]) {
        [_items addObject:[QMWStroke mj_objectWithKeyValues:dics[0]]];
    }
    QMWHeadContent* content=[[QMWHeadContent alloc]initWithFrame:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 44)];
    content.model=_items[0];
    content.content=_items[0].branch_name;
    for (QMWStroke* stroke in _items) {
        stroke.rate=0;
        [_lists addObject:stroke];
    }
    [self.view addSubview:self.tableView];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _lists.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    QMWStroke* stroke=_lists[indexPath.row];
    QMWCELL* cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.model=stroke;
    cell.contentLB.text=stroke.branch_name;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    QMWCELL* cell=[tableView cellForRowAtIndexPath:indexPath];
    [cell setSelected:NO animated:YES];
    if (cell.model.state) {
        //已展开 关闭操作
        if (cell.model.data.count!=0) {
            NSMutableArray* indexs=[[NSMutableArray alloc]init];
            int a=1;
            for (NSArray* arry in cell.model.data) {
                for (QMWStroke* stroke in arry) {
                    [_lists removeObject:stroke];
                    stroke.state=NO;
                    NSIndexPath* index=[NSIndexPath indexPathForRow:indexPath.row+a inSection:0];
                    [indexs addObject:index];
                    a++;
                }
            }
            NSMutableArray* deleteArry=[[NSMutableArray alloc]init];
            for (QMWStroke* strkes in _lists) {
                if (strkes.rate>indexPath.row) {
                    strkes.state=NO;
                    NSIndexPath* index=[NSIndexPath indexPathForRow:strkes.rate inSection:0];
                    [indexs addObject:index];
                    [deleteArry  addObject:strkes];
                }
            }
            [_lists removeObjectsInArray:deleteArry];
            [tableView reloadData];
            cell.model.state=NO;
        }
    }else{
        //未展开 展开操作
        if (cell.model.data.count!=0) {
            NSMutableArray* indexs=[[NSMutableArray alloc]init];
            int a=1;
            for (NSArray* arry in cell.model.data) {
                for (QMWStroke* stroke in arry) {
                    NSIndexPath* path=[NSIndexPath indexPathForRow:indexPath.row+a inSection:0];
                    stroke.rate=indexPath.row+a;
                    [indexs addObject:path];
                    [_lists insertObject:stroke atIndex:indexPath.row+a];
                    a++;
                }
            }
            [tableView insertRowsAtIndexPaths:indexs withRowAnimation:UITableViewRowAnimationTop];
            cell.model.state=YES;
        }
    }
    
}

@end
