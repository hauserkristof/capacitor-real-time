export interface CapacitorRealTimePlugin {
  echo(options: { value: string }): Promise<{ value: string }>;
}
