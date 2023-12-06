// CapacitorRealTime.java
package hu.hauserresults.plugins.caprealtime;

import android.os.SystemClock;
import android.util.Log;
import java.time.Clock;

public class CapacitorRealTime {

    public String echo(String value) {
        Log.i("Echo", value);
        return value;
    }

    public long getUptime() {
        long uptime = SystemClock.elapsedRealtime();
        return uptime;
    }

    public Clock getGnssTime() {
        try {
            Clock gnssTime = null;
            if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.Q) {
                gnssTime = SystemClock.currentGnssTimeClock();
            }
            if (gnssTime == null) {
                //throw new UnsupportedOperationException("GNSS Time is not available");
                Log.e("CapacitorRealTime", "GNSS Time is not available");
                //call.reject("GNSS Time is not available");
            }
            return gnssTime;
        } catch (Exception e) {
            Log.e("CapacitorRealTime", "Error getting GNSS Time: " + e.getMessage());
            //call.reject("Error getting GNSS Time: " + e.getMessage());
            return null; // Or handle the error as appropriate for your application
        }
    }

    public Clock getNetworkTime() {
        try {
            Clock networkTime = null;
            if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.TIRAMISU) {
                networkTime = SystemClock.currentNetworkTimeClock();
            }
            if (networkTime == null) {
                //throw new UnsupportedOperationException("Network Time is not available");
                //call.reject("Network Time is not available");
                Log.e("CapacitorRealTime", "Network Time is not available");
            }
            return networkTime;
        } catch (Exception e) {
            Log.e("CapacitorRealTime", "Error getting Network Time: " + e.getMessage());
            //call.reject("Error getting Network Time: " + e.getMessage());
            return null; // Or handle the error as appropriate for your application
        }
    }
}
