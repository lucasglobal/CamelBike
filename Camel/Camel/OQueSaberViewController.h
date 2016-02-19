//
//  OQueSaberViewController.h
//  Camel
//
//  Created by LucasAndrade on 6/3/14.
//  Copyright (c) 2014 Lucas Andrade Ribeiro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OQueSaberViewController : UIViewController  <UIPickerViewDelegate,UIPickerViewDataSource>
@property (nonatomic) UIButton* botaoProxima;
@property (nonatomic) UIPickerView* picker;
-(void)voltarTela;
- (IBAction)botaoVoltar:(id)sender;

-(void)telaLegislacao;
-(void)telaDicas;
@end
