import { CapacitorRealTime } from 'capacitor-real-time';

window.testEcho = () => {
  const inputValue = document.getElementById('echoInput').value;
  CapacitorRealTime.echo({ value: inputValue });
};

window.testGetUptime = async () => {
  try {
    const result = await CapacitorRealTime.getUptime();
    console.log('Uptime:', result);
    alert('Uptime: ' + result.uptime);
  } catch (e) {
    console.error('Error getting uptime:', e);
    alert('Error getting uptime: ' + e.message);
  }
};

window.testGetUsedTimeZone = async () => {
  try {
    const result = await CapacitorRealTime.getUsedTimeZone();
    console.log('Used Time Zone:', result);
    alert('Used Time Zone: ' + result.timeZone);
  } catch (e) {
    console.error('Error getting used time zone:', e);
    alert('Error getting used time zone: ' + e.message);
  }
};

window.testGetGnssTime = async () => {
  try {
    const result = await CapacitorRealTime.getGnssTime();
    console.log('GNSS Time:', result);
    alert('GNSS Time: ' + new Date(result.gnssTime).toISOString());
  } catch (e) {
    console.error('Error getting GNSS time:', e);
    alert('Error getting GNSS time: ' + e.message);
  }
};

window.testGetNetworkTime = async () => {
  try {
    const result = await CapacitorRealTime.getNetworkTime();
    console.log('Network Time:', result);
    alert('Network Time: ' + new Date(result.networkTime).toISOString());
  } catch (e) {
    console.error('Error getting network time:', e);
    alert('Error getting network time: ' + e.message);
  }
};

window.testGetTrueTime = async () => {
  try {
    const result = await CapacitorRealTime.getTrueTime();
    console.log('True Time (NTP):', result);
    alert('True Time (NTP): ' + new Date(result.trueTime).toISOString());
  } catch (e) {
    console.error('Error getting true time:', e);
    alert('Error getting true time: ' + e.message);
  }
};
