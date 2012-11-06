//
//  FirstViewController.m
//  EncuentraTec
//
//  Created by Viko Nava on 9/27/12.
//  Copyright (c) 2012 Viko Nava. All rights reserved.
//

#import "FirstViewController.h"
#import "Place.h"
#import "RAILSRequest.h"
#import "PlaceInfoViewController.h"

@interface FirstViewController ()
@end


NSMutableArray *allPlaces;
NSArray *searchResults;

@implementation FirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    //[self startStandardUpdates];
     MKCoordinateRegion viewRegion = [self.myMap regionThatFits:MKCoordinateRegionMakeWithDistance(CLLocationCoordinate2DMake(25.650927430672148, -100.28958678245544),0.6,0.6)];
    viewRegion.span.latitudeDelta = 0.0025;
    [self.myMap setRegion:viewRegion animated:NO];
    [self.myMap setDelegate:self];
    allPlaces = [[NSMutableArray alloc] init];
    searchResults = [[NSArray alloc] init];

    [self addPOIs];
    [self setBlackOverlay];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [allPlaces release];
    [searchResults release];
    [_myMap release];
    [_searchBar release];
    [super dealloc];
}

#pragma mark Map

/*
- (void)startStandardUpdates {
    // Create the location manager if this object does not
    // already have one.
    if (nil == self.locationManager)
        self.locationManager = [[CLLocationManager alloc] init];
 
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters;
 
    // Set a movement threshold for new events.
    self.locationManager.distanceFilter = 500;
 
    [self.locationManager startUpdatingLocation];
}
*/

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    // If it's the user location, just return nil.
    if ([annotation isKindOfClass:[MKUserLocation class]]) return nil;
 
    // Handle any custom annotations.
    if ([annotation isKindOfClass:[Place class]]) {
        Place *temp = (Place *)annotation;
        // Try to dequeue an existing pin view first.
        MKAnnotationView* pinView = (MKAnnotationView*)[mapView
        dequeueReusableAnnotationViewWithIdentifier:@"CustomPinAnnotationView"];
 
        if (!pinView) {
            // If an existing pin view was not available, create one.
            pinView = [[[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"CustomPinAnnotation"] autorelease];
            pinView.image = temp.image;
            
            pinView.canShowCallout = YES;
        }
        else pinView.annotation = annotation;
        
        UIButton *moreInfo = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        pinView.rightCalloutAccessoryView = moreInfo;
 
        return pinView;
    }
 
    return nil;
}

