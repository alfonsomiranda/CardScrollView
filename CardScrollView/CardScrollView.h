//
//  CardScrollView.h
//  CardScrollView
//
//  Created by Alfonso Miranda Castro on 14/02/13.
//  Copyright (c) 2013 Alfonso Miranda Castro. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CardScrollView : UIView <UIScrollViewDelegate> {
    
    UIScrollView *_scrollView;
    NSArray *_sliderViews;
    NSInteger _lastContentOffset;
    CGFloat _offSet;
    NSInteger _slidePosition;
    CGSize _cardSize;
    CGPoint _cardPosition;
    CGFloat _offsetCurrentView;
    UIPageControl *_pageControl;
    
}

- (id)initWithViews:(NSArray *)views atPoint:(CGPoint)point;

@end
