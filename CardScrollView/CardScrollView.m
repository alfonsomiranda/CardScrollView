//
//  CardScrollView.m
//  CardScrollView
//
//  Created by Alfonso Miranda Castro on 14/02/13.
//  Copyright (c) 2013 Alfonso Miranda Castro. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "CardScrollView.h"


#define WIDTH 320
#define DIFF 30

@implementation CardScrollView

- (id)initWithViews:(NSArray *)views atPoint:(CGPoint)point {
    
    self = [super init];
    if (self) {
        
        _sliderViews = [[NSArray alloc] initWithArray:views];
        
        if ([_sliderViews count] > 0) {
            
            UIView *view = [_sliderViews objectAtIndex:0];
            _cardSize = view.frame.size;
            _cardPosition = view.frame.origin;
            
        }
        
        self.frame = CGRectMake(point.x, point.y, WIDTH, _cardSize.height);
        
        CGRect scrollFrame;
        scrollFrame.origin.x = 0;
        scrollFrame.origin.y = 0;
        scrollFrame.size.width = _cardSize.width ;
        scrollFrame.size.height = _cardSize.height;
        
        _scrollView = [[UIScrollView alloc] initWithFrame:scrollFrame];
        
        [self initializeScrollView];
        
        _pageControl = [[UIPageControl alloc] init];
        _pageControl.numberOfPages = [_sliderViews count];
        _pageControl.frame = CGRectMake((_cardSize.width - 90)/2, _cardPosition.y + _cardSize.height + 10, 150, 14);
        _pageControl.autoresizingMask = (UIViewAutoresizingFlexibleTopMargin|
                                             UIViewAutoresizingFlexibleBottomMargin|
                                             UIViewAutoresizingFlexibleHeight);
        [_pageControl setCurrentPage:0];
        
        [self addSubview:_pageControl];
        
    }
    return self;
}

- (void)initializeScrollView {
    
    _scrollView.bounces = YES;
    _scrollView.pagingEnabled = YES;
    _scrollView.delegate = self;
    _scrollView.userInteractionEnabled = YES;
    _scrollView.clipsToBounds = NO;
    [_scrollView setShowsHorizontalScrollIndicator:NO];
    
    CGFloat originX = DIFF;
    _offsetCurrentView = originX;
    
    for (int i = 0; i < [_sliderViews count]; i++) {
        
        CGRect frame = CGRectMake(originX, 0, _cardSize.width, _cardSize.height);
            
        UIView *view = [_sliderViews objectAtIndex:i];
        
        [self cornerSquare:view];
        
        view.frame = frame;
        
        if (i != 0) {
            
            view.transform = CGAffineTransformMakeScale(.9f, .9f);
            
        }
        
        [_scrollView addSubview:view];
        
        originX = originX + _cardSize.width;
        
    }
    
    [_scrollView setContentSize:CGSizeMake(originX, _cardSize.height)];
    [_scrollView setContentOffset:CGPointMake(0, 0)];
    [self addSubview:_scrollView];
    [_scrollView scrollRectToVisible:CGRectMake(0,0,_cardSize.width,_cardSize.height) animated:NO];
    
}

- (void)cornerSquare:(UIView *)viewL {
    
    CALayer * layerView = [viewL layer];
    
    [layerView setMasksToBounds:NO];
    [layerView setCornerRadius:5.0];
    [layerView setShadowColor:[[UIColor blackColor] CGColor]];
    [layerView setShadowOffset:CGSizeMake(0, 2)];
    layerView.shadowOpacity = 0.10;
    layerView.shadowRadius = 3.0;
    layerView.shouldRasterize = YES;
    [layerView setRasterizationScale:[UIScreen mainScreen].scale];
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    CGFloat offset = _scrollView.contentOffset.x;
    CGFloat width = _scrollView.frame.size.width;
    [_pageControl setCurrentPage:(offset+(width/2))/width];
  
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offset = scrollView.contentOffset.x;
    
    for (UIView *view in _sliderViews) {
        NSInteger index = [_sliderViews indexOfObject:view];
        CGFloat width = _scrollView.frame.size.width;
        CGFloat y = index * width;
        CGFloat value = (offset-y)/width;
        CGFloat scale = 1.f-fabs(value);
        if (scale > 1.f) scale = 1.f;
        if (scale < .9f) scale = .9f;
        
        view.transform = CGAffineTransformMakeScale(scale, scale);
    }
    
}
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    
	if ([self pointInside:point withEvent:event]) {
		return _scrollView;
	}
	return nil;
}

@end
