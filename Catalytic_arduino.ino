// LED alarm code Catalytic sensor
const int sensorPin = A0;
const int ledPin = 12;

unsigned long startTime;
float threshold = 0.3;  // Adjust based on data

void setup() {
  Serial.begin(115200);
  pinMode(ledPin, OUTPUT);
  startTime = millis();
}

void loop() {
  unsigned long t = millis() - startTime;
  float t_s = t / 1000.0;

  int raw = analogRead(sensorPin);
  float voltage = raw * (5.0 / 1023.0);

  Serial.print(t_s);
  Serial.print(",");
  Serial.println(voltage);

  // Hydrogen detection logic
  if (voltage > threshold) {
    // Flash LED
    digitalWrite(ledPin, HIGH);
    delay(200);
    digitalWrite(ledPin, LOW);
    delay(200);
  } else {
    // Keep LED off
    digitalWrite(ledPin, LOW);
    delay(500); // Refresh slower
  }
}
