package com.halilyaman.android_phone_calls

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.telephony.TelephonyManager
import android.util.Log

class PhoneCallHandler : BroadcastReceiver() {
    var isAnswered = false
    override fun onReceive(context: Context?, intent: Intent?) {
        val state = intent?.getStringExtra(TelephonyManager.EXTRA_STATE)
        Log.d(AndroidPhoneCallsPlugin.TAG, "onReceive: state $state")
        when (state) {
            TelephonyManager.EXTRA_STATE_RINGING -> {
                // Incoming call
            }
            TelephonyManager.EXTRA_STATE_OFFHOOK -> {
                // Call answered
                isAnswered = true
            }
            TelephonyManager.EXTRA_STATE_IDLE -> {
                if (isAnswered) {
                    // Call ended or rejected
                    isAnswered = false
                } else {
                    // Call missed
                }
            }
        }
    }
}