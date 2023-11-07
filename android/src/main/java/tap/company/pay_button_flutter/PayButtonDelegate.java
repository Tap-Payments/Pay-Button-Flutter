package tap.company.pay_button_flutter;

import android.app.Activity;
import android.content.Intent;
import android.os.Looper;
import android.os.Handler;


import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import java.util.HashMap;
import java.util.LinkedHashMap;

import company.tap.tappaybutton.PayButton;
import company.tap.tappaybutton.PayButtonConfig;
import company.tap.tappaybutton.PayButtonStatusDelegate;
import company.tap.tappaybutton.PayButtonType;
import io.flutter.plugin.common.EventChannel;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.PluginRegistry;

public class PayButtonDelegate implements PluginRegistry.ActivityResultListener,
        PluginRegistry.RequestPermissionsResultListener, PayButtonStatusDelegate {


    private Activity activity;
    //    private DataConfiguration dataConfiguration;

  //  PayButtonConfig payButtonConfig;
    private PayButton payButton;

    public EventChannel.EventSink eventSink;

    private MethodCall methodCall;
    private MethodChannel channel;

    boolean onReadyCallbackTriggered = false;

    boolean onHeightChangeCallbackTriggered = true;

    private Handler handler = new Handler(Looper.getMainLooper());

    public PayButtonDelegate(Activity _activity) {
        this.activity = _activity;
     //     this.payButtonConfig = PayButtonConfig.INSTANCE;
        this.payButton = new PayButton(_activity.getApplicationContext());

    }


    public void start(Activity activity1, HashMap<String, Object> params, EventChannel.EventSink event) {

        this.eventSink = event;
        this.activity = activity1;
        try {

            System.out.println("inside Start method ");
            HashMap<String, Object> tapCardConfigurations = (HashMap<String, Object>) params.get("configuration");

            System.out.println("Tap Card Configurations " + tapCardConfigurations);
            PayButtonConfig.INSTANCE.addPayButtonStatusDelegate(this);
//            payButton.initPayButton(
//                    activity,
//                    tapCardConfigurations,
//                    PayButtonType.KNET,
//                    this);
          //  payButton.invalidate();


//            PayButtonConfig.INSTANCE.initPayButton(activity1, tapCardConfigurations, PayButtonType.KNET, payButton);
//            PayButtonConfig.INSTANCE.addPayButtonStatusDelegate(this);

//            DataConfiguration.INSTANCE.initializeSDK(activity1, tapCardConfigurations, tapBenefitPay);
//            DataConfiguration.INSTANCE.addTapBenefitPayStatusDelegate(this);

        } catch (Exception e) {
        }
    }


    @Override
    public boolean onActivityResult(int requestCode, int resultCode, @Nullable Intent data) {
        return false;
    }

    @Override
    public boolean onRequestPermissionsResult(int requestCode, @NonNull String[] permissions, @NonNull int[] grantResults) {
        return false;
    }

    @Override
    public void onCancel() {
        handler.post(
                new Runnable() {
                    @Override
                    public void run() {
                        HashMap<String, Object> resultData = new HashMap<>();
                        resultData.put("onCanceled", "onCancel callback is executed");
                        eventSink.success(resultData);
                    }
                });
    }

    @Override
    public void onChargeCreated(@NonNull String s) {
        handler.post(
                new Runnable() {
                    @Override
                    public void run() {

                        try {
                            HashMap<String, Object> resultData = new HashMap<>();
                            resultData.put("onChargeCreated", s);
                            eventSink.success(resultData);

                        } catch (IllegalStateException exception) {
                            // Output expected IllegalStateException.
                            System.out.println("Exception " + exception);
                            // Logging.log(exception);
                        } catch (Throwable throwable) {
                            // Output unexpected Throwables.
                            System.out.println("Exception throwable");
                            // Logging.log(throwable, false);
                        }


                    }
                });
    }

    @Override
    public void onClick() {
        handler.post(
                new Runnable() {
                    @Override
                    public void run() {
                        HashMap<String, Object> resultData = new HashMap<>();
                        resultData.put("onClicked", "onClick callback is executed");
                        eventSink.success(resultData);
                    }
                });
    }

    @Override
    public void onError(@NonNull String s) {
        System.out.println("Error is : " + s);
        handler.post(
                new Runnable() {
                    @Override
                    public void run() {
                        HashMap<String, Object> resultData = new HashMap<>();
                        System.out.println("Error is : " + s);
                        resultData.put("onError", s);
                        eventSink.success(resultData);
                    }
                });
    }

    @Override
    public void onOrderCreated(@NonNull String s) {
        handler.post(
                new Runnable() {
                    @Override
                    public void run() {

                        try {
                            HashMap<String, Object> resultData = new HashMap<>();
                            resultData.put("onOrderCreated", s);
                            eventSink.success(resultData);

                        } catch (IllegalStateException exception) {
                            // Output expected IllegalStateException.
                            System.out.println("Exception " + exception);
                            // Logging.log(exception);
                        } catch (Throwable throwable) {
                            // Output unexpected Throwables.
                            System.out.println("Exception throwable");
                            // Logging.log(throwable, false);
                        }


                    }
                });
    }

    @Override
    public void onReady() {
        handler.post(
                new Runnable() {
                    @Override
                    public void run() {
                        HashMap<String, Object> resultData = new HashMap<>();
                        resultData.put("onReady", "onReady callback is executed");
                        eventSink.success(resultData);
                   //     payButton.invalidate();
                    }
                });
    }

    @Override
    public void onSuccess(@NonNull String s) {
        handler.post(
                new Runnable() {
                    @Override
                    public void run() {

                        try {
                            HashMap<String, Object> resultData = new HashMap<>();
                            resultData.put("onSuccess", s);
                            eventSink.success(resultData);

                        } catch (IllegalStateException exception) {
                            // Output expected IllegalStateException.
                            System.out.println("Exception " + exception);
                            // Logging.log(exception);
                        } catch (Throwable throwable) {
                            // Output unexpected Throwables.
                            System.out.println("Exception throwable");
                            // Logging.log(throwable, false);
                        }


                    }
                });
    }
}
