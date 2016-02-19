
//
//  controleDaRoda.m
//  rodaGiratoria
//
//  Created by LucasAndrade on 5/27/14.
//  Copyright (c) 2014 Lucas Andrade Ribeiro. All rights reserved.
//

#import "controleDaRoda.h"
#import <QuartzCore/QuartzCore.h>
#import <QuartzCore/QuartzCore.h>


@interface controleDaRoda()
- (void)drawWheel;
- (float) calculateDistanceFromCenter:(CGPoint)point;
- (void) buildSectorsEven;
- (void) buildSectorsOdd;
- (UIImageView *) getSectorByValue:(int)value;
@end



@implementation controleDaRoda
static float deltaAngle;

//static float maxAlphavalue = 1.0;
@synthesize delegate, container, numberOfSections,startTransform,sectors,currentSector;


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id) initWithFrame:(CGRect)frame andDelegate:(id)del withSections:(int)sectionsNumber {
    // 1 - Call super init
    if ((self = [super initWithFrame:frame])) {
        // 2 - Set properties
        self.numberOfSections = sectionsNumber;
        self.delegate = del;
        // 3 - Draw wheel
        [self drawWheel];
        
	}
    return self;
}


- (void) drawWheel {
    // 1
    container = [[UIView alloc] initWithFrame:self.frame];
    // 2
    CGFloat angleSize = 2*M_PI/numberOfSections;
    
    //criando array com imagens
    //NSMutableArray* arrayPizza = [[NSMutableArray alloc]init];
    // 4 - Create image view
    UIImageView *im2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"1.png"]];
    im2.layer.bounds = CGRectMake(0, 0, 123, 178);
    im2.layer.anchorPoint = CGPointMake(1.0f, 0.5f);
    im2.layer.position = CGPointMake(container.bounds.size.width/2.0-container.frame.origin.x,
                                     container.bounds.size.height/2.0-container.frame.origin.y);
    im2.transform = CGAffineTransformMakeRotation(angleSize*0);
    //im2.alpha = minAlphavalue;
    im2.tag = 1;
    [container addSubview:im2];
    
    UIImageView *im4 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"2.png"]];
    im4.layer.bounds = CGRectMake(0, 0, 123, 178);
    im4.layer.anchorPoint = CGPointMake(1.0f, 0.5f);
    im4.layer.position = CGPointMake(container.bounds.size.width/2.0-container.frame.origin.x,
                                     container.bounds.size.height/2.0-container.frame.origin.y);
    im4.transform = CGAffineTransformMakeRotation(angleSize*1);
    //im4.alpha = minAlphavalue;
    im4.tag = 3;
    [container addSubview:im4];
    
    UIImageView *im3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"3.png"]];
    im3.layer.bounds = CGRectMake(0, 0, 123, 178);
    im3.layer.anchorPoint = CGPointMake(1.0f, 0.5f);
    im3.layer.position = CGPointMake(container.bounds.size.width/2.0-container.frame.origin.x,
                                     container.bounds.size.height/2.0-container.frame.origin.y);
    im3.transform = CGAffineTransformMakeRotation(angleSize*2);
    //im3.alpha = minAlphavalue;
    im3.tag = 2;
    [container addSubview:im3];
    
    UIImageView *im5 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"4.png"]];
    im5.layer.bounds = CGRectMake(0, 0, 123, 178);
    im5.layer.anchorPoint = CGPointMake(1.0f, 0.5f);
    im5.layer.position = CGPointMake(container.bounds.size.width/2.0-container.frame.origin.x,
                                     container.bounds.size.height/2.0-container.frame.origin.y);
    im5.transform = CGAffineTransformMakeRotation(angleSize*3);
    //im5.alpha = minAlphavalue;
    im5.tag = 4;
    [container addSubview:im5];
    
    
    
    UIImageView *im1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"5.png"]];
    im1.layer.bounds = CGRectMake(0, 0, 123, 178);
    im1.layer.anchorPoint = CGPointMake(1.0f, 0.5f);
    im1.layer.position = CGPointMake(container.bounds.size.width/2.0-container.frame.origin.x,
                                     container.bounds.size.height/2.0-container.frame.origin.y);
    im1.transform = CGAffineTransformMakeRotation(angleSize*4);
    //im1.alpha = minAlphavalue;
    im1.tag = 0;
    [container addSubview:im1];
    
    
    
    
    
    
    
    
    
    //    // 3 - Create the sectors
    //	for (int i = 0; i < numberOfSections; i++) {
    //        // 4 - Create image view
    //        UIImageView *im = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"segment.png"]];
    //        im.layer.bounds = CGRectMake(0, 0, 84, 120);
    //        im.layer.anchorPoint = CGPointMake(1.0f, 0.5f);
    //        im.layer.position = CGPointMake(container.bounds.size.width/2.0-container.frame.origin.x,
    //                                        container.bounds.size.height/2.0-container.frame.origin.y);
    //        im.transform = CGAffineTransformMakeRotation(angleSize*i);
    //        im.alpha = minAlphavalue;
    //        im.tag = i;
    //
    //
    //       //if (i == 0) {
    //       //    im.alpha = maxAlphavalue;
    //       // }
    //
    //
    //		// 5 - Set sector image
    //        UIImageView *sectorImage = [[UIImageView alloc] initWithFrame:CGRectMake(5, 40, 40, 40)];
    //        sectorImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"icon%i.png", i]];
    //        [im addSubview:sectorImage];
    //        // 6 - Add image view to container
    //        [container addSubview:im];
    //	}
    
    // 7
    container.userInteractionEnabled = NO;
    [self addSubview:container];
    
    // 7.1 - Add background image
    UIImageView *bg = [[UIImageView alloc] initWithFrame:CGRectMake(self.bounds.origin.x-40, self.bounds.origin.y-40, 290, 290)];
    bg.image = [UIImage imageNamed:@"Roda2.png"];
    
    [self addSubview:bg];
    
    
    // 8 - Initialize sectors
    sectors = [NSMutableArray arrayWithCapacity:numberOfSections];
    if (numberOfSections % 2 == 0) {
        [self buildSectorsEven];
    } else {
        [self buildSectorsOdd];
    }
    
    // 9 - Call protocol method
    [self.delegate wheelDidChangeValue:[NSString stringWithFormat:@"Por que andar de bike?"]];

    
    }

