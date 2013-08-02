KPDataCleaner
=============

You remember when you remove application from device everytime to get ride off all application data?

KPDataCleader provide easy way of doing it. Just attach it to view add by double tapping with two fingers you will see menu with two options:

* **Remove all application data** - cleans standardUserDefaults and documents folder files.
* **Quit application** - easy way to exit application and then starting it again from multitasking applications list.

~~~~

### **Usage**




Simple - just attach it to window or any other view

```

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
#ifdef DEBUG
    [KPDataCleaner attachToView:self.window];
#endif
    
    return YES;
}
```




![image](http://24.media.tumblr.com/50763272671105c666522937941df5c9/tumblr_mqxg2ocp0t1s5jboho1_500.png)
you can get in touch with me on Twitter @KamilPyc
 