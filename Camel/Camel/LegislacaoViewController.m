//
//  LegislacaoViewController.m
//  Camel
//
//  Created by LucasAndrade on 6/6/14.
//  Copyright (c) 2014 Lucas Andrade Ribeiro. All rights reserved.
//

#import "LegislacaoViewController.h"

@interface LegislacaoViewController ()

@end

@implementation LegislacaoViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        //cor do fundo
        CGRect thirdFrame = CGRectMake(0,0,self.view.bounds.size.width,self.view.bounds.size.height);
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
        UILabel* titulo = [[UILabel alloc]initWithFrame:CGRectMake(120, 25, (self.view.bounds.size.width/2), 40)];
        [titulo setText:@"Legislação"];
        [titulo setFont:[UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:20]];
        titulo.textColor = [UIColor whiteColor];
        [self.view addSubview:titulo];
        
        
        
        //pegando imagem com pathForResource do NSString porque ao dar load na UIWebview, nao aceita o .png
        NSString *pathImg = [[NSBundle mainBundle] pathForResource:@"dar_sinal" ofType:@"jpg"];
        NSString *pathImg1 = [[NSBundle mainBundle] pathForResource:@"portas" ofType:@"jpg"];
        NSString *pathImg2 = [[NSBundle mainBundle] pathForResource:@"bordo_pista" ofType:@"jpg"];
        NSString *pathImg3 = [[NSBundle mainBundle] pathForResource:@"circular_passeio" ofType:@"jpg"];
        NSString *pathImg4 = [[NSBundle mainBundle] pathForResource:@"ciclista_desmontado" ofType:@"jpg"];
        NSString *pathImg5 = [[NSBundle mainBundle] pathForResource:@"seguranca" ofType:@"jpg"];
        NSString *pathImg6 = [[NSBundle mainBundle] pathForResource:@"campainha" ofType:@"jpg"];
        NSString *pathImg7 = [[NSBundle mainBundle] pathForResource:@"detritos" ofType:@"jpg"];
        NSString *pathImg8 = [[NSBundle mainBundle] pathForResource:@"dar_sinal_1" ofType:@"jpg"];
        NSString *pathImg9 = [[NSBundle mainBundle] pathForResource:@"um_metro_e_meio" ofType:@"jpg"];
        NSString *pathImg10 = [[NSBundle mainBundle] pathForResource:@"imprudentes" ofType:@"jpg"];
        NSString *pathImg11 = [[NSBundle mainBundle] pathForResource:@"trafegando_fila" ofType:@"jpg"];
        
        NSString* webViewContent = [NSString stringWithFormat:
                                    @"<html>"
                                    "<body>"
                                    
                                    "<div style='background-color:#000000; text-align:center; color:#FFFFFF;'>"
                                    "<p> NORMAS DE CIRCULAÇÃO E CONDUTA </p>"
                                    "</div>"
                                    
                                    "<table border=0>"
                                    "<tr>"
                                    "<td> <img src=\"%@\" width=\"50\" height=\"50\"/></td>"
                                    "<td align='justify'> Sinalize com o braço ao executar uma manobra de transposição de faixas, movimentos de conversão à direita, à esquerda e retornos."
                                    "<a href='http://www.planalto.gov.br/ccivil_03/leis/l9503.htm'> C.T.B. Art. 35</a>"
                                    "</td>"
                                    "</tr>"
                                    "<table/>"
                                    
                                    "<div style='background-color:#000000; text-align:center; color:#FFFFFF;'>"
                                    "<p>*</p>"
                                    "</div>"
                                    
                                    "<table border=0>"
                                    "<tr>"
                                    "<td> <img src=\"%@\" width=\"50\" height=\"50\"/></td>"
                                    "<td align='justify'> Cuidado com o embarque e desembarque de pessoas em veículos. É de responsabilidade dos passageiros, mas   faça a sua parte e fique atento."
                                    "<a href='http://www.planalto.gov.br/ccivil_03/leis/l9503.htm'> C.T.B. Art. 49</a>"
                                    "</td>"
                                    "</tr>"
                                    "<table/>"
                                    
                                    "<div style='background-color:#000000; text-align:center; color:#FFFFFF;'>"
                                    "<p>*</p>"
                                    "</div>"
                                    
                                    "<table border=0>"
                                    "<tr>"
                                    "<td> <img src=\"%@\" width=\"50\" height=\"50\"/></td>"
                                    "<td align='justify'> O trânsito de bicicletas se dá nos seguintes locais respectivamente: Ciclo faixa, acostamento e na inexistência destes você deverá circular pelo bordo da pista de rolamento."
                                    "<a href='http://www.planalto.gov.br/ccivil_03/leis/l9503.htm'> C.T.B. Art. 58</a>"
                                    "</td>"
                                    "</tr>"
                                    "<table/>"
                                    
                                    "<div style='background-color:#000000; text-align:center; color:#FFFFFF;'>"
                                    "<p>*</p>"
                                    "</div>"
                                    
                                    "<table border=0  >"
                                    "<tr>"
                                    "<td> <img src=\"%@\" width=\"50\" height=\"50\"/></td>"
                                    "<td align='justify'> Se o órgão ou entidade com circunscrição sobre a via autorizar você poderá circular nos passeios."
                                    "<a href='http://www.planalto.gov.br/ccivil_03/leis/l9503.htm'> C.T.B. Art. 59</a>"
                                    "</td>"
                                    "</tr>"
                                    "<table/>"
                                    
                                    "<div style='background-color:#000000; text-align:center; color:#FFFFFF;'>"
                                    "<p>*</p>"
                                    "</div>"
                                    
                                    "<table border=0  >"
                                    "<tr>"
                                    "<td> <img src=\"%@\" width=\"50\" height=\"50\"/></td>"
                                    "<td align='justify'> O ciclista desmontado empurrando a bicicleta equipara-se ao pedestre em direitos e deveres."
                                    "<a href='http://www.planalto.gov.br/ccivil_03/leis/l9503.htm'> C.T.B. Art. 59 § 1º.</a>"
                                    "</td>"
                                    "</tr>"
                                    "<table/>"
                                    
                                    "<div style='background-color:#000000; text-align:center; color:#FFFFFF;'>"
                                    "<p>*</p>"
                                    "</div>"
                                    
                                    "<table border=0>"
                                    "<tr>"
                                    "<td> <img src=\"%@\" width=\"50\" height=\"50\"/></td>"
                                    "<td align='justify'> Equipamentos de segurança obrigatórios para as bicicletas: campainha, sinalização noturna dianteira, traseira, lateral e nos pedais, e espelho retrovisor do lado esquerdo."
                                    "<a href='http://www.planalto.gov.br/ccivil_03/leis/l9503.htm'> C.T.B. Art. 59</a>"
                                    "</td>"
                                    "</tr>"
                                    "<table/>"
                                    
                                    
                                    "<div style='background-color:#000000; text-align:center; color:#FFFFFF;'>"
                                    "<p>INFRAÇÕES</p>"
                                    "</div>"
                                    
                                    
                                    
                                    "<table border=0>"
                                    "<tr>"
                                    "<td> <img src=\"%@\" width=\"50\" height=\"50\"/></td>"
                                    "<td align='justify'> Ameaçar pedestres é infração gravíssima. Cabe aos ciclistas cuidarem dos pedestres."
                                    "<a href='http://www.planalto.gov.br/ccivil_03/leis/l9503.htm'> C.T.B. Art. 170</a>"
                                    "</td>"
                                    "</tr>"
                                    "<table/>"
                                    
                                    "<div style='background-color:#000000; text-align:center; color:#FFFFFF;'>"
                                    "<p>*</p>"
                                    "</div>"
                                    
                                    "<table border=0>"
                                    "<tr>"
                                    "<td> <img src=\"%@\" width=\"50\" height=\"50\"/></td>"
                                    "<td align='justify'> Equipamentos de segurança obrigatórios para as bicicletas: campainha, sinalização noturna dianteira, traseira, lateral e nos pedais, e espelho retrovisor do lado esquerdo."
                                    "<a href='http://www.planalto.gov.br/ccivil_03/leis/l9503.htm'> C.T.B. Art. 170</a>"
                                    "</td>"
                                    "</tr>"
                                    "<table/>"
                                    
                                    "<div style='background-color:#000000; text-align:center; color:#FFFFFF;'>"
                                    "<p>*</p>"
                                    "</div>"
                                    
                                    "<table border=0>"
                                    "<tr>"
                                    "<td> <img src=\"%@\" width=\"50\" height=\"50\"/></td>"
                                    "<td align='justify'> É infração grave deixar de indicar com antecedência, mediante gesto regulamentar de braço ou luz indicadora de direção."
                                    "<a href='http://www.planalto.gov.br/ccivil_03/leis/l9503.htm'> C.T.B. Art. 196</a>"
                                    "</td>"
                                    "</tr>"
                                    "<table/>"
                                    
                                    "<div style='background-color:#000000; text-align:center; color:#FFFFFF;'>"
                                    "<p>*</p>"
                                    "</div>"
                                    
                                    "<table border=0>"
                                    "<tr>"
                                    "<td> <img src=\"%@\" width=\"50\" height=\"50\"/></td>"
                                    "<td align='justify'> É infração média deixar de guardar a distância lateral de um metro e cinqüenta centímetros ao passar ou ultrapassar bicicletas."
                                    "<a href='http://www.planalto.gov.br/ccivil_03/leis/l9503.htm'> C.T.B. Art. 196</a>"
                                    "</td>"
                                    "</tr>"
                                    "<table/>"
                                    
                                    "<div style='background-color:#000000; text-align:center; color:#FFFFFF;'>"
                                    "<p>*</p>"
                                    "</div>"
                                    
                                    "<table border=0>"
                                    "<tr>"
                                    "<td> <img src=\"%@\" width=\"50\" height=\"50\"/></td>"
                                    "<td align='justify'> É infração grave deixar de reduzir a velocidade do veículo de forma compatível com a segurança do trânsito: XIII - ao ultrapassar ciclista."
                                    "<a href='http://www.planalto.gov.br/ccivil_03/leis/l9503.htm'> C.T.B. Art. 220</a>"
                                    "</td>"
                                    "</tr>"
                                    "<table/>"
                                    
                                    "<div style='background-color:#000000; text-align:center; color:#FFFFFF;'>"
                                    "<p>*</p>"
                                    "</div>"
                                    
                                    "<table border=0>"
                                    "<tr>"
                                    "<td> <img src=\"%@\" width=\"50\" height=\"50\"/></td>"
                                    "<td align='justify'> Preste atenção e tome cuidado, não deixe de conduzir pelo bordo da pista de rolamento, em fila única no mesmo sentido da via, nunca na contramão."
                                    "<a href='http://www.planalto.gov.br/ccivil_03/leis/l9503.htm'> C.T.B. Art. 247</a>"
                                    "</td>"
                                    "</tr>"
                                    "<table/>"
                                    
                                    "<div style='background-color:#000000; text-align:center; color:#FFFFFF;'>"
                                    "<p>*</p>"
                                    "</div>"
                                    
                                    "<table border=0>"
                                    "<tr>"
                                    "<td>""<td/>"
                                    "<tr/>"
                                    "<tr>"
                                    "<td>""<td/>"
                                    "<tr/>"
                                    "</table>"
                                    "</br>"
                                    "</br>"
                                    "</br>"
                                    "</body>"
                                    "</html>", pathImg,pathImg1,pathImg2, pathImg3,pathImg4,pathImg5,pathImg6,pathImg7,pathImg8,pathImg9,pathImg10,pathImg11];
        
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
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)voltarTela{
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
