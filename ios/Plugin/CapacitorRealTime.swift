// CapacitorRealTime.swift
import Foundation

@objc public class CapacitorRealTime: NSObject {
    @objc public func echo(_ value: String) -> String {
        print(value)
        return value
    }

    @objc publix func getUsedTimeZone(_ call: CAPPluginCall) {
        return TimeZone.current.identifier
    }

    @objc public func getUptime() -> TimeInterval {
        return ProcessInfo.processInfo.systemUptime * 1000
    }
}
