Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDDB038642A
	for <platform-driver-x86@vger.kernel.org>; Thu, 12 Mar 2026 03:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773285065; cv=none; b=uIQgC2cpYfbSe7QWK/N5BhcR4YT8lK6SwrtEVLtYZIWbYSjO1AwZQnWa6yjP6QVyOJ4WVBbDvso2JquFXwmootKgo5k6yoy9+PH0c5lB99bA5MYM3+Gx+Qqc5tKWJ793MpaloACcVcckNf1hK9G/a0qi2j8hr1DXorBBsHvvvS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773285065; c=relaxed/simple;
	bh=jZGkc0CaX1KiVfoT+MjN4RrjO76bH/XuYnnKqmkqi/M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s7loLI7eQshVhLap7ZYMKlP/Cr65VP+BE+GVFSIDctFI8EtizSisic7Ojid0ZypVN4dzt+G/bCV4uueOpJeTxrFZzb5br0zUb/mtVIhzFHf+0nzX6hWtGj0rgPzWifstvuR4eXF9TEObOTWfkJKmxcQXPiSAVMdkmj62fmAU4BY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CUxI4sSC; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CUxI4sSC"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2be06c02f66so848292eec.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 11 Mar 2026 20:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773285041; x=1773889841; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UShDUsZkuPSTbtrFEPurAUVLmu+3zQB+pbyGgJQ6eFA=;
        b=CUxI4sSCmU37/+0/VkhOcOUKHvDfwG/t2CjO0WSl5hcNWHi66kAFoiczITwcrXSn1h
         BxU9siIe8khH11K2Kg6EyyPNmJRRY5roXy0I4uulH23abO/05vY53jGhpZHsGFCtciD0
         VW8jnFIf9vc1s4OOZ9jiQsJMJJ0efnKGyrv9hyznanGKomhwM9aApr40VQO2/kl+ngG2
         y/cdZgHGOq7QQrz2NME9jz6SDxxdy+unMf41DjK4cC3uOvw7vTIXXBk3UtkChbZHKHQ1
         x6/G+J8bkwekdOyTJRZAUPhgQUI389E4Zpz1G6EI538YwThoncHQCq2qI0+M0O6BgTpS
         LbjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773285041; x=1773889841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UShDUsZkuPSTbtrFEPurAUVLmu+3zQB+pbyGgJQ6eFA=;
        b=d4x12sFW7ltj3uCl632dM4J6XSxrCTekVLtmcoscydygalKZ3jvUWlOHSDxyNrJisz
         ACwC3mXtHW7ehEceCvgZ4WFbUik+sNWl8bhhW5EyBKMtZVYs/miSjjYer9QL82HSKi2h
         AT7+uGcr2FLM9peCZ5/kGvjWQNwRMeCPKtMzdCMVOCTlMr1sfw+thYc92C9NLEM42KzL
         LD2jnsp0bF+cYWrgyDHZo1F2hBG9ycrtldkBRHYwqYbS3W27zKrz23brqzQdj4r5ci1+
         aWzIQJYSRUGFffE2nr4Qdzgq3RzRz4QWf4M7/XPLSJ+e/blJY2Lw9K8TgLaXuS+n4dLE
         93Eg==
X-Forwarded-Encrypted: i=1; AJvYcCWWFDLALha+AXNHlHGI8MIL8kZtKHp+Opg+zX2ec8bwxB2jZDWTHZIM5NwFcQzFOr6SotEIvtm3bXVkdXCmVS4KIzmr@vger.kernel.org
X-Gm-Message-State: AOJu0YxPQCLxnwtE+m2121aefdZcOOHKqAzJnB+BvxwBrXPMt7K/Ki3r
	gqj9WfR3KyO3X0OgHjRHJnZGPBeUh0dTNlBo6X4TUyQsRa6LfEpIwtF1
