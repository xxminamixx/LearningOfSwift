//
//  ViewController.m
//  Chapter7-2
//
//  Created by 南　京兵 on 2016/09/27.
//  Copyright © 2016年 南　京兵. All rights reserved.
//

#import "ViewController.h"
#import "Chapter7-Swift.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MySwiftClass *msc = [[MySwiftClass alloc] init];
    msc.message = @"Swift";
    [msc messageRepeatBy: 10];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
