Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D473DE44C;
	Wed,  8 Jul 2026 19:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783540568; cv=none; b=dmCP5rYwp8lxsGtc+7TJ6KcKfHaV9j5oYzJysdPLtEEepBFhCgBcDEUMMnuyfuJ/x4ojQoK4pTHL4l6WtDAC9GhuJpfUV8z7Z+KqX5hDpq4HGRjaA3rmc7a1p5eApyj2sSCBlqpF/vLdhx8scIpRcx/umidyI7Qnt8kKbx4yYSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783540568; c=relaxed/simple;
	bh=pVzveNLvRvHkrk9yFZodqwEPAzq1EnwwRiyu5xvDvIY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OR6GpT/IoShTBOx2hh0/5sEA66fAJPl3ZM358q8AZtkBD+BiexfgfjOXpX7gJUcy+G5biy0KwI5p90iT8UZHuQfmxeKjm9k60LgtnRjxjU5S2ItfukjeFixxOLfoSAxdknwogQxO0NekK+bF8QBMdlro1bPnMgqPYYBSuEJ2ZeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=Yr21htun; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="Yr21htun"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1783540563; x=1784145363; i=w_armin@gmx.de;
	bh=qoRQsz12Ep5QIwnR+fSj3OoDWT+RQnMSyHoUTUWfTQg=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Yr21htunX5GjYcXMFt+M0xewzt/2Znwat+K3BskTIqRakgp0BgdZD+bpH31Yz6+M
	 XHeyrnLBcxXHMDoCTM5/ZPdyg3Y/LsKXVUADWtNdqx8s8go9q76YVk1jdppfJczpw
	 Pgsx9IdOSRbcttfpAfLUWmQyb/WGHB5/PHG/w03EFJkOtOvIcuiMYTJCMel/E7+j4
	 Yp2tLsKwqwZFp5i+URZauJ3b/DRuSJGGJiatpH68qseI6jcdsdGNP2s6ApwKc4U9/
	 hvNLzwpIchWZCCB9A9qGT7pvKdyqg8l6hjJwU6xv9KCcuqbysCPy3BlUNIvf1sum5
	 mfuAGt4iZV9kE6FJLQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MryTF-1xSyU21nOf-00khH5; Wed, 08
 Jul 2026 21:56:03 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: matan@svgalib.org
Cc: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/5] platform/x86: lg-laptop: Add support for native ACPI events
Date: Wed,  8 Jul 2026 21:55:50 +0200
Message-Id: <20260708195553.7762-3-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260708195553.7762-1-W_Armin@gmx.de>
References: <20260708195553.7762-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:NApYNmm1ucrsyClrXodnBYbaXGMH+Bj5L4rgfir1CwaWR23qoEL
 KI7MLLCV07V0Webhed7hnXXRfCjKbk0ScxE1sMZxwZrX1SQIibMRf11cFETqC0jobkTEkks
 CcRPxeuXHPn0FsbihHTsEsZneQio0oB4IXXhycV469mSUQe7UgVt3p7ksvPflExzlH6HXVe
 EwBeZp89HiH1uTBBSvuUQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:5vmoU9K0hq8=;hPhqamwwyTcXf7cVHqv/pSQ1RvM
 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
 flRgNi740=

LG devices support two interfaces for receiving events:
- the WMI-based interface currently being used by the driver
- a ACPI-based interface similar to the WMI-based interface

Older devices use the WMI-based interface by default and need
to be manually switched into ACPI mode. Newer devices however
only support the ACPI-based interface, preventing the current
driver from receiving events on them.

Fix this by always using the native ACPI-based interface for
receiving events.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/platform/x86/Kconfig     |   1 -
 drivers/platform/x86/lg-laptop.c | 302 ++++++++++++++++++++-----------
 2 files changed, 200 insertions(+), 103 deletions(-)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index b54b5212b204..957034f39e4e 100644