- (void) rotate {
    CGAffineTransform t = CGAffineTransformRotate(container.transform, -0.78);
    container.transform = t;
}

- (BOOL)beginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event {
    // 1 - Get touch position
    CGPoint touchPoint = [touch locationInView:self];
    
    float dist = [self calculateDistanceFromCenter:touchPoint];
    // 1.2 - Filter out touches too close to the center
    if (dist < 40 || dist > 100)
    {
        // forcing a tap to be on the ferrule
        //NSLog(@"ignoring tap (%f,%f)", touchPoint.x, touchPoint.y);
        return NO;
    }
    // 2 - Calculate distance from center
    float dx = touchPoint.x - container.center.x;
    float dy = touchPoint.y - container.center.y;
    // 3 - Calculate arctangent value
    deltaAngle = atan2(dy,dx);
    // 4 - Save current transform
    startTransform = container.transform;
    
    // 5 - Set current sector's alpha value to the minimum value
	//UIImageView *im = [self getSectorByValue:currentSector];
	//im.alpha = minAlphavalue;
    
    return YES;
}
- (BOOL)continueTrackingWithTouch:(UITouch*)touch withEvent:(UIEvent*)event
{
   // CGFloat radians = atan2f(container.transform.b, container.transform.a);
   // NSLog(@"rad is %f", radians);
    
    CGPoint pt = [touch locationInView:self];
    float dx = pt.x  - container.center.x;
    float dy = pt.y  - container.center.y;
    float ang = atan2(dy,dx);
    float angleDifference = deltaAngle - ang;
    container.transform = CGAffineTransformRotate(startTransform, -angleDifference);
    return YES;
}

