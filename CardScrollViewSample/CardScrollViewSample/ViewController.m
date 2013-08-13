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
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 260, 300)];
    [view2 setBackgroundColor:[UIColor greenColor]];
    UIView *view3 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 260, 300)];
    [view3 setBackgroundColor:[UIColor grayColor]];
    UIView *view4 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 260, 300)];
    [view4 setBackgroundColor:[UIColor whiteColor]];
    UIView *view5 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 260, 300)];
    [view5 setBackgroundColor:[UIColor orangeColor]];
    UIView *view6 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 260, 300)];
    [view6 setBackgroundColor:[UIColor brownColor]];
    UIView *view7 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 260, 300)];
    [view7 setBackgroundColor:[UIColor purpleColor]];
    UIView *view8 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 260, 300)];
    [view8 setBackgroundColor:[UIColor blackColor]];
    
    NSArray *views  = [[NSArray alloc] initWithObjects:view1, view2, view3, view4,view5, view6, view7, view8, nil];
    
    CardScrollView *cardScroll = [[CardScrollView alloc] initWithViews:views atPoint:CGPointMake(0, 50)];
    cardScroll.delegate = self;
    [self.view addSubview:cardScroll];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma -
#pragma CardScrollViewDelegate

- (void)pagingScrollView:(CardScrollView *)pagingScrollView scrolledToPage:(NSInteger)currentPage {
    
    NSLog(@"%d", currentPage);
    
}

@end
