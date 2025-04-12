# 🔐 Smart Door Lock System using Arduino Nano

This project is a **keypad-based smart door lock system** built using an Arduino Nano, designed as part of our **IoT curriculum**. It provides a simple and secure way to control access using a 4-digit PIN code.

---

## 🚀 Project Highlights

- ✅ **Arduino Nano**
- 🔢 **4x4 Keypad** for secure PIN entry
- 🔄 **Servo Motor** to control the locking mechanism
- 🖥 **SSD1306 OLED Display** for user interaction
- 💡 **LED indicators** & 🔊 **Buzzer** for real-time feedback

---

## ⚙️ How It Works

1. The user is prompted to **enter a 4-digit PIN** using the keypad.
2. On pressing `#`:
   - ✅ If the input is **correct**:
     - The OLED displays `"Welcome To Home"`.
     - The **servo unlocks** the door.
     - A **green LED blinks** three times.
   - ❌ If the input is **incorrect**:
     - The OLED shows `"Wrong Password"`.
     - A **red LED flashes**.
     - A **buzzer sounds** an alert.
3. The OLED guides the user through the entire process.

---

## 🧪 Try the Simulation

👉 You can run and test this project directly on [Wokwi Arduino Simulator]([https://wokwi.com](https://wokwi.com/projects/428032776238138369)).

---

## 👨‍💻 Team Members

- Siddhi Jadhav
- Mahima Reddy    
- Pragati Bhingarkar  
- Sakshi Avagadhe  

---


## 📦 Components Used

- Arduino Nano  
- 4x4 Matrix Keypad  
- SSD1306 OLED Display (I2C)  
- Servo Motor (SG90)  
- Red & Green LEDs  
- Buzzer  
- Jumper wires & Breadboard


---

  
## 🙏 Mentors

Special thanks to our **mentors and faculty** for their continuous support and guidance throughout the development of this project!
---

## 🛠️ Future Improvements

- Add **RFID support** for card-based access.
- Integrate with **IoT dashboard** to monitor access logs.
- Enable **Bluetooth/Wi-Fi** unlocking via mobile app.

---

Feel free to fork, modify, or enhance this project for your own smart security solutions!