X-Gm-Gg: ATEYQzySZvR1khGpwLZbP9NfWY/A1R6K55QRAPJjDnf/0YM/6kzdSqpk8jhGSX/4TW2
	aE1GJVfsJgfPID/NAZAcb+pO+ZMewH1kMVDhib9XSf5cBhfqRlWl07LDzccPGNEdzEjVJuqz3WJ
	wl2Qz07B/3kUlxKXT7I2l0Z8MPiM2CUYT0scV4dIk2s7BRxbf7QZgieNoQhsmEn4jUeRZTfqJ1c
	FYLyEgJrOYgDsNj/l+Xcox1kbu3ANkGQ0+6jA/zT3j5gMtjXYm/swOxrHHZzdIr0dveRzXWGH80
	NlrC3OarEfuxQ6QPwiB4MZhn8tiWfzDKz9aL5WbcirXOAFGWx06gwuXNAG96g7hSGX3C5zBUjhC
	fcN79ToSTwbBNmSprsW4C+2j72vVsAwniWqq6XBdGK2ds07yLMHdheD7tPY/mWfDB7vUpXS2SYW
	gQVo6/BIWirmIARjoqp7xoHhPCgWD4bPzaf6hsZmvrIoYiWty7cDP2YCDt4tLAAoTkk3vBZM5L5
	aKlFFQTG/njQ5k=
X-Received: by 2002:a05:7301:d1a:b0:2ba:a04a:8372 with SMTP id 5a478bee46e88-2be8a59cf82mr2116408eec.33.1773285040945;
        Wed, 11 Mar 2026 20:10:40 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be8aa97dcfsm4802495eec.33.2026.03.11.20.10.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 20:10:40 -0700 (PDT)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>,
	Armin Wolf <W_Armin@gmx.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Rong Zhang <i@rong.moe>,
	Kurt Borja <kuurtb@gmail.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 8/8] platform/x86: lenovo-wmi-other: Add WMI battery charge limiting
Date: Thu, 12 Mar 2026 03:10:32 +0000
Message-ID: <20260312031032.3467565-9-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260312031032.3467565-1-derekjohn.clark@gmail.com>
References: <20260312031032.3467565-1-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add charge-type power supply extension for devices that support WMI based
charge enable/disable.

Lenovo Legion devices that implement WMI function and capdata ID
0x03010001 in their BIOS are able to enable or disable charging at 80%
through the lenovo-wmi-other interface. Add a charge_type power supply
extension to expose this capability to the sysfs.

The ideapad_laptop driver can also provide the charge_type attribute. To
avoid conflicts between the drivers, get the acpi_handle and do the same
check that ideapad_laptop does when it enables the feature. If the
feature is supported in ideapad_laptop, abort adding the extension from
lenovo-wmi-other. The ACPI method is more reliable when both are
present, from my testing, so we can prefer that implementation and do
not need to worry about de-conflicting from inside that driver. A new
module parameter, force_load_psy_ext, is provided to bypass this ACPI
check, if desired.

Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
v4:
  - Remove unused defines.
  - Disambiguate charging defines by renaming them to be more consistent
    with the kernel modes they represent.
  - Add module parameter to ignore ACPI checks.
  - Don't fail if the ACPI handle isn't found, skip the ACPI check
    instead.
---
 drivers/platform/x86/lenovo/wmi-capdata.h |   1 +
 drivers/platform/x86/lenovo/wmi-other.c   | 234 +++++++++++++++++++++-
 2 files changed, 234 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/lenovo/wmi-capdata.h b/drivers/platform/x86/lenovo/wmi-capdata.h
index 196481b1ce17..cc0d1c176c2f 100644
--- a/drivers/platform/x86/lenovo/wmi-capdata.h
+++ b/drivers/platform/x86/lenovo/wmi-capdata.h
@@ -20,6 +20,7 @@
 enum lwmi_device_id {
 	LWMI_DEVICE_ID_CPU = 0x01,
 	LWMI_DEVICE_ID_GPU = 0x02,
+	LWMI_DEVICE_ID_PSU = 0x03,
 	LWMI_DEVICE_ID_FAN = 0x04,
 };
 
diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x86/lenovo/wmi-other.c
index 61ac9bee352f..cab9ae6bd811 100644
--- a/drivers/platform/x86/lenovo/wmi-other.c
+++ b/drivers/platform/x86/lenovo/wmi-other.c
@@ -43,9 +43,12 @@
 #include <linux/module.h>
 #include <linux/notifier.h>
 #include <linux/platform_profile.h>
