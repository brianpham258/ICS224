//
//  SecondViewController.swift
//  Lab9
//
//  Created by Brian Pham on 2020-03-23.
//  Copyright © 2020 ics057. All rights reserved.
//

import UIKit
import CoreMotion

class SecondViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var sensorPickerView: UIPickerView!
    @IBOutlet weak var statusTextView: UITextView!
    var pickerData = [" ", "Accelerometer", "Altimeter", "Device Motion", "Gyro", "Magnetometer"]
    var motionManager = CMMotionManager()
    var altimeter = CMAltimeter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        sensorPickerView.delegate = self
        sensorPickerView.dataSource = self
    }

    func setupAccelerometer() {
        if !motionManager.isAccelerometerAvailable {
            statusTextView.text.append("No Accelerometer\n")
        }
        motionManager.accelerometerUpdateInterval = 5.0
        motionManager.startAccelerometerUpdates(to: OperationQueue.main, withHandler: { (data, error) in
            if let validData = data {
                self.statusTextView.text.append("Accelerometer: \(validData.acceleration)\n")
            }
        })
    }
    
    func setupAltimeter() {
        if !CMAltimeter.isRelativeAltitudeAvailable() {
            statusTextView.text.append("No Altimeter\n")
        }
        altimeter.startRelativeAltitudeUpdates(to: OperationQueue.main, withHandler: { (data, error) in
            if let validData = data {
                self.statusTextView.text.append("Pressure: \(validData.pressure)\n")
                self.statusTextView.text.append("Altitude: \(validData.relativeAltitude)\n")
            }
        })
    }
    
    func setupDeviceMotion() {
        if !motionManager.isDeviceMotionAvailable {
            statusTextView.text.append("No Device Motion Sensor\n")
        }
        motionManager.deviceMotionUpdateInterval = 5.0
        motionManager.startDeviceMotionUpdates(to: OperationQueue.main, withHandler: { (data, error) in
            if let validData = data {
                self.statusTextView.text.append("Attitude: \(validData.attitude)")
                self.statusTextView.text.append("Gravity: \(validData.gravity)\n")
                self.statusTextView.text.append("Heading: \(validData.heading)\n")
                self.statusTextView.text.append("Magnetic Field: \(validData.magneticField)\n")
                self.statusTextView.text.append("Rotation Rate: \(validData.rotationRate)\n")
                self.statusTextView.text.append("User Acceleration: \(validData.userAcceleration)\n\n")
            }
        })
    }
    
    func setupGyro() {
        if !motionManager.isGyroAvailable {
            statusTextView.text.append("No Gyro Sensor\n")
        }
        motionManager.gyroUpdateInterval = 5.0
        motionManager.startGyroUpdates(to: OperationQueue.main, withHandler: { (data, error) in
            if let validData = data {
                self.statusTextView.text.append("Rotation Rate: \(validData.rotationRate)\n")
            }
        })
    }
    
    func setupMagnetometer() {
        if !motionManager.isMagnetometerAvailable {
            statusTextView.text.append("No Magnetometer\n")
            return
        }
        motionManager.magnetometerUpdateInterval = 5.0
        motionManager.startMagnetometerUpdates(to: OperationQueue.main, withHandler: { (data, error) in
            if let validData = data {
                self.statusTextView.text.append("Magnetic Field: \(validData.magneticField)\n")
            }
        })
    }
    
    func stopAll() {
        self.statusTextView.text = ""
        motionManager.stopAccelerometerUpdates()
        altimeter.stopRelativeAltitudeUpdates()
        motionManager.stopDeviceMotionUpdates()
        motionManager.stopGyroUpdates()
        motionManager.stopMagnetometerUpdates()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return pickerData.count
        }
        else {
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return pickerData[row]
        }
        else {
            return nil
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 {
            stopAll()
            switch pickerData[row] {
            case "Accelerometer":
                setupAccelerometer()
            case "Altimeter":
                setupAltimeter()
            case "Device Motion":
                setupDeviceMotion()
            case "Gyro":
                setupGyro()
            case "Magnetometer":
                setupMagnetometer()
            default:
                print("Unkown choice \(pickerData[row])")
            }
        }
    }
}

