// CapacitorRealTimePlugin.swift
import Foundation
import Capacitor

/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitorjs.com/docs/plugins/ios
 */
@objc(CapacitorRealTimePlugin)
public class CapacitorRealTimePlugin: CAPPlugin {
    private let implementation = CapacitorRealTime()

    @objc func echo(_ call: CAPPluginCall) {
        let value = call.getString("value") ?? ""
        call.resolve([
            "value": implementation.echo(value)
        ])
    }

    @objc func getUptime(_ call: CAPPluginCall) {
        let uptime = implementation.getUptime()
        call.resolve([
            "uptime": uptime
        ])
    }
}
