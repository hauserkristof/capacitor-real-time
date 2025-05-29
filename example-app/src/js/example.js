import { CapacitorRealTime } from 'capacitor-real-time';

window.testEcho = () => {
  const inputValue = document.getElementById('echoInput').value;
  CapacitorRealTime.echo({ value: inputValue });
};
