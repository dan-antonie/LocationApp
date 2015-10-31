//
//  ViewController.m
//  LocationApp
//
//  Created by Horatiu on 31/10/15.
//  Copyright (c) 2015 Horatiu. All rights reserved.
//

#import "ViewController.h"
#import "AnotareDemo.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@property (nonatomic, strong) CLLocationManager *locationManager;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initializareHartaCuNisteAnnotari];
}

- (void) initializareHartaCuNisteAnnotari
{
    self.locationManager = [[CLLocationManager alloc] init ];
    self.locationManager.delegate = self;
    [self.locationManager requestWhenInUseAuthorization];
    [self.locationManager requestAlwaysAuthorization];
    
    
    
    //niste coordinate
    
    CLLocationCoordinate2D oCoordonata = CLLocationCoordinate2DMake(44.4343131, 26.03865);
    
    AnotareDemo *anotareaMea = [[AnotareDemo alloc] initWithTitle:@"Un titlu" coordinates:oCoordonata];
    [self.mapView addAnnotation:anotareaMea];
    
    
    //self.mapView.showsUserLocation=YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 800, 800);
    [self.mapView setRegion:[self.mapView regionThatFits:region] animated:YES];
}


- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    MKPinAnnotationView  *anAnnotation = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"ceva de refolosit"];
    
    anAnnotation.canShowCallout = YES;
    anAnnotation.calloutOffset = CGPointMake(-9, -5);
    anAnnotation.animatesDrop = YES;
    anAnnotation.pinColor = MKPinAnnotationColorPurple;
    anAnnotation.draggable = YES;
    anAnnotation.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    anAnnotation.leftCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeContactAdd];
    
    
    return anAnnotation;
    
}

- (void)mapView:(MKMapView *)mapView didAddAnnotationViews:(NSArray *)views
{
    AnotareDemo *anAnnotation = [views objectAtIndex:0];
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(anAnnotation.coordinate, 4500, 4500);
    [self.mapView setRegion:[self.mapView regionThatFits:region] animated:YES];
    
    
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
    
    AnotareDemo *anAnnotation = [[self.mapView selectedAnnotations] firstObject];
    
    NSString *coordonatele = [NSString stringWithFormat:@"%.5f %.5f", anAnnotation.coordinate.latitude, anAnnotation.coordinate.longitude];
    
    UIAlertView *anAlert = [[UIAlertView alloc] initWithTitle:@"S-a dat click pe anotation" message:coordonatele delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    [anAlert show];
    
}





@end
