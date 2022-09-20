package com.example.flutter18_firebase;

import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.widget.Toast;

import io.flutter.embedding.android.FlutterActivity;

public class TestActivity extends FlutterActivity {

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        //throw new RuntimeException("Test Crash");

        String mess = "Hello CodeFresher! - Flutter 18 - B15";

        Toast.makeText(getApplicationContext(), mess, Toast.LENGTH_SHORT).show();
    }
}