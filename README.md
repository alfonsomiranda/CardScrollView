CardScrollView
==============

Installation
-------

Add the CardScrollView folder to your project.

Usage
-----

```objective-c
UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 260, 300)];
[view1 setBackgroundColor:[UIColor redColor]];
UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 260, 300)];
[view2 setBackgroundColor:[UIColor greenColor]];
UIView *view3 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 260, 300)];
[view3 setBackgroundColor:[UIColor grayColor]];
UIView *view4 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 260, 300)];
[view4 setBackgroundColor:[UIColor whiteColor]];

NSArray *views  = [[NSArray alloc] initWithObjects:view1, view2, view3, view4, nil];
CardScrollView *cardScroll = [[CardScrollView alloc] initWithViews:views atPoint:CGPointMake(0, 50)];
[self.view addSubview:cardScroll];
```

# Requirements

Requires iOS 5.0 and ARC.

