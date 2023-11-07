package tap.company.pay_button_flutter;

import android.content.Context;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import java.util.Map;

import io.flutter.plugin.common.StandardMessageCodec;
import io.flutter.plugin.platform.PlatformView;
import io.flutter.plugin.platform.PlatformViewFactory;

public class PayButtonViewFactory extends PlatformViewFactory {

    PayButtonViewFactory() {
        super(StandardMessageCodec.INSTANCE);
    }
    @NonNull
    @Override
    public PlatformView create(Context context, int viewId, @Nullable Object args) {
        final Map<String, Object> creationParams = (Map<String, Object>) args;
        System.out.println("Config in Factory " + args);
        return new PayButtonViewManager(context, viewId, creationParams);
    }
}
