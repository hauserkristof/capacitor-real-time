import Foundation
import Capacitor
import Kronos

/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitorjs.com/docs/plugins/ios
 */
@objc(CapacitorRealTimePlugin)
public class CapacitorRealTimePlugin: CAPPlugin, CAPBridgedPlugin {
    public let identifier = "CapacitorRealTimePlugin"
    public let jsName = "CapacitorRealTime"
    public let pluginMethods: [CAPPluginMethod] = [
        CAPPluginMethod(name: "echo", returnType: CAPPluginReturnPromise),
        CAPPluginMethod(name: "getUptime", returnType: CAPPluginReturnPromise),
        CAPPluginMethod(name: "getGnssTime", returnType: CAPPluginReturnPromise),
        CAPPluginMethod(name: "getNetworkTime", returnType: CAPPluginReturnPromise),
        CAPPluginMethod(name: "getTrueTime", returnType: CAPPluginReturnPromise)
    ]
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

    @objc func getUsedTimeZone(_ call: CAPPluginCall) {
        let timeZone = implementation.getUsedTimeZone()
        call.resolve([
            "timeZone": timeZone
        ])
    }

    @objc func getGnssTime(_ call: CAPPluginCall) {
        // Not implemented on iOS, provide an appropriate message or response
        call.unimplemented("GNSS Time is not available on iOS")
    }

    @objc func getNetworkTime(_ call: CAPPluginCall) {
        // Not implemented on iOS, provide an appropriate message or response
        call.unimplemented("Network Time is not available on iOS")
    }

    @objc func getTrueTime(_ call: CAPPluginCall) {
        Clock.sync {
            time, error in
            if let time = time {
                // time is a Date object when using Kronos
                call.resolve(["trueTime": time.timeIntervalSince1970 * 1000])
            } else if let error = error {
                // error is a TimeInterval (Double) representing the offset in seconds
                call.reject("Error getting network time. Offset: \(error) seconds")
            } else {
                call.reject("Unknown error occurred while getting network time")
            }
        }
    }
}
