Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD2D4283FC9
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Feb 2026 04:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771907534; cv=none; b=R0YMjMIbQsNogwvinXyQdqiL87UGM3C0NSLkU9Fidf/+q0N01hS0DBYsE20bgK4P6Rt8ecO8PbNDDiEmdRsWrgNe6ISdbmFKnu36XApIMQuyCPB+9jfwcirJe9bY1jWDV1EokSmD0Ua3Zp0Axo2NDRygANB1PbsqLI800nxf1N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771907534; c=relaxed/simple;
	bh=kessVQ8OOCDF+bsFY6W3zPIUXmUylLTWeH7nV4KNA9Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KuW23nmNfpbNFjRaQbbMLlPbBchSADxU8XapOK5SNfo6hGWx45oRg4wNkeaIQCYZozcleVoEfyTVN/rGq05E7B+coDMc/q7kVHX7KXSL2ohGbFG5TXf5CGNUoL4GK/g5l54thiXFWCacblVGhnNQSjnn9pzIqtZexXhkUarTqs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V4tYjiiX; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V4tYjiiX"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-126ea4e9694so51614c88.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 23 Feb 2026 20:32:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771907531; x=1772512331; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ilbe388Cxt5TpkwJ0RJZDtRFNc1WD3dk5cFWqwGlj9g=;
        b=V4tYjiiXIgillW77OZvVqxaJmARcT1j+Ccm/jdJ3eBITOGIXSl8fWkm0qPC9B5Pjkb
         i62l69WJw5OYE6ijS6I9+4/2zTkAh8PqGHhVSC3z8IhT9z3v2y2zk7oJddq6SEJ0uGaU
         UOVTJlPM/AtMZuPI9qIJm6il2DZGaS2MoaP38HR+Vd1UO5aZIdiMYq8CclEFVlxPaRGg
         MWWkG9nFlPmd9DNFfZ397ppPtd0FzYtBxtXPfBc95zshlC32yx8MNLYjvRCp1vCV+Ss+
         c2k/rO8T8xe1h84htBcu5aJ/TLhqHFX32B9aHakfpUPNG/fKd4MfZJWIWM3JGop25nIQ
         hmqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771907531; x=1772512331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ilbe388Cxt5TpkwJ0RJZDtRFNc1WD3dk5cFWqwGlj9g=;
        b=FpRBKUpMGzBmSg/BKScSgk6lEiWsatlciPL3+L5LV2Z4/PqySZLHhSBp9TWEyvNLbi
         Vo2+S+5vsu+XN7vjuIlbx2I5lXNhsz5plsNWwDPw3pUIiVoZtXeehQMMrI2XL7Ogl2ca
         N85DbgJgwC8uhsyolmP33LUlFkBi8cPSK96PYQfB9x0o93f/OASIn1N1Pq2gmp619w8V
         eYwJufAqpWUyrUNqfjUNRjDYFehPSsBxQnTNPfKbCxzEeOgIHT379HML+3UdIEw27QPS
         a1moOAkYvYhcR63CrsRz93xGyy5ZWPM61R1qoV1F5dA5B2cHpy/xIIvZWqR/lwC4+iA9
         dnsg==
X-Forwarded-Encrypted: i=1; AJvYcCXBbhHV5sxkchuml4A5K16bM7QjiJMyDhMJBXwUJ72ToeZ9GkcwBn9F9cIGcvtaKcEXDJqZja3L/v6Pz9kTjuMYxozH@vger.kernel.org
X-Gm-Message-State: AOJu0YwyW5IXczf3byJKHMP9Wtot7pAql/1F6JWpwNcTBDG6u5NnIOb2
	3A7MSF3XbfdyUCzv9W2uB/PiMpv3do6laezSbKtdJy7vnPEBle0O764S
