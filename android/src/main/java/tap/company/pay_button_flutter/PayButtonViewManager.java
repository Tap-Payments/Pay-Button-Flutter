package tap.company.pay_button_flutter;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.LinearLayout;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import java.util.HashMap;
import java.util.Map;

import company.tap.tappaybutton.PayButton;
import company.tap.tappaybutton.PayButtonConfig;
import company.tap.tappaybutton.PayButtonStatusDelegate;
import company.tap.tappaybutton.PayButtonType;
import io.flutter.plugin.platform.PlatformView;

public class PayButtonViewManager implements PlatformView {

    private PayButton payButton;
    private View view;

    private LinearLayout linearLayout;


    PayButtonViewManager(@NonNull Context context, int id, @Nullable Map<String, Object> creationParams) {

        HashMap<String, Object> tapCardConfigurations = (HashMap<String, Object>) creationParams.get("configuration");
        String buttonType = (String) creationParams.get("button_type");
        System.out.println("Button Type >>> " + buttonType);
        System.out.println("Configuration >>> " + tapCardConfigurations);

        view = LayoutInflater.from(context).inflate(R.layout.pay_button_view, null);
        linearLayout = view.findViewById(R.id.linear);
        payButton = view.findViewById(R.id.paybutton);
        assert buttonType != null;
        assert tapCardConfigurations != null;
        PayButtonConfig.INSTANCE.initPayButton(context, (HashMap<String, Object>) tapCardConfigurations, getPayButtonType(buttonType), payButton);
    }


    @NonNull
    private PayButtonType getPayButtonType(String typeValue) {
        PayButtonType buttonType = PayButtonType.BENEFITPAY;
        switch (typeValue) {
            case "BENEFITPAY":
                buttonType = PayButtonType.BENEFITPAY;
                break;
            case "KNET":
                buttonType = PayButtonType.KNET;
                break;
            case "BENEFIT":
                buttonType = PayButtonType.BENEFIT;
                break;
            case "FAWRY":
                buttonType = PayButtonType.FAWRY;
                break;
            case "PAYPAL":
                buttonType = PayButtonType.PAYPAL;
                break;
            case "TABBY":
                buttonType = PayButtonType.TABBY;
                break;
            case "GOOGLEPAY":
                buttonType = PayButtonType.GOOGLEPAY;
                break;
        }
        System.out.println(typeValue);
        return buttonType;
    }


    @Nullable
    @Override
    public View getView() {
        return view;
    }

    @Override
    public void dispose() {

    }
}
