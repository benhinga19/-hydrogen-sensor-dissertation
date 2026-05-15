// No LED MQ-8 code
const int sensorPin = A0;
unsigned long startTime;

// Set up connection
void setup() {
  Serial.begin(115200);
  startTime = millis();
}

void loop() {
  unsigned long t = millis() - startTime;
  float t_s = t / 1000.0;
  int raw = analogRead(sensorPin);
  float voltage = raw * (5.0 / 1023.0);

  // Stream data across connection to be read by matlab code
  Serial.print(t_s);
  Serial.print(",");
  Serial.println(voltage);   // IMPORTANT: println adds newline

  delay(100);
}
