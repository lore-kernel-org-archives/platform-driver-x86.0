From: Corentin Chary <corentincj-EjuBZuxMvz2sTnJN9+BGXg@public.gmane.org>
Subject: [PATCH 03/14] asus-wmi: minor cleanups
Date: Sat, 26 Feb 2011 10:20:32 +0100
Message-ID: <1298712045-17671-4-git-send-email-corentincj@iksaif.net>
References: <1298712045-17671-1-git-send-email-corentincj@iksaif.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <acpi4asus-user-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
In-Reply-To: <1298712045-17671-1-git-send-email-corentincj-EjuBZuxMvz2sTnJN9+BGXg@public.gmane.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/acpi4asus-user>,
	<mailto:acpi4asus-user-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=acpi4asus-user>
List-Post: <mailto:acpi4asus-user-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:acpi4asus-user-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/acpi4asus-user>,
	<mailto:acpi4asus-user-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: acpi4asus-user-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: Matthew Garrett <mjg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:ASUS NOTEBOOKS AN..." <acpi4asus-user-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>, "open list:ASUS NOTEBOOKS AN..." <platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: platform-driver-x86.vger.kernel.org

Signed-off-by: Corentin Chary <corentincj-EjuBZuxMvz2sTnJN9+BGXg@public.gmane.org>
---
 drivers/platform/x86/asus-wmi.c  |   34 +++++++++++++++++-----------------
 drivers/platform/x86/eeepc-wmi.c |    2 +-
 2 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 35e6bb6..4c3f68a 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -2,7 +2,7 @@
  * Asus PC WMI hotkey driver
  *
  * Copyright(C) 2010 Intel Corporation.
- * Copyright(C) 2010 Corentin Chary <corentin.chary-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
+ * Copyright(C) 2010-2011 Corentin Chary <corentin.chary-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
  *
  * Portions based on wistron_btns.c:
  * Copyright (C) 2005 Miloslav Trmac <mitr-VIXq6x/3rUk@public.gmane.org>
@@ -87,7 +87,7 @@ MODULE_LICENSE("GPL");
 #define ASUS_WMI_DEVID_CARDREADER	0x00080013
 
 /* Input */
-#define ASUS_WMI_DEVID_TOUCHPAD	0x00100011
+#define ASUS_WMI_DEVID_TOUCHPAD		0x00100011
 #define ASUS_WMI_DEVID_TOUCHPAD_LED	0x00100012
 
 /* DSTS masks */
@@ -903,25 +903,25 @@ static void asus_wmi_notify(u32 value, void *context)
 
 	obj = (union acpi_object *)response.pointer;
 
-	if (obj && obj->type == ACPI_TYPE_INTEGER) {
-		code = obj->integer.value;
-		orig_code = code;
+	if (!obj || obj->type != ACPI_TYPE_INTEGER)
+		goto exit;
 
-		if (code >= NOTIFY_BRNUP_MIN && code <= NOTIFY_BRNUP_MAX)
-			code = NOTIFY_BRNUP_MIN;
-		else if (code >= NOTIFY_BRNDOWN_MIN &&
-			 code <= NOTIFY_BRNDOWN_MAX)
-			code = NOTIFY_BRNDOWN_MIN;
+	code = obj->integer.value;
+	orig_code = code;
 
-		if (code == NOTIFY_BRNUP_MIN || code == NOTIFY_BRNDOWN_MIN) {
-			if (!acpi_video_backlight_support())
-				asus_wmi_backlight_notify(asus, orig_code);
-		}
+	if (code >= NOTIFY_BRNUP_MIN && code <= NOTIFY_BRNUP_MAX)
+		code = NOTIFY_BRNUP_MIN;
+	else if (code >= NOTIFY_BRNDOWN_MIN &&
+		 code <= NOTIFY_BRNDOWN_MAX)
+		code = NOTIFY_BRNDOWN_MIN;
 
-		if (!sparse_keymap_report_event(asus->inputdev, code, 1, true))
-			pr_info("Unknown key %x pressed\n", code);
-	}
+	if (code == NOTIFY_BRNUP_MIN || code == NOTIFY_BRNDOWN_MIN) {
+		if (!acpi_video_backlight_support())
+			asus_wmi_backlight_notify(asus, orig_code);
+	} else if (!sparse_keymap_report_event(asus->inputdev, code, 1, true))
+		pr_info("Unknown key %x pressed\n", code);
 
+exit:
 	kfree(obj);
 }
 
diff --git a/drivers/platform/x86/eeepc-wmi.c b/drivers/platform/x86/eeepc-wmi.c
index 3a060ae..e69701f 100644
--- a/drivers/platform/x86/eeepc-wmi.c
+++ b/drivers/platform/x86/eeepc-wmi.c
@@ -2,7 +2,7 @@
  * Eee PC WMI hotkey driver
  *
  * Copyright(C) 2010 Intel Corporation.
- * Copyright(C) 2010 Corentin Chary <corentin.chary-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
+ * Copyright(C) 2010-2011 Corentin Chary <corentin.chary-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
  *
  * Portions based on wistron_btns.c:
  * Copyright (C) 2005 Miloslav Trmac <mitr-VIXq6x/3rUk@public.gmane.org>
-- 
1.7.4


------------------------------------------------------------------------------
Free Software Download: Index, Search & Analyze Logs and other IT data in 
Real-Time with Splunk. Collect, index and harness all the fast moving IT data 
generated by your applications, servers and devices whether physical, virtual
or in the cloud. Deliver compliance at lower cost and gain new business 
insights. http://p.sf.net/sfu/splunk-dev2dev 