+#include <linux/power_supply.h>
 #include <linux/types.h>
 #include <linux/wmi.h>
 
+#include <acpi/battery.h>
+
 #include "wmi-capdata.h"
 #include "wmi-events.h"
 #include "wmi-gamezone.h"
@@ -79,10 +82,12 @@ enum lwmi_feature_id_gpu {
 	LWMI_FEATURE_ID_GPU_NV_CPU_BOOST =	0x0b,
 };
 
-#define LWMI_FEATURE_ID_FAN_RPM 0x03
+#define LWMI_FEATURE_ID_FAN_RPM		0x03
+#define LWMI_FEATURE_ID_PSU_CHARGE_TYPE	0x01
 
 #define LWMI_TYPE_ID_NONE	0x00
 #define LWMI_TYPE_ID_CROSSLOAD	0x01
+#define LWMI_TYPE_ID_PSU_AC	0x01
 
 #define LWMI_FEATURE_VALUE_GET 17
 #define LWMI_FEATURE_VALUE_SET 18
@@ -93,6 +98,9 @@ enum lwmi_feature_id_gpu {
 
 #define LWMI_FAN_DIV 100
 
+#define LWMI_CHARGE_TYPE_STANDARD	0x00
+#define LWMI_CHARGE_TYPE_LONGLIFE	0x01
+
 /**
  * lwmi_attr_id() - Formats a capability data attribute ID
  * @dev_id: The u8 corresponding to the device ID.
@@ -114,6 +122,10 @@ static u32 lwmi_attr_id(u8 dev_id, u8 feat_id, u8 mode_id, u8 type_id)
 	lwmi_attr_id(LWMI_DEVICE_ID_FAN, LWMI_FEATURE_ID_FAN_RPM, \
 		     LWMI_GZ_THERMAL_MODE_NONE, LWMI_FAN_ID(x))
 
+#define LWMI_ATTR_ID_PSU(feat, type)			\
+	lwmi_attr_id(LWMI_DEVICE_ID_PSU, feat,		\
+		     LWMI_GZ_THERMAL_MODE_NONE, type)
+
 #define LWMI_OM_SYSFS_NAME "lenovo-wmi-other"
 #define LWMI_OM_HWMON_NAME "lenovo_wmi_other"
 
@@ -155,6 +167,8 @@ struct lwmi_om_priv {
 		bool capdata00_collected : 1;
 		bool capdata_fan_collected : 1;
 	} fan_flags;
+
+	struct acpi_battery_hook battery_hook;
 };
 
 /*
@@ -579,6 +593,223 @@ static void lwmi_om_fan_info_collect_cd_fan(struct device *dev, struct cd_list *
 	lwmi_om_hwmon_add(priv);
 }
 
+/* ======== Power Supply Extension (component: lenovo-wmi-capdata 00) ======== */
+
+/**
+ * lwmi_psy_ext_get_prop() - Get a power_supply_ext property
+ * @ps: The battery that was extended
+ * @ext: The extension
+ * @ext_data: Pointer the lwmi_om_priv drvdata
+ * @prop: The property to read
+ * @val: The value to return
+ *
+ * Writes the given value to the power_supply_ext property
+ *
+ * Return: 0 on success, or an error
+ */
+static int lwmi_psy_ext_get_prop(struct power_supply *ps,
+				 const struct power_supply_ext *ext,
+				 void *ext_data,
+				 enum power_supply_property prop,
+				 union power_supply_propval *val)
+{
+	struct lwmi_om_priv *priv = ext_data;
+	struct wmi_method_args_32 args;
+	u32 retval;
+	int ret;
+
+	args.arg0 = LWMI_ATTR_ID_PSU(LWMI_FEATURE_ID_PSU_CHARGE_TYPE, LWMI_TYPE_ID_PSU_AC);
+
+	ret = lwmi_dev_evaluate_int(priv->wdev, 0x0, LWMI_FEATURE_VALUE_GET,
+				    (unsigned char *)&args, sizeof(args),
+				    &retval);
+	if (ret)
+		return ret;
+
+	dev_dbg(&priv->wdev->dev, "Got return value %x for property %x\n", retval, prop);
+
+	if (retval == LWMI_CHARGE_TYPE_LONGLIFE)
+		val->intval = POWER_SUPPLY_CHARGE_TYPE_LONGLIFE;
+	else
+		val->intval = POWER_SUPPLY_CHARGE_TYPE_STANDARD;
+
+	return 0;
+}
+
+/**
+ * lwmi_psy_ext_set_prop() - Set a power_supply_ext property
+ * @ps: The battery that was extended
+ * @ext: The extension
+ * @ext_data: Pointer the lwmi_om_priv drvdata
+ * @prop: The property to write
+ * @val: The value to write
+ *
+ * Writes the given value to the power_supply_ext property
+ *
+ * Return: 0 on success, or an error
+ */
+static int lwmi_psy_ext_set_prop(struct power_supply *ps,
+				 const struct power_supply_ext *ext,
+				 void *ext_data,
+				 enum power_supply_property prop,
+				 const union power_supply_propval *val)
+{
+	struct lwmi_om_priv *priv = ext_data;
+	struct wmi_method_args_32 args;
+
+	args.arg0 = LWMI_ATTR_ID_PSU(LWMI_FEATURE_ID_PSU_CHARGE_TYPE, LWMI_TYPE_ID_PSU_AC);
+	if (val->intval == POWER_SUPPLY_CHARGE_TYPE_LONGLIFE)
+		args.arg1 = LWMI_CHARGE_TYPE_LONGLIFE;
+	else
+		args.arg1 = LWMI_CHARGE_TYPE_STANDARD;
+
+	dev_dbg(&priv->wdev->dev, "Attempting to set %#08x for property %x to %x\n",
+		args.arg0, prop, args.arg1);
+
+	return lwmi_dev_evaluate_int(priv->wdev, 0x0, LWMI_FEATURE_VALUE_SET,
+				     (unsigned char *)&args, sizeof(args), NULL);
+}
+
+/**
+ * lwmi_psy_prop_is_writeable() - Determine if the property is supported
+ * @ps: The battery that was extended
+ * @ext: The extension
+ * @ext_data: Pointer the lwmi_om_priv drvdata
+ * @prop: The property to check
+ *
+ * Checks capdata 00 to determine if the property is supported.
+ *
+ * Return: Support level, or false
+ */
+static int lwmi_psy_prop_is_writeable(struct power_supply *ps,
+				      const struct power_supply_ext *ext,
+				      void *ext_data,
+				      enum power_supply_property prop)
+{
+	struct lwmi_om_priv *priv = ext_data;
+	struct capdata00 capdata;
+	u32 attribute_id = LWMI_ATTR_ID_PSU(LWMI_FEATURE_ID_PSU_CHARGE_TYPE, LWMI_TYPE_ID_PSU_AC);
+	int ret;
+
+	ret = lwmi_cd00_get_data(priv->cd00_list, attribute_id, &capdata);
+	if (ret)
+		return false;
+
+	dev_dbg(&priv->wdev->dev, "Battery charge mode (%#08x) support level: %x\n",
+		attribute_id, capdata.supported);
+
+	return capdata.supported;
+}
+
+static const enum power_supply_property lwmi_psy_ext_props[] = {
+	POWER_SUPPLY_PROP_CHARGE_TYPES,
+};
+
+static const struct power_supply_ext lwmi_psy_ext = {
+	.name			= LWMI_OM_SYSFS_NAME,
+	.properties		= lwmi_psy_ext_props,
+	.num_properties		= ARRAY_SIZE(lwmi_psy_ext_props),
+	.charge_types		= (BIT(POWER_SUPPLY_CHARGE_TYPE_STANDARD) |
+				   BIT(POWER_SUPPLY_CHARGE_TYPE_LONGLIFE)),
+	.get_property		= lwmi_psy_ext_get_prop,
+	.set_property		= lwmi_psy_ext_set_prop,
+	.property_is_writeable	= lwmi_psy_prop_is_writeable,
+};
+
+/**
+ * lwmi_add_battery() - Connect the power_supply_ext
+ * @battery: The battery to extend
+ * @hook: The driver hook used to extend the battery
+ *
+ * Return: 0 on success, or an error.
+ */
+static int lwmi_add_battery(struct power_supply *battery, struct acpi_battery_hook *hook)
+{
+	struct lwmi_om_priv *priv = container_of(hook, struct lwmi_om_priv, battery_hook);
+
+	return power_supply_register_extension(battery, &lwmi_psy_ext, &priv->wdev->dev, priv);
+}
+
+/**
+ * lwmi_remove_battery() - Disconnect the power_supply_ext
+ * @battery: The battery that was extended
+ * @hook: The driver hook used to extend the battery
+ *
+ * Return: 0 on success, or an error.
+ */
+static int lwmi_remove_battery(struct power_supply *battery, struct acpi_battery_hook *hook)
+{
+	power_supply_unregister_extension(battery, &lwmi_psy_ext);
+	return 0;
+}
+
+/**
+ * lwmi_acpi_match() - Attempts to return the ideapad acpi handle
+ * @handle: The ACPI handle that manages battery charging
+ * @lvl: Unused
+ * @context: Void pointer to the acpi_handle object to return
+ * @retval: Unused
+ *
+ * Checks if the ideapad_laptop driver is going to manage charge_type first,
+ * then if not, hooks the battery to our WMI methods.
+ *
+ * Return: AE_CTRL_TERMINATE if found, AE_OK if not found.
+ */
+static acpi_status lwmi_acpi_match(acpi_handle handle, u32 lvl,
+				   void *context, void **retval)
+{
+	acpi_handle *ahand = context;
+
+	if (!handle)
+		return AE_OK;
+
+	*ahand = handle;
+
+	return AE_CTRL_TERMINATE;
+}
+
+static bool force_load_psy_ext;
+module_param(force_load_psy_ext, bool, 0444);
+MODULE_PARM_DESC(force_load_psy_ext,
+	"This option will skip checking if the ideapad_laptop driver will conflict "
+	"with adding an extension to set the battery charge type. It is recommended "
+	"to blacklist the ideapad driver before using this option.");
+
+/**
+ * lwmi_om_ps_ext_init() - Hooks power supply extension to device battery
+ * @priv: Driver private data
+ *
+ * Checks if the ideapad_laptop driver is going to manage charge_type first,
+ * then if not, hooks the battery to our WMI methods.
+ */
+static void lwmi_om_ps_ext_init(struct lwmi_om_priv *priv)
+{
+	static const char * const ideapad_hid = "VPC2004";
+	acpi_handle handle = NULL;
+	int ret;
+
+	/* Deconflict ideapad_laptop driver */
+	ret = acpi_get_devices(ideapad_hid, lwmi_acpi_match, &handle, NULL);
+	if (ret)
+		return;
+
+	if (handle && !force_load_psy_ext) {
+		if (acpi_has_method(handle, "GBMD") && acpi_has_method(handle, "SBMC")) {
+			dev_dbg(&priv->wdev->dev, "ideapad_laptop driver manages battery for device.\n");
+			return;
+		}
+	}
+
+	/* Add battery hooks */
+	priv->battery_hook.add_battery = lwmi_add_battery;
+	priv->battery_hook.remove_battery = lwmi_remove_battery;
+	priv->battery_hook.name = "Lenovo WMI Other Battery Extension";
+
+	ret = devm_battery_hook_register(&priv->wdev->dev, &priv->battery_hook);
+	if (ret)
+		dev_err(&priv->wdev->dev, "Error during battery hook: %i\n", ret);
+}
+
 /* ======== fw_attributes (component: lenovo-wmi-capdata 01) ======== */
 
 struct tunable_attr_01 {
@@ -1334,6 +1565,7 @@ static int lwmi_om_master_bind(struct device *dev)
 		return -ENODEV;
 
 	lwmi_om_fan_info_collect_cd00(priv);
+	lwmi_om_ps_ext_init(priv);
 
 	return lwmi_om_fw_attr_add(priv);
 }
-- 
2.53.0

