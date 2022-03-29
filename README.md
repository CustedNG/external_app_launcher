# ExternalAppLauncher2

A Flutter plugin which helps you to open another app from your app.



## Code Illustration
```
/// It returns bool. 
/// [true] if the app is opened successfully.
/// [false] if the app is not installed or open failed.
await ExternalAppLauncher2.openApp('urlscheme://path')
```

## Platform specific config

From APP-A to APP-B

#### Android

APP-A `AndroidManifest.xml`
```xml
<manifest>
    .....
    <queries>
        <intent>
            <action android:name="android.intent.action.VIEW" />
            <data android:scheme="APP-B-Scheme" />
        </intent>
    </queries>
    .....
</manifest>
```

APP-B `AndroidManifest.xml`
```xml
<manifest>
    .....
    <application>
            <intent-filter>
                <!--must haves-->
                <action android:name="android.intent.action.VIEW"/>
                <!--add this line if you want to open app via web-->
                <category android:name="android.intent.category.BROWSABLE"/>
                <category android:name="android.intent.category.DEFAULT"/>
                <!--protocol-->
                <data android:scheme="APP-B-Scheme"
                    android:host="PATH"/>
            </intent-filter>
        </activity>
    </application>
    .....
</manifest>
```

#### iOS

In iOS, for opening an external app from your app, you need to provide URLscheme of the target app.

To know more about URLScheme refer to this [Link](https://developer.apple.com/documentation/uikit/inter-process_communication/allowing_apps_and_websites_to_link_to_your_content/defining_a_custom_url_scheme_for_your_app)

If your deployment target is greater than or equal to 9, then you also need to update APP-A information in `Info.plist`.
```xml
    <key>LSApplicationQueriesSchemes</key>
    <array>
      <string>APP-B-Scheme</string>
    </array>
```


