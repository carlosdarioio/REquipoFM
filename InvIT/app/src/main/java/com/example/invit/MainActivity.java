package com.example.invit;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;

public class MainActivity extends AppCompatActivity {
    private WebView myWebView;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        myWebView = (WebView) this.findViewById(R.id.webView);
        myWebView.setWebViewClient((new WebViewClient()));
        myWebView.loadUrl("http://10.1.201.5/DxWebIT/WFactura.aspx");

        WebSettings webSettings = myWebView.getSettings();
        webSettings.setJavaScriptEnabled(true);


    }

    @Override
    public void onBackPressed() {
        if(myWebView.canGoBack())
        {
            myWebView.goBack();
        }
        else
            super.onBackPressed();
    }
}