- (void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated {
    float sup_x1, sup_y1, inf_x1, inf_y1, m, limity;
    float lat = mapView.centerCoordinate.latitude, lon = mapView.centerCoordinate.longitude;
    
    // LIMITS
    
    // Limite Inferior
    if (lat < 25.647844603731368) lat = 25.647844603731368;
    
    // Limite Izquierdo
    if (lon < -100.29447376728058) lon = -100.29447376728058;
    
    // Limite Derecho
    if (lon > -100.2841392159462) lon = -100.2841392159462;
    
    // Limite Superior
    if (lat > 25.658577333189466) lat = 25.658577333189466;
    
    // Limite Garza Sada
    if (lon > -100.29447376728058 && lon < -100.29012054204941) {
        sup_x1 = -100.29447376728058;
        sup_y1 = 25.654812888104477;
        inf_x1 = -100.29012054204941;
        inf_y1 = 25.647844603731368;
    
        m = (sup_y1-inf_y1)/(sup_x1-inf_x1);
        limity = m*(lon-sup_x1)+sup_y1;
    
        if (lat < limity) lon = sup_x1+((lat-sup_y1)/m);
    }
    
    // Limite Luis Elizondo
    if (lon > -100.29012054204941 && lon < -100.28696358203888) {
        sup_x1 = -100.28696358203888;
        sup_y1 = 25.650226245659972;
        inf_x1 = -100.29012054204941;
        inf_y1 = 25.647844603731368;
    
        m = (sup_y1-inf_y1)/(sup_x1-inf_x1);
        limity = m*(lon-sup_x1)+sup_y1;
    
        if (lat < limity) lat = limity;
    }
    
    // Limite Junco de la Vega
    if (lon > -100.28696358203888 && lon < -100.28561443090439) {
        sup_x1 = -100.28696358203888;
        sup_y1 = 25.650226245659972;
        inf_x1 = -100.28561443090439;
        inf_y1 = 25.64864735535737;
    
        m = (sup_y1-inf_y1)/(sup_x1-inf_x1);
        limity = m*(lon-sup_x1)+sup_y1;
    
        if (lat < limity) lat = limity;
    }
    
    // Limite Dover
    if (lon > -100.2850216627121 && lon < -100.2841392159462) {
        sup_x1 = -100.2841392159462;
        sup_y1 = 25.652994693534186;
        inf_x1 = -100.2850216627121;
        inf_y1 = 25.64879243037626;
    
        m = (sup_y1-inf_y1)/(sup_x1-inf_x1);
        limity = m*(lon-sup_x1)+sup_y1;
    
        if (lat < limity) lon = sup_x1+((lat-sup_y1)/m);
    }
    
    // Limite Junco-Dover
    if (lon > -100.28561443090439 && lon < -100.2850216627121 && lat < 25.64879243037626) {
        lat = 25.64879243037626;
    }
    
    // Limite Nogales-CampusNorte
    if (lon > -100.2877950668335 && lon < -100.2841204404831) {
        sup_x1 = -100.2877950668335;
        sup_y1 = 25.658577333189466;
        inf_x1 = -100.2841204404831;
        inf_y1 = 25.656444887555708;
    
        m = (sup_y1-inf_y1)/(sup_x1-inf_x1);
        limity = m*(lon-sup_x1)+sup_y1;
    
        if (lat > limity) lat = limity;
    }
    
    // Limite Nogales-Junco
    if (lon > -100.29142141342163 && lon < -100.2877950668335) {
        sup_x1 = -100.2877950668335;
        sup_y1 = 25.658577333189466;
        inf_x1 = -100.29142141342163;
        inf_y1 = 25.655226330077134;
    
        m = (sup_y1-inf_y1)/(sup_x1-inf_x1);
        limity = m*(lon-sup_x1)+sup_y1;
    
        if (lat > limity) lat = limity;
    }
    
    // 2abril
    if (lon > -100.29447376728058 && lon < -100.29142141342163) {
        sup_x1 = -100.29447376728058;
        sup_y1 = 25.65569054391771;
        inf_x1 = -100.29142141342163;
        inf_y1 = 25.655226330077134;
    
        m = (sup_y1-inf_y1)/(sup_x1-inf_x1);
        limity = m*(lon-sup_x1)+sup_y1;
    
        if (lat > limity) lat = limity;
    }
    
    
    if (mapView.centerCoordinate.latitude != lat || mapView.centerCoordinate.longitude != lon) {
        [self.myMap setCenterCoordinate:CLLocationCoordinate2DMake(lat, lon) animated:YES];
    }
    
    // ZOOM
    //
    // Check Zoom
    if (mapView.region.span.latitudeDelta > 0.01) {
        [self.myMap setRegion:MKCoordinateRegionMake(self.myMap.region.center, MKCoordinateSpanMake(0.01, 0.01)) animated:TRUE];
    }
}

- (MKOverlayView *)mapView:(MKMapView *)mapView viewForOverlay:(id<MKOverlay>)overlay {
    if ([overlay isKindOfClass:[MKPolygon class]]) {
        MKPolygonView *aView = [[[MKPolygonView alloc] initWithPolygon:(MKPolygon*)overlay] autorelease];
        
        aView.fillColor = [[UIColor darkGrayColor] colorWithAlphaComponent:0.8];
        
        
        return aView;
    }
    
    return nil;
}

#pragma mark Segue to Show Info

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control {
    self.curPlace = (Place *)view.annotation;
    [self performSegueWithIdentifier:@"showPlaceInfoView" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showPlaceInfoView"]) {
        PlaceInfoViewController *placeInfoView = (PlaceInfoViewController *)segue.destinationViewController;
        placeInfoView.curPlace = self.curPlace;
    }
}

#pragma mark Special Functions

- (void)setBlackOverlay {
    CLLocationCoordinate2D points[25];
    points[0] = CLLocationCoordinate2DMake(90, -180);
    points[1] = CLLocationCoordinate2DMake(25.654795963548747,-100.29448449611664);
    points[2] = CLLocationCoordinate2DMake(25.647818006446506,-100.2901178598404);
    points[3] = CLLocationCoordinate2DMake(25.650177887921043,-100.28697431087494);
    points[4] = CLLocationCoordinate2DMake(25.648625594089335,-100.28564393520355);
    points[5] = CLLocationCoordinate2DMake(25.648770669134663,-100.28498947620392);
    points[6] = CLLocationCoordinate2DMake(25.651328796790157,-100.28475880622864);
    points[7] = CLLocationCoordinate2DMake(25.65173983298151,-100.2845710515976);
    points[8] = CLLocationCoordinate2DMake(25.652204060388907,-100.2844101190567);
    points[9] = CLLocationCoordinate2DMake(25.65302612532463,-100.28409898281097);
    points[10] = CLLocationCoordinate2DMake(25.656435216513596,-100.28408288955688);
    points[11] = CLLocationCoordinate2DMake(25.65649324275442,-100.28524696826935);
    points[12] = CLLocationCoordinate2DMake(25.65873690241804,-100.28761267662048);
    points[13] = CLLocationCoordinate2DMake(25.657228239361384,-100.28912007808685);
    points[14] = CLLocationCoordinate2DMake(25.656657650283407,-100.29003202915192);
    points[15] = CLLocationCoordinate2DMake(25.654370431072774,-100.28736054897308);
    points[16] = CLLocationCoordinate2DMake(25.65385785584769,-100.28789699077606);
    points[17] = CLLocationCoordinate2DMake(25.65361607431672,-100.2897959947586);
    points[18] = CLLocationCoordinate2DMake(25.655260179064076,-100.29167354106903);
    points[19] = CLLocationCoordinate2DMake(25.655618010624206,-100.293830037117);
    points[20] = CLLocationCoordinate2DMake(25.654795963548747,-100.29448449611664);
    points[21] = CLLocationCoordinate2DMake(90, -180);
    // CLOSURE
    points[22] = CLLocationCoordinate2DMake(90, 180);
    points[23] = CLLocationCoordinate2DMake(-90, 180);
    points[24] = CLLocationCoordinate2DMake(-90, -180);
    
    
    MKPolygon *p = [MKPolygon polygonWithCoordinates:points count:25];
    [self.myMap addOverlay:p];
}


- (void)addPOIs {
    NSString *filePath = [[NSString alloc] initWithFormat:@"%@", [self dataFilePath]];
    NSArray *response;
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
    //if (false) {
        response = [[[NSArray alloc] initWithContentsOfFile:filePath] autorelease];
    } else {
        RAILSRequest *req = [[RAILSRequest alloc] initWithUrlString:@"places.json" requestData:[NSMutableDictionary dictionaryWithObject:@"" forKey:@"id"]];
        response = [req synchronousGetJsonRequest];
        [req release];
        
        [response writeToFile:filePath atomically:YES];
    }
    
    Place *temp;
    for(int i=0; i<[response count]; i++) {
        NSDictionary *t = [response objectAtIndex:i];
        temp = [[Place alloc] initWithTitle:[t objectForKey:@"title"] andCoordinate:CLLocationCoordinate2DMake([[t objectForKey:@"latitude"] floatValue] , [[t objectForKey:@"longitude"] floatValue]) imageNamed:[t objectForKey:@"image"] subtitle:[t objectForKey:@"schedule"] photo:@"http://img.photobucket.com/albums/v236/jluiz/DSC06254.jpg"];
        
        [self.myMap addAnnotation:temp];
        [allPlaces addObject:temp];
        [temp release];
    }
    [filePath release];
}

#pragma mark Places Persistance

- (NSString *)dataFilePath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    return [documentsDirectory stringByAppendingPathComponent:kFilename];
}

#pragma mark Search Bar

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger rows = 0;
    
    if ([tableView isEqual:self.searchDisplayController.searchResultsTableView]) {
        rows = [searchResults count];
    } else {
        rows = [allPlaces count];
    }
    
    return rows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellId = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellId];
    
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellId] autorelease];
    }
    
    cell.textLabel.text = [(Place *)[searchResults objectAtIndex:indexPath.row] title];
    
    return cell;
}

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString {
    NSPredicate *resultPredicate = [NSPredicate predicateWithFormat:@"SELF.title contains[cd] %@", searchString];
    [searchResults release];
    searchResults = [[allPlaces filteredArrayUsingPredicate:resultPredicate] retain];
    return YES;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.curPlace = [searchResults objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"showPlaceInfoView" sender:self];
}

@end
