//CapacitorRealTimePlugin.java
package hu.hauserresults.plugins.caprealtime;

import android.os.Build;

import androidx.annotation.RequiresApi;

import com.getcapacitor.JSObject;
import com.getcapacitor.Plugin;
import com.getcapacitor.PluginCall;
import com.getcapacitor.PluginMethod;
import com.getcapacitor.annotation.CapacitorPlugin;
import java.net.InetAddress;
import java.time.Clock;
import java.time.DateTimeException;
import java.time.Duration;

import org.apache.commons.net.ntp.NTPUDPClient;
import org.apache.commons.net.ntp.TimeInfo;

@CapacitorPlugin(name = "CapacitorRealTime")
public class CapacitorRealTimePlugin extends Plugin {

    private CapacitorRealTime implementation = new CapacitorRealTime();
    
    @PluginMethod
    public void echo(PluginCall call) {
        String value = call.getString("value");

        JSObject ret = new JSObject();
        ret.put("value", implementation.echo(value));
        call.resolve(ret);
    }

    @PluginMethod
    public void getUptime(PluginCall call) {
        long uptime = implementation.getUptime();
        JSObject ret = new JSObject();
        ret.put("uptime", uptime);
        call.resolve(ret);
    }

    @RequiresApi(api = Build.VERSION_CODES.O)
    @PluginMethod
    public void getGnssTime(PluginCall call) {
        try{
            Clock gnssTime = implementation.getGnssTime();
            JSObject ret = new JSObject();

            if(gnssTime != null){
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                    ret.put("gnssTime", gnssTime.millis());
                    call.resolve(ret);
                }else {
                    call.reject("GNSS Time is not available");
                }
            }else{
                call.reject("Error getting GNSS Time");
            }
        }catch (DateTimeException e){
            call.reject("Error getting GNSS Time: " + e.getMessage());
        }
    }

    @RequiresApi(api = Build.VERSION_CODES.O)
    @PluginMethod
    public void getNetworkTime(PluginCall call) {
        try{
            Clock networkTime = implementation.getNetworkTime();
            JSObject ret = new JSObject();

            if( networkTime != null){
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                    ret.put("networkTime", networkTime.millis());
                    call.resolve(ret);
                }else{
                    call.reject("Network Time is not available");
                }
            }else{
                call.reject("Error getting Network Time");
            }
        }catch (DateTimeException e){
            call.reject("Error getting Network Time: " + e.getMessage());
        }
    }

    @PluginMethod
    public void getTrueTime(PluginCall call) {
        new Thread(
            () -> {
                try {
                    NTPUDPClient client = new NTPUDPClient();
                    client.setDefaultTimeout(10000);
                    client.open();
                    InetAddress hostAddr = InetAddress.getByName("pool.ntp.org");
                    TimeInfo info = client.getTime(hostAddr);
                    long returnTime = info.getMessage().getTransmitTimeStamp().getTime();

                    JSObject ret = new JSObject();
                    ret.put("networkTime", returnTime);
                    call.resolve(ret);
                } catch (Exception e) {
                    call.reject("Error getting network time", e);
                }
            }
        )
            .start();
    }
}
