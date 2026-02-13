Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5705931BC84
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Feb 2026 08:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770970379; cv=none; b=XO6ouBUGufWBA203aYwfY75fNBU+DAhHPvw1Yc/QUmBTjOCss/PoL6y7oKW37N107ssTZgjRN7zx5G1AkS0HmEZG1nnB2BrH719bn2n7cFF65jAZkK/o92g2uhHmVtGrd0Lh/cegIEaiNjJiwugDFuV7eGkIL/WpeXoHq8EHPaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770970379; c=relaxed/simple;
	bh=5s9AVwmWrPWvryxVGEWCx5WjMxqO3LeVDb/V+4PkOp4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WtmJG2o+TdtZNQb/JMEQc1LLlqdflshhKohhSvFHqwV3EhwEhrexzKgdWycsYXMWIgJW8KCSDBPC4TThe9ciQVA9YPC2BSIf7cVzz99TY1IxIGyPh09Q8XwnEUlEsDzSMieD6c7aVzYR3zPD8xJ/B4hiN45SfTKuN/xDvEx4eYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kjumX2Vt; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kjumX2Vt"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2b6b0500e06so737085eec.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 13 Feb 2026 00:12:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770970377; x=1771575177; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4uyMXxL/35bZXh+M5rpS1MKPDp4yRVwiZedei3Hpg6o=;
        b=kjumX2VtLVyZJOW8zMClIIRiRgDt657USelkWPbJic8/irSS25EsLFmwp93FTjOeN6
         hGr9umDwnyy+ozUG9P4fTG7Gxf5up8fmR3MqsG+YRTRNVUIhqC4ldS8Ja5sMFc35k7ZM
         s8IG2NQRCsHuGUgdmouTLeVX7ti985w2+8vrZEi6Sj/Nwk+NVWvpnBZZe6x+YyLdeMR9
         w9O9P35KiGT7RBnkbLorh7KIU6uTm++0441/yge2TvQgjmqEumn9hQl5f8ACvP+1cv3k
         ObT25HqlUi15HCuonQwhK/3pFKfkYfAV6RrmoPVqnfUMVTmRTYyQ+qeSzyJOFiX98F+V
         XF1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770970377; x=1771575177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4uyMXxL/35bZXh+M5rpS1MKPDp4yRVwiZedei3Hpg6o=;
        b=Kna1T2kRXfT6dY0yNW2RfM4aVZT2estz5qYt2U2SQJFKq3fC+Tfz2u6cEkXeOT/5ji
         xcvxFWsebTxfrfZ5T2Qs/dx/XrKf3jwgfKYUxvTB+uqhZ4UnxnoTQIkO+0dC+pYkWJsy
         7Yxs0UYnsX4tPP6ecgRL5MvceNkWipO5rvO0dHW6j32XPaukEvV7n/8qEJ0xRWafWGp5
         y2LSVPVuVn3tWdl0AY4g/mZXiQq7JAbXX3HEuD+/tzKvGkp+pLawVBTIvrYxiDDnaOE2
         YseTdowewPfRu6FujB8ReMnKfmp2go0z6SXvHX/hsebFTBca1tnEUyYVcPDUEzzc17Kg
         JKag==
X-Forwarded-Encrypted: i=1; AJvYcCV/T9PRSXUM1iTzln5JncaAlA+Z3RGZy6GaEZ06gBGPKwfOYO4YDKNx35Y3p4RKJjoNjf969RxQqXI8jEYjuvKrE+lQ@vger.kernel.org
X-Gm-Message-State: AOJu0YznUyGL7zOBFDp/WNT7iTDFWiyeL5iR8IBSqkr210rLM3IaqzEo
	IoLIbuDZsBaRUcLUckwR77Q+xxkVT6NaRADDjKuudnriNS3bTiaJj0lP
X-Gm-Gg: AZuq6aLTRmD8Z734+tkzZexaHu/Jo0TjjXNXW7qphUZJ0oF4yqpb6/HCcuUC40xTIkV
	JxK3ccja2GkO6g/ILiAH/x/cCOK/tP5bg9QVPXdkOjs/z0DmquYXpPIsz2v8EfyL6/Pi7OvDD1Y
	eNfuMizE9zbzMkAx/F2HDKgYxCJFx77uUvuKmVs1696dZHppfOSy6P5BW9fV/OU+7cmhFIgHkXW
	2CtQQLkBGrDKIG+45EPtsrTbWkJIhTJDEMBqqFKaiR1URxIHFTcMcSDkfkQq0rsSDGQZmKK/SF4
	b5g+STdNzdbc+U4/bbOlfQxtbASHEo0u6L8S8Win3CWmMCzbQIP4qzdvwrGLH5A63IRzzsKRSJh
	1jk2mfY+barWIblKkcaNLZupRH5d1IWFf2EaQ0gMN9ATI4IL8fRFlOLdMS74+YrjFvajvFhdZFo
	HFG7nmEOGxNNPO6EZueUlUT1IrVY32cq+YytBVf4T9f5EKU6NbU8bkg7pJqnaxEnp/J5wew37kh
	Vk=
X-Received: by 2002:a05:7301:1688:b0:2ba:7ed9:1565 with SMTP id 5a478bee46e88-2baba125906mr577903eec.36.1770970377456;
        Fri, 13 Feb 2026 00:12:57 -0800 (PST)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ba9dd0a04csm4975052eec.33.2026.02.13.00.12.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 00:12:56 -0800 (PST)
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
Subject: [PATCH 5/5] platform/x86: lenovo-wmi-other: Add WMI battery charge limiting.
Date: Fri, 13 Feb 2026 08:02:57 +0000
Message-ID: <20260213081243.794288-6-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260213081243.794288-1-derekjohn.clark@gmail.com>
References: <20260213081243.794288-1-derekjohn.clark@gmail.com>
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

