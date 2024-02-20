package com.halilyaman.android_phone_calls

import android.Manifest
import android.app.Activity
import android.content.pm.PackageManager
import android.util.Log
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat

object PermissionHelper {
    private const val PERMISSION_REQUEST_CODE = 123;

    var lastNonNull : MutableList<Boolean?> = listOf(null, null, null, null).toMutableList();

    val permissions = arrayOf(
        Manifest.permission.READ_PHONE_STATE,
        Manifest.permission.READ_CALL_LOG,
        Manifest.permission.READ_CONTACTS,
        Manifest.permission.CALL_PHONE
    )

    fun requestPhoneCallPermissions(activity: Activity) {
        ActivityCompat.requestPermissions(
            activity,
            permissions,
            PERMISSION_REQUEST_CODE
        )
    }

    private fun isPermissionGrantedNullIsPermamentlyDenied(
        permission: String,
        activity: Activity
    ): Boolean? {
        if (ContextCompat.checkSelfPermission(
                activity,
                permission) != PackageManager.PERMISSION_GRANTED) {
            if (!ActivityCompat.shouldShowRequestPermissionRationale(activity, permission)) {
                return null;
            }
            return false;
        }
        return true;
    }



    fun checkPhoneCallPermissions(activity: Activity): Boolean? {
        val p = permissions.map {
            isPermissionGrantedNullIsPermamentlyDenied(
                it,
                activity
            )
        }.toMutableList()

        Log.d(AndroidPhoneCallsPlugin.TAG, "The perms..: ${p.map { "$it" }.joinToString(" ")}}")

        // the initial null does not mean it's rejected for good
        for (i in p.indices) {
            if (p[i] == null) {
                if (lastNonNull[i] == null) {
                    p[i] = false;
                }
            } else {
                lastNonNull[i] = p[i];
            }
        }

        // if we have a false, we still ask the user, no need for settings
        if (p.any { it == false }) return false;

        // if it's at least one null (and the rest trues), then we cannot ask the user
        if (p.any { it == null }) return null;

        // return p1 && p2 && p3;
        return p.all { it == true };
    }
}