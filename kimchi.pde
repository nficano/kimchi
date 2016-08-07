/*
 * See: http://seeedstudio.com/wiki/Motor_Shield_V1.0
 *
 * pin1 pin2 pin3 pin4
 * --------------------
 * 1    0    0    1    // forward
 * 0    1    1    0    // reverse
 * 0    1    0    1    // left
 * 1    0    1    0    // right
 */

int pinI1 = 8;       // define I1 interface
int pinI2 = 11;      // define I2 interface
int pinI3 = 12;      // define I3 interface
int pinI4 = 13;      // define I4 interface

int speed = 100;     // define the speed of motor
int speedpinA = 9;   // enable motor A
int speedpinB = 10;  // enable motor B

void setup() {
    pinMode(pinI1, OUTPUT);
    pinMode(pinI2, OUTPUT);
    pinMode(pinI3, OUTPUT);
    pinMode(pinI4, OUTPUT);

    pinMode(speedpinA, OUTPUT);
    pinMode(speedpinB, OUTPUT);
}

void setSpeed(int speed) {
    analogWrite(speedpinA, speed);
    analogWrite(speedpinB, speed);
}

void forward() {
    setSpeed(speed);

    digitalWrite(pinI1, HIGH);
    digitalWrite(pinI2, LOW);
    digitalWrite(pinI3, LOW);
    digitalWrite(pinI4, HIGH);
}

void reverse() {
    setSpeed(speed);

    digitalWrite(pinI1, LOW);
    digitalWrite(pinI2, HIGH);
    digitalWrite(pinI3, HIGH);
    digitalWrite(pinI4, LOW);
}

void rotateLeft() {
    setSpeed(speed);

    digitalWrite(pinI1, LOW);
    digitalWrite(pinI2, HIGH);
    digitalWrite(pinI3, LOW);
    digitalWrite(pinI4, HIGH);
}

void rotateRight() {
    setSpeed(speed);

    digitalWrite(pinI1, HIGH);
    digitalWrite(pinI2, LOW);
    digitalWrite(pinI3, HIGH);
    digitalWrite(pinI4, LOW);
}

void stop() {
    digitalWrite(speedpinA, LOW);
    digitalWrite(speedpinB, LOW);

    delay(1000);
}

/*
 * Spins the rover clockwise, counterclockwise, forwards, and reverse.
 */
void testDrive() {
    rotateLeft();
    delay(2000);
    stop();

    rotateRight();
    delay(2000);
    stop();

    forward();
    delay(2000);
    stop();

    reverse();
    delay(2000);
    stop();
}

void loop() {
    testDrive();
}
