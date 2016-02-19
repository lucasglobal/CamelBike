//
//  controleDaRoda.h
//  rodaGiratoria
//
//  Created by LucasAndrade on 5/27/14.
//  Copyright (c) 2014 Lucas Andrade Ribeiro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "protocoloRoda.h"
#import "setorRoda.h"


@interface controleDaRoda : UIControl

@property (weak) id <protocoloRoda> delegate;
@property (nonatomic, strong) UIView *container;
@property int numberOfSections;
@property CGAffineTransform startTransform;
@property (nonatomic, strong) NSMutableArray *sectors;
@property int currentSector;

- (id) initWithFrame:(CGRect)frame andDelegate:(id)del withSections:(int)sectionsNumber;
-(void)rotate;
@end
