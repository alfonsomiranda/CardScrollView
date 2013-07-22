//
//  ViewController.m
//  CardScrollViewSample
//
//  Created by Alfonso Miranda Castro on 22/07/13.
//  Copyright (c) 2013 Alfonso Miranda Castro. All rights reserved.
//

#import "ViewController.h"
#import "CardScrollView.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 260, 300)];
    [view1 setBackgroundColor:[UIColor redColor]];
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(50, 50, 100, 50)];
    [label1 setText:@"1"];
    [view1 addSubview:label1];
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 260, 300)];
    UIView *view3 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 260, 300)];
    UIView *view4 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 260, 300)];
    UIView *view5 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 260, 300)];
    UIView *view6 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 260, 300)];
    [view6 setBackgroundColor:[UIColor yellowColor]];
    UIView *view7 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 260, 300)];
    UIView *view8 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 260, 300)];
    
    NSArray *views  = [[NSArray alloc] initWithObjects:view1, view2, view3, view4,view5, view6, view7, view8, nil];
    
    CardScrollView *cardScroll = [[CardScrollView alloc] initWithViews:views atPoint:CGPointMake(0, 50)];
    [self.view addSubview:cardScroll];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
