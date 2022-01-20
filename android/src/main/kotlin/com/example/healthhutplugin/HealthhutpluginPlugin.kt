package com.example.healthhutplugin

import android.content.Intent
import android.util.Log
import androidx.annotation.NonNull
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import android.app.Activity
import android.content.Context;
import androidx.core.content.ContextCompat.startActivity
import com.sinosoft.healthhut.HealthHutActivity
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.PluginRegistry
import org.json.JSONObject


/** HealthhutpluginPlugin */
class HealthhutpluginPlugin: FlutterPlugin, MethodCallHandler,ActivityAware {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel
  private lateinit var   activity:Activity;
  private lateinit var  context: Context;
  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "healthhutplugin")
    channel.setMethodCallHandler(this)
    this.context = flutterPluginBinding.applicationContext;
  }
  companion object {
    @JvmStatic
    fun registerWith(registrar: PluginRegistry.Registrar) {
      val channel = MethodChannel(registrar.messenger(), "flutterHandler")
      channel.setMethodCallHandler(HealthhutpluginPlugin())
    }
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    Log.d("333",call.method);
    if(call.method.equals("jumpHealthHutModular")) {
      val userId = call.arguments<String>();
      var intent =Intent(activity,HealthHutActivity::class.java);
      val jsonObject: JSONObject = JSONObject(userId);
      Log.d("333",jsonObject.getString("userId"));
      intent.putExtra("userId",jsonObject.getString("userId"));
      activity.startActivity(intent);

    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
  override fun onAttachedToActivity(binding: ActivityPluginBinding) {
     activity = binding.activity;
  }

  override fun onDetachedFromActivityForConfigChanges() {
  }

  override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
     onAttachedToActivity(binding);
  }

  override fun onDetachedFromActivity() {
  }
}
