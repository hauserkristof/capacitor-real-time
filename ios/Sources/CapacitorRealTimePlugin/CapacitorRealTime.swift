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

    /// Milliseconds since boot, including time spent asleep (like Android's
    /// SystemClock.elapsedRealtime). ProcessInfo.systemUptime pauses while the
    /// device sleeps, which breaks uptime-based drift calculations.
    @objc public func getUptime() -> TimeInterval {
        return TimeInterval(clock_gettime_nsec_np(CLOCK_MONOTONIC)) / 1_000_000
    }
}
