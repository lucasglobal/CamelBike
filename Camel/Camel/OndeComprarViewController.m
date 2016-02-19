//
//  OndeComprarViewController.m
//  Camel
//
//  Created by Lucas Andrade on 6/4/14.
//  Copyright (c) 2014 Lucas Andrade Ribeiro. All rights reserved.
//

#import "OndeComprarViewController.h"

@interface OndeComprarViewController ()

@end

@implementation OndeComprarViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        //cor do fundo
        CGRect thirdFrame = CGRectMake(0,0,self.view.bounds.size.width,self.view.bounds.size.height);
        UIView* tituloView = [[UIView alloc]initWithFrame:thirdFrame];
        [tituloView setBackgroundColor:[UIColor blackColor]]
        ;
        [self.view addSubview:tituloView];
        
        //botao de voltar redondo
        UIButton *botaoVoltar = [UIButton buttonWithType:UIButtonTypeCustom];
        [botaoVoltar setImage:[UIImage imageNamed:@"botaoVoltar.png"] forState:UIControlStateNormal];
        [botaoVoltar addTarget:self action:@selector(voltarTela) forControlEvents:UIControlEventTouchUpInside];
        botaoVoltar.frame = CGRectMake(15.0, 25.0, 40.0, 40.0);//width and height should be same value
        [self.view addSubview:botaoVoltar];
        
        
        //label com o título da página
        UILabel* titulo = [[UILabel alloc]initWithFrame:CGRectMake(110, 25, (self.view.bounds.size.width/2), 40)];
        [titulo setText:@"Onde comprar?"];
        [titulo setFont:[UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:20]];
        titulo.textColor = [UIColor whiteColor];
        [self.view addSubview:titulo];
        
        
        NSString* webViewContent = [NSString stringWithFormat:
                                    @"<html><body>"
                                    
                                    "<div style='background-color:#000000; text-align:center; color:#FFFFFF; font-family:Helvetica Neue'>"
                                    "<p>LOJAS EM BRASÍLIA - DF</p>"
                                    "</div>"
                                    
                                    "<table font-family:Helvetica Neue border=1 cellspacing=0 cellpadding=2 bordercolor='#000000' align='center' >"
                                    "<tr>"
                                    "<td align='center' width=75> Localidade</td>"
                                    "<td align='center' width=75> Endereço</td>"
                                    "<td align='center' width=75> Nome</td>"
                                    "<td align='center' width=75> Telefone</td>"
                                    "</tr>"
                                    "<tr>"
                                    "<td align='center' width=75 rowspan=5 > Asa Norte</td>"
                                    "<td align='center' width=75> 704 </td>"
                                    "<td align='center' width=75> Ciclista Canarinho </td>"
                                    "<td align='center' width=75><font size='2'> 3326-5752 </font></td>"
                                    "</tr>"
                                    "<tr>"
                                    "<td align='center' width=75> 407</td>"
                                    "<td align='center' width=75> Bike & Adventures</td>"
                                    "<td align='center' width=75><font size='2'> 3347-6171</font></td>"
                                    "</tr>"
                                    "<tr>"
                                    "<td align='center' width=75> 307</td>"
                                    "<td align='center' width=75> Eco Pedal</td>"
                                    "<td align='center' width=75><font size='2'> 3273-6322</font></td>"
                                    "</tr>"
                                    "<tr>"
                                    "<td align='center' width=75> 714</td>"
                                    "<td align='center' width=75> <a href='http://www.bikesportbr.com.br'> Bike Sport</a> </td>"
                                    "<td align='center' width=75><font size='2'> 3326-5752</font></td>"
                                    "</tr>"
                                    "<tr>"
                                    "<td align='center' width=75> 110</td>"
                                    "<td align='center' width=75> <a href='http://www.cycling.com.br'> Cycling </a> </td>"
                                    "<td align='center' width=75><font size='2'> 3274-0591</font></td>"
                                    "</tr>"
                                    "<tr>"
                                    
                                    "<table/>"
                                    "<div style='background-color:#000000; text-align:center; color:#FFFFFF;'>"
                                    "<p>*</p>"
                                    "</div>"
                                    
                                    "<table border=1 cellspacing=0 cellpadding=2 bordercolor='#000000' align='center' >"
                                    "<tr>"
                                    "<td align='center' width=75> Localidade</td>"
                                    "<td align='center' width=75> Endereço</td>"
                                    "<td align='center' width=75> Nome</td>"
                                    "<td align='center' width=75> Telefone</td>"
                                    "</tr>"
                                    "<td align='center' width=75 rowspan=7 > Asa Sul</td>"
                                    "<tr>"
                                    "<td align='center' width=75> 411</td>"
                                    "<td align='center' width=75> Casa do Ciclismo</td>"
                                    "<td align='center' width=75><font size='2'> 3345-1129</font></td>"
                                    "</tr>"
                                    "<tr>"
                                    "<td align='center' width=75> CLS 315 </td>"
                                    "<td align='center' width=75> <a href='http://http://www.commute.com.br'> Commute Bike Studio </a></td> </td>"
                                    "<td align='center' width=75><font size='2'>  3877-9299 </font></td>"
                                    "</tr>"
                                    "<tr>"
                                    "<td align='center' width=75> 214</td>"
                                    "<td align='center' width=75> Veloce</td>"
                                    "<td align='center' width=75><font size='2'> 3346-4626</font></td>"
                                    "</tr>"
                                    "<tr>"
                                    "<td align='center' width=75> 208 </td>"
                                    "<td align='center' width=75> <a href='http://www.biketechbrasilia.com.br'> Bike Tech </a></td>"
                                    "<td align='center' width=75><font size='2'> 3242-8285 </font></td>"
                                    "</tr>"
                                    "<tr>"
                                    "<td align='center' width=75> 310</td>"
                                    "<td align='center' width=75> <a href='http://www.sportcicle.com.br'> Sportcicle </a></td>"
                                    "<td align='center' width=75><font size='2'> 3241-1481</font></td>"
                                    "</tr>"
                                    "<tr>"
                                    "<td align='center' width=75> 407</td>"
                                    "<td align='center' width=75> Bike & Adventures</td>"
                                    "<td align='center' width=75><font size='2'> 3347-6171</font></td>"
                                    "</tr>"
                                    
                                    
                                    
                                    "<table/>"
                                    "<div style='background-color:#000000; text-align:center; color:#FFFFFF;'>"
                                    "<p>*</p>"
                                    "</div>"
                                    
                                    "<table border=1 cellspacing=0 cellpadding=2 bordercolor='#000000' align='center' >"
                                    "<tr>"
                                    "<td align='center' width=75> Localidade</td>"
                                    "<td align='center' width=75> Endereço</td>"
                                    "<td align='center' width=75> Nome</td>"
                                    "<td align='center' width=75> Telefone</td>"
                                    "</tr>"
                                    "<td align='center' width=75 rowspan=4 > Sudoeste</td>"
                                    "<tr>"
                                    "<td align='center' width=75> CLSW 103</td>"
                                    "<td align='center' width=75> Bike Clicle & Adventure</td>"
                                    "<td align='center' width=75><font size='2'> 3037-3944</font></td>"
                                    "</tr>"
                                    "<td align='center' width=75> CLSW 101</td>"
                                    "<td align='center' width=75> <a href='http://www.superbike101.com.br'> Sportcicle </a></td>"
                                    "<td align='center' width=75><font size='2'> 3344-8042</font></td>"
                                    "</tr>"
                                    
                                    "<table/>"
                                    "<div style='background-color:#000000; text-align:center; color:#FFFFFF;'>"
                                    "<p>*</p>"
                                    "</div>"
                                    
                                    "<table border=1 cellspacing=0 cellpadding=2 bordercolor='#000000' align='center' >"
                                    "<tr>"
                                    "<td align='center' width=75> Localidade</td>"
                                    "<td align='center' width=75> Endereço</td>"
                                    "<td align='center' width=75> Nome</td>"
                                    "<td align='center' width=75> Telefone</td>"
                                    "</tr>"
                                    "<td align='center' width=75 rowspan=6 > Taguatinga</td>"
                                    "<tr>"
                                    "<td align='center' width=75> Pç. Bicalho</td>"
                                    "<td align='center' width=75> Ciclista Novo Mundo</td>"
                                    "<td align='center' width=75><font size='2'> 3355-1461</font></td>"
                                    "</tr>"
                                    "<td align='center' width=75> Pç. DI </td>"
                                    "<td align='center' width=75>  Ciclo Miroir </td>"
                                    "<td align='center' width=75><font size='2'> 3351-1900 </font></td>"
                                    "</tr>"
                                    "<tr>"
                                    "<td align='center' width=75> QSA 09</td>"
                                    "<td align='center' width=75>  Taguaciclo </td>"
                                    "<td align='center' width=75><font size='2'> 3351-3905</font></td>"
                                    "</tr>"
                                    "<td align='center' width=75> EQNL 10/12</td>"
                                    "<td align='center' width=75>  Bike Shop </td>"
                                    "<td align='center' width=75><font size='2'> 3336-0162</font></td>"
                                    "</tr>"
                                    "<td align='center' width=75> Av. Palmeiras</td>"
                                    "<td align='center' width=75>  Bibiclo </td>"
                                    "<td align='center' width=75><font size='2'> 3562-2555</font></td>"
                                    "</tr>"
                                    
                                    
                                    
                                    
                                    
                                    "<table/>"
                                    "<div style='background-color:#000000; text-align:center; color:#FFFFFF;'>"
                                    "<p>*</p>"
                                    "</div>"
                                    "</br>""</br>""</br>""</br>" "</br>""</br>""</br>""</br>"
                                    
                                    "</body></html>"];
        
        //criando a UIWebView
        UIWebView *webView = [[UIWebView alloc] init];
        [webView loadHTMLString:webViewContent baseURL:[[NSBundle mainBundle] bundleURL]];
        
        webView.frame = CGRectMake(0, 80, self.view.bounds.size.width, self.view.bounds.size.height);
        [self.view addSubview:webView];
        
        
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
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
