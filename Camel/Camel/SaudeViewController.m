//
//  SaudeViewController.m
//  Camel
//
//  Created by Lucas Andrade on 6/10/14.
//  Copyright (c) 2014 Lucas Andrade Ribeiro. All rights reserved.
//

#import "SaudeViewController.h"

@interface SaudeViewController ()

@end

@implementation SaudeViewController

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
        UILabel* titulo = [[UILabel alloc]initWithFrame:CGRectMake(135, 25, (self.view.bounds.size.width/2), 40)];
        [titulo setText:@"Saúde"];
        [titulo setFont:[UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:20]];
        titulo.textColor = [UIColor whiteColor];
        [self.view addSubview:titulo];
        
        
        
        //pegando imagem com pathForResource do NSString porque ao dar load na UIWebview, nao aceita o .png
        NSString *pathImg3 = [[NSBundle mainBundle] pathForResource:@"Untitled" ofType:@"png"];
        NSString* webViewContent = [NSString stringWithFormat:
                                    @"<html>"
                                    "<body>"
                                    "</br><br/></br><br/>DICAS </br>Hello World com inserção de imagem ;)</br></br>"
                                    "<img src=\"%@\" width=\"150\" height=\"100\"/>"
                                    "</body></html>", pathImg3];
        
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
