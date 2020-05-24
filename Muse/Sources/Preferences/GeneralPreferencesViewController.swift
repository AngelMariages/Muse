//
//  GeneralPreferencesViewController.swift
//  Muse
//
//  Created by Marco Albera on 30/07/2018.
//  Copyright © 2018 Edge Apps. All rights reserved.
//

import Cocoa
import MASPreferences

class GeneralPreferencesViewController: NSViewController, MASPreferencesViewController {
    
    override var nibName: NSNib.Name? {
        return NSNib.Name(rawValue: "GeneralPreferencesView")
    }
    
    // MARK: MASPreferencesViewController
    
    var viewIdentifier: String = "GeneralPreferences"
    
    var toolbarItemLabel: String? = "General"
    
    var toolbarItemImage: NSImage? = NSImage(named: NSImage.Name.preferencesGeneral)
    
    // MARK: General preferences
    var showControlStripItem: Bool {
        set {
            Preference<Bool>(.controlStripItem).set(newValue)
        }
        
        get {
            return Preference<Bool>(.controlStripItem).value
        }
    }

    @IBAction func handleClick(_ sender: NSButton) {
        switch sender.identifier?.rawValue {
            case "controlStripButton":
                showControlStripItem = sender.state.rawValue == 0 ? false : true
            case "hudControlStrip":
                showHUDForControlStripAction = sender.state.rawValue == 0 ? false : true
            case "songTitleMenu":
                showSongTitle = sender.state.rawValue == 0 ? false : true
            case .none:
                print("none")
            case .some(_):
                print("some")
        }
    }
    
    var showHUDForControlStripAction: Bool {
        set {
            Preference<Bool>(.controlStripHUD).set(newValue)
        }
        
        get {
            return Preference<Bool>(.controlStripHUD).value
        }
    }
    
    var showSongTitle: Bool {
        set {
            Preference<Bool>(.menuBarTitle).set(newValue)
        }
        
        get {
            return Preference<Bool>(.menuBarTitle).value
        }
    }
    
}
