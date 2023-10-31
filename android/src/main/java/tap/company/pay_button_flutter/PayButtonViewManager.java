package tap.company.pay_button_flutter;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import java.util.HashMap;
import java.util.Map;

import company.tap.tappaybutton.PayButton;
import company.tap.tappaybutton.PayButtonStatusDelegate;
import company.tap.tappaybutton.PayButtonType;
import io.flutter.plugin.platform.PlatformView;

public class PayButtonViewManager implements PlatformView {

    private PayButton payButton;
    private View view;

    PayButtonViewManager(@NonNull Context context, int id, @Nullable Map<String, Object> creationParams) {
        HashMap<String, Object> tapCardConfigurations = (HashMap<String, Object>) creationParams.get("configuration");
        view = LayoutInflater.from(context).inflate(R.layout.pay_button_layout, null);
        payButton = view.findViewById(R.id.payButton);

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
