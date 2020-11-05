#include <Servo.h>

Servo myservo;  //创建一个舵机控制对象
int pos = 0;    // 存储舵机角度位置
int TrgPin = 8; //定义管脚
int EcoPin = 9;
int Light = 7 ; //定义二极管管脚
float dist; //距离

void setup()
{   
  
  Serial.begin(9600);
  //设置TrgPin为输出状态
  pinMode(TrgPin, OUTPUT);
  // 设置EcoPin为输入状态
  pinMode(EcoPin, INPUT);
  pinMode(Light, OUTPUT);
  myservo.attach(10);  // 舵机由arduino第10脚控制
  
}
void loop()
{
  
  digitalWrite(TrgPin, LOW);
  delayMicroseconds(8);
  digitalWrite(TrgPin, HIGH);
  // 维持10毫秒高电平用来产生一个脉冲
  delayMicroseconds(10);
  digitalWrite(TrgPin, LOW);
  // 读取脉冲的宽度并换算成距离
  dist = pulseIn(EcoPin, HIGH) / 58.00;
  //Serial.print("Distance:");
  Serial.println(dist);
  //Serial.println("cm");
  if(dist<=20)
  {
    digitalWrite(Light, HIGH);   //点亮二极管
    for(pos = 0; pos < 90; pos += 1)  // 从0度到180度运动， 每次步进一度
    {                                                    
      myservo.write(pos);        // 指定舵机转向的角度
      delay(5);                       // 等待5ms让舵机到达指定位置
    }
    
    delay(3000);  //延时3s
    
    for(pos = 90; pos>=1; pos-=1)   //从180度到0度运动  
    {                                
      myservo.write(pos);         // 指定舵机转向的角度
      delay(5);                        // 等待5ms让舵机到达指定位置
    }
    digitalWrite(Light, LOW);
  }
delay(300); //延时300ms
}
