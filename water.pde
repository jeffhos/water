final int NUM_LIGHTS = 50;
final int LIGHT_WIDTH = 20;

final color startColor = color(0, 0, 128);
final color endColor = color(0, 255, 255);

class Light {
  float currentLerp;
  float targetLerp;
  float speed;
}

Light[] lights;

void setup() {
  size(NUM_LIGHTS * LIGHT_WIDTH, 150);
  lights = new Light[NUM_LIGHTS];
  for (int i = 0; i < NUM_LIGHTS; i++) {
    lights[i] = new Light();
    lights[i].currentLerp = random(1);
    chooseNewTarget(lights[i]);
  }
  frameRate(15);
}

void draw() {
  for (int i = 0; i < NUM_LIGHTS; i++) {
    if (lights[i].targetLerp < lights[i].currentLerp) {
      lights[i].currentLerp -= lights[i].speed;
      if (lights[i].currentLerp <= lights[i].targetLerp) {
        chooseNewTarget(lights[i]);
      }
    } else {
      lights[i].currentLerp += lights[i].speed;
      if (lights[i].currentLerp >= lights[i].targetLerp) {
        chooseNewTarget(lights[i]);
      }
    }
    fill(lerpColor(startColor, endColor, lights[i].currentLerp));
    rect(i * LIGHT_WIDTH, 0, LIGHT_WIDTH, 150);
  }  
}

void chooseNewTarget(Light light) {
  light.targetLerp = random(1);
  light.speed = random(0.2);
}

