#include <Servo.h>
Servo myservo;  //创建一个舵机控制对象
int pos = 0;    // 该变量用与存储舵机角度位置
int TrgPin = 8;
int EcoPin = 9;
int Light = 7 ;
float dist;
void setup()
{   
  Serial.begin(9600);
  //设置TrgPin为输出状态
  pinMode(TrgPin, OUTPUT);
  // 设置EcoPin为输入状态
  pinMode(EcoPin, INPUT);
  pinMode(Light, OUTPUT);
  myservo.attach(10);  // 该舵机由arduino第九脚控制
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
    digitalWrite(Light, HIGH);
    for(pos = 0; pos < 90; pos += 1)  // 从0度到180度运动
    {                                                     // 每次步进一度
      myservo.write(pos);        // 指定舵机转向的角度
      delay(5);                       // 等待15ms让舵机到达指定位置
    }
    delay(3000);
    for(pos = 90; pos>=1; pos-=1)   //从180度到0度运动  
    {                                
      myservo.write(pos);         // 指定舵机转向的角度
      delay(5);                        // 等待15ms让舵机到达指定位置
    }
    digitalWrite(Light, LOW);
  }
delay(300);
}
