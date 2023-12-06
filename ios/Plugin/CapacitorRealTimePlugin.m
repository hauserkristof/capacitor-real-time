// File: CapacitorRealTimePlugin.m
#import <Foundation/Foundation.h>
#import <Capacitor/Capacitor.h>

// Define the plugin using the CAP_PLUGIN Macro, and
// each method the plugin supports using the CAP_PLUGIN_METHOD macro.
CAP_PLUGIN(CapacitorRealTimePlugin, "CapacitorRealTime",
           CAP_PLUGIN_METHOD(echo, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(getUptime, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(getGnssTime, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(getNetworkTime, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(getTrueTime, CAPPluginReturnPromise);
)