X-Gm-Gg: AZuq6aLqJCL486WIjjmmHZo6IZhDGyyrEFS+7Zp/iSOi3g28tjKOPL79b3bUiI1QCKf
	6errFLcfZKd5P2lwXAXgYQY2ySYp3ERou1JPdOzlPI3Ueyw2C1p1TcSF5BLQO16UPPsdhJKzhMl
	Oab7f8pz4CXYhNVR6IKheV+NuKUmeupD3PI0CthN3O0jPCMrZJheRP7kDyw1oo1ISDcTJSpCLSC
	qEwGEICYKnoLWU6NqLtMHQccFai96+ZxAd9lT2pCYvGSB/q4OgKUY6+M9/nNOzxRTz352BhJ18c
	CT2Z7aA3FG+DvB3iVR1LtaeQjKp5+/cefggsoxDGiK+8cbHbUIQdfkyDCTmvqVX6AOBzeYJTM6B
	wMAf7jeIGwi+MauGY1gm5Z7E71k4MRmdeqlSFaclciOK95QH3Luxe2EDLeOT66af4NT+KPWsNHM
	EX/soJPOTFgZ8aHfoviiZ4qnquvPODWNYCCc43SCpJUZggQoA9qocm3CQInepe0RVUJ79x4tUl9
	Z0=
X-Received: by 2002:a05:7022:685:b0:127:33e0:ea33 with SMTP id a92af1059eb24-1276ad11e4amr4942976c88.22.1771907530905;
        Mon, 23 Feb 2026 20:32:10 -0800 (PST)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1276af7b4c7sm9607887c88.9.2026.02.23.20.32.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 20:32:10 -0800 (PST)
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
Subject: [PATCH v3 6/6] platform/x86: lenovo-wmi-other: Add WMI battery charge limiting.
Date: Tue, 24 Feb 2026 04:32:00 +0000
Message-ID: <20260224043200.2680384-7-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260224043200.2680384-1-derekjohn.clark@gmail.com>
References: <20260224043200.2680384-1-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add charge-type power supply extension for devices that support WMI based
charge enable/disable. Lenovo Legion devices that implement function ID
and capdata 00 ID 0x03010001 are able to enable or disable charging
through the lenovo-wmi-other interface. The ideapad_laptop driver
conflicts with this if it can also provide the attribute, so we have to
get the acpi_handle and check for the same ACPI methods that enable the
feature in that driver. The ACPI method is more reliable from my testing
when both are present, so there is no need to modify the ideapad_laptop
driver instead.

Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
 drivers/platform/x86/lenovo/wmi-capdata.h |   1 +
 drivers/platform/x86/lenovo/wmi-other.c   | 230 ++++++++++++++++++++++
 2 files changed, 231 insertions(+)

diff --git a/drivers/platform/x86/lenovo/wmi-capdata.h b/drivers/platform/x86/lenovo/wmi-capdata.h
index b7f9ee7b301a..00471551e7d6 100644
--- a/drivers/platform/x86/lenovo/wmi-capdata.h
+++ b/drivers/platform/x86/lenovo/wmi-capdata.h
@@ -26,6 +26,7 @@
 enum lwmi_device_id {
 	LWMI_DEVICE_ID_CPU = 0x01,
 	LWMI_DEVICE_ID_GPU = 0x02,
+	LWMI_DEVICE_ID_PSU = 0x03,
 	LWMI_DEVICE_ID_FAN = 0x04,
 };
 
diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x86/lenovo/wmi-other.c
index 7f0d5a17b44f..b2daff1b45c2 100644
--- a/drivers/platform/x86/lenovo/wmi-other.c
+++ b/drivers/platform/x86/lenovo/wmi-other.c
@@ -42,9 +42,12 @@
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
@@ -78,10 +81,17 @@ enum lwmi_feature_id_gpu {
 	LWMI_FEATURE_ID_GPU_NV_CPU_BOOST = 0x0b,
 };
 
+enum lwmi_feature_id_psu {
+	LWMI_FEATURE_ID_PSU_INSTANT_MODE = 0x01,
+	LWMI_FEATURE_ID_PSU_CHARGE_MODE = 0x02,
+};
+
 #define LWMI_FEATURE_ID_FAN_RPM 0x03
 
 #define LWMI_TYPE_ID_NONE 0x00
 #define LWMI_TYPE_ID_CROSSLOAD 0x01
+#define LWMI_TYPE_ID_PSU_AC 0x01
+#define LWMI_TYPE_ID_PSU_PD 0x02
 
 #define LWMI_FEATURE_VALUE_GET 17
 #define LWMI_FEATURE_VALUE_SET 18
