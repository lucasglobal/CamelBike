//
//  QualBikeViewController.m
//  Camel
//
//  Created by LucasAndrade on 6/5/14.
//  Copyright (c) 2014 Lucas Andrade Ribeiro. All rights reserved.
//

#import "QualBikeViewController.h"

@interface QualBikeViewController ()

@end

@implementation QualBikeViewController
@synthesize pageControl,scrollView,pickerTerra,pickerUrbana;

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
        UILabel* titulo = [[UILabel alloc]initWithFrame:CGRectMake(self.view.bounds.size.width/2-50, 25, 200, 40)];
        [titulo setText:@"Qual bike comprar?"];
        [titulo setFont:[UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:18]];
        titulo.textColor = [UIColor whiteColor];
        [self.view addSubview:titulo];
        
        
        //criando uma view scroll por toda a dimensao e adicionando no array de views
        scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 85, self.view.bounds.size.width, self.view.bounds.size.height*2)];
        
        scrollView.contentSize = CGSizeMake(scrollView.frame.size.width * 14,
                                            scrollView.frame.size.height);
        //comeca a view do scroll no meio
        [scrollView setContentOffset:CGPointMake(scrollView.frame.size.width*8, 0)];
        
        scrollView.pagingEnabled=YES;
        scrollView.backgroundColor = [UIColor blackColor];
        scrollView.delegate = self;
        
        
        
        //adicionando view triathlon road na scroll view
        UIView *viewTriAthlon = [[UIView alloc]
                                 initWithFrame:CGRectMake(((scrollView.frame.size.width)*0), 0,
                                                          (scrollView.frame.size.width), scrollView.frame.size.height)];
        viewTriAthlon.backgroundColor=[UIColor whiteColor];
        [viewTriAthlon setTag:5];
        
        
        //criando uma view scroll para possibilitar descer a página
        UIScrollView* scrollViewHorizontal6 = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height*2)];
        
        scrollViewHorizontal6.contentSize = CGSizeMake(scrollView.frame.size.width,
                                                       scrollView.frame.size.height+180);
        //        //comeca a view do scroll no meio
        //        [scrollViewHorizontal setContentOffset:CGPointMake(scrollView.frame.size.width*8, 0)];
        
        scrollViewHorizontal6.pagingEnabled=NO;
        scrollViewHorizontal6.backgroundColor = [UIColor whiteColor];
        scrollViewHorizontal6.delegate = self;
        
        [viewTriAthlon addSubview:scrollViewHorizontal6];
        
        UIImageView* imageTriAthlon = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Triathlon.png"]];
        imageTriAthlon.frame = CGRectMake(30,15, 270, 165);
        [scrollViewHorizontal6 addSubview:imageTriAthlon];
        
        //Titulo
        UILabel *tituloTriathlon = [[UILabel alloc]initWithFrame:CGRectMake(30, 10, 100, 80)];
        tituloTriathlon.text = @"Triathlon";
        [tituloTriathlon setFont:[UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:22]];
        
        [scrollViewHorizontal6 addSubview:tituloTriathlon];
        
        //Descricao Triathlon
        
        UITextView *descricaoTriathlon = [[UITextView alloc]initWithFrame:CGRectMake(30, 211, 270, 4400)];
        descricaoTriathlon.text = @"Um \"aviãozinho sem asas\". O foco nesta bike é a velocidade. Para tanto, foram feitos investimentos poderosos na aerodinâmica que vão desde os materiais que a compõem, geometria do quadro, aos equipamentos que o ciclista utiliza para pilotar essa máquina. Utilizada para a modalidade contra-relógio no ciclismo ou para o triatlo - riathlon - (modalidade esportiva mista onde é praticado 3 esportes seguidos do outro: natação, ciclismo e corrida, nesta ordem). Se você já corre e nada e quer virar um triatleta, você acaba de encontrar sua bike • Característas chave: terreno plano, veloz, prática de esportes.";
        descricaoTriathlon.editable = NO;
        descricaoTriathlon.scrollEnabled = YES;
        [descricaoTriathlon setFont:[UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:18]];
        [descricaoTriathlon setTextAlignment:NSTextAlignmentJustified];
        
        [scrollViewHorizontal6 addSubview:descricaoTriathlon];
        
        
        
        [scrollView addSubview:viewTriAthlon];
        
        
        
        //adicionando view tandem road na scroll view
        UIView *viewTandem = [[UIView alloc]
                              initWithFrame:CGRectMake(((scrollView.frame.size.width)*1), 0,
                                                       (scrollView.frame.size.width), scrollView.frame.size.height)];
        viewTandem.backgroundColor=[UIColor whiteColor];
        [viewTandem setTag:5];
        
        UIImageView* imageTandem = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"tandem-road-vetorizada.png"]];
        imageTandem.frame = CGRectMake(30,15, 270, 119);
        [viewTandem addSubview:imageTandem];
        
        //Titulo
        UILabel *tituloTandemRode = [[UILabel alloc]initWithFrame:CGRectMake(30, 150, 100, 80)];
        tituloTandemRode.text = @"Tandem";
        [tituloTandemRode setFont:[UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:22]];
        
        [viewTandem addSubview:tituloTandemRode];
        
        //Descricao Tandem Rode
        UITextView *descricaoTandemRode = [[UITextView alloc]initWithFrame:CGRectMake(30, 211, 270, 4400)];
        descricaoTandemRode.text = @"Uma para dois! Quão divertido isso pode ser? Já imaginou poder fazer longos passeios e dividir a força com outro ciclista? A Tandem é uma bike construída e reforçada para suportar dois ciclistas (“pedalantes”). Ideal pra fazer passeios em família ou casal • Características chave: diversão garantida, rápida, passeio/prática de esporte, terrenos planos";
        descricaoTandemRode.editable = NO;
        descricaoTandemRode.scrollEnabled = YES;
        [descricaoTandemRode setFont:[UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:18]];
        [descricaoTandemRode setTextAlignment:NSTextAlignmentJustified];
        
        [viewTandem addSubview:descricaoTandemRode];
        
        [scrollView addSubview:viewTandem];
        
        
        //adicionando view road na scroll view
        UIView *viewRoad = [[UIView alloc]
                            initWithFrame:CGRectMake(((scrollView.frame.size.width)*2), 0,
                                                     (scrollView.frame.size.width), scrollView.frame.size.height)];
        viewRoad.backgroundColor=[UIColor whiteColor];
        [viewRoad setTag:5];
        
        
        //criando uma view scroll para possibilitar descer a página
        UIScrollView* scrollViewHorizontal5 = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height*2)];
        
        scrollViewHorizontal5.contentSize = CGSizeMake(scrollView.frame.size.width,
                                                       scrollView.frame.size.height+265);
        //        //comeca a view do scroll no meio
        //        [scrollViewHorizontal setContentOffset:CGPointMake(scrollView.frame.size.width*8, 0)];
        
        scrollViewHorizontal5.pagingEnabled=NO;
        scrollViewHorizontal5.backgroundColor = [UIColor whiteColor];
        scrollViewHorizontal5.delegate = self;
        
        [viewRoad addSubview:scrollViewHorizontal5];
        
        
        UIImageView* imageRoad = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"road.png"]];
        imageRoad.frame = CGRectMake(30,15, 270, 160);
        [scrollViewHorizontal5 addSubview:imageRoad];
        
        
        //Titulo
        UILabel *tituloRode = [[UILabel alloc]initWithFrame:CGRectMake(30, 10, 100, 80)];
        tituloRode.text = @"Speed";
        [tituloRode setFont:[UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:22]];
        
        [scrollViewHorizontal5 addSubview:tituloRode];
        
        
        //Descricao Road
        UITextView *descricaoRode = [[UITextView alloc]initWithFrame:CGRectMake(30, 211, 270, 4400)];
        descricaoRode.text = @"Rode Bike, Bike de Estrada ou mais comumente: Speed. Como o apelido diz: esses tipos de bike são feitas pra velocidade. São as famosas bikes do Tour de France, a mais famosa e respeitada prova de ciclismo de estrada do mundo. Possuem quadro e pneu finos, e são rígidas para que toda a força impressa nos pedais pelo ciclista seja aproveitada e convertida em velocidade (em termos didáticos). Se tem pouco tempo para praticar esporte e quer deixar o sendetarismo de lado, cogite a compra de uma Speed. 1h pedalando nessa bike você poderá várias calorias, vai fortalecer seu sistema cardiopulmonar, tonificará os músculos e distribuirá sorrizos de graça por aí • Característica chave: veloz, leve, prática de esportes.";
        descricaoRode.editable = NO;
        descricaoRode.scrollEnabled = YES;
        [descricaoRode setFont:[UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:18]];
        [descricaoRode setTextAlignment:NSTextAlignmentJustified];
        [descricaoRode sizeToFit];
        
        [scrollViewHorizontal5 addSubview:descricaoRode];
        
        [scrollView addSubview:viewRoad];
        
        
        
        //adicionando view fixa na scroll view
        UIView *viewFixa = [[UIView alloc]
                            initWithFrame:CGRectMake(((scrollView.frame.size.width)*3), 0,
                                                     (scrollView.frame.size.width), scrollView.frame.size.height)];
        viewFixa.backgroundColor=[UIColor whiteColor];
        [viewFixa setTag:0];
        
        
        //criando uma view scroll para possibilitar descer a página
        UIScrollView* scrollViewHorizontal4 = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height*2)];
        
        scrollViewHorizontal4.contentSize = CGSizeMake(scrollView.frame.size.width,
                                                       scrollView.frame.size.height+175);
        //        //comeca a view do scroll no meio
        //        [scrollViewHorizontal setContentOffset:CGPointMake(scrollView.frame.size.width*8, 0)];
        
        scrollViewHorizontal4.pagingEnabled=NO;
        scrollViewHorizontal4.backgroundColor = [UIColor whiteColor];
        scrollViewHorizontal4.delegate = self;
        
        [viewFixa addSubview:scrollViewHorizontal4];
        
        UIImageView* imageFixa = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"fixa.png"]];
        imageFixa.frame = CGRectMake(30,15, 270, 163);
        [scrollViewHorizontal4 addSubview:imageFixa];
        
        //Titulo
        UILabel *tituloFixa = [[UILabel alloc]initWithFrame:CGRectMake(30, 10, 100, 80)];
        tituloFixa.text = @"Fixa";
        [tituloFixa setFont:[UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:22]];
        
        [scrollViewHorizontal4 addSubview:tituloFixa];
        
        //Descricao Fixa
        UITextView *descricaoFixa = [[UITextView alloc]initWithFrame:CGRectMake(30, 211, 270, 4400)];
        descricaoFixa.text = @"Simples, ágil, leve, roda-fixa e tradicionalmente sem freio. \"Hã?! Sem freio!?\" Sim! Como a roda é fixa (daí o nome, Fixed Gear), ou seja, se a bike estiver em movimento, os pedais também estarão, sempre. Você vai pedalar subindo, descendo e para parar. Interessante né?! Essa bike é muito utilizada em grandes centros Europeus e principalmente pelos Courriers (Mensageiros) de Nova York pelo baixo custo de manutenção (devida as poucas peças que a bike possui), agilidade e leveza • Características chave: ágil, roda-fixa, leve, customizavel, sem-freio(opcional), dia-a-dia.";
        descricaoFixa.editable = NO;
        descricaoFixa.scrollEnabled = YES;
        [descricaoFixa setFont:[UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:18]];
        [descricaoFixa setTextAlignment:NSTextAlignmentJustified];
        
        [scrollViewHorizontal4 addSubview:descricaoFixa];
        
        [scrollView addSubview:viewFixa];
        
        
        
       
        
        //adicionando view dobravel na scroll view
        UIView *viewDobravel = [[UIView alloc]
                                initWithFrame:CGRectMake(((scrollView.frame.size.width)*4), 0,
                                                         (scrollView.frame.size.width), scrollView.frame.size.height)];
        viewDobravel.backgroundColor=[UIColor whiteColor];
        [viewDobravel setTag:0];
        
        
        //criando uma view scroll para possibilitar descer a página
        UIScrollView* scrollViewHorizontal3 = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height*2)];
        
        scrollViewHorizontal3.contentSize = CGSizeMake(scrollView.frame.size.width,
                                                       scrollView.frame.size.height+80);
        //        //comeca a view do scroll no meio
        //        [scrollViewHorizontal setContentOffset:CGPointMake(scrollView.frame.size.width*8, 0)];
        
        scrollViewHorizontal3.pagingEnabled=NO;
        scrollViewHorizontal3.backgroundColor = [UIColor whiteColor];
        scrollViewHorizontal3.delegate = self;
        
        
        [viewDobravel addSubview:scrollViewHorizontal3];
        UIImageView* imageDobravel = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"dobravel-vetorizada.png"]];
        imageDobravel.frame = CGRectMake(20,15, 135, 109);
        [scrollViewHorizontal3 addSubview:imageDobravel];
        
        UIImageView *imageDobravelDobrada = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"drobrada-vetorizada.png" ]];
        imageDobravelDobrada.frame = CGRectMake(165, 15, 135, 105);
        [scrollViewHorizontal3 addSubview:imageDobravelDobrada];
        
        //Titulo
        UILabel *tituloDobravel = [[UILabel alloc]initWithFrame:CGRectMake(30, 110, 100, 80)];
        tituloDobravel.text = @"Dobrável";
        [tituloDobravel setFont:[UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:22]];
        
        [scrollViewHorizontal3 addSubview:tituloDobravel];
        
        
        //Descricao Dobravel
        UITextView *descricaoDobravel = [[UITextView alloc]initWithFrame:CGRectMake(30, 211, 270, 4400)];
        descricaoDobravel.text = @"Está de bike e vai pegar carona, metrô ou ônibus? No seu trabalho ou faculdade não tem bicicletário e quer guarda-la junto de você? Que tal uma bicicleta dobrável? A principal característica das bikes dobráveis é a facilidade de poder armazena-la em qualquer local e carrega-la contigo por aí. Não subestime o tamanho dessa bike! É uma bicicleta ágil e eficiente em longas distâncias \n • Características chave: passeio, dia-a-dia, ágil.";
        descricaoDobravel.editable = NO;
        descricaoDobravel.scrollEnabled = YES;
        [descricaoDobravel setFont:[UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:18]];
        [descricaoDobravel setTextAlignment:NSTextAlignmentJustified];
        
        [scrollViewHorizontal3 addSubview:descricaoDobravel];
        
        [scrollView addSubview:viewDobravel];
        
        
        
        //adicionando view customBike na scroll view
        UIView *viewCustom = [[UIView alloc]
                              initWithFrame:CGRectMake(((scrollView.frame.size.width)*5), 0,
                                                       (scrollView.frame.size.width), scrollView.frame.size.height)];
        viewCustom.backgroundColor=[UIColor whiteColor];
        [viewCustom setTag:0];
        
        UIImageView* imageCustom = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"custom-vetorizado.png"]];
        imageCustom.frame = CGRectMake(30,15, 270, 150);
        [viewCustom addSubview:imageCustom];
        
        //Titulo
        UILabel *tituloCustom = [[UILabel alloc]initWithFrame:CGRectMake(30, -30, 130, 100)];
        tituloCustom.text = @"Customizada";
        [tituloCustom setFont:[UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:22]];
        
        [viewCustom addSubview:tituloCustom];
        
        
        //Descricao Custom
        UITextView *descricaoCustom = [[UITextView alloc]initWithFrame:CGRectMake(30, 211, 270, 4400)];
        descricaoCustom.text = @"Assim como as Cruisers Bikes, as bicicletas customizadas ou chopper bikes, são ideais para passeios em terreno plano, mas com muito mais estilo. Se você curte exclusividade ou gosta de tudo personalizado, essa bike é A bike! • Características chave: customizada - passeios - terrenos planos";
        descricaoCustom.editable = NO;
        descricaoCustom.scrollEnabled = YES;
        [descricaoCustom setFont:[UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:18]];
        [descricaoCustom setTextAlignment:NSTextAlignmentJustified];
        
        [viewCustom addSubview:descricaoCustom];
        
        
        
        [scrollView addSubview:viewCustom];
        
        //adicionando view 1 na scroll view
        UIView *view0 = [[UIView alloc]
                         initWithFrame:CGRectMake(((scrollView.frame.size.width)*6), 0,
                                                  (scrollView.frame.size.width), scrollView.frame.size.height)];
        view0.backgroundColor=[UIColor whiteColor];
        [view0 setTag:2];
        
        
        //criando uma view scroll para possibilitar descer a página
        UIScrollView* scrollViewHorizontal2 = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height*2)];
        
        scrollViewHorizontal2.contentSize = CGSizeMake(scrollView.frame.size.width,
                                                      scrollView.frame.size.height+80);
        //        //comeca a view do scroll no meio
        //        [scrollViewHorizontal setContentOffset:CGPointMake(scrollView.frame.size.width*8, 0)];
        
        scrollViewHorizontal2.pagingEnabled=NO;
        scrollViewHorizontal2.backgroundColor = [UIColor whiteColor];
        scrollViewHorizontal2.delegate = self;
        
        [view0 addSubview:scrollViewHorizontal2];

        
        //adicionando view Communter Bike
        
        UIImageView* imageCommuter = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"commuter.png"]];
        imageCommuter.frame = CGRectMake(30,15, 270, 132);
        [scrollViewHorizontal2 addSubview:imageCommuter];
        
        //Titulo
        UILabel *tituloCommuter = [[UILabel alloc]initWithFrame:CGRectMake(30, -20, 100, 80)];
        tituloCommuter.text = @"Commuter";
        [tituloCommuter setFont:[UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:22]];
        
        [scrollViewHorizontal2 addSubview:tituloCommuter];
        
        //Descricao Commuter Bike
        UITextView *descricaoCommuter = [[UITextView alloc]initWithFrame:CGRectMake(30, 211, 270, 300)];
        descricaoCommuter.text = @"Commuter bike é usada por quem vai de casa para o trabalho e/ou faculdade. As principais características desta bicicleta é agilidade e conforto com uma pitada de estilo. Geralmente são equipadas com bagageiro para que o ciclista possa levar tudo que utilizará durante o dia sem que se desgaste carregando mochilas pesadas nas costas • Características chaves: ágeis - confortáveis - dia-a-dia - híbrida (terra e asfalto)";
        descricaoCommuter.editable = NO;
        //descricaoCommuter.scrollEnabled = YES;
        [descricaoCommuter setFont:[UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:18]];
        [descricaoCommuter setTextAlignment:NSTextAlignmentJustified];
        [descricaoCommuter sizeToFit];
        
        [scrollViewHorizontal2 addSubview:descricaoCommuter];
        
        
        [scrollView addSubview:view0];
        
        //adicionando view 2 na scroll view
        UIView *view1 = [[UIView alloc]
                         initWithFrame:CGRectMake(((scrollView.frame.size.width)*7), 0,
                                                  (scrollView.frame.size.width), scrollView.frame.size.height)];
        
        view1.backgroundColor=[UIColor whiteColor];
        [view1 setTag:3];
        
        
        
        
        
        //criando uma view scroll para possibilitar descer a página
        UIScrollView* scrollViewHorizontal = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height*2)];
        
        scrollViewHorizontal.contentSize = CGSizeMake(scrollView.frame.size.width,
                                                      scrollView.frame.size.height+150);
        //        //comeca a view do scroll no meio
        //        [scrollViewHorizontal setContentOffset:CGPointMake(scrollView.frame.size.width*8, 0)];
        
        scrollViewHorizontal.pagingEnabled=NO;
        scrollViewHorizontal.backgroundColor = [UIColor whiteColor];
        scrollViewHorizontal.delegate = self;
        
        [view1 addSubview:scrollViewHorizontal];
        
        //adicionando View Confort Bike
        UIImageView* imageConfort = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"confort.png"]];
        imageConfort.frame = CGRectMake(30,15, 270, 163);
        [scrollViewHorizontal addSubview:imageConfort];
        
        //Titulo
        UILabel *tituloConfort = [[UILabel alloc]initWithFrame:CGRectMake(30, -20, 130, 100)];
        tituloConfort.text = @"Confortável";
        [tituloConfort setFont:[UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:22]];
        
        [scrollViewHorizontal addSubview:tituloConfort];
        
        //Descricao Confort Bike
        UITextView* descricaoConfort = [[UITextView alloc]initWithFrame:CGRectMake(30, 211, 270, 440)];
        [descricaoConfort setText:@"O estilo retrô: guidão longo, pneus e selim largos; permite que o ciclista tenha uma boa visão da paisagem ao seu redor, além de conforto. Cruisers bikes são ideais para quem pretende passear pela cidade e parques ou usa-las para fazer pequenas compras, como ir ao mercado ou panificadora. Geralmente (existem no mercado modelos com mais de uma marcha) possuem uma marcha, o que significa que seu desempenho é melhor em terrenos planos • Características chaves: confortáveis - passeios - terrenos planos."];
        descricaoConfort.editable = NO;
        [descricaoConfort setFont:[UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:18]];
        [descricaoConfort setTextAlignment:NSTextAlignmentJustified];
        descricaoConfort.scrollEnabled = YES;
        [scrollViewHorizontal addSubview:descricaoConfort];
        [scrollView addSubview:view1];
        
        
        
    

        //adicionando view 3 na scroll view
        UIView *view2 = [[UIView alloc]
                         initWithFrame:CGRectMake(((scrollView.frame.size.width)*8), 0,
                                                  (scrollView.frame.size.width), scrollView.frame.size.height)];
        view2.backgroundColor=[UIColor whiteColor];
        [view2 setTag:4];
        //imagem central
        UIImageView* imagemCentral = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"OffRoad_or_Urban_Screen.png"]];
        imagemCentral.frame = CGRectMake(0,0, self.view.bounds.size.width, self.view.bounds.size.height-86);
        [view2 addSubview:imagemCentral];
        [scrollView addSubview:view2];
        
        //adicionando view 4 na scroll view
        UIView *viewBMX = [[UIView alloc]
                           initWithFrame:CGRectMake(((scrollView.frame.size.width)*9), 0,
                                                    (scrollView.frame.size.width), scrollView.frame.size.height)];
        
        viewBMX.backgroundColor=[UIColor whiteColor];
        [viewBMX setTag:7];
        
        
        
        //criando uma view scroll para possibilitar descer a página
        UIScrollView* scrollViewVertical7 = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height*2)];
        
        scrollViewVertical7.contentSize = CGSizeMake(scrollView.frame.size.width,
                                                       scrollView.frame.size.height+80);
        //        //comeca a view do scroll no meio
        //        [scrollViewHorizontal setContentOffset:CGPointMake(scrollView.frame.size.width*8, 0)];
        
        scrollViewVertical7.pagingEnabled=NO;
        scrollViewVertical7.backgroundColor = [UIColor whiteColor];
        scrollViewVertical7.delegate = self;
        
        [viewBMX addSubview:scrollViewVertical7];
        
        
        UIImageView* imageBmx = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bmx.png"]];
        imageBmx.frame = CGRectMake(30,15, 270, 186);
        [scrollViewVertical7 addSubview:imageBmx];
        
        
        //Titulo
        UILabel *tituloBMX = [[UILabel alloc]initWithFrame:CGRectMake(30, 10, 100, 80)];
        tituloBMX.text = @"BMX Bike";
        [tituloBMX setFont:[UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:22]];
        
        [scrollViewVertical7 addSubview:tituloBMX];
        
        //Descrição da BMX
        
        UITextView *descricaoBMX = [[UITextView alloc]initWithFrame:CGRectMake(30, 211, 270, 440)];
        descricaoBMX.text = @"BMX ou Bicicleta de Motocross. Motocross é um esporte praticado em pistas construídas na terra com rampas e costelas os pilotos (de moto ou bicicleta) saltam de obstáculo ao outro em alta velocidade. Requer muita habilidade e coragem. A BMX, tradicionalmente, possui somente freio traseiro e uma única marcha • Características chave: manobras, saltos, prática de esporte.";
        descricaoBMX.editable = NO;
        descricaoBMX.scrollEnabled = YES;
        descricaoBMX.textAlignment = NSTextAlignmentJustified;
        [descricaoBMX setFont:[UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:18]];
        
        [scrollViewVertical7 addSubview:descricaoBMX];
        
        
        [scrollView addSubview:viewBMX];
        
        //adicionando view DH na scroll view
        UIView *viewDH = [[UIView alloc]
                          initWithFrame:CGRectMake(((scrollView.frame.size.width)*10), 0,
                                                   (scrollView.frame.size.width), scrollView.frame.size.height)];
        
        viewDH.backgroundColor=[UIColor whiteColor];
        [viewDH setTag:7];
        
        //criando uma view scroll para possibilitar descer a página
        UIScrollView* scrollViewVertical8 = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height*2)];
        
        scrollViewVertical8.contentSize = CGSizeMake(scrollView.frame.size.width,
                                                     scrollView.frame.size.height+80);
        //        //comeca a view do scroll no meio
        //        [scrollViewHorizontal setContentOffset:CGPointMake(scrollView.frame.size.width*8, 0)];
        
        scrollViewVertical8.pagingEnabled=NO;
        scrollViewVertical8.backgroundColor = [UIColor whiteColor];
        scrollViewVertical8.delegate = self;
        
        [viewDH addSubview:scrollViewVertical8];

        
        
        
        UIImageView* imageDH = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"dh.png"]];
        imageDH.frame = CGRectMake(30,15, 270, 163);
        [scrollViewVertical8 addSubview:imageDH];
        
        //Titulo
        UILabel *tituloDH = [[UILabel alloc]initWithFrame:CGRectMake(30, 20, 100, 80)];
        tituloDH.text = @"DownHill";
        [tituloDH setFont:[UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:22]];
        
        [scrollViewVertical8 addSubview:tituloDH];
        
        // Descricao da DH
        
        UITextView *descricaoDH = [[UITextView alloc]initWithFrame:CGRectMake(30, 211, 270, 440)];
        descricaoDH.text = @"Adrenalina pura! Feita para descer montanhas em alta velocidade. Pesam por volta dos 13kg para dar estabilidade nas descidas. Devido ao peso e a geometria da bike, que é feita para descer, é ruim de subidas. Se você mora em uma região que tenha muitos morros, trilhas com descidas longas, você e esta bike se divertirão muito morro a baixo • Característica chave: terreno acidentado, descidas";
        descricaoDH.editable = NO;
        descricaoDH.textAlignment = NSTextAlignmentJustified;
        [descricaoDH setFont:[UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:18]];
        descricaoDH.scrollEnabled = YES;
        
        [scrollViewVertical8 addSubview:descricaoDH];
        
        [scrollView addSubview:viewDH];
        
        //adicionando view maratona na scroll view
        UIView *viewMaratona = [[UIView alloc]
                                initWithFrame:CGRectMake(((scrollView.frame.size.width)*11), 0,
                                                         (scrollView.frame.size.width), scrollView.frame.size.height)];
        
        viewMaratona.backgroundColor=[UIColor whiteColor];
        [viewMaratona setTag:7];
        
        
        //criando uma view scroll para possibilitar descer a página
        UIScrollView* scrollViewVertical9 = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height*2)];
        
        scrollViewVertical9.contentSize = CGSizeMake(scrollView.frame.size.width,
                                                     scrollView.frame.size.height+80);
        //        //comeca a view do scroll no meio
        //        [scrollViewHorizontal setContentOffset:CGPointMake(scrollView.frame.size.width*8, 0)];
        
        scrollViewVertical9.pagingEnabled=NO;
        scrollViewVertical9.backgroundColor = [UIColor whiteColor];
        scrollViewVertical9.delegate = self;
        
        [viewMaratona addSubview:scrollViewVertical9];

        
        
        
        UIImageView* imageMaratona = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"maratona.png"]];
        imageMaratona.frame = CGRectMake(30,15, 270, 154);
        [scrollViewVertical9 addSubview:imageMaratona];
        
        //Titulo
        UILabel *tituloMaratona = [[UILabel alloc]initWithFrame:CGRectMake(30, 10, 100, 80)];
        tituloMaratona.text = @"Matatona";
        [tituloMaratona setFont:[UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:22]];
        
        [scrollViewVertical9 addSubview:tituloMaratona];
        
        // Descricao Marathon
        UITextView *descricaoMarathon = [[UITextView alloc]initWithFrame:CGRectMake(30, 211, 270, 440)];
        descricaoMarathon.text = @"Essa Mountain Bike (Bicicleta de Montanha) é ideal para aqueles que gostam de trilhas longas. Por ser full-suspension (possui sistema de amortecimento dianteiro e traseiro) proporciona maior conforto ao piloto que pedala longas distâncias em terreno acidentado • Características chave: full-suspension, confortável, rápida em descidas e estradas de terra (estradões)";
        descricaoMarathon.editable = NO;
        descricaoMarathon.scrollEnabled = YES;
        descricaoMarathon.textAlignment = NSTextAlignmentJustified;
        [descricaoMarathon setFont:[UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:18]];
        [scrollViewVertical9 addSubview:descricaoMarathon];
        
        
        [scrollView addSubview:viewMaratona];
        
        
        //adicionando view tandemMTB na scroll view
        UIView *viewTandemMTB = [[UIView alloc]
                                 initWithFrame:CGRectMake(((scrollView.frame.size.width)*12), 0,
                                                          (scrollView.frame.size.width), scrollView.frame.size.height)];
        
        viewTandemMTB.backgroundColor=[UIColor whiteColor];
        [viewTandemMTB setTag:7];
        
        UIImageView* imageTandemMTB = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"tandem-mtb.png"]];
        imageTandemMTB.frame = CGRectMake(30,15, 270, 114);
        [viewTandemMTB addSubview:imageTandemMTB];
        
        //Titulo
        UILabel *tituloTandemMTB = [[UILabel alloc]initWithFrame:CGRectMake(30, 114, 140, 100)];
        tituloTandemMTB.text = @"Tandem MTB";
        [tituloTandemMTB setFont:[UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:22]];
        
        [viewTandemMTB addSubview:tituloTandemMTB];
        
        
        //Descricao Tandem MTB
        
        UITextView *descricaoTandemMTB = [[UITextView alloc]initWithFrame:CGRectMake(30, 211, 270, 300)];
        descricaoTandemMTB.text = @"Uma para dois! Quão divertido isso pode ser? Já imaginou poder fazer longos passeios em trilhas e dividir a força com outro ciclista? A Tandem é uma bike construída e reforçada para suportar dois ciclistas (“pedalantes”). Ideal pra fazer passeios em família ou casal • Características chave: diversão garantida, rápida, passeio/prática de esporte, terrenos acidentados.";
        descricaoTandemMTB.editable = NO;
        [descricaoTandemMTB setUserInteractionEnabled:YES];
        [descricaoTandemMTB setScrollEnabled:YES];
        descricaoTandemMTB.textAlignment = NSTextAlignmentJustified;
        [descricaoTandemMTB setFont:[UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:18]];
        [viewTandemMTB addSubview:descricaoTandemMTB];
        
        
        [scrollView addSubview:viewTandemMTB];
        
        
        //adicionando view xco na scroll view
        UIView *viewXCO = [[UIView alloc]
                           initWithFrame:CGRectMake(((scrollView.frame.size.width)*13), 0,
                                                    (scrollView.frame.size.width), scrollView.frame.size.height)];
        
        viewXCO.backgroundColor=[UIColor whiteColor];
        [viewXCO setTag:7];
        
        
        //criando uma view scroll para possibilitar descer a página
        UIScrollView* scrollViewVertical10 = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height*2)];
        
        scrollViewVertical10.contentSize = CGSizeMake(scrollView.frame.size.width,
                                                     scrollView.frame.size.height+160);
        //        //comeca a view do scroll no meio
        //        [scrollViewHorizontal setContentOffset:CGPointMake(scrollView.frame.size.width*8, 0)];
        
        scrollViewVertical10.pagingEnabled=NO;
        scrollViewVertical10.backgroundColor = [UIColor whiteColor];
        scrollViewVertical10.delegate = self;
        
        [viewXCO addSubview:scrollViewVertical10];

        
        
        UIImageView* imageXCO = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"xco.png"]];
        imageXCO.frame = CGRectMake(30,15, 270, 153);
        [scrollViewVertical10 addSubview:imageXCO];
        
        //Titulo
        UILabel *tituloXCO = [[UILabel alloc]initWithFrame:CGRectMake(30, 10, 100, 80)];
        tituloXCO.text = @"XCO";
        [tituloXCO setFont:[UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:22]];
        
        [scrollViewVertical10 addSubview:tituloXCO];
        
        
        //Descricão XCO
        UITextView *descricaoXCO = [[UITextView alloc]initWithFrame:CGRectMake(30, 211, 270, 440)];
        descricaoXCO.text = @"Bicicleta de Cross Country Olímpico (XCO) ou mais didaticamente, de trilhas técnicas. Essa Mountain Bike é feita para desafiar trilhas (circuitos) técnicos com obstáculos naturais e artificias, como pedras, raízes e pontes. São excelentes em subidas com terreno acidentando e, em descidas não tão rápidas quanto as bikes full-supension, por terem o “Rabo-Duro” ou Hard Tail do inglês, ou seja, não possuem suspensão traseira • Características chaves: terrenos acidentados, ágeis nas subidas, trechos técnicos e estradões, prática de esportes e passeio.";
        descricaoXCO.editable = NO;
        descricaoXCO.scrollEnabled = YES;
        descricaoXCO.textAlignment = NSTextAlignmentJustified;
        [descricaoXCO setFont:[UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:18]];
        [scrollViewVertical10 addSubview:descricaoXCO];
        
        
        [scrollView addSubview:viewXCO];
        
        
        
        [self.view addSubview:scrollView];
        
        pageControl = [[UIPageControl alloc] init];
        pageControl.frame = CGRectMake(self.view.bounds.size.width/2, 60, 40, 20);
        pageControl.numberOfPages = 3;
        pageControl.currentPage = 1;
        [pageControl addTarget:self action:@selector(pageChanged) forControlEvents:UIControlEventValueChanged];
        [self.view addSubview:pageControl];
        
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //pageControl.currentPage = scrollView.tag;
    // NSLog(@"%@",(id) scrollView.contentOffset);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)voltarTela{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)scrollViewDidScroll:(UIScrollView *)_scrollView{
    
    CGFloat viewWidth = _scrollView.frame.size.width;
    // content offset - tells by how much the scroll view has scrolled.
    
    int pageNumber = floor((_scrollView.contentOffset.x - viewWidth/50) / viewWidth) +1;
    
    
    if(pageNumber == 8){
        pageControl.currentPage=1;
    }
    else if(pageNumber<8){
        pageControl.currentPage=0;
    }
    else if (pageNumber>8){
        pageControl.currentPage=2;
    }
}

- (void)pageChanged {
    
    int pageNumber = (int)pageControl.currentPage;
    //NSLog(@"pOHA EH ESSAAAA");
    CGRect frame = scrollView.frame;
    frame.origin.x = frame.size.width*pageNumber;
    frame.origin.y=0;
    
    [scrollView scrollRectToVisible:frame animated:YES];
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return 3;
    
}
-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    NSMutableArray* arrayPicker = [NSMutableArray array];
    [arrayPicker addObject:[NSString stringWithFormat:@"Vou passear"]];
    [arrayPicker addObject:[NSString stringWithFormat:@"Vou ao trabalho"]];
    [arrayPicker addObject:[NSString stringWithFormat:@"Quero competir"]];
    
    
    return [arrayPicker objectAtIndex:row];
}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    //UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Hello" message:[NSString stringWithFormat:@"Hello ROW  %d",row] delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil];
    // [alert show];
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
