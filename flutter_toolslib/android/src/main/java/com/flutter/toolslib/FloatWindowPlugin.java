package com.flutter.toolslib;

import android.app.Activity;
import android.content.Intent;
import android.net.Uri;
import android.provider.Settings;
import android.widget.Toast;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;


/**
 * FloatWindowPlugin
 */
public class FloatWindowPlugin implements MethodCallHandler {


    private Activity activity;

    private FloatWindowPlugin(Activity activity) {
        this.activity = activity;
    }

//    private FloatWindowPlugin(Registrar registrar) {
//        this.registrar = registrar;
//    }
//
//    private final Registrar registrar;

    AudioUtil au;

    /**
     * Plugin registration.
     */
    public static void registerWith(Registrar registrar) {
        final MethodChannel channel = new MethodChannel(registrar.messenger(), "float_window");
        FloatWindowPlugin instance = new FloatWindowPlugin(registrar.activity());
        channel.setMethodCallHandler(instance);
    }

    @Override
    public void onMethodCall(MethodCall call, Result result) {
        if (call.method.equals("startFloatWindow")) {
            startFloatingButtonService();
        } else {
            result.notImplemented();
        }
    }

    public void startFloatingButtonService() {
        if (FloatingButtonService.isStarted) {
            return;
        }
        if (!Settings.canDrawOverlays(activity)) {
            Toast.makeText(activity, "当前无权限，请授权", Toast.LENGTH_SHORT);
            activity.startActivityForResult(new Intent(Settings.ACTION_MANAGE_OVERLAY_PERMISSION, Uri.parse("package:" + activity.getPackageName())), 0);
        } else {
            activity.startService(new Intent(activity, FloatingButtonService.class));
        }
    }

    public void startFloatingVideoService() {
        if (FloatingVideoService.isStarted) {
            return;
        }
        if (!Settings.canDrawOverlays(activity)) {
            Toast.makeText(activity, "当前无权限，请授权", Toast.LENGTH_SHORT);
            activity.startActivityForResult(new Intent(Settings.ACTION_MANAGE_OVERLAY_PERMISSION, Uri.parse("package:" + activity.getPackageName())), 2);
        } else {
            activity.startService(new Intent(activity, FloatingVideoService.class));
        }
    }


}