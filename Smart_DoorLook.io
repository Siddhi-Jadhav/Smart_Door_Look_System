#include <Wire.h>
#include <Adafruit_GFX.h>
#include <Adafruit_SSD1306.h>
#include <Keypad.h>
#include <Servo.h>

#define SCREEN_WIDTH 128
#define SCREEN_HEIGHT 64
#define OLED_RESET -1
Adafruit_SSD1306 display(SCREEN_WIDTH, SCREEN_HEIGHT, &Wire, OLED_RESET);

// Servo
Servo lockServo;
int servoPin = 10;

// LEDs & Buzzer
int greenLED = 11;
int redLED = 12;
int buzzer = 13;

// Keypad
const byte ROWS = 4;
const byte COLS = 4;
char keys[ROWS][COLS] = {
  {'1','2','3','A'},
  {'4','5','6','B'},
  {'7','8','9','C'},
  {'*','0','#','D'}
};

byte rowPins[ROWS] = {9,8,7,6};
byte colPins[COLS] = {5,4,3,2};
Keypad keypad = Keypad(makeKeymap(keys), rowPins, colPins, ROWS, COLS);

// Password
String password = "1234";
String input = "";

void setup() {
  Serial.begin(9600);
  lockServo.attach(servoPin);
  lockServo.write(0); // Locked

  pinMode(greenLED, OUTPUT);
  pinMode(redLED, OUTPUT);
  pinMode(buzzer, OUTPUT);

  // Initialize the OLED display
  if(!display.begin(SSD1306_SWITCHCAPVCC, 0x3C)) {
    Serial.println(F("OLED failed"));
    for(;;);
  }

  // Show "Aether AI" at startup
  display.clearDisplay();
  display.setTextSize(2);
  display.setTextColor(WHITE);
  display.setCursor(0, 20);
  display.println("Aether AI");
  display.display();
  
  delay(2000); // Show "Aether AI" for 2 seconds

  // Now show the "Enter Password" prompt
  display.clearDisplay();
  display.setTextSize(1);
  display.setCursor(0, 0);
  display.println("Enter Password:");
  display.display();
}

void loop() {
  char key = keypad.getKey();

  if (key) {
    if (key == '#') {
      if (input == password) {
        displaySuccess();
        blinkGreenLED();
        lockServo.write(90);  // Unlock
        delay(3000);
        lockServo.write(0);   // Lock
      } else {
        displayFailure();
        wrongFeedback();
      }
      input = "";
      displayPrompt();
    } else if (key == '*') {
      input = "";
      displayPrompt();
    } else {
      input += key;
      displayInput(input);
    }
  }
}

void displayPrompt() {
  display.clearDisplay();
  display.setCursor(0,0);
  display.println("Enter Password:");
  display.display();
}

void displayInput(String str) {
  displayPrompt();
  display.setCursor(0, 20);
  display.print(str);
  display.display();
}

void displaySuccess() {
  display.clearDisplay();
  display.setCursor(0, 0);
  display.println("Welcome To Home");
  display.display();
}

void displayFailure() {
  display.clearDisplay();
  display.setCursor(0, 0);
  display.println("Wrong Password");
  display.display();
}

void blinkGreenLED() {
  for (int i = 0; i < 3; i++) {
    digitalWrite(greenLED, HIGH);
    delay(200);
    digitalWrite(greenLED, LOW);
    delay(200);
  }
}

void wrongFeedback() {
  for (int i = 0; i < 3; i++) {
    digitalWrite(redLED, HIGH);
    digitalWrite(buzzer, HIGH);
    delay(200);
    digitalWrite(redLED, LOW);
    digitalWrite(buzzer, LOW);
    delay(200);
  }
}
