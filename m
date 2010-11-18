From: Anisse Astier <anisse@astier.eu>
Subject: [PATCH 1/2] msi-wmi: Add mute key support
Date: Thu, 18 Nov 2010 13:00:53 +0100
Message-ID: <1290081655-13945-1-git-send-email-anisse@astier.eu>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from smtp4-g21.free.fr ([212.27.42.4]:55043 "EHLO smtp4-g21.free.fr"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750917Ab0KRMGv (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 18 Nov 2010 07:06:51 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Anisse Astier <anisse@astier.eu>, Mark Huijgen <mark.sf.net@huijgen.tk>

Add new MUTE key seen on Medion Akoya AIO PC P4010D using MSI motherboard
(Product Name: MS-7621)

Reported-and-tested-by: Mark Huijgen <mark.sf.net@huijgen.tk>
Signed-off-by: Anisse Astier <anisse@astier.eu>
---
 drivers/platform/x86/msi-wmi.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/drivers/platform/x86/msi-wmi.c b/drivers/platform/x86/msi-wmi.c
index 42a5469..bde607d 100644
--- a/drivers/platform/x86/msi-wmi.c
+++ b/drivers/platform/x86/msi-wmi.c
@@ -48,11 +48,13 @@ MODULE_ALIAS("wmi:B6F3EEF2-3D2F-49DC-9DE3-85BCE18C62F2");
 #define MSI_WMI_BRIGHTNESSDOWN (KEYCODE_BASE + 1)
 #define MSI_WMI_VOLUMEUP       (KEYCODE_BASE + 2)
 #define MSI_WMI_VOLUMEDOWN     (KEYCODE_BASE + 3)
+#define MSI_WMI_MUTE           (KEYCODE_BASE + 4)
 static struct key_entry msi_wmi_keymap[] = {
 	{ KE_KEY, MSI_WMI_BRIGHTNESSUP,   {KEY_BRIGHTNESSUP} },
 	{ KE_KEY, MSI_WMI_BRIGHTNESSDOWN, {KEY_BRIGHTNESSDOWN} },
 	{ KE_KEY, MSI_WMI_VOLUMEUP,       {KEY_VOLUMEUP} },
 	{ KE_KEY, MSI_WMI_VOLUMEDOWN,     {KEY_VOLUMEDOWN} },
+	{ KE_KEY, MSI_WMI_MUTE,           {KEY_MUTE} },
 	{ KE_END, 0}
 };
 static ktime_t last_pressed[ARRAY_SIZE(msi_wmi_keymap) - 1];
-- 
1.7.0.6
