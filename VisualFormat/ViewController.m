//
//  ViewController.m
//  VisualFormat
//
//  Created by Adusa on 15/9/8.
//  Copyright (c) 2015年 Adusa. All rights reserved.
//

#import "ViewController.h"
#import "MyLabel.h"
@interface ViewController ()

@end

@implementation ViewController
{
    NSInteger currentFigure;
    MyLabel *view1;
    MyLabel *view2;
    MyLabel *view3;
    NSMutableArray *constraintsArray;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    //指定控制器是否可以把视图延伸至半透明的bar下方,默认值是UIRectEdgeAll,在四个方向上都会延伸
    self.edgesForExtendedLayout=UIRectEdgeNone;
    UIBarButtonItem*nextBarButton=[[UIBarButtonItem alloc]initWithTitle:@"GO" style:UIBarButtonItemStyleDone target:self action:@selector(next:)];
    self.navigationItem.rightBarButtonItem=nextBarButton;
    currentFigure=0;
    constraintsArray=[NSMutableArray array];
    
    view1=[[MyLabel alloc]init];
    view1.text=@"View 1";
    view1.backgroundColor=[UIColor colorWithRed:0.694 green:0.894 blue:0.702 alpha:1];
    view1.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:view1];
    
    view2=[[MyLabel alloc]init];
    view2.text=@"View2";
    view2.backgroundColor=[UIColor colorWithRed:0.694 green:0.710 blue:0.902 alpha:1];
    view2.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:view2];
    
    view3=[[MyLabel alloc]init];
    view3.text=@"View3";
    view3.backgroundColor=[UIColor colorWithRed:0.910 green:0.702 blue:0.698 alpha:1];
    view3.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:view3];
    
    view1.alpha=0;
    view2.alpha=0;
    view3.alpha=0;
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)next:(UIBarButtonItem*)item
{
    [self layoutFigure:currentFigure];
    currentFigure++;
    if (currentFigure>8) {
        currentFigure=0;
    }
}

-(void)layoutFigure:(NSInteger)number
{
    [self.view removeConstraints:constraintsArray];
    [constraintsArray removeAllObjects];
    switch (number) {
        case 0:
            view1.alpha=1;
            view2.alpha=1;
            view3.alpha = 0;
            [constraintsArray addObject:[NSLayoutConstraint constraintWithItem:view1 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0f constant:0.0]];
            [constraintsArray addObject:[NSLayoutConstraint constraintWithItem:view2 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:0.0]];
            [constraintsArray addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[view1][view2]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(view1,view2)]];
            break;
        case 1:
            view1.alpha=1;
            view2.alpha=1;
            view3.alpha=1;
            [constraintsArray addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[view1]-20-[view2]-20-[view3]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(view1,view2,view3)]];
            [constraintsArray addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[view1]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(view1,view2,view3)]];
            [constraintsArray addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[view2]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(view1,view2,view3)]];
            [constraintsArray addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[view3]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(view1,view2,view3)]];
            break;
        case 2:
            view1.alpha=1;
            view2.alpha=1;
            view3.alpha = 0;
            [constraintsArray addObject:[NSLayoutConstraint constraintWithItem:view1 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0f constant:0]];
            [constraintsArray addObject:[NSLayoutConstraint constraintWithItem:view2 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0f constant:0]];
            [constraintsArray addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[view1]-[view2]"options:0 metrics:nil views:NSDictionaryOfVariableBindings(view1,view2)]];
            break;
        case 3:
            view1.alpha=1;
            view2.alpha=1;
            view3.alpha = 0;
            [constraintsArray addObject:[NSLayoutConstraint constraintWithItem:view1 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0f constant:0]];
            [constraintsArray addObject:[NSLayoutConstraint constraintWithItem:view2 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0f constant:0]];
            [constraintsArray addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[view1]-30-[view2]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(view1,view2)]];
            break;
        case 4:
            view1.alpha=1;
            view2.alpha=1;
            view3.alpha = 0;
            [constraintsArray addObject:[NSLayoutConstraint constraintWithItem:view1 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0f constant:0]];
            [constraintsArray addObject:[NSLayoutConstraint constraintWithItem:view2 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0f constant:0]];
            [constraintsArray addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[view1]-[view2]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(view1,view2)]];
            break;
        case 5:
            view1.alpha=1;
            view2.alpha=1;
            view3.alpha = 0;
            [constraintsArray addObject:[NSLayoutConstraint constraintWithItem:view1 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0f constant:0]];
            [constraintsArray addObject:[NSLayoutConstraint constraintWithItem:view2 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0f constant:0]];
            [constraintsArray addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[view1]-[view2]-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(view1,view2)]];
            break;
        case 6:
            view1.alpha=1;
            view2.alpha=1;
            view3.alpha = 0;
            [constraintsArray addObject:[NSLayoutConstraint constraintWithItem:view1 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0f constant:0]];
            [constraintsArray addObject:[NSLayoutConstraint constraintWithItem:view2 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0f constant:0]];
            [constraintsArray addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[view1]-(>=0)-[view2]-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(view1,view2)]];
            break;
        case 7:
            view1.alpha=1;
            view2.alpha=1;
            view3.alpha=1;
            [constraintsArray addObject:[NSLayoutConstraint constraintWithItem:view1 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0f constant:0]];
            [constraintsArray addObject:[NSLayoutConstraint constraintWithItem:view2 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0f constant:0]];
            [constraintsArray addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[view1]-[view2]-(>=5)-[view3]-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(view1,view2,view3)]];
            break;
        case 8:
            view1.alpha=1;
            view2.alpha=0;
            view3.alpha=0;
            [constraintsArray addObject:[NSLayoutConstraint constraintWithItem:view1 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0f constant:0]];
            [constraintsArray addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[view1(>=0)]-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(view1)]];
            break;
        default:
            break;
    }
    [self.view addConstraints:constraintsArray];
    [self.view layoutIfNeeded];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