=2D-- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -802,7 +802,6 @@ config LG_LAPTOP
 	tristate "LG Laptop Extras"
 	depends on ACPI
 	depends on ACPI_BATTERY
-	depends on ACPI_WMI
 	depends on INPUT
 	select INPUT_SPARSEKMAP
 	select NEW_LEDS
diff --git a/drivers/platform/x86/lg-laptop.c b/drivers/platform/x86/lg-la=
ptop.c
index a2db9657027e..9ba1e872b6fe 100644
=2D-- a/drivers/platform/x86/lg-laptop.c
+++ b/drivers/platform/x86/lg-laptop.c
@@ -8,6 +8,7 @@
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
=20
 #include <linux/acpi.h>
+#include <linux/array_size.h>
 #include <linux/bitfield.h>
 #include <linux/bits.h>
 #include <linux/device.h>
@@ -17,6 +18,7 @@
 #include <linux/input/sparse-keymap.h>
 #include <linux/kernel.h>
 #include <linux/leds.h>
+#include <linux/limits.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/string_choices.h>
@@ -57,13 +59,18 @@ MODULE_PARM_DESC(fw_debug, "Enable printing of firmwar=
e debug messages");
 #define LG_ADDRESS_SPACE_DEBUG_MSG_START_ADR	0x3E8
 #define LG_ADDRESS_SPACE_DEBUG_MSG_END_ADR	0x5E8
=20
-#define WMI_EVENT_GUID0	"E4FB94F9-7F2B-4173-AD1A-CD1D95086248"
-#define WMI_EVENT_GUID1	"023B133E-49D1-4E10-B313-698220140DC2"
-#define WMI_EVENT_GUID2	"37BE1AC0-C3F2-4B1F-BFBE-8FDEAF2814D6"
-#define WMI_EVENT_GUID3	"911BAD44-7DF8-4FBB-9319-BABA1C4B293B"
-#define WMI_METHOD_WMAB "C3A72B38-D3EF-42D3-8CBB-D5A57049F66D"
-#define WMI_METHOD_WMBB "2B4F501A-BD3C-4394-8DCF-00A7D2BC8210"
-#define WMI_EVENT_GUID  WMI_EVENT_GUID0
+#define LG_NOTIFY_TABLET_MODE_OFF	0x50
+#define LG_NOTIFY_TABLET_MODE_ON	0x51
+#define LG_NOTIFY_HOTKEY		0x80
+#define LG_NOTIFY_THERMAL		0x81
+#define LG_NOTIFY_MISC			0x82
+
+#define LG_OREP_READ_EC			0
+#define LG_OREP_WRITE_EC		1
+#define LG_OREP_DEBUG			2
+#define LG_OREP_UPDATE_SYSTEM_STATE	3
+#define LG_OREP_INTERCEPT_WMI_EVENTS	4
+#define LG_OREP_WAKE_ON_LAN		6
=20
 #define SB_GGOV_METHOD  "\\_SB.GGOV"
 #define GOV_TLED        0x2020008
@@ -83,21 +90,7 @@ MODULE_PARM_DESC(fw_debug, "Enable printing of firmware=
 debug messages");
=20
 #define PLATFORM_NAME   "lg-laptop"
=20
-MODULE_ALIAS("wmi:" WMI_EVENT_GUID0);
-MODULE_ALIAS("wmi:" WMI_EVENT_GUID1);
-MODULE_ALIAS("wmi:" WMI_EVENT_GUID2);
-MODULE_ALIAS("wmi:" WMI_EVENT_GUID3);
-MODULE_ALIAS("wmi:" WMI_METHOD_WMAB);
-MODULE_ALIAS("wmi:" WMI_METHOD_WMBB);
-
 static struct platform_device *pf_device;
-static struct input_dev *wmi_input_dev;
-
-static u32 inited;
-#define INIT_INPUT_WMI_0        0x01
-#define INIT_INPUT_WMI_2        0x02
-#define INIT_INPUT_ACPI         0x04
-#define INIT_SPARSE_KEYMAP      0x80
=20
 static int battery_limit_use_wmbb;
 static bool kbd_backlight_available;
@@ -115,6 +108,36 @@ static const struct key_entry wmi_keymap[] =3D {
 	{KE_END, 0}
 };
=20
+static int lg_laptop_execute_orep(acpi_handle handle, u64 command, u64 va=
lue,
+				  unsigned long long *result)
+{
+	union acpi_object objs[] =3D {
+		{
+			.integer =3D {
+				.type =3D ACPI_TYPE_INTEGER,
+				.value =3D command,
+			},
+		},
+		{
+			.integer =3D {
+				.type =3D ACPI_TYPE_INTEGER,
+				.value =3D value,
+			},
+		}
+	};
+	struct acpi_object_list args =3D {
+		.count =3D ARRAY_SIZE(objs),
+		.pointer =3D objs,
+	};
+	acpi_status status;
+
+	status =3D acpi_evaluate_integer(handle, "OREP", &args, result);
+	if (ACPI_FAILURE(status))
+		return -EIO;
+
+	return 0;
+}
+
 static int ggov(u32 arg0)
 {
 	union acpi_object args[1];
@@ -212,70 +235,6 @@ static union acpi_object *lg_wmbb(struct device *dev,=
 u32 method_id, u32 arg1, u
 	return (union acpi_object *)buffer.pointer;
 }
=20
-static void wmi_notify(union acpi_object *obj, void *context)
-{
-	long data =3D (long)context;
-	unsigned int brightness;
-
-	pr_debug("event guid %li\n", data);
-	if (!obj)
-		return;
-
-	if (obj->type =3D=3D ACPI_TYPE_INTEGER) {
-		int eventcode =3D obj->integer.value;
-		struct key_entry *key;
-
-		if (eventcode =3D=3D 0x10000000) {
-			if (kbd_backlight_available) {
-				brightness =3D get_kbd_backlight_level(kbd_backlight.dev->parent);
-				led_classdev_notify_brightness_hw_changed(&kbd_backlight,
-									  brightness);
-			}
-		} else {
-			key =3D sparse_keymap_entry_from_scancode(
-				wmi_input_dev, eventcode);
-			if (key && key->type =3D=3D KE_KEY)
-				sparse_keymap_report_entry(wmi_input_dev,
-							   key, 1, true);
-		}
-	}
-
-	pr_debug("Type: %i    Eventcode: 0x%llx\n", obj->type,
-		 obj->integer.value);
-}
-
-static void wmi_input_setup(void)
-{
-	acpi_status status;
-
-	wmi_input_dev =3D input_allocate_device();
-	if (wmi_input_dev) {
-		wmi_input_dev->name =3D "LG WMI hotkeys";
-		wmi_input_dev->phys =3D "wmi/input0";
-		wmi_input_dev->id.bustype =3D BUS_HOST;
-
-		if (sparse_keymap_setup(wmi_input_dev, wmi_keymap, NULL) ||
-		    input_register_device(wmi_input_dev)) {
-			pr_info("Cannot initialize input device");
-			input_free_device(wmi_input_dev);
-			return;
-		}
-
-		inited |=3D INIT_SPARSE_KEYMAP;
-		status =3D wmi_install_notify_handler(WMI_EVENT_GUID0, wmi_notify,
-						    (void *)0);
-		if (ACPI_SUCCESS(status))
-			inited |=3D INIT_INPUT_WMI_0;
-
-		status =3D wmi_install_notify_handler(WMI_EVENT_GUID2, wmi_notify,
-						    (void *)2);
-		if (ACPI_SUCCESS(status))
-			inited |=3D INIT_INPUT_WMI_2;
-	} else {
-		pr_info("Cannot allocate input device");
-	}
-}
-
 static ssize_t fan_mode_store(struct device *dev,
 			      struct device_attribute *attr,
 			      const char *buffer, size_t count)
@@ -634,26 +593,163 @@ static enum led_brightness kbd_backlight_get(struct=
 led_classdev *cdev)
=20
 static LED_DEVICE(kbd_backlight, 255, LED_BRIGHT_HW_CHANGED);
=20
-static void wmi_input_destroy(void)
+static struct platform_driver pf_driver =3D {
+	.driver =3D {
+		   .name =3D PLATFORM_NAME,
+	}
+};
+
+static int lg_laptop_get_event_data(acpi_handle handle, u32 value, u32 *d=
ata)
 {
-	if (inited & INIT_INPUT_WMI_2)
-		wmi_remove_notify_handler(WMI_EVENT_GUID2);
+	union acpi_object objs[] =3D {
+		{
+			.integer =3D {
+				.type =3D ACPI_TYPE_INTEGER,
+				.value =3D value,
+			},
+		}
+	};
+	struct acpi_object_list args =3D {
+		.count =3D ARRAY_SIZE(objs),
+		.pointer =3D objs,
+	};
+	unsigned long long result;
+	acpi_status status;
=20
-	if (inited & INIT_INPUT_WMI_0)
-		wmi_remove_notify_handler(WMI_EVENT_GUID0);
+	status =3D acpi_evaluate_integer(handle, "_WED", &args, &result);
+	if (ACPI_FAILURE(status))
+		return -EIO;
=20
-	if (inited & INIT_SPARSE_KEYMAP)
-		input_unregister_device(wmi_input_dev);
+	if (result > U32_MAX)
+		return -EPROTO;
=20
-	inited &=3D ~(INIT_INPUT_WMI_0 | INIT_INPUT_WMI_2 | INIT_SPARSE_KEYMAP);
+	*data =3D result;
+
+	return 0;
 }
=20
-static struct platform_driver pf_driver =3D {
-	.driver =3D {
-		   .name =3D PLATFORM_NAME,
+static void lg_laptop_handle_input_event(struct input_dev *input_dev, u32=
 value, u32 data)
+{
+	unsigned int kbd_brightness;
+
+	switch (value) {
+	case LG_NOTIFY_HOTKEY:
+		sparse_keymap_report_event(input_dev, data, 1, true);
+		break;
+	case LG_NOTIFY_THERMAL:
+		/* Currently not supported */
+		break;
+	case LG_NOTIFY_MISC:
+		switch (data) {
+		case 0x10000000:
+			if (!kbd_backlight_available)
+				break;
+
+			kbd_brightness =3D get_kbd_backlight_level(kbd_backlight.dev->parent);
+			led_classdev_notify_brightness_hw_changed(&kbd_backlight, kbd_brightne=
ss);
+			break;
+		default:
+			sparse_keymap_report_event(input_dev, data, 1, true);
+		}
+		break;
+	default:
+		break;
+	}
+}
+
+static void lg_laptop_notify_handler(acpi_handle handle, u32 value, void =
*context)
+{
+	struct input_dev *input_dev =3D context;
+	u32 data;
+	int ret;
+
+	switch (value) {
+	case LG_NOTIFY_TABLET_MODE_OFF:
+	case LG_NOTIFY_TABLET_MODE_ON:
+		/* Already handled by intel-hid */
+		return;
+	case LG_NOTIFY_HOTKEY:
+	case LG_NOTIFY_THERMAL:
+	case LG_NOTIFY_MISC:
+		ret =3D lg_laptop_get_event_data(handle, value, &data);
+		if (ret < 0) {
+			dev_notice(input_dev->dev.parent, "Failed to get event data: %d\n", re=
t);
+			return;
+		}
+
+		dev_dbg(input_dev->dev.parent, "Received event %u (%u)\n", value, data)=
;
+
+		lg_laptop_handle_input_event(input_dev, value, data);
+		return;
+	default:
+		dev_notice(input_dev->dev.parent, "Received unknown event %u\n", value)=
;
 	}
 };
=20
+static void lg_laptop_remove_notify_handler(void *context)
+{
+	acpi_handle handle =3D context;
+
+	acpi_remove_notify_handler(handle, ACPI_ALL_NOTIFY, lg_laptop_notify_han=
dler);
+}
+
+static void lg_laptop_reenable_wmi_events(void *context)
+{
+	acpi_handle handle =3D context;
+	unsigned long long dummy;
+
+	lg_laptop_execute_orep(handle, LG_OREP_INTERCEPT_WMI_EVENTS, 0, &dummy);
+}
+
+static int lg_laptop_input_init(struct device *dev, acpi_handle handle)
+{
+	struct input_dev *input_dev;
+	unsigned long long result;
+	acpi_status status;
+	int ret;
+
+	if (!acpi_has_method(handle, "_WED"))
+		return 0;
+
+	input_dev =3D devm_input_allocate_device(dev);
+	if (!input_dev)
+		return -ENOMEM;
+
+	input_dev->name =3D "LG WMI hotkeys";
+	input_dev->phys =3D "wmi/input0";
+	input_dev->id.bustype =3D BUS_HOST;
+	ret =3D sparse_keymap_setup(input_dev, wmi_keymap, NULL);
+	if (ret < 0)
+		return ret;
+
+	ret =3D input_register_device(input_dev);
+	if (ret < 0)
+		return ret;
+
+	status =3D acpi_install_notify_handler(handle, ACPI_ALL_NOTIFY, lg_lapto=
p_notify_handler,
+					     input_dev);
+	if (ACPI_FAILURE(status))
+		return -EIO;
+
+	ret =3D devm_add_action_or_reset(dev, lg_laptop_remove_notify_handler, h=
andle);
+	if (ret < 0)
+		return ret;
+
+	if (acpi_has_method(handle, "OREP")) {
+		ret =3D lg_laptop_execute_orep(handle, LG_OREP_INTERCEPT_WMI_EVENTS, 1,=
 &result);
+		if (ret < 0)
+			return ret;
+		if (result)
+			return -EIO;
+
+		ret =3D devm_add_action_or_reset(dev, lg_laptop_reenable_wmi_events, ha=
ndle);
+		if (ret < 0)
+			return ret;
+	}
+
+	return 0;
+}
+
 static acpi_status lg_laptop_address_space_write(struct device *dev, acpi=
_physical_address address,
 						 size_t size, u64 value)
 {
@@ -865,10 +961,6 @@ static int acpi_probe(struct platform_device *pdev)
 	if (year >=3D 2019)
 		battery_limit_use_wmbb =3D 1;
=20
-	ret =3D sysfs_create_group(&pf_device->dev.kobj, &dev_attribute_group);
-	if (ret)
-		goto out_platform_device;
-
 	/* LEDs are optional */
 	ret =3D devm_led_classdev_register(&pdev->dev, &kbd_backlight);
 	if (ret < 0)
@@ -878,7 +970,14 @@ static int acpi_probe(struct platform_device *pdev)
=20
 	devm_led_classdev_register(&pdev->dev, &tpad_led);
=20
-	wmi_input_setup();
+	ret =3D lg_laptop_input_init(&pdev->dev, device->handle);
+	if (ret < 0)
+		goto out_platform_device;
+
+	ret =3D sysfs_create_group(&pf_device->dev.kobj, &dev_attribute_group);
+	if (ret)
+		goto out_platform_device;
+
 	battery_hook_register(&battery_hook);
=20
 	return 0;
@@ -895,7 +994,6 @@ static void acpi_remove(struct platform_device *pdev)
 	sysfs_remove_group(&pf_device->dev.kobj, &dev_attribute_group);
=20
 	battery_hook_unregister(&battery_hook);
-	wmi_input_destroy();
 	platform_device_unregister(pf_device);
 	pf_device =3D NULL;
 	platform_driver_unregister(&pf_driver);
=2D-=20
2.39.5

