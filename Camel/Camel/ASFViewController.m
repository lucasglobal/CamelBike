//
//  ASFViewController.m
//  CalculadoraBike
//
//  Created by Alexandre Ferretti on 6/4/14.
//  Copyright (c) 2014 Alexandre Ferretti. All rights reserved.
//

#import "ASFViewController.h"

@interface ASFViewController ()

@end

@implementation ASFViewController



-(void) changeLabel{
    _labelAcademia.text = [NSString stringWithFormat:@"%d",(int) _sliderAcademia.value];
    _labelTrabalho.text = [NSString stringWithFormat:@"%d",(int) _sliderTrabalho.value];
    _labelAmigos.text = [NSString stringWithFormat:@"%d",(int) _sliderAmigos.value];
    _labelParque.text = [NSString stringWithFormat:@"%d",(int) _sliderParque.value];
    _labelEscola.text = [NSString stringWithFormat:@"%d",(int) _sliderEscola.value];
    _labelOutros.text = [NSString stringWithFormat:@"%d",(int) _sliderOutros.value];

    
    NSString *somaDistancia =[NSString stringWithFormat:@"%d",
                            (int) _sliderAcademia.value +
                            (int) _sliderTrabalho.value +
                            (int) _sliderAmigos.value +
                            (int) _sliderParque.value +
                            (int) _sliderEscola.value +
                            (int) _sliderOutros.value];
    
    _labelDistancia.text = somaDistancia;
    //float auxFloat = [somaDistancia floatValue];
    //int auxInt = [somaDistancia floatValue];

    _labelCalorias.text = [NSString stringWithFormat:@"%d", (int) [somaDistancia floatValue] * 59];
    _labelCo2.text =  [NSString stringWithFormat:@"%.2f", (float)[somaDistancia floatValue] * 0.27];
    _labelDinheiro.text =  [NSString stringWithFormat:@"%.2f", (float)[somaDistancia floatValue] * 0.32];
}




- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    //cor do fundo
    CGRect thirdFrame = CGRectMake(0,0,self.view.bounds.size.width,80);
    UIView* tituloView = [[UIView alloc]initWithFrame:thirdFrame];
    [tituloView setBackgroundColor:[UIColor blackColor]];
    [self.view addSubview:tituloView];
    
    
    //botao de voltar redondo
    UIButton *botaoVoltar = [UIButton buttonWithType:UIButtonTypeCustom];
    [botaoVoltar setImage:[UIImage imageNamed:@"botaoVoltar.png"] forState:UIControlStateNormal];
    [botaoVoltar addTarget:self action:@selector(voltarTela) forControlEvents:UIControlEventTouchUpInside];
    botaoVoltar.frame = CGRectMake(15.0, 25.0, 40.0, 40.0);//width and height should be same value
    [self.view addSubview:botaoVoltar];
    
    
    //label com o título da página
    UILabel* titulo = [[UILabel alloc]initWithFrame:CGRectMake(90, 25, 200, 40)];
    [titulo setText:@"Porque andar de bike?"];
    [titulo setFont:[UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:18]];
    titulo.textColor = [UIColor whiteColor];
    [self.view addSubview:titulo];
    

    
    [_sliderAcademia addTarget:self action:@selector(changeLabel) forControlEvents:UIControlEventValueChanged];
    [_sliderTrabalho addTarget:self action:@selector(changeLabel) forControlEvents:UIControlEventValueChanged];
    [_sliderAmigos addTarget:self action:@selector(changeLabel) forControlEvents:UIControlEventValueChanged];
    [_sliderParque addTarget:self action:@selector(changeLabel) forControlEvents:UIControlEventValueChanged];
    [_sliderEscola addTarget:self action:@selector(changeLabel) forControlEvents:UIControlEventValueChanged];
    [_sliderOutros addTarget:self action:@selector(changeLabel) forControlEvents:UIControlEventValueChanged];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)voltarTela{
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

@end
