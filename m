Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D9C34B1AD;
	Mon, 22 Jun 2026 19:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782157182; cv=none; b=QA/R27UtD6EGmw4Hvq9hiXVRCBfg8gYGJSqusxCHnjmTYbDp5RNKxUg/TIRFR+R8Hl8lk9+tQLHJGJUfJ68dWBvauvMiCYLWOmrTNas3E4CZtIdEg2Zc6cPaCspm76yqmtykkUpAXmGzPjiiDM6XdPRsOh3SFfRQrlePaVyYbSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782157182; c=relaxed/simple;
	bh=m2NZgs3FExq2fvnAlf8Ig4YTCWr0KPc5HbNTgVfpnuI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mfKWpoBY9FTEM/6QbJYkVNTgTzb9EUw38dtzsrBQuy3SGCM6gESfcnHb4epaoYGkMCZDsqEzudcmtJhfceJwQ637UN1uVYuOIwxsyaE/cp4XkGoCFOTru653LTUl+q6ZYiZozKf/6838XIHdwx6SgHO52A7lc2un5M2aw9lTB0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=QSyXDK10; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="QSyXDK10"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1782157170; x=1782761970; i=w_armin@gmx.de;
	bh=W886lSX+L1r8B/kBJzPTzKoMRC33WwSp/1BkODijG1s=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=QSyXDK10wTVDfz4pXfywYw+qMFGu4top+hkeKBEwBWapNWknUkFD75Ke+eaPibhx
	 7fspyfTr+JJ5trTVrIpVI6VtJKJYO+bWDmLjgUN3xj0JQiU89v2U9T/Vajd9iTiZA
	 Yeh2q5OsSqpsFf+3smX80jzDHb7rZr1+iF9DMxTrk5N6zFgZxtOv6L9t9tyjNRbhw
	 kHQ150qN/PM9U4esgVBRmgnHAJcC9gn7RLMI7fLBL+zW5ErySX3+8EMGemVWFF9Li
	 0CIQf7AKD4OagIz9WR0UmLdV2c3T/RjsreCM3zGo4hsY91Bl8Cs0Iw9oE4IqRXUw2
	 JworrUz5L49gmhliIQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1McH9i-1x9hGg2Jki-00ZYqz; Mon, 22
 Jun 2026 21:39:30 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: matan@svgalib.org
Cc: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] platform/x86: lg-laptop: Add support for native ACPI events
Date: Mon, 22 Jun 2026 21:39:11 +0200
Message-Id: <20260622193914.116999-3-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260622193914.116999-1-W_Armin@gmx.de>
References: <20260622193914.116999-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:r2V7l8Tc4H4SpoZLZZo/r9u+t///PzynvUT9tn5zFAGx0mj4oVr
 tcv5OXd8OjicZ4o5LoO8NgEm8lt6q3nyz8XPQ9sA8nHqU9LN+n6buknLry8itxRoFNsGEZ7
 7xlpyR+flXQ7eCw50aLYoNgc7eqhrl5SVHLtDf+v3mamJkvL/FcRMu+Upa5YRDYkNEQd70L
 HvYgBUDBmaKy/wwuwkERw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:urs6Ms2waUk=;1v3HWxsmh/fdCyRHtykB/QSql6/
 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
 7fZyqgIKQ=

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
 drivers/platform/x86/lg-laptop.c | 301 ++++++++++++++++++++-----------
 2 files changed, 199 insertions(+), 103 deletions(-)

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
index a2db9657027e..ead0c3cc74a8 100644
=2D-- a/drivers/platform/x86/lg-laptop.c
+++ b/drivers/platform/x86/lg-laptop.c
@@ -57,13 +57,18 @@ MODULE_PARM_DESC(fw_debug, "Enable printing of firmwar=
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
@@ -83,21 +88,7 @@ MODULE_PARM_DESC(fw_debug, "Enable printing of firmware=
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
@@ -115,6 +106,36 @@ static const struct key_entry wmi_keymap[] =3D {
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
@@ -212,70 +233,6 @@ static union acpi_object *lg_wmbb(struct device *dev,=
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
@@ -634,26 +591,164 @@ static enum led_brightness kbd_backlight_get(struct=
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
+
+	status =3D acpi_evaluate_integer(handle, "_WED", &args, &result);
+	if (ACPI_FAILURE(status))
+		return -EIO;
=20
-	if (inited & INIT_INPUT_WMI_0)
-		wmi_remove_notify_handler(WMI_EVENT_GUID0);
+	if (result > U32_MAX)
+		return -EPROTO;
=20
-	if (inited & INIT_SPARSE_KEYMAP)
-		input_unregister_device(wmi_input_dev);
+	*data =3D result;
=20
-	inited &=3D ~(INIT_INPUT_WMI_0 | INIT_INPUT_WMI_2 | INIT_SPARSE_KEYMAP);
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
+
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
@@ -865,10 +960,6 @@ static int acpi_probe(struct platform_device *pdev)
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
@@ -878,7 +969,14 @@ static int acpi_probe(struct platform_device *pdev)
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
@@ -895,7 +993,6 @@ static void acpi_remove(struct platform_device *pdev)
 	sysfs_remove_group(&pf_device->dev.kobj, &dev_attribute_group);
=20
 	battery_hook_unregister(&battery_hook);
-	wmi_input_destroy();
 	platform_device_unregister(pf_device);
 	pf_device =3D NULL;
 	platform_driver_unregister(&pf_driver);
=2D-=20
2.39.5

