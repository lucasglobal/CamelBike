//
//  protocoloRoda.h
//  rodaGiratoria
//
//  Created by LucasAndrade on 5/27/14.
//  Copyright (c) 2014 Lucas Andrade Ribeiro. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol protocoloRoda <NSObject>

- (void) wheelDidChangeValue:(NSString *)newValue;

@end
