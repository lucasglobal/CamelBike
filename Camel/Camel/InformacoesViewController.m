//
//  InformacoesViewController.m
//  Camel
//
//  Created by Lucas Andrade on 6/4/14.
//  Copyright (c) 2014 Lucas Andrade Ribeiro. All rights reserved.
//

#import "InformacoesViewController.h"

@interface InformacoesViewController ()

@end

@implementation InformacoesViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
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
        [titulo setText:@"Informações"];
        [titulo setFont:[UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:20]];
        titulo.textColor = [UIColor whiteColor];
        [self.view addSubview:titulo];
        
        //pegando imagem com pathForResource do NSString porque ao dar load na UIWebview, nao aceita o .png
        NSString *pathImg = [[NSBundle mainBundle] pathForResource:@"Camel Logo Colorido" ofType:@"png"];
        NSString* webViewContent = [NSString stringWithFormat:
                                    @"<html>"
                                    "</br>"
                                    "<div align='center'>"
                                    "<p>"
                                    "<font size=\"15\" face=\"HelveticaNeue-CondensedBlack\">"
                                    "Camel"
                                    "</font>"
                                    "</p>"
                                    "</div>"
                                    

                                    "<body><div align='left'>"
                                    "<img src=\"%@\" vspace=\"%fpx\" hspace=\"%fpx\" width=\"200\" height=\"178.22\"/>"
                                    "</div>"
                                    
                                    
                                    "<p>"
                                    "<font size=\"4\" face=\"HelveticaNeue-CondensedBlack\">"
                                    "Desenvolvedores"
                                    "</font>"
                                    "</p>"
                                    "<font size=\"2\" face=\"HelveticaNeue\">"

                                    "- Alexandre Ferretti </br> <a href=\"mailto:alexandre.ferretti@live.com\">alexandre.ferretti@live.com</a></br></br> - Lucas Andrade   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</br> <a href=\"mailto:andradelucas.r@gmail.com\">andradelucas.r@gmail.com</a></br></br>- Marcelly L. &nbsp; </br> <a href=\"mailto:marcellygodinho@gmail.com\">marcellygodinho@gmail.com</a></br></br>"
                                    
                                    "<div align = 'center'>"
                                    "versão 1.0"
                                    "</div>"
                                    
                    
                                    "</br>"
                                    "</br>"
                                    "</br>"
                                    "</br>"
                                    "</br>"
                                    "</br>"
                                    "</br>"
                                    "</br>""</br>"
                                    "</br>"
                                    "</body></html>", pathImg,self.view.bounds.origin.y
                                    ,self.view.bounds.size.width/2-120];
        
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
