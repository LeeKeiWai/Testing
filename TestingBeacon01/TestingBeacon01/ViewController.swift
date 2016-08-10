//
//  ViewController.swift
//  TestingBeacon01
//
//  Created by Daniel Leung on 8/2/16.
//  Copyright © 2016 web-on. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {

    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        
        let uuid = NSUUID(UUIDString: "b9407f30-f5f8-466e-aff9-25556b57fe6d")
        let major: CLBeaconMajorValue = UInt16(313)
        let minor: CLBeaconMinorValue = UInt16(313)
        
        let beaconRegion = CLBeaconRegion(proximityUUID: uuid!, major: major, minor: minor, identifier: "ABC")
        //locationManager.startRangingBeaconsInRegion(beaconRegion)
        locationManager.startMonitoringForRegion(beaconRegion)
   
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

// MARK: CLLocationManagerDelegate
extension ViewController: CLLocationManagerDelegate
{
    func locationManager(manager: CLLocationManager, monitoringDidFailForRegion region: CLRegion?, withError error: NSError)
    {
        print("Failed monitoring region: \(error.description)")
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError)
    {
        print("Location manager failed: \(error.description)")
    }
    
    func locationManager(manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], inRegion region: CLBeaconRegion)
    {
        
//        if let beacons = beacons as? [CLBeacon] {
//            for beacon in beacons {
//                for item in items {
//                    if item == beacon {
//                        item.lastSeenBeacon = beacon
//                    }
//                }
//            }
//        }
    }
    
    func locationManager(manager: CLLocationManager, didExitRegion region: CLRegion) {
        
        let notification = UILocalNotification()
        notification.alertBody = "didExitRegion"
        notification.soundName = "Default"
        UIApplication.sharedApplication().presentLocalNotificationNow(notification)
        
    }
    
    func locationManager(manager: CLLocationManager, didEnterRegion region: CLRegion) {
        
        let notification = UILocalNotification()
        notification.alertBody = "didEnterRegion"
        notification.soundName = "Default"
        UIApplication.sharedApplication().presentLocalNotificationNow(notification)
        
    }
    
    func locationManager(manager: CLLocationManager, didStartMonitoringForRegion region: CLRegion) {
        //NSLog(@"Started monitoring %@ region", region.identifier);
        //NSLog(@"Monitored regions: %@", self.locationManager.monitoredRegions);
        
        print("Started monitoring \(region.identifier) region")
        
        let notification = UILocalNotification()
        notification.alertBody = "didStartMonitoringForRegion"
        notification.soundName = "Default"
        UIApplication.sharedApplication().presentLocalNotificationNow(notification)
    }
}

