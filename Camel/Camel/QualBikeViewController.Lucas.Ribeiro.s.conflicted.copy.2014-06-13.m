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
@synthesize pageControl,scrollView;

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
        
        // Adjust scroll view content size, set background colour and turn on paging
        
        scrollView.contentSize = CGSizeMake(scrollView.frame.size.width * 3,
                                            scrollView.frame.size.height);
        //comeca a view do scroll no meio
        [scrollView setContentOffset:CGPointMake(scrollView.frame.size.width, 0)];

        scrollView.pagingEnabled=YES;
        scrollView.backgroundColor = [UIColor blackColor];
        scrollView.delegate = self;
        // Generate content for our scroll view using the frame height and width as the reference point
        
        int i = 0;
        while (i<=2) {
            
            UIView *views = [[UIView alloc]
                             initWithFrame:CGRectMake(((scrollView.frame.size.width)*i)+20, 0,
                                                      (scrollView.frame.size.width)-40, scrollView.frame.size.height)];
            views.backgroundColor=[UIColor yellowColor];
            [views setTag:i];
            [scrollView addSubview:views];
            
            i++;
        }
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
    
    pageControl.currentPage=pageNumber;
    
}

- (void)pageChanged {
    
    int pageNumber = (int)pageControl.currentPage;
    
    CGRect frame = scrollView.frame;
    frame.origin.x = frame.size.width*pageNumber;
    frame.origin.y=0;
    
    [scrollView scrollRectToVisible:frame animated:YES];
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
