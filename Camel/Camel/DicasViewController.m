//
//  DicasViewController.m
//  Camel
//
//  Created by LucasAndrade on 6/6/14.
//  Copyright (c) 2014 Lucas Andrade Ribeiro. All rights reserved.
//

#import "DicasViewController.h"

@interface DicasViewController ()

@end

@implementation DicasViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
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
        UILabel* titulo = [[UILabel alloc]initWithFrame:CGRectMake(135, 25, (self.view.bounds.size.width/2), 40)];
        [titulo setText:@"Dicas"];
        [titulo setFont:[UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:20]];
        titulo.textColor = [UIColor whiteColor];
        [self.view addSubview:titulo];
        
        
        
        //pegando imagem com pathForResource do NSString porque ao dar load na UIWebview, nao aceita o .png
        NSString *pathImg = [[NSBundle mainBundle] pathForResource:@"fone" ofType:@"png"];
        NSString *pathImg1 = [[NSBundle mainBundle] pathForResource:@"pontos_onibus" ofType:@"jpg"];
        NSString *pathImg2 = [[NSBundle mainBundle] pathForResource:@"cruzamento" ofType:@"jpg"];
        NSString *pathImg3 = [[NSBundle mainBundle] pathForResource:@"curvas" ofType:@"jpg"];
        NSString *pathImg4 = [[NSBundle mainBundle] pathForResource:@"sol" ofType:@"jpg"];
        
        
        NSString* webViewContent = [NSString stringWithFormat:
                                    @"<html><body>"
                                    
                                    
                                    // "<img src=\"%@\" width=\"150\" height=\"100\"/>"
                                    
                                    
                                    
                                    "<div style='background-color:#000000; text-align:center; color:#FFFFFF;'>"
                                    "<p>DICAS</p>"
                                    "</div>"
                                    
                                    "<table border=0>"
                                    "<tr>"
                                    "<td > <img src=\"%@\" width=\"50\" height=\"50\"/></td>"
                                    "<td align='justify'> Aparelhos eletrônicos:"
                                    "</br>""NÃO transite com aparelhos eletrônicos plugados aos seus ouvidos. Você estará perdendo um dos sentidos fundamentais á sua atenção."
                                    "</td>"
                                    "</tr>"
                                    
                                    "<table/>"
                                    "<div style='background-color:#000000; text-align:center; color:#FFFFFF;'>"
                                    "<p>*</p>"
                                    "</div>"
                                    
                                    "<table border=0>"
                                    "<tr>"
                                    "<td valign=top> <img src=\"%@\" width=\"50\" height=\"50\"/></td>"
                                    "<td align='justify'> Pontos de ônibus e taxi:"
                                    "<br/>""Cuidado ao passar pelas paradas de ônibus e taxi, verifique se eles se aproximam, aguarde até que possa prosseguir com segurança."
                                    "</td>"
                                    "</tr>"
                                    
                                    "<table/>"
                                    "<div style='background-color:#000000; text-align:center; color:#FFFFFF;'>"
                                    "<p>*</p>"
                                    "</div>"
                                    
                                    "<table border=0>"
                                    "<tr>"
                                    "<td valign=top> <img src=\"%@\" width=\"50\" height=\"50\"/></td>"
                                    "<td align='justify'> Cruzamentos:"
                                    "<br/>""Fique de olho na intenção dos veículos e pedestres. Na dúvida atravesse na faixa empurrando a bicicleta."
                                    "</td>"
                                    "</tr>"
                                    
                                    "<table/>"
                                    "<div style='background-color:#000000; text-align:center; color:#FFFFFF;'>"
                                    "<p>*</p>"
                                    "</div>"
                                    
                                    "<table border=0>"
                                    "<tr>"
                                    "<td valign=top> <img src=\"%@\" width=\"50\" height=\"50\"/></td>"
                                    "<td align='justify'> Curvas:"
                                    "<br/>""Entre com cuidado em curvas. Você poderá encontrar poças d’água, manchas de óleo, areia e buracos."
                                    "</td>"
                                    "</tr>"
                                    
                                    "<table/>"
                                    "<div style='background-color:#000000; text-align:center; color:#FFFFFF;'>"
                                    "<p>*</p>"
                                    "</div>"
                                    
                                    "<table border=0>"
                                    "<tr>"
                                    "<td valign=top> <img src=\"%@\" width=\"50\" height=\"50\"/></td>"
                                    "<td align='justify'> Insolação:"
                                    "<br/>""Evite os horários mais ensolarados do dia. Use protetor solar."
                                    "</td>"
                                    "</tr>"
                                    
                                    "<table/>"
                                    "<div style='background-color:#000000; text-align:center; color:#FFFFFF;'>"
                                    "<p>*</p>"
                                    "</div>"
                                    "</br>"
                                    "</br>"
                                    "</br>"
                                    "</body></html>", pathImg,pathImg1,pathImg2,pathImg3,pathImg4];
        
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
