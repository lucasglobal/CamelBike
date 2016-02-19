//
//  PorqueAndarBikeViewController.h
//  Camel
//
//  Created by Lucas Andrade on 6/4/14.
//  Copyright (c) 2014 Lucas Andrade Ribeiro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PorqueAndarBikeViewController : UIViewController <UIPickerViewDelegate,UIPickerViewDataSource>

@property (nonatomic) UIButton* botaoProxima;
@property (nonatomic) UIPickerView* picker;

-(void)voltarTela;
-(void)telaSaude;
-(void)telaTempo;
-(void)telaMeioAmbiente;
@end
