//
//  ASFViewController.h
//  CalculadoraBike
//
//  Created by Alexandre Ferretti on 6/4/14.
//  Copyright (c) 2014 Alexandre Ferretti. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ASFViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *labelAcademia;
@property (weak, nonatomic) IBOutlet UILabel *labelTrabalho;
@property (weak, nonatomic) IBOutlet UILabel *labelAmigos;
@property (weak, nonatomic) IBOutlet UILabel *labelParque;
@property (weak, nonatomic) IBOutlet UILabel *labelEscola;
@property (weak, nonatomic) IBOutlet UILabel *labelOutros;

@property (weak, nonatomic) IBOutlet UILabel *labelDistancia;
@property (weak, nonatomic) IBOutlet UILabel *labelCo2;
@property (weak, nonatomic) IBOutlet UILabel *labelCalorias;
@property (weak, nonatomic) IBOutlet UILabel *labelDinheiro;

@property (weak, nonatomic) IBOutlet UISlider *sliderAcademia;
@property (weak, nonatomic) IBOutlet UISlider *sliderTrabalho;
@property (weak, nonatomic) IBOutlet UISlider *sliderAmigos;
@property (weak, nonatomic) IBOutlet UISlider *sliderParque;
@property (weak, nonatomic) IBOutlet UISlider *sliderEscola;
@property (weak, nonatomic) IBOutlet UISlider *sliderOutros;

-(void)changeLabel;


@end
