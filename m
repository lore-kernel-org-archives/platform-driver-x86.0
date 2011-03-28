From: Seth Forshee <seth.forshee-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Subject: [PATCH v3 1/3] asus-wmi: Add callback for hotkey
	filtering
Date: Mon, 28 Mar 2011 13:33:42 -0500
Message-ID: <1301337224-3293-2-git-send-email-seth.forshee@canonical.com>
References: <AANLkTi=U2Qkqv7FKfe18f0a=8Xg0QwRX_cxFj-j7ZPC=@mail.gmail.com>
	<1301337224-3293-1-git-send-email-seth.forshee@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <acpi4asus-user-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
In-Reply-To: <1301337224-3293-1-git-send-email-seth.forshee-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/acpi4asus-user>,
	<mailto:acpi4asus-user-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=acpi4asus-user>
List-Post: <mailto:acpi4asus-user-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:acpi4asus-user-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/acpi4asus-user>,
	<mailto:acpi4asus-user-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: acpi4asus-user-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: Corentin Chary <corentin.chary-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: acpi4asus-user-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chris Bagwell <chris-ZCD0YumhXB+iMFqZbmIluw@public.gmane.org>, Matthew Garrett <mjg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: platform-driver-x86.vger.kernel.org

This is required for the T101MT home key, which behaves differently
than other hotkeys.

Signed-off-by: Seth Forshee <seth.forshee-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
---
 drivers/platform/x86/asus-wmi.c |   12 +++++++++++-
 drivers/platform/x86/asus-wmi.h |    6 ++++++
 2 files changed, 17 insertions(+), 1 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 5b779a9..b14d992 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -1058,6 +1058,8 @@ static void asus_wmi_notify(u32 value, void *context)
 	acpi_status status;
 	int code;
 	int orig_code;
+	unsigned int key_value = 1;
+	bool autorelease = 1;
 
 	status = wmi_get_event_data(value, &response);
 	if (status != AE_OK) {
@@ -1073,6 +1075,13 @@ static void asus_wmi_notify(u32 value, void *context)
 	code = obj->integer.value;
 	orig_code = code;
 
+	if (asus->driver->key_filter) {
+		asus->driver->key_filter(asus->driver, &code, &key_value,
+					 &autorelease);
+		if (code == ASUS_WMI_KEY_IGNORE)
+			goto exit;
+	}
+
 	if (code >= NOTIFY_BRNUP_MIN && code <= NOTIFY_BRNUP_MAX)
 		code = NOTIFY_BRNUP_MIN;
 	else if (code >= NOTIFY_BRNDOWN_MIN &&
@@ -1082,7 +1091,8 @@ static void asus_wmi_notify(u32 value, void *context)
 	if (code == NOTIFY_BRNUP_MIN || code == NOTIFY_BRNDOWN_MIN) {
 		if (!acpi_video_backlight_support())
 			asus_wmi_backlight_notify(asus, orig_code);
-	} else if (!sparse_keymap_report_event(asus->inputdev, code, 1, true))
+	} else if (!sparse_keymap_report_event(asus->inputdev, code,
+					       key_value, autorelease))
 		pr_info("Unknown key %x pressed\n", code);
 
 exit:
diff --git a/drivers/platform/x86/asus-wmi.h b/drivers/platform/x86/asus-wmi.h
index c044522..4da6103 100644
--- a/drivers/platform/x86/asus-wmi.h
+++ b/drivers/platform/x86/asus-wmi.h
@@ -29,6 +29,8 @@
 
 #include <linux/platform_device.h>
 
+#define ASUS_WMI_KEY_IGNORE (-1)
+
 struct module;
 struct key_entry;
 struct asus_wmi;
@@ -44,6 +46,10 @@ struct asus_wmi_driver {
 	const struct key_entry	*keymap;
 	const char		*input_name;
 	const char		*input_phys;
+	/* Returns new code, value, and autorelease values in arguments.
+	 * Return ASUS_WMI_KEY_IGNORE in code if event should be ignored. */
+	void (*key_filter) (struct asus_wmi_driver *driver, int *code,
+			    unsigned int *value, bool *autorelease);
 
 	int (*probe) (struct platform_device *device);
 	void (*quirks) (struct asus_wmi_driver *driver);
-- 
1.7.4.1


------------------------------------------------------------------------------
Create and publish websites with WebMatrix
Use the most popular FREE web apps or write code yourself; 
WebMatrix provides all the features you need to develop and publish 
your website. http://p.sf.net/sfu/ms-webmatrix-sf