The power supply extension requires a name. Instead of adding a third
const macro with the same information, replace LWMI_OM_FW_ATTR_BASE_PATH
and LWMI_OM_HWMON_NAME with LWMI_OM_NAME and use that everywhere.

Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
 drivers/platform/x86/lenovo/wmi-capdata.h |   1 +
 drivers/platform/x86/lenovo/wmi-other.c   | 238 +++++++++++++++++++++-
 2 files changed, 233 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/lenovo/wmi-capdata.h b/drivers/platform/x86/lenovo/wmi-capdata.h
index b7f9ee7b301a5..00471551e7d60 100644
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
index cc024cb369b0f..a1a0638d5ce77 100644
--- a/drivers/platform/x86/lenovo/wmi-other.c
+++ b/drivers/platform/x86/lenovo/wmi-other.c
@@ -26,6 +26,7 @@
  *   - binding to Capability Data 00 and Fan
  */
 
+#include <acpi/battery.h>
 #include <linux/acpi.h>
 #include <linux/bitfield.h>
 #include <linux/cleanup.h>
@@ -42,6 +43,7 @@
 #include <linux/module.h>
 #include <linux/notifier.h>
 #include <linux/platform_profile.h>
+#include <linux/power_supply.h>
 #include <linux/types.h>
 #include <linux/wmi.h>
 
@@ -80,10 +82,17 @@ enum lwmi_feature_id_gpu {
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
@@ -91,15 +100,20 @@ enum lwmi_feature_id_gpu {
 #define LWMI_FAN_ID_BASE 1
 #define LWMI_FAN_NR 4
 #define LWMI_FAN_ID(x) ((x) + LWMI_FAN_ID_BASE)
+#define LWMI_FAN_DIV 100
+
+#define LWMI_CHARGE_MODE_ENABLED	0x00
+#define LWMI_CHARGE_MODE_DISABLED	0x01
 
 #define LWMI_ATTR_ID_FAN_RPM(x)                                   \
 	LWMI_ATTR_ID(LWMI_DEVICE_ID_FAN, LWMI_FEATURE_ID_FAN_RPM, \
 		     LWMI_GZ_THERMAL_MODE_NONE, LWMI_FAN_ID(x))
 
-#define LWMI_FAN_DIV 100
+#define LWMI_ATTR_ID_PSU(feat, type)		\
+	LWMI_ATTR_ID(LWMI_DEVICE_ID_PSU, feat,		\
+		     LWMI_GZ_THERMAL_MODE_NONE, type)
 
-#define LWMI_OM_FW_ATTR_BASE_PATH "lenovo-wmi-other"
-#define LWMI_OM_HWMON_NAME "lenovo_wmi_other"
+#define LWMI_OM_NAME "lenovo-wmi-other"
 
 static BLOCKING_NOTIFIER_HEAD(om_chain_head);
 static DEFINE_IDA(lwmi_om_ida);
@@ -139,6 +153,8 @@ struct lwmi_om_priv {
 		bool capdata00_collected : 1;
 		bool capdata_fan_collected : 1;
 	} fan_flags;
+
+	struct acpi_battery_hook battery_hook;
 };
 
 /*
@@ -454,7 +470,7 @@ static void lwmi_om_hwmon_add(struct lwmi_om_priv *priv)
 	}
 
 	priv->hwmon_dev = hwmon_device_register_with_info(&priv->wdev->dev,
-							  LWMI_OM_HWMON_NAME, priv,
+							  LWMI_OM_NAME, priv,
 							  &lwmi_om_hwmon_chip_info,
 							  NULL);
 	if (IS_ERR(priv->hwmon_dev)) {
@@ -563,6 +579,216 @@ static void lwmi_om_fan_info_collect_cd_fan(struct device *dev, struct cd_list *
 	lwmi_om_hwmon_add(priv);
 }
 
+/* ======== Power Supply Extension (component: lenovo-wmi-capdata 00) ======== */
+
+/**
+ * lwmi_psy_prop_is_writeable() - Get a power_supply_ext property
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
+				 void *data,
+				 enum power_supply_property prop,
+				 union power_supply_propval *val)
+{
+	struct lwmi_om_priv *priv = data;
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
+ * lwmi_psy_prop_is_writeable() - Set a power_supply_ext property
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
+	.name			= LWMI_OM_NAME,
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
+ * @acpi_handle: The ACPI handle that manages battery charging
+ * @lvl: Unused
+ * @context: Void pointer to the acpi_handle object to return
+ * @retval: Unused
+ *
+ * Checks if the ideapad_laptop driver is going to manage charge_type first,
+ * thenm if not, hooks the battery to our WMI methods.
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
+ * thenm if not, hooks the battery to our WMI methods.
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
@@ -1252,8 +1478,7 @@ static int lwmi_om_fw_attr_add(struct lwmi_om_priv *priv)
 
 	priv->fw_attr_dev = device_create(&firmware_attributes_class, NULL,
 					  MKDEV(0, 0), NULL, "%s-%u",
-					  LWMI_OM_FW_ATTR_BASE_PATH,
-					  priv->ida_id);
+					  LWMI_OM_NAME, priv->ida_id);
 	if (IS_ERR(priv->fw_attr_dev)) {
 		err = PTR_ERR(priv->fw_attr_dev);
 		goto err_free_ida;
@@ -1345,6 +1570,7 @@ static int lwmi_om_master_bind(struct device *dev)
 		return -ENODEV;
 
 	lwmi_om_fan_info_collect_cd00(priv);
+	lwmi_om_ps_ext_init(priv);
 
 	return lwmi_om_fw_attr_add(priv);
 }
-- 
2.52.0

