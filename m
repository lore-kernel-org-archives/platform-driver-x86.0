From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: [PATCH v4 3/3] dell-laptop: Use dell-rbtn instead i8042 filter when possible
Date: Wed, 27 May 2015 23:28:25 +0200
Message-ID: <1432762105-13723-4-git-send-email-pali.rohar@gmail.com>
References: <1416755361-17357-1-git-send-email-pali.rohar@gmail.com>
 <1432762105-13723-1-git-send-email-pali.rohar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1432762105-13723-1-git-send-email-pali.rohar@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Gabriele Mazzotta <gabriele.mzt@gmail.com>, Alex Hung <alex.hung@canonical.com>, Matthew Garrett <mjg59@srcf.ucam.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Valdis.Kletnieks@vt.edu, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>, Darren Hart <dvhart@linux.intel.com>
List-Id: platform-driver-x86.vger.kernel.org

Until now module dell-laptop registered rfkill device which used i8042
filter function for receiving HW switch rfkill events (handling special
keycode).

But for some dell laptops there is native ACPI driver dell-rbtn which c=
an
receive rfkill events (without i8042 hooks).

So this patch will combine best from both sides. It will use native ACP=
I
driver dell-rbtn for receiving events and dell-laptop SMBIOS interface =
for
enabling or disabling radio devices. If ACPI driver or device will not =
be
available fallback to i8042 filter function will be used.

Patch also changes module_init() to late_initcall() to ensure that init
function will be called after initializing dell-rbtn.c driver.

Signed-off-by: Pali Roh=C3=A1r <pali.rohar@gmail.com>
Tested-by: Gabriele Mazzotta <gabriele.mzt@gmail.com>
Signed-off-by: Darren Hart <dvhart@linux.intel.com>
---
Changes for v4:
 - Use symbol_request() instead hard dependency on function symbols
 - Move rfkill/rbtn/i8042 clean code to dell_cleanup_rfkill()
 - Use late_initcall() instead module_init()
 - Fix commit message and comments, spelling error fixed by aspell
---
 drivers/platform/x86/dell-laptop.c |   91 ++++++++++++++++++++++++++++=
++++----
 1 file changed, 83 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/x86/dell-laptop.c b/drivers/platform/x86/=
dell-laptop.c
index d688d80..be4e425 100644
--- a/drivers/platform/x86/dell-laptop.c
+++ b/drivers/platform/x86/dell-laptop.c
@@ -32,6 +32,7 @@
 #include <linux/debugfs.h>
 #include <linux/seq_file.h>
 #include "../../firmware/dcdbas.h"
+#include "dell-rbtn.h"
=20
 #define BRIGHTNESS_TOKEN 0x7d
 #define KBD_LED_OFF_TOKEN 0x01E1
@@ -642,6 +643,20 @@ static bool dell_laptop_i8042_filter(unsigned char=
 data, unsigned char str,
 	return false;
 }
=20
+static int (*dell_rbtn_notifier_register_func)(struct notifier_block *=
);
+static int (*dell_rbtn_notifier_unregister_func)(struct notifier_block=
 *);
+
+static int dell_laptop_rbtn_notifier_call(struct notifier_block *nb,
+					  unsigned long action, void *data)
+{
+	schedule_delayed_work(&dell_rfkill_work, 0);
+	return NOTIFY_OK;
+}
+
+static struct notifier_block dell_laptop_rbtn_notifier =3D {
+	.notifier_call =3D dell_laptop_rbtn_notifier_call,
+};
+
 static int __init dell_setup_rfkill(void)
 {
 	int status, ret, whitelisted;
@@ -718,10 +733,59 @@ static int __init dell_setup_rfkill(void)
 			goto err_wwan;
 	}
