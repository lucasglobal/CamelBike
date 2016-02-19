//
//  QualBikeViewController.h
//  Camel
//
//  Created by LucasAndrade on 6/5/14.
//  Copyright (c) 2014 Lucas Andrade Ribeiro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QualBikeViewController : UIViewController <UIScrollViewDelegate,UIPickerViewDelegate,UIPickerViewDataSource>

@property (nonatomic,retain) UIPageControl* pageControl;
@property (nonatomic,retain) UIScrollView* scrollView;
@property (nonatomic)UIPickerView* pickerTerra;
@property (nonatomic)UIPickerView* pickerUrbana;

-(void)voltarTela;
- (void)scrollViewDidScroll:(UIScrollView *)_scrollView;
- (void)pageChanged;
@end
