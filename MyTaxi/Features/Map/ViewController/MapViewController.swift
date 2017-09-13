//
//  MapViewController.swift
//  MyTaxi
//
//  Created by Plamen Andreev on 9/14/17.
//  Copyright © 2017 Plamen Andreev. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

	@IBOutlet weak var mapView: MKMapView!

	override func viewDidLoad() {
		super.viewDidLoad()

		// Hamburg
		let location = CLLocationCoordinate2D(latitude: 53.5439092, longitude: 9.9834774)
		let span = MKCoordinateSpanMake(0.05, 0.05)
		let region = MKCoordinateRegion(center: location, span: span)
		mapView.setRegion(region, animated: true)

		let annotation = MKPointAnnotation()
		annotation.coordinate = location
		annotation.title = "Taxi"
		annotation.subtitle = "Active"
		mapView.addAnnotation(annotation)

	}
}
