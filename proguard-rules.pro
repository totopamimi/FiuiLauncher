    #指定代码的压缩级别
    -optimizationpasses 5
    
    #包明不混合大小写
    -dontusemixedcaseclassnames
    
    #不去忽略非公共的库类
    -dontskipnonpubliclibraryclasses
    
     #优化  不优化输入的类文件
    -dontoptimize
    
     #预校验
    -dontpreverify
    
     #混淆时是否记录日志
    -verbose
    
     # 混淆时所采用的算法
    -optimizations !code/simplification/arithmetic,!field/*,!class/merging/*

    #这样再次崩溃的时候就有源文件和行号的信息了
    -keepattributes SourceFile,LineNumberTable

    #保护注解
    -keepattributes *Annotation*
    -keep class * extends java.lang.annotation.Annotation { *; }
    
    # 保持哪些类不被混淆
    -keep public class * extends android.app.Fragment
    -keep public class * extends android.app.Activity
    -keep public class * extends android.app.Application
    -keep public class * extends android.app.Service
    -keep public class * extends android.content.BroadcastReceiver
    -keep public class * extends android.content.ContentProvider
    -keep public class * extends android.app.backup.BackupAgentHelper
    -keep public class * extends android.preference.Preference
    -keep public class com.android.vending.licensing.ILicensingService
    #如果有引用v4包可以添加下面这行
    -keep public class * extends android.support.v4.app.Fragment
    
    
    
    #忽略警告
    -ignorewarning
    
    ##记录生成的日志数据,gradle build时在本项目根目录输出##
    
    #apk 包内所有 class 的内部结构
    -dump class_files.txt
    #未混淆的类和成员
    -printseeds seeds.txt
    #列出从 apk 中删除的代码
    -printusage unused.txt
    #混淆前后的映射
    -printmapping mapping.txt
    
    ########记录生成的日志数据，gradle build时 在本项目根目录输出-end######
    
    
    #####混淆保护自己项目的部分代码以及引用的第三方jar包library#######
    
    #-libraryjars libs/umeng-analytics-v5.2.4.jar
    
    #三星应用市场需要添加:sdk-v1.0.0.jar,look-v1.0.1.jar
    #-libraryjars libs/sdk-v1.0.0.jar
    #-libraryjars libs/look-v1.0.1.jar
    
    #如果不想混淆 keep 掉
    -keep class com.lippi.recorder.iirfilterdesigner.** {*; }
    #友盟
    -keep class com.umeng.**{*;}



    #项目特殊处理代码
    
    #忽略警告
    -dontwarn com.lippi.recorder.utils**
    #保留一个完整的包
    -keep class com.lippi.recorder.utils.** {
        *;
     }
    
    -keep class  com.lippi.recorder.utils.AudioRecorder{*;}
    
    
#如果引用了v4或者v7包
-dontwarn android.support.**
    
####混淆保护自己项目的部分代码以及引用的第三方jar包library-end####
    
-keep public class * extends android.view.View {
        public <init>(android.content.Context);
        public <init>(android.content.Context, android.util.AttributeSet);
        public <init>(android.content.Context, android.util.AttributeSet, int);
        public void set*(...);
}

#保持 native 方法不被混淆
-keepclasseswithmembernames class * {
        native <methods>;
}
    
#保持自定义控件类不被混淆
-keepclasseswithmembers class * {
        public <init>(android.content.Context, android.util.AttributeSet);
}
    
#保持自定义控件类不被混淆
-keepclassmembers class * extends android.app.Activity {
       public void *(android.view.View);
}
    
#保持 Parcelable 不被混淆
-keep class * implements android.os.Parcelable {
      public static final android.os.Parcelable$Creator *;
}
    
#保持 Serializable 不被混淆
-keepnames class * implements java.io.Serializable
    
#保持 Serializable 不被混淆并且enum 类也不被混淆
-keepclassmembers class * implements java.io.Serializable {
        static final long serialVersionUID;
        private static final java.io.ObjectStreamField[] serialPersistentFields;
        !static !transient <fields>;
        !private <fields>;
        !private <methods>;
        private void writeObject(java.io.ObjectOutputStream);
        private void readObject(java.io.ObjectInputStream);
        java.lang.Object writeReplace();
        java.lang.Object readResolve();
}
    
    #保持枚举 enum 类不被混淆 如果混淆报错，建议直接使用上面的 -keepclassmembers class * implements java.io.Serializable即可
    #-keepclassmembers enum * {
    #  public static **[] values();
    #  public static ** valueOf(java.lang.String);
    #}
    
-keepclassmembers class * {
    public void *ButtonClicked(android.view.View);
}
    
#不混淆资源类
-keepclassmembers class **.R$* {
    public static <fields>;
}
    
#避免混淆泛型 如果混淆报错建议关掉
#–keepattributes Signature

#如果用用到Gson解析包的，直接添加下面这几行就能成功混淆，不然会报错。
#gson
#-libraryjars libs/gson-2.2.2.jar
-keepattributes Signature
# Gson specific classes
-keep class sun.misc.Unsafe { *; }
# Application classes that will be serialized/deserialized over Gson
-keep class com.google.gson.examples.android.model.** { *; }



# LeakCanary
-keep class org.eclipse.mat.** { *; }
-keep class com.squareup.leakcanary.** { *; }

-keep public class * implements com.bumptech.glide.module.GlideModule
-keep public enum com.bumptech.glide.load.resource.bitmap.ImageHeaderParser$** {
    **[] $VALUES;
    public *;
}
#TalkingData
-dontwarn com.tendcloud.tenddata.**
-keep public class com.tendcloud.tenddata.** { public protected *;}
-keepclassmembers class ** {
     public void *(***);
 }
-keep class com.talkingdata.sdk.TalkingDataSDK {public *;}
-keep class com.apptalkingdata.** {*;}

#Flurry
-keep class com.flurry.** {*;}
-dontwarn com.flurry.**
-keepattributes *Annotation*,EnclosingMethod
-keepclasseswithmembers class * {
    public <init>(android.content.Context, android.util.AttributeSet, int);
}

# xutilsdb
-dontwarn com.lidroid.xutils.**
-keep class com.lidroid.xutils.** { *;}

-dontwarn com.facebook.ads.**
-keep class com.facebook.ads.** { *;}

-dontwarn com.umeng.update.**
-keep class com.umeng.update.** { *;}


# okhttp
-dontwarn com.squareup.okhttp.**
-keep class com.squareup.okhttp.** { *;}
-dontwarn okio.**

# glide
-dontwarn com.bumptech.glide.**
-keep class com.bumptech.glide.** { *;}


# lqthememanager
-dontwarn com.lqsoft.theme.**
-keep class com.lqsoft.theme.** { *;}

#otto

-dontwarn com.squareup.otto.**
-keep class com.squareup.otto.** { *;}

# nineoldandroids
-dontwarn com.nineoldandroids.**
-keep class com.nineoldandroids.** { *;}

-keep class com.android.launcher3.Launcher {
  public void previousScreen(android.view.View);
  public void nextScreen(android.view.View);
  public void launchHotSeat(android.view.View);
  public void onClickSearchButton(android.view.View);
  public void onClickVoiceButton(android.view.View);
  public void onClickConfigureButton(android.view.View);
  public void onClickAllAppsButton(android.view.View);
  public void onClickAppMarketButton(android.view.View);
  public void dismissFirstRunCling(android.view.View);
  public void dismissMigrationClingCopyApps(android.view.View);
  public void dismissMigrationClingUseDefault(android.view.View);
  public void dismissMigrationWorkspaceCling(android.view.View);
  public void dismissWorkspaceCling(android.view.View);
  public void dismissAllAppsCling(android.view.View);
}

-keep class com.android.launcher3.CellLayout {
  public float getBackgroundAlpha();
  public void setBackgroundAlpha(float);
}

-keep class com.android.launcher3.DragLayer$LayoutParams {
  public void setWidth(int);
  public int getWidth();
  public void setHeight(int);
  public int getHeight();
  public void setX(int);
  public int getX();
  public void setY(int);
  public int getY();
}

-keep class com.android.launcher3.CellLayout$LayoutParams {
  public void setWidth(int);
  public int getWidth();
  public void setHeight(int);
  public int getHeight();
  public void setX(int);
  public int getX();
  public void setY(int);
  public int getY();
}

-keep class com.android.launcher3.Workspace {
  public float getBackgroundAlpha();
  public void setBackgroundAlpha(float);
  public float getChildrenOutlineAlpha();
  public void setChildrenOutlineAlpha(float);
}

-keep class com.android.launcher3.MemoryDumpActivity {
  *;
}

-keep class com.android.launcher3.PreloadIconDrawable {
  public float getAnimationProgress();
  public void setAnimationProgress(float);
}

-keep class com.android.launcher3.FastBitmapDrawable {
  public int getBrightness();
  public void setBrightness(int);
}