- (void)endTrackingWithTouch:(UITouch*)touch withEvent:(UIEvent*)event
{
    // 1 - Get current container rotation in radians
    CGFloat radians = atan2f(container.transform.b, container.transform.a);
    // 2 - Initialize new value
    CGFloat newVal = 0.0;
    // 3 - Iterate through all the sectors
    for (setorRoda *s in sectors) {
        
        
        // 4 - Check for anomaly (occurs with even number of sectors)
        if (s.minValue > 0 && s.maxValue < 0) {
            if (s.maxValue > radians || s.minValue < radians) {
                // 5 - Find the quadrant (positive or negative)
                if (radians > 0) {
                    newVal = radians - M_PI;
                } else {
                    newVal = M_PI + radians;
                }
                currentSector = s.sector;
            }
        }
        // 6 - All non-anomalous cases
        else if (radians > s.minValue && radians < s.maxValue) {
            newVal = radians - s.midValue;
            currentSector = s.sector;
        }
    
    }
    // 7 - Set up animation for final rotation
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.2];
    CGAffineTransform t = CGAffineTransformRotate(container.transform, -newVal);
    container.transform = t;
    [UIView commitAnimations];

     
    // 9 - Call protocol method
    switch (currentSector) {
        case 0:
            [self.delegate wheelDidChangeValue:[NSString stringWithFormat:@"Por que andar de bike?"]];
            break;
        case 1:
            [self.delegate wheelDidChangeValue:[NSString stringWithFormat:@"O que saber?"]];
            
            break;
        case 2:
            [self.delegate wheelDidChangeValue:[NSString stringWithFormat:@"Qual bike comprar?"]];
            break;
        case 3:
            [self.delegate wheelDidChangeValue:[NSString stringWithFormat:@"Onde comprar?"]];
            break;
        case 4:
            [self.delegate wheelDidChangeValue:[NSString stringWithFormat:@"Informações do App"]];
            break;



    }
}


- (float) calculateDistanceFromCenter:(CGPoint)point {
    CGPoint center = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2);
    float dx = point.x - center.x;
    float dy = point.y - center.y;
    return sqrt(dx*dx + dy*dy);
}

- (void) buildSectorsOdd {
	// 1 - Define sector length
    CGFloat fanWidth = M_PI*2/numberOfSections;
	// 2 - Set initial midpoint
    CGFloat mid = 0;
	// 3 - Iterate through all sectors
    for (int i = 0; i < numberOfSections; i++) {
        setorRoda *sector = [[setorRoda alloc] init];
		// 4 - Set sector values
        sector.midValue = mid;
        sector.minValue = mid - (fanWidth/2);
        sector.maxValue = mid + (fanWidth/2);
        sector.sector = i;
        mid -= fanWidth;
        if (sector.minValue < - M_PI) {
            mid = -mid;
            mid -= fanWidth;
        }
		// 5 - Add sector to array
        [sectors addObject:sector];
		//NSLog(@"cl is %@", sector);
    }
}

- (void) buildSectorsEven {
    // 1 - Define sector length
    CGFloat fanWidth = M_PI*2/numberOfSections;
    // 2 - Set initial midpoint
    CGFloat mid = 0;
    // 3 - Iterate through all sectors
    for (int i = 0; i < numberOfSections; i++) {
        setorRoda *sector = [[setorRoda alloc] init];
        // 4 - Set sector values
        sector.midValue = mid;
        sector.minValue = mid - (fanWidth/2);
        sector.maxValue = mid + (fanWidth/2);
        sector.sector = i;
        if (sector.maxValue-fanWidth < - M_PI) {
            mid = M_PI;
            sector.midValue = mid;
            sector.minValue = fabsf(sector.maxValue);
            
        }
        mid -= fanWidth;
        //NSLog(@"cl is %@", sector);
        // 5 - Add sector to array
        [sectors addObject:sector];
    }
}

- (UIImageView *) getSectorByValue:(int)value {
    UIImageView *res;
    NSArray *views = [container subviews];
    for (UIImageView *im in views) {
        if (im.tag == value)
            res = im;
    }
    return res;
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
