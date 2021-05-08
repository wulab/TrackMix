//
//  AppDelegate.swift
//  TrackMix
//
//  Created by Weera Wu on 7/5/2564 BE.
//

import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {

    var track: Track?

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        track = Track()
        updateUserInterface()
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    @IBOutlet var window: NSWindow!
    @IBOutlet weak var textField: NSTextField!
    @IBOutlet weak var slider: NSSlider!

    @IBAction func mute(_ sender: NSButton) {
        if let track = track {
            track.volume = 0.0
            updateUserInterface()
        }
    }

    @IBAction func takeFloatValueForVolumeFrom(_ sender: Any) {
        if let control = sender as? NSControl, let track = track {
            let newValue = control.floatValue

            track.volume = newValue
            updateUserInterface()
        }
    }

    func updateUserInterface() {
        if let volume = track?.volume {
            textField.floatValue = volume
            slider.floatValue = volume
        }
    }
}

