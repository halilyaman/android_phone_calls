package com.halilyaman.android_phone_calls

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.provider.ContactsContract
import android.telephony.TelephonyManager
import android.util.Log
import io.flutter.plugin.common.MethodChannel

var isAnswered = false

class PhoneCallHandler : BroadcastReceiver() {

    override fun onReceive(context: Context, intent: Intent) {
        val state = intent.getStringExtra(TelephonyManager.EXTRA_STATE)
        val phoneNumber = intent.getStringExtra(TelephonyManager.EXTRA_INCOMING_NUMBER) ?: return
        Log.d(AndroidPhoneCallsPlugin.TAG, "phoneNumber: $phoneNumber")
        when (state) {
            TelephonyManager.EXTRA_STATE_RINGING -> {
                // Incoming call
                Log.d(AndroidPhoneCallsPlugin.TAG, "Incoming call...")
                val callerName = getCallerName(context, phoneNumber)
                AndroidPhoneCallsPlugin.channel.invokeMethod(
                    "onIncomingCall",
                    mapOf("phoneNumber" to phoneNumber, "callerName" to callerName)
                )
            }
            TelephonyManager.EXTRA_STATE_OFFHOOK -> {
                // Call answered
                Log.d(AndroidPhoneCallsPlugin.TAG, "Answered call.")
                isAnswered = true
                AndroidPhoneCallsPlugin.channel.invokeMethod("onCallAnswered", null)
            }
            TelephonyManager.EXTRA_STATE_IDLE -> {
                if (isAnswered) {
                    // Call ended
                    Log.d(AndroidPhoneCallsPlugin.TAG, "Ended call.")
                    isAnswered = false
                    AndroidPhoneCallsPlugin.channel.invokeMethod("onCallEnded", null)
                } else {
                    // Call missed or rejected
                    Log.d(AndroidPhoneCallsPlugin.TAG, "Missed/Rejected call.")
                    AndroidPhoneCallsPlugin.channel.invokeMethod("onMissedCall", null)
                }
            }
        }
    }

    private fun getCallerName(context: Context, phoneNumber: String?): String? {
        try {
            var callerName: String? = null
            val uri = ContactsContract.CommonDataKinds.Phone.CONTENT_URI
            val projection = arrayOf(
                ContactsContract.PhoneLookup.DISPLAY_NAME,
                ContactsContract.CommonDataKinds.Phone.NUMBER
            )
            val selection = "${ContactsContract.CommonDataKinds.Phone.NUMBER} = ?"
            val selectionArgs = arrayOf(phoneNumber)
            val people = context.contentResolver.query(uri, projection, selection, selectionArgs, null)
            if (people != null && people.moveToFirst()) {
                val indexName = people.getColumnIndex(ContactsContract.PhoneLookup.DISPLAY_NAME)
                if (indexName > -1) {
                    callerName = people.getString(indexName)
                }
                people.close()
            }
            return callerName
        } catch(e: Exception) {
            return null
        }
    }
}