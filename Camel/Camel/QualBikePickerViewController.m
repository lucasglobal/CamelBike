//
//  QualBikePickerViewController.m
//  Camel
//
//  Created by Lucas Andrade on 6/13/14.
//  Copyright (c) 2014 Lucas Andrade Ribeiro. All rights reserved.
//

#import "QualBikePickerViewController.h"

@interface QualBikePickerViewController ()

@end

@implementation QualBikePickerViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        //cor do fundo
        
        [self.view setBackgroundColor:[UIColor whiteColor]];
        CGRect thirdFrame = CGRectMake(0,0,self.view.bounds.size.width,self.view.bounds.origin.y+80);
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
        [titulo setText:@"Qual bike?"];
        [titulo setFont:[UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:20]];
        titulo.textColor = [UIColor whiteColor];
        [self.view addSubview:titulo];

        
        
        UIPickerView* picker = [[UIPickerView alloc]initWithFrame:CGRectMake(0, self.view.bounds.size.height/2-100, self.view.bounds.size.width,500)];
        picker.delegate = self;
        picker.dataSource = self;
        
        [self.view addSubview:picker];
        // Custom initialization
    }
    return self;
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return 3;
    
}
-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    NSMutableArray* arrayPicker = [NSMutableArray array];
    [arrayPicker addObject:[NSString stringWithFormat:@"Como você vai pedalar?"]];
    [arrayPicker addObject:[NSString stringWithFormat:@" Vou pedalar com maior frequência"]];
    [arrayPicker addObject:[NSString stringWithFormat:@" Quero ver os tipos de bikes"]];
    
    
    return [arrayPicker objectAtIndex:row];
}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    //UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Hello" message:[NSString stringWithFormat:@"Hello ROW  %d",row] delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil];
   // [alert show];
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
