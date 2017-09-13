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

		setupMapView()
		refreshPins()
	}

	func refreshPins() {
		removeAllPins()

		MYTVehiclesAPIClient.shared().getVehiclesIn(mapView.visibleMapRect, success: { [weak self] vehicles in
			self?.addPins(for: vehicles)
		}) { (error) in
			// handle error or most likely go to sleep :)
		}
	}
}

// MARK: - MKMapViewDelegate

extension MapViewController: MKMapViewDelegate {
	func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
		refreshPins()
	}
}

// MARK: - Private methods

extension MapViewController {

	fileprivate func setupMapView() {
		// Hamburg
		let location = CLLocationCoordinate2D(latitude: 53.5439092, longitude: 9.9834774)
		let span = MKCoordinateSpanMake(0.05, 0.05)
		let region = MKCoordinateRegion(center: location, span: span)
		mapView.setRegion(region, animated: true)

		mapView.delegate = self
	}

	fileprivate func removeAllPins() {
		mapView.removeAnnotations(mapView.annotations)
	}

	fileprivate func addPins(for vehicles:[MYTVehicleModel]) {
		vehicles.forEach { [weak self] vehicle in
			self?.mapView.addAnnotation(createAnnotation(for: vehicle))
		}
	}

	fileprivate func createAnnotation(for vehicle: MYTVehicleModel) -> MKPointAnnotation {
		let location = CLLocationCoordinate2DMake(CLLocationDegrees(vehicle.latitude), CLLocationDegrees(vehicle.longitude))
		let annotation = MKPointAnnotation()
		annotation.coordinate = location
		annotation.title = vehicle.type.capitalized
		annotation.subtitle = vehicle.state.capitalized
		return annotation
	}
}
