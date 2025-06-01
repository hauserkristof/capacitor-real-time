import Foundation
import Kronos

@objc public class CapacitorRealTime: NSObject {
    @objc public func echo(_ value: String) -> String {
        print(value)
        return value
    }

    @objc public func getUsedTimeZone() -> String {
        return TimeZone.current.identifier
    }

    @objc public func getUptime() -> TimeInterval {
        return ProcessInfo.processInfo.systemUptime * 1000
    }

    @objc public func getGnssTime() -> TimeInterval {
        // Placeholder: Actual GNSS time retrieval would be platform-specific
        // and might involve CoreLocation or other services.
        return 0
    }

    @objc public func getNetworkTime() -> TimeInterval {
        // Placeholder: Similar to getTrueTime, but could be a more generic NTP.
        // For now, TrueTime (which uses NTP) covers this.
        return 0
    }

    @objc public func getTrueTime(completion: @escaping (TimeInterval?, Error?) -> Void) {
        Clock.sync { time, error in
            if let time = time {
                completion(time.timeIntervalSince1970 * 1000, nil)
            } else {
                // Pass the original error, or a custom error.
                // For simplicity, passing Kronos' error (which is TimeInterval offset, or nil)
                // We might want to wrap this in a custom NSError object for more clarity.
                let nsError = NSError(domain: "CapacitorRealTime.TrueTimeError", code: 0, userInfo: ["description": "Failed to get true time.", "originalError": error ?? "Unknown Kronos error"])
                completion(nil, nsError)
            }
        }
    }
}
