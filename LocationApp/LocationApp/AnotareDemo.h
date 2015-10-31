//
//  AnotareDemo.h
//  LocationApp
//
//  Created by Horatiu on 31/10/15.
//  Copyright (c) 2015 Horatiu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface AnotareDemo : NSObject<MKAnnotation>
@property (nonatomic) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString *title;

- (id) initWithTitle:(NSString *)title coordinates:(CLLocationCoordinate2D) coordonate;

@end
