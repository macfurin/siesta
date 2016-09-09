//
//  SiestaUI-ObjC.swift
//  Siesta
//
//  Created by Paul on 2016/8/17.
//  Copyright © 2016 Bust Out Solutions. All rights reserved.
//

import Foundation
import Siesta

#if !os(OSX)

extension ResourceEvent
    {
    internal static let all = [ObserverAdded, Requested, RequestCancelled, NotModified, Error,
                               NewData(.Network), NewData(.Cache), NewData(.LocalOverride), NewData(.Wipe)]

    internal static func fromDescription(description: String) -> ResourceEvent?
        {
        let matching = ResourceEvent.all.filter { $0.description == description }
        return (matching.count == 1) ? matching[0] : nil
        }
    }

extension ResourceStatusOverlay: _objc_ResourceObserver
    {
    public func resourceChanged(resource: Resource, event eventString: String)
        {
        if let event = ResourceEvent.fromDescription(eventString)
            { resourceChanged(resource, event: event) }
        }
    }

extension ResourceStatusOverlay
    {
    @objc(displayPriority)
    public var _objc_displayPriority: [String]
        {
        get {
            return displayPriority.map { $0.rawValue }
            }

        set {
            displayPriority = newValue.flatMap
                {
                let condition = ResourceStatusOverlay.StateRule(rawValue: $0)
                if condition == nil
                    { Swift.print("WARNING: ignoring unknown ResourceStatusOverlay.StateRule \"\($0)\"") }
                return condition
                }
            }
        }
    }

#endif
