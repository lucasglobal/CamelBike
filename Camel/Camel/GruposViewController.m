//
//  GruposViewController.m
//  Camel
//
//  Created by LucasAndrade on 6/6/14.
//  Copyright (c) 2014 Lucas Andrade Ribeiro. All rights reserved.
//

#import "GruposViewController.h"

@interface GruposViewController ()

@end

@implementation GruposViewController

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
        [titulo setText:@"Grupos"];
        [titulo setFont:[UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:20]];
        titulo.textColor = [UIColor whiteColor];
        [self.view addSubview:titulo];
        
        
        
        //pegando imagem com pathForResource do NSString porque ao dar load na UIWebview, nao aceita o .png
        NSString *pathImg = [[NSBundle mainBundle] pathForResource:@"batom_bikers" ofType:@"png"];
        NSString *pathImg1 = [[NSBundle mainBundle] pathForResource:@"pedal_noturno" ofType:@"jpg"];
        NSString *pathImg2 = [[NSBundle mainBundle] pathForResource:@"rebas" ofType:@"jpg"];
        NSString *pathImg3 = [[NSBundle mainBundle] pathForResource:@"rodas_da_paz" ofType:@"png"];
        
        NSString* webViewContent = [NSString stringWithFormat:
                                    @"<html>"
                                    "<body>"
                                    
                                    "<div style='background-color:#000000; text-align:center; color:#FFFFFF;'>"
                                    "<p>GRUPOS</p>"
                                    "</div>"
                                    
                                    "<table border=0>"
                                    "<tr>"
                                    "<td > <img src=\"%@\" width=\"50\" height=\"50\"/></td>"
                                    "<td align='justify'> <a href='http://bsbbatombikers.blogspot.com.br/'>Batom Bikers</a>"
                                    "<p>""Grupo feminino de ciclismo, de Brasília, sem fins lucrativos, que ama o esporte e a vida.""<p/>"
                                    "<div/>"
                                    "</td>"
                                    "</tr>"
                                    "<table/>"
                                    
                                    "<div style='background-color:#000000; text-align:center; color:#FFFFFF;'>"
                                    "<p>*</p>"
                                    "</div>"
                                    
                                    "<table border=0>"
                                    "<tr>"
                                    "<td > <img src=\"%@\" width=\"50\" height=\"50\"/></td>"
                                    "<td align='justify'> <a href='http://www.pedalnoturnodf.com.br'>Pedal Noturno</a>"
                                    "<p>""A filosofia do grupo é que qualquer pessoa possa pedalar, não precisa ser um atleta, bastando apenas que tenha os equipamentos necessários (bike, capacete, luvas, luzes dianteira e traseira) e vontade, aqui oferecemos companhia!""<p/>"
                                    "<div/>"
                                    "</td>"
                                    "</tr>"
                                    "<table/>"
                                    
                                    "<div style='background-color:#000000; text-align:center; color:#FFFFFF;'>"
                                    "<p>*</p>"
                                    "</div>"
                                    
                                    
                                    "<table border=0>"
                                    "<tr>"
                                    "<td > <img src=\"%@\" width=\"50\" height=\"50\"/></td>"
                                    "<td align='justify'> <a href='http://www.rebasdocerrado.com.br'>Rebas do Cerrado</a>"
                                    "<p>""O Rebas do Cerrado é um grupo Mountain Bikers, formado por pessoas comuns, de idades variadas e de ambos os sexos. O que nos une é paixão pela bicicleta, pela natureza, pela aventura, pela solidariedade e por superar desafios.""<p/>"
                                    "<div/>"
                                    "</td>"
                                    "</tr>"
                                    "<table/>"
                                    
                                    "<div style='background-color:#000000; text-align:center; color:#FFFFFF;'>"
                                    "<p>*</p>"
                                    "</div>"
                                    
                                    
                                    "<table border=0>"
                                    "<tr>"
                                    "<td > <img src=\"%@\" width=\"50\" height=\"50\"/></td>"
                                    "<td align='justify'> <a href='http://www.rodasdapaz.org.br/'>ONG Rodas da Paz</a>"
                                    "<p>""A ONG Rodas da Paz foi instituída em 2003 com o objetivo de reagir à violência e ao crescente número de acidentes e mortes no trânsito do Distrito Federal.""<p/>"
                                    "<div/>"
                                    "</td>"
                                    "</tr>"
                                    
                                    "<table/>"
                                    "<div style='background-color:#000000; text-align:center; color:#FFFFFF;'>"
                                    "<p>*</p>"
                                    "</div>"

                                    "</br>"
                                    "</br>"
                                    "</br>"
                                    "</body>"
                                    
                                    "</html>", pathImg,pathImg1,pathImg2,pathImg3];
        
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
