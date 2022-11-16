# Task 3

## Table of contents

1. [Starting mosquitto broker](#Starting_mosquitto_broker)
2. [Building example mosquitto_subscriber](#Building_example_mosquitto_subscriber)
3. [Publishing a message with mosquitto_pub](#Publishing_a_message_with_mosquitto_pub)

Task files structure

```
.
├── mosquitto.conf.me   - config file for mosquitto broker
├── mqtt_start
│   └── pwfile          - password file for mosquitto broker
├── mqtt_subscriber     - mqtt_subscriber example from SDK
│
├── mqtt_subscriber.log - output of mqtt_subscriber/cross-build.sh 
└── readme.md
```

# Starting mosquitto broker <a name="Starting_mosquitto_broker"></a>

![image](https://user-images.githubusercontent.com/51270744/202132237-9e8cc802-d384-400d-a7ed-41c9306af8cb.png)

# Building example mosquitto_subscriber <a name="Building_example_mosquitto_subscriber"></a>

![image](https://user-images.githubusercontent.com/51270744/202132515-973e502f-4993-4f48-a49b-3c4597cb76a4.png)

# Publishing a message with mosquitto_pub <a name="Publishing_a_message_with_mosquitto_pub"></a>

![image](https://user-images.githubusercontent.com/51270744/202133220-41961012-3974-4250-b643-6324d636c028.png)

After that we can see the message in our subscriber log:

![image](https://user-images.githubusercontent.com/51270744/202133431-b6e7a229-e1e0-45a7-8a0d-630e3dfc7095.png)

full subscriber log can be found in [mqtt_subscriber.log](./mqtt_subscriber.log)
