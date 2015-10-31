//
//  AnotareDemo.m
//  LocationApp
//
//  Created by Horatiu on 31/10/15.
//  Copyright (c) 2015 Horatiu. All rights reserved.
//

#import "AnotareDemo.h"

@implementation AnotareDemo


- (id) initWithTitle:(NSString *)title coordinates:(CLLocationCoordinate2D) coordonate
{
    self = [super init];
    if (self) {
        ///initializari
        self.title = title;
        self.coordinate = coordonate;
    }
    
    return self;
}


@end

