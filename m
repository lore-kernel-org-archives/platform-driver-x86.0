From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] ideapad-laptop: add support for Yoga 3 ESC key
Date: Fri, 06 Nov 2015 22:28:49 +0100
Message-ID: <3945339.hkrnUBKIiS@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org, Ike Panhc <ike.pan@canonical.com>
Cc: Darren Hart <dvhart@infradead.org>, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

The ideapad-laptop handles most special keys on various Lenovo Laptops
including the Yoga line. Unfortunately, the Yoga 3 11/13/14 models have
one important exception, which is the Fn-ESC combination.

On other Lenovo Laptops, this is FnLock, which switches the function keys
between the primary (Mute, Vol down, Vol up, ...) and the secondary (F1,
F2, F3, ...) behavior. On the new machines, FnLock is only available
through BIOS setup (possibly through a yet-to-be-implemented feature
in this driver) but not through Fn-ESC, but instead the ESC key itself
switched between ESC and a "Paper Display" app for Windows.

Unfortunately, that means that you can never have both ESC *and* the
function keys working at the same time without needing to press Fn on
one of them.
As pointed out in the official Lenovo Forum by dozens of users, this
makes the machine rather useless for any serious work [1].

I have now studied the ACPI DSDT one more time and found the event
that is generated for the ESC key. Unlike all other key events on this
machine, it is actually a WMI, while the other ones are read from the
embedded controller.

I am now installing a WMI notifier that uses the event number from the
WMI subsystem as the scancode. The only event number generated here is
'128', and that fits in nicely with the two existing ranges of scancodes
used by the EC: 0-15 for the 16-bit VPCCMD_R_VPC register, 16-17 for
the VPCCMD_R_NOVO register and 64-67 for VPCCMD_R_SPECIAL_BUTTONS.

The only sane way to handle this button (in absence of the Windows Paper
Display driver) seems to be to have it emit KEY_ESC, so that is what
I use as the default. Should any user ever want to overwrite the default,
they can install their own keymap.

To ensure that we can still build the driver without adding a CONFIG_WMI
dependency, all new code is enclosed in #ifdef.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>

[1] https://forums.lenovo.com/t5/Lenovo-Yoga-Series-Notebooks/YOGA-3-14-How-to-reclaim-my-Esc-key-and-permanently-disable/td-p/2070816

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 02bbc70c332d..1089eaa02b00 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -345,6 +345,7 @@ config IDEAPAD_LAPTOP
 	depends on SERIO_I8042
 	depends on BACKLIGHT_CLASS_DEVICE
 	depends on ACPI_VIDEO || ACPI_VIDEO = n
+	depends on ACPI_WMI || ACPI_WMI = n
 	select INPUT_SPARSEKMAP
 	help
 	  This is a driver for Lenovo IdeaPad netbooks contains drivers for
diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
index ad4b8b7e97cc..231db03a6417 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -47,6 +47,10 @@
 #define CFG_WIFI_BIT	(18)
 #define CFG_CAMERA_BIT	(19)
 
+#if IS_ENABLED(CONFIG_ACPI_WMI)
+static const char ideapad_wmi_fnesc_event[] = "26CAB2E5-5CF1-46AE-AAC3-4A12B6BA50E6";
+#endif
+
 enum {
 	VPCCMD_R_VPC1 = 0x10,
 	VPCCMD_R_BL_MAX,
@@ -567,6 +571,8 @@ static const struct key_entry ideapad_keymap[] = {
 	{ KE_KEY, 65, { KEY_PROG4 } },
 	{ KE_KEY, 66, { KEY_TOUCHPAD_OFF } },
 	{ KE_KEY, 67, { KEY_TOUCHPAD_ON } },
+	{ KE_KEY, 128, { KEY_ESC } },
+
 	{ KE_END, 0 },
 };
 
@@ -825,6 +831,19 @@ static void ideapad_acpi_notify(acpi_handle handle, u32 event, void *data)
 	}
 }
 
+#if IS_ENABLED(CONFIG_ACPI_WMI)
+static void ideapad_wmi_notify(u32 value, void *context)
+{
+	switch (value) {
+	case 128:
+		ideapad_input_report(context, value);
+		break;
+	default:
+		pr_info("Unknown WMI event %u\n", value);
+	}
+}
+#endif
+
 /*
  * Some ideapads don't have a hardware rfkill switch, reading VPCCMD_R_RF
  * always results in 0 on these models, causing ideapad_laptop to wrongly
@@ -942,8 +961,18 @@ static int ideapad_acpi_add(struct platform_device *pdev)
 		ACPI_DEVICE_NOTIFY, ideapad_acpi_notify, priv);
 	if (ret)
 		goto notification_failed;
+#if IS_ENABLED(CONFIG_ACPI_WMI)
+	ret = wmi_install_notify_handler(ideapad_wmi_fnesc_event, ideapad_wmi_notify, priv);
+	if (ret != AE_OK && ret != AE_NOT_EXIST)
+		goto notification_failed_wmi;
+#endif
 
 	return 0;
+#if IS_ENABLED(CONFIG_ACPI_WMI)
+notification_failed_wmi:
+	acpi_remove_notify_handler(priv->adev->handle,
+		ACPI_DEVICE_NOTIFY, ideapad_acpi_notify);
+#endif
 notification_failed:
 	ideapad_backlight_exit(priv);
 backlight_failed:
@@ -962,6 +991,9 @@ static int ideapad_acpi_remove(struct platform_device *pdev)
 	struct ideapad_private *priv = dev_get_drvdata(&pdev->dev);
 	int i;
 
+#if IS_ENABLED(CONFIG_ACPI_WMI)
+	wmi_remove_notify_handler(ideapad_wmi_fnesc_event);
+#endif
 	acpi_remove_notify_handler(priv->adev->handle,
 		ACPI_DEVICE_NOTIFY, ideapad_acpi_notify);
 	ideapad_backlight_exit(priv);
