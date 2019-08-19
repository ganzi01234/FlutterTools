package io.flutter.plugins;

import io.flutter.plugin.common.PluginRegistry;
import com.jordanalcaraz.audiorecorder.audiorecorder.AudioRecorderPlugin;
import com.example.citypickers.CityPickersPlugin;
import io.flutter.plugins.deviceinfo.DeviceInfoPlugin;
import io.flutter.plugins.firebaseadmob.FirebaseAdMobPlugin;
import com.jzoom.flutteralipay.FlutterAlipayPlugin;
import vn.hunghd.flutterdownloader.FlutterDownloaderPlugin;
import io.github.edufolly.fluttermobilevision.FlutterMobileVisionPlugin;
import com.dooboolab.fluttersound.FlutterSoundPlugin;
import com.flutter.toolslib.RecorderWavPlugin;
import com.flutter_webview_plugin.FlutterWebviewPlugin;
import com.github.xu.flutterwechat.FlutterWechatPlugin;
import com.hhwy.fm_baidu_map.FmBaiduMapPlugin;
import io.flutter.plugins.imagepicker.ImagePickerPlugin;
import com.crazecoder.openfile.OpenFilePlugin;
import io.flutter.plugins.packageinfo.PackageInfoPlugin;
import io.flutter.plugins.pathprovider.PathProviderPlugin;
import com.ly.permission.PermissionPlugin;
import io.flutter.plugins.sharedpreferences.SharedPreferencesPlugin;
import com.tekartik.sqflite.SqflitePlugin;
import io.flutter.plugins.urllauncher.UrlLauncherPlugin;

/**
 * Generated file. Do not edit.
 */
public final class GeneratedPluginRegistrant {
  public static void registerWith(PluginRegistry registry) {
    if (alreadyRegisteredWith(registry)) {
      return;
    }
    AudioRecorderPlugin.registerWith(registry.registrarFor("com.jordanalcaraz.audiorecorder.audiorecorder.AudioRecorderPlugin"));
    CityPickersPlugin.registerWith(registry.registrarFor("com.example.citypickers.CityPickersPlugin"));
    DeviceInfoPlugin.registerWith(registry.registrarFor("io.flutter.plugins.deviceinfo.DeviceInfoPlugin"));
    FirebaseAdMobPlugin.registerWith(registry.registrarFor("io.flutter.plugins.firebaseadmob.FirebaseAdMobPlugin"));
    FlutterAlipayPlugin.registerWith(registry.registrarFor("com.jzoom.flutteralipay.FlutterAlipayPlugin"));
    FlutterDownloaderPlugin.registerWith(registry.registrarFor("vn.hunghd.flutterdownloader.FlutterDownloaderPlugin"));
    FlutterMobileVisionPlugin.registerWith(registry.registrarFor("io.github.edufolly.fluttermobilevision.FlutterMobileVisionPlugin"));
    FlutterSoundPlugin.registerWith(registry.registrarFor("com.dooboolab.fluttersound.FlutterSoundPlugin"));
    RecorderWavPlugin.registerWith(registry.registrarFor("com.flutter.toolslib.RecorderWavPlugin"));
    FlutterWebviewPlugin.registerWith(registry.registrarFor("com.flutter_webview_plugin.FlutterWebviewPlugin"));
    FlutterWechatPlugin.registerWith(registry.registrarFor("com.github.xu.flutterwechat.FlutterWechatPlugin"));
    FmBaiduMapPlugin.registerWith(registry.registrarFor("com.hhwy.fm_baidu_map.FmBaiduMapPlugin"));
    ImagePickerPlugin.registerWith(registry.registrarFor("io.flutter.plugins.imagepicker.ImagePickerPlugin"));
    OpenFilePlugin.registerWith(registry.registrarFor("com.crazecoder.openfile.OpenFilePlugin"));
    PackageInfoPlugin.registerWith(registry.registrarFor("io.flutter.plugins.packageinfo.PackageInfoPlugin"));
    PathProviderPlugin.registerWith(registry.registrarFor("io.flutter.plugins.pathprovider.PathProviderPlugin"));
    PermissionPlugin.registerWith(registry.registrarFor("com.ly.permission.PermissionPlugin"));
    SharedPreferencesPlugin.registerWith(registry.registrarFor("io.flutter.plugins.sharedpreferences.SharedPreferencesPlugin"));
    SqflitePlugin.registerWith(registry.registrarFor("com.tekartik.sqflite.SqflitePlugin"));
    UrlLauncherPlugin.registerWith(registry.registrarFor("io.flutter.plugins.urllauncher.UrlLauncherPlugin"));
  }

  private static boolean alreadyRegisteredWith(PluginRegistry registry) {
    final String key = GeneratedPluginRegistrant.class.getCanonicalName();
    if (registry.hasPlugin(key)) {
      return true;
    }
    registry.registrarFor(key);
    return false;
  }
}
