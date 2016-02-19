//
//  PorqueAndarBikeViewController.m
//  Camel
//
//  Created by Lucas Andrade on 6/4/14.
//  Copyright (c) 2014 Lucas Andrade Ribeiro. All rights reserved.
//

#import "PorqueAndarBikeViewController.h"
#import "SaudeViewController.h"
#import "MeioAmbienteViewController.h"
#import "TempoViewController.h"

@interface PorqueAndarBikeViewController ()

@end

@implementation PorqueAndarBikeViewController
@synthesize  botaoProxima,picker;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
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
        UILabel* titulo = [[UILabel alloc]initWithFrame:CGRectMake(0, 25, 200, 40)];
        [titulo setText:@"Porque andar de bike?"];
        [titulo setFont:[UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:18]];
        titulo.textColor = [UIColor whiteColor];
        [self.view addSubview:titulo];
        
        
        //adicionando picker como submenu
        picker = [[UIPickerView alloc]initWithFrame:CGRectMake(0, self.view.bounds.size.height/2-160, self.view.bounds.size.width,500)];
        picker.delegate = self;
        picker.dataSource = self;
        [self.view addSubview:picker];
        
        //botao da próxima página
        botaoProxima = [[UIButton alloc] initWithFrame:CGRectMake(15, self.view.bounds.size.height-170
                                                                  , self.view.bounds.size.width-30, 55)];
        botaoProxima.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:20];
        [botaoProxima addTarget:self action:@selector(telaSaude) forControlEvents:UIControlEventTouchUpInside];
        [botaoProxima setTitle:@"Escolher" forState:UIControlStateNormal];
        botaoProxima.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        botaoProxima.backgroundColor = [UIColor  blackColor];
        botaoProxima.layer.cornerRadius = 20; // this value vary as per your desire
        botaoProxima.clipsToBounds = YES;
        [self.view addSubview:botaoProxima];
        
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
-(void)telaSaude{
    SaudeViewController* saudeViewCont = [[SaudeViewController alloc]init];
    [self presentViewController:saudeViewCont animated:YES completion:nil];
}
-(void)telaTempo{
    TempoViewController* tempoViewCont = [[TempoViewController alloc]init];
    [self presentViewController:tempoViewCont animated:YES completion:nil];
}
-(void)telaMeioAmbiente{
    MeioAmbienteViewController* meioViewCont = [[MeioAmbienteViewController alloc]init];
    [self presentViewController:meioViewCont animated:YES completion:nil];
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return 3;
    
}
-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    NSMutableArray* arrayPicker = [NSMutableArray array];
    [arrayPicker addObject:[NSString stringWithFormat:@"Saúde"]];
    [arrayPicker addObject:[NSString stringWithFormat:@"Economize Tempo"]];
    [arrayPicker addObject:[NSString stringWithFormat:@"Meio Ambiente"]];
    
    
    return [arrayPicker objectAtIndex:row];
}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    //armazenando a selecao do menu
    NSUInteger numComponents = [picker.dataSource numberOfComponentsInPickerView:picker];
    NSMutableString * text = [NSMutableString string];
    for(NSUInteger i = 0; i < numComponents; ++i) {
        NSUInteger selectedRow = [picker selectedRowInComponent:i];
        NSString * title = [[picker delegate] pickerView:picker titleForRow:selectedRow forComponent:i];
        [text appendFormat:@"%@", title];
    }
    
    
    
    if([text isEqualToString:@"Saúde"]){
        //botao da próxima página
        botaoProxima = nil;
        botaoProxima = [[UIButton alloc] initWithFrame:CGRectMake(15, self.view.bounds.size.height-170
                                                                  , self.view.bounds.size.width-30, 55)];
        botaoProxima.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:20];
        [botaoProxima addTarget:self action:@selector(telaSaude) forControlEvents:UIControlEventTouchUpInside];
        [botaoProxima setTitle:@"Escolher" forState:UIControlStateNormal];
        botaoProxima.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        botaoProxima.backgroundColor = [UIColor  blackColor];
        botaoProxima.layer.cornerRadius = 20; // this value vary as per your desire
        botaoProxima.clipsToBounds = YES;
        [self.view addSubview:botaoProxima];
    }
    else if([text isEqualToString:@"Economize Tempo"]){
        //botao da próxima página
        botaoProxima = nil;
        botaoProxima = [[UIButton alloc] initWithFrame:CGRectMake(15, self.view.bounds.size.height-170
                                                                  , self.view.bounds.size.width-30, 55)];
        botaoProxima.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:20];
        [botaoProxima addTarget:self action:@selector(telaTempo) forControlEvents:UIControlEventTouchUpInside];
        [botaoProxima setTitle:@"Escolher" forState:UIControlStateNormal];
        botaoProxima.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        botaoProxima.backgroundColor = [UIColor  blackColor];
        botaoProxima.layer.cornerRadius = 20; // this value vary as per your desire
        botaoProxima.clipsToBounds = YES;
        [self.view addSubview:botaoProxima];
    }
    else if([text isEqualToString:@"Meio Ambiente"]){
        //botao da próxima página
        botaoProxima = nil;
        botaoProxima = [[UIButton alloc] initWithFrame:CGRectMake(15, self.view.bounds.size.height-170
                                                                  , self.view.bounds.size.width-30, 55)];
        botaoProxima.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:20];
        [botaoProxima addTarget:self action:@selector(telaMeioAmbiente) forControlEvents:UIControlEventTouchUpInside];
        [botaoProxima setTitle:@"Escolher" forState:UIControlStateNormal];
        botaoProxima.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        botaoProxima.backgroundColor = [UIColor  blackColor];
        botaoProxima.layer.cornerRadius = 20; // this value vary as per your desire
        botaoProxima.clipsToBounds = YES;
        [self.view addSubview:botaoProxima];
    }
    
}

@end