=20
-	ret =3D i8042_install_filter(dell_laptop_i8042_filter);
-	if (ret) {
-		pr_warn("Unable to install key filter\n");
+	/*
+	 * Dell Airplane Mode Switch driver (dell-rbtn) supports ACPI devices
+	 * which can receive events from HW slider switch.
+	 *
+	 * Dell SMBIOS on whitelisted models supports controlling radio devic=
es
+	 * but does not support receiving HW button switch events. We can use
+	 * i8042 filter hook function to receive keyboard data and handle
+	 * keycode for HW button.
+	 *
+	 * So if it is possible we will use Dell Airplane Mode Switch ACPI
+	 * driver for receiving HW events and Dell SMBIOS for setting rfkill
+	 * states. If ACPI driver or device is not available we will fallback=
 to
+	 * i8042 filter hook function.
+	 *
+	 * To prevent duplicate rfkill devices which control and do same thin=
g,
+	 * dell-rbtn driver will automatically remove its own rfkill devices
+	 * once function dell_rbtn_notifier_register() is called.
+	 */
+
+	dell_rbtn_notifier_register_func =3D symbol_request(dell_rbtn_notifie=
r_register);
+	if ( dell_rbtn_notifier_register_func ) {
+		dell_rbtn_notifier_unregister_func =3D symbol_request(dell_rbtn_noti=
fier_unregister);
+		if ( ! dell_rbtn_notifier_unregister_func ) {
+			symbol_put(dell_rbtn_notifier_register);
+			dell_rbtn_notifier_register_func =3D NULL;
+		}
+	}
+
+	if (dell_rbtn_notifier_register_func) {
+		ret =3D dell_rbtn_notifier_register_func(&dell_laptop_rbtn_notifier)=
;
+		symbol_put(dell_rbtn_notifier_register);
+		dell_rbtn_notifier_register_func =3D NULL;
+		if (ret !=3D 0) {
+			symbol_put(dell_rbtn_notifier_unregister);
+			dell_rbtn_notifier_unregister_func =3D NULL;
+		}
+	} else {
+		pr_info("Symbols from dell-rbtn acpi driver are not available\n");
+		ret =3D -ENODEV;
+	}
+
+	if (ret =3D=3D 0) {
+		pr_info("Using dell-rbtn acpi driver for receiving events\n");
+	} else if (ret !=3D -ENODEV) {
+		pr_warn("Unable to register dell rbtn notifier\n");
 		goto err_filter;
+	} else {
+		ret =3D i8042_install_filter(dell_laptop_i8042_filter);
+		if (ret) {
+			pr_warn("Unable to install key filter\n");
+			goto err_filter;
+		}
+		pr_info("Using i8042 filter function for receiving events\n");
 	}
=20
 	return 0;
@@ -744,6 +808,14 @@ err_wifi:
=20
 static void dell_cleanup_rfkill(void)
 {
+	if (dell_rbtn_notifier_unregister_func) {
+		dell_rbtn_notifier_unregister_func(&dell_laptop_rbtn_notifier);
+		symbol_put(dell_rbtn_notifier_unregister);
+		dell_rbtn_notifier_unregister_func =3D NULL;
+	} else {
+		i8042_remove_filter(dell_laptop_i8042_filter);
+	}
+	cancel_delayed_work_sync(&dell_rfkill_work);
 	if (wifi_rfkill) {
 		rfkill_unregister(wifi_rfkill);
 		rfkill_destroy(wifi_rfkill);
@@ -1961,8 +2033,6 @@ static int __init dell_init(void)
 	return 0;
=20
 fail_backlight:
-	i8042_remove_filter(dell_laptop_i8042_filter);
-	cancel_delayed_work_sync(&dell_rfkill_work);
 	dell_cleanup_rfkill();
 fail_rfkill:
 	free_page((unsigned long)bufferpage);
@@ -1983,8 +2053,6 @@ static void __exit dell_exit(void)
 	if (quirks && quirks->touchpad_led)
 		touchpad_led_exit();
 	kbd_led_exit();
-	i8042_remove_filter(dell_laptop_i8042_filter);
-	cancel_delayed_work_sync(&dell_rfkill_work);
 	backlight_device_unregister(dell_backlight_device);
 	dell_cleanup_rfkill();
 	if (platform_device) {
@@ -1995,7 +2063,14 @@ static void __exit dell_exit(void)
 	free_page((unsigned long)buffer);
 }
=20
-module_init(dell_init);
+/* dell-rbtn.c driver export functions which will not work correctly (=
and could
+ * cause kernel crash) if they are called before dell-rbtn.c init code=
=2E This is
+ * not problem when dell-rbtn.c is compiled as external module. When b=
oth files
+ * (dell-rbtn.c and dell-laptop.c) are compiled statically into kernel=
, then we
+ * need to ensure that dell_init() will be called after initializing d=
ell-rbtn.
+ * This can be achieved by late_initcall() instead module_init().
+ */
+late_initcall(dell_init);
 module_exit(dell_exit);
=20
 MODULE_AUTHOR("Matthew Garrett <mjg@redhat.com>");
--=20
1.7.9.5
