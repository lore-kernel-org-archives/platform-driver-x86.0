From: Shuduo Sang <shuduo.sang@canonical.com>
Subject: [PATCH] save and restore adaptive keyboard mode for suspend and,resume
Date: Thu, 27 Mar 2014 18:06:25 +0800
Message-ID: <5333F821.20704@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pd0-f177.google.com ([209.85.192.177]:51928 "EHLO
	mail-pd0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751469AbaC0KGe (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 27 Mar 2014 06:06:34 -0400
Received: by mail-pd0-f177.google.com with SMTP id y10so3148410pdj.36
        for <platform-driver-x86@vger.kernel.org>; Thu, 27 Mar 2014 03:06:34 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: ibm-acpi@hmh.eng.br, matthew.garrett@nebula.com, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org
Cc: bruce.ma@canonical.com, joey.zheng@canonical.com

Dan Aloni has submitted a patch to set adaptive mode to function mode
when system resume back. Thanks Dan. :)

Following patch can make it to be restored to previous mode like What
Windows does.

Thanks,
Shuduo


From 0ca960138518ceab23110141a0d7c0cafd54a859 Mon Sep 17 00:00:00 2001
From: Shuduo Sang <shuduo.sang@canonical.com>
Date: Thu, 27 Mar 2014 17:51:24 +0800
Subject: [PATCH] save and restore adaptive keyboard mode for suspend and
 resume

The mode of adaptive keyboard on X1 Carbon need be saved first before
suspend then it can be restored after resume. Otherwise it will be
unusable.

Signed-off-by: Bruce Ma <bruce.ma@canonical.com>
Signed-off-by: Shuduo Sang <shuduo.sang@canonical.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/platform/x86/thinkpad_acpi.c
b/drivers/platform/x86/thinkpad_acpi.c
index f8305d1..9a5a19d 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -3855,13 +3855,28 @@ static void hotkey_notify(struct ibm_struct
*ibm, u32 event)

 static void hotkey_suspend(void)
 {
+	int hkeyv;
+
 	/* Do these on suspend, we get the events on early resume! */
 	hotkey_wakeup_reason = TP_ACPI_WAKEUP_NONE;
 	hotkey_autosleep_ack = 0;
+
+	/* save previous mode of adaptive keyboard of X1 Carbon */
+	if (acpi_evalf(hkey_handle, &hkeyv, "MHKV", "qd")) {
+		if ((hkeyv >> 8) == 2) {
+			if (!acpi_evalf(hkey_handle,
+						&adaptive_keyboard_prev_mode,
+						"GTRW", "dd", 0)) {
+				pr_err("Cannot read adaptive keyboard mode.\n");
+			}
+		}
+	}
 }

 static void hotkey_resume(void)
 {
+	int hkeyv;
+
 	tpacpi_disable_brightness_delay();

 	if (hotkey_status_set(true) < 0 ||
@@ -3874,6 +3889,18 @@ static void hotkey_resume(void)
 	hotkey_wakeup_reason_notify_change();
 	hotkey_wakeup_hotunplug_complete_notify_change();
 	hotkey_poll_setup_safe(false);
+
+	/* restore previous mode of adapive keyboard of X1 Carbon */
+	if (acpi_evalf(hkey_handle, &hkeyv, "MHKV", "qd")) {
+		if ((hkeyv >> 8) == 2) {
+			if (!acpi_evalf(hkey_handle,
+						NULL,
+						"STRW", "vd",
+						adaptive_keyboard_prev_mode)) {
+				pr_err("Cannot set adaptive keyboard mode.\n");
+			}
+		}
+	}
 }

 /* procfs -------------------------------------------------------------- */
-- 
1.9.1
