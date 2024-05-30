### How to integrate the sdk

Step 1: Copy the API Token

```
Copy the API token from the manager dashboard
````
   
Step 2: Add the library: 
Add the library to the pubspec.yaml file
```
 live_call_widget_flutter:
    git:
      url: https://gitlab.com/pressone-apps/Live-Call-Widget-Flutter
```      

Step 3: Add the Initialization Function:
Add the following code to the manifest file in the android folder
```
    <uses-permission android:name="android.permission.RECORD_AUDIO" />
    <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE" />
    <uses-permission android:name="android.permission.CHANGE_NETWORK_STATE" />
    <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS" />
```

Step 4: Add the Initialization Function:
Place the following code in the main file of your application or at the point you want to fetch other important details in your application. This code includes a <String> argument that will contain your unique API token.
```
await LiveCallWidget.setAPIKEY("pk_34XsEi033ocVbA5Zm0X9YnvlSaqDg");
```

Step 5: Show the Widget
Place the following code at the point where you want the user to interact or make the call
```
LiveCallWidget.showWidget(context);
```

### For more examples on [integration](https://github.com/D-Mick/TestLiveCallWidgetPressOne/blob/main/lib/main.dart)

```
This is a link to an example application that integrated the sdk successfully:
- https://github.com/D-Mick/TestLiveCallWidgetPressOne/blob/main/lib/main.dart
```