@@ -92,10 +102,17 @@ enum lwmi_feature_id_gpu {
 
 #define LWMI_FAN_DIV 100
 
+#define LWMI_CHARGE_MODE_ENABLED	0x00
+#define LWMI_CHARGE_MODE_DISABLED	0x01
+
 #define LWMI_ATTR_ID_FAN_RPM(x)                                   \
 	LWMI_ATTR_ID(LWMI_DEVICE_ID_FAN, LWMI_FEATURE_ID_FAN_RPM, \
 		     LWMI_GZ_THERMAL_MODE_NONE, LWMI_FAN_ID(x))
 
+#define LWMI_ATTR_ID_PSU(feat, type)		\
+	LWMI_ATTR_ID(LWMI_DEVICE_ID_PSU, feat,		\
+		     LWMI_GZ_THERMAL_MODE_NONE, type)
+
 #define LWMI_OM_SYSFS_NAME "lenovo-wmi-other"
 #define LWMI_OM_HWMON_NAME "lenovo_wmi_other"
 
@@ -137,6 +154,8 @@ struct lwmi_om_priv {
 		bool capdata00_collected : 1;
 		bool capdata_fan_collected : 1;
 	} fan_flags;
+
+	struct acpi_battery_hook battery_hook;
 };
 
 /*
@@ -561,6 +580,216 @@ static void lwmi_om_fan_info_collect_cd_fan(struct device *dev, struct cd_list *
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
+	args.arg0 = LWMI_ATTR_ID_PSU(LWMI_FEATURE_ID_PSU_INSTANT_MODE, LWMI_TYPE_ID_PSU_AC);
+
+	ret = lwmi_dev_evaluate_int(priv->wdev, 0x0, LWMI_FEATURE_VALUE_GET,
+				    (unsigned char *)&args, sizeof(args),
+				    &retval);
+	if (ret)
+		return ret;
+
+	dev_dbg(&priv->wdev->dev, "Got return value %x for property %x\n", retval, prop);
+
+	if (retval == LWMI_CHARGE_MODE_DISABLED)
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
+	args.arg0 = LWMI_ATTR_ID_PSU(LWMI_FEATURE_ID_PSU_INSTANT_MODE, LWMI_TYPE_ID_PSU_AC);
+	if (val->intval == POWER_SUPPLY_CHARGE_TYPE_LONGLIFE)
+		args.arg1 = LWMI_CHARGE_MODE_DISABLED;
+	else
+		args.arg1 = LWMI_CHARGE_MODE_ENABLED;
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
+	u32 attribute_id = LWMI_ATTR_ID_PSU(LWMI_FEATURE_ID_PSU_INSTANT_MODE, LWMI_TYPE_ID_PSU_AC);
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
+	if (!handle)
+		return AE_OK;
+
+	acpi_handle *ahand = context;
+	*ahand = handle;
+
+	return AE_CTRL_TERMINATE;
+}
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
+	if (!handle)
+		return;
+
+	if (acpi_has_method(handle, "GBMD") && acpi_has_method(handle, "SBMC")) {
+		dev_dbg(&priv->wdev->dev, "ideapad_laptop driver manages battery for device.\n");
+		return;
+	}
+
+	/* Add battery hooks */
+	priv->battery_hook.add_battery	= lwmi_add_battery,
+	priv->battery_hook.remove_battery	= lwmi_remove_battery,
+	priv->battery_hook.name		= "Lenovo WMI Other Battery Extension",
+
+	ret = devm_battery_hook_register(&priv->wdev->dev, &priv->battery_hook);
+	if (ret)
+		dev_err(&priv->wdev->dev, "Error during battery hook: %i\n", ret);
+}
+
 /* ======== fw_attributes (component: lenovo-wmi-capdata 01) ======== */
 
 struct tunable_attr_01 {
@@ -1325,6 +1554,7 @@ static int lwmi_om_master_bind(struct device *dev)
 		return -ENODEV;
 
 	lwmi_om_fan_info_collect_cd00(priv);
+	lwmi_om_ps_ext_init(priv);
 
 	return lwmi_om_fw_attr_add(priv);
 }
-- 
2.52.0

