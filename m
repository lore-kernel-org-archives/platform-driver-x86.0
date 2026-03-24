Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD1F3C7DF4
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Mar 2026 22:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774390244; cv=none; b=ODSq53n49ok2Yo2/wG2wFcJS0HtuP2AVgc8lJmA2wzW1+msLkF0Y05k14E0JS2u2sUX9ZqFupeZlLsjZtOj52HgohyygrNRbGkuTLV425TaZP2oyo0JWCDTNpVRnzG2zhANpV0QUzzouSdxHsropuiIeSkQeqI70sbvd4e4jkkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774390244; c=relaxed/simple;
	bh=++q/TIbFFULKGy6KkUZYgcdJioWrXHdR5t3T1e5fAao=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HoOu9jD57vvi79GKyLPS/81ScXUF1QBWUBHP6ihCm5+niGQ932xwX+RgOYQdCis8v854PyAHeVQ2bahkRX0GsmLn2W/qRxGwPFdB0zy/T2qMRTzPRE1a0sYZjb9lGDYe5GJZOepdCjdXguIEcmkAWMzbyvqd4mcEwJh6yU+SX7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=knWSWGoh; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="knWSWGoh"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2ba895adfeaso2049279eec.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 24 Mar 2026 15:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774390241; x=1774995041; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2gMM/Qe6t0JjJ7msgQKHqXE41UfA697h2w/oTgTV6Dw=;
        b=knWSWGoh65RegKv5wNW1RZEo2oZEpp8QWwccoYZPPqE+WOHo9az8dxWxEW41DP4UAa
         FhcIdj4I3pydtrW3G/hIgf9SpQdXRHciHoSRs/NWK7S9aXCqpdyiIV5HdZ3wFNQisnbZ
         rgvQvT3vS/f7ByOSURFhVdoALYuIsaD08p4+Uc1qquZ1GYS7v0bEtrUM70oW+rGvbveM
         hwmkndEZxy/iCQvlcT6NjJjJ4bEcrF7mJe5uwD1Whqyl6RTYGRrcLuUQPkds1xwUxZue
         LBg8yw7Nq4Vt9olsLA2HJ5lNNSopk5a+qud8sTXFrAnz9ETSuJsaj4CY2vtlGWRhyHcD
         iowA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774390241; x=1774995041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2gMM/Qe6t0JjJ7msgQKHqXE41UfA697h2w/oTgTV6Dw=;
        b=m0KtHq8qX1XyC2N8w1ipcpQyx4s2zOLVJ+4S/mIO0B7G/znrF8Bt2SljP3jQqJvITO
         5OkpobyAH6XI/XALOgSfJ+czbujObpJKBWLkVajgFJ5dpfzMG6R/lKlwed7TSV/TvmZS
         B7DO2SLK/cp/ExT/z7zxGUJmR0nmM3r/sVNrn2zQs9J1OnidGLFizkfq2Z6To3IDoijU
         zxp+W4dwVT3cg3nPF47NbvdvrwCQI271YS4rc3P7PDXDrxZ3A7+wLAHutCJG2CNpUh3i
         jhNInY1KSKwBk2+J4ppCJJddhKKDQONxV7HXUs9JLi84hUWBvp+qh4z9CN4DgTcEYQng
         +ywA==
X-Forwarded-Encrypted: i=1; AJvYcCVQAGy0vCTH7WVwRTyzRQDZ4f1+FYfUrHN+VukmQhyEaQ6OHNwy75c5vYV1YV0LYCvIhhyFDbwi4d9HnSRalu7kDeFz@vger.kernel.org
X-Gm-Message-State: AOJu0YxnJ8cHuP1j/YZXTtKyO8OJJFc0ICARGeQ6EIwPbryK1KGQJccW
	sCZqJGfEi7DGPHJpZULMcDaqejevz9YUnLVNR+h550B8X4g+NzhgSNgA
X-Gm-Gg: ATEYQzxfqk43u/khxlEsB4wuNBhD6ArtY7Wb3T56Iyc3AmOIA8lPZhTszZKrxYMYiKi
	MDiKWgfGcluW7qea8CCQyA1+4PKQcsleL8gQRtCYgQTyj/1X3xRzsbBLuLAgN48aCT3xkHf2Q0J
	NJcDD+5S7tkY5hCP/DPJVU2SKeUOnGOESjFoP5yR6MYwr/5OZtGmTrZatj8fQski9Wym9m8yoJB
	8SKqo5Hfb9MB89sH6UinYG8LWCHhRYS48rnq169gJu5i6ZO3w+gzC6Bb/PMNlStmY0o9yXnxPva
	iBg9+1igwP1eYAreJjWLwWdLOYr4zSyHtUJ0rWF9Q4WZJ7oqR4zSlKR1BHpSuaapKJAu8gOHgtw
	LBDoZZuk4U4vVov5cIuIl7oL1ANIsaKCJrBWV/5YG5lUi10qgTSPHqYABBE++jOZ398xvaf3Xhc
	cLE8qDU9rDOnqko/PVEPNSHWaIkPxuWbkjEklRyrEwhVV9akUnFxs4F/w0aU4wTy4QWBNoWX2sr
	zWF
X-Received: by 2002:a05:7301:4088:b0:2c1:5134:54d3 with SMTP id 5a478bee46e88-2c15d433488mr550753eec.22.1774390240958;
        Tue, 24 Mar 2026 15:10:40 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b14c299sm16282832eec.6.2026.03.24.15.10.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 15:10:40 -0700 (PDT)
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
Subject: [PATCH v5 8/8] platform/x86: lenovo-wmi-other: Add WMI battery charge limiting
Date: Tue, 24 Mar 2026 22:10:32 +0000
Message-ID: <20260324221032.1333636-9-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260324221032.1333636-1-derekjohn.clark@gmail.com>
References: <20260324221032.1333636-1-derekjohn.clark@gmail.com>
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
v5:
  - Use switch statement instead of if for battery charge state set/get.
  - use force_load_psy_ext to skip all ACPI interactions.
  - Various formatting fixes.
v4:
  - Remove unused defines.
  - Disambiguate charging defines by renaming them to be more consistent
    with the kernel modes they represent.
  - Add module parameter to ignore ACPI checks.
  - Don't fail if the ACPI handle isn't found, skip the ACPI check
    instead.
---
 drivers/platform/x86/lenovo/Kconfig       |   1 +
 drivers/platform/x86/lenovo/wmi-capdata.h |   1 +
 drivers/platform/x86/lenovo/wmi-other.c   | 250 +++++++++++++++++++++-
 3 files changed, 251 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/lenovo/Kconfig b/drivers/platform/x86/lenovo/Kconfig
index f885127b007f..75a8b144b0da 100644
--- a/drivers/platform/x86/lenovo/Kconfig
+++ b/drivers/platform/x86/lenovo/Kconfig
@@ -263,6 +263,7 @@ config LENOVO_WMI_GAMEZONE
 config LENOVO_WMI_TUNING
 	tristate "Lenovo Other Mode WMI Driver"
 	depends on ACPI_WMI
+	depends on ACPI_BATTERY
 	select HWMON
 	select FW_ATTR_CLASS
 	select LENOVO_WMI_CAPDATA
diff --git a/drivers/platform/x86/lenovo/wmi-capdata.h b/drivers/platform/x86/lenovo/wmi-capdata.h
index b026ee30c828..1939401c6c14 100644
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
index 11c16857ef97..cef51cded7be 100644
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
@@ -79,9 +82,11 @@ enum lwmi_feature_id_gpu {
 	LWMI_FEATURE_ID_GPU_NV_CPU_BOOST =	0x0b,
 };
 
-#define LWMI_FEATURE_ID_FAN_RPM 0x03
+#define LWMI_FEATURE_ID_FAN_RPM		0x03
+#define LWMI_FEATURE_ID_PSU_CHARGE_TYPE	0x01
 
 #define LWMI_TYPE_ID_CROSSLOAD	0x01
+#define LWMI_TYPE_ID_PSU_AC	0x01
 
 #define LWMI_FEATURE_VALUE_GET 17
 #define LWMI_FEATURE_VALUE_SET 18
@@ -92,10 +97,17 @@ enum lwmi_feature_id_gpu {
 
 #define LWMI_FAN_DIV 100
 
+#define LWMI_CHARGE_TYPE_STANDARD	0x00
+#define LWMI_CHARGE_TYPE_LONGLIFE	0x01
+
 #define LWMI_ATTR_ID_FAN_RPM(x)                                   \
 	lwmi_attr_id(LWMI_DEVICE_ID_FAN, LWMI_FEATURE_ID_FAN_RPM, \
 		     LWMI_GZ_THERMAL_MODE_NONE, LWMI_FAN_ID(x))
 
+#define LWMI_ATTR_ID_PSU(feat, type)			\
+	lwmi_attr_id(LWMI_DEVICE_ID_PSU, feat,		\
+		     LWMI_GZ_THERMAL_MODE_NONE, type)
+
 #define LWMI_OM_SYSFS_NAME "lenovo-wmi-other"
 #define LWMI_OM_HWMON_NAME "lenovo_wmi_other"
 
@@ -137,6 +149,8 @@ struct lwmi_om_priv {
 		bool capdata00_collected : 1;
 		bool capdata_fan_collected : 1;
 	} fan_flags;
+
+	struct acpi_battery_hook battery_hook;
 };
 
 /*
@@ -561,6 +575,239 @@ static void lwmi_om_fan_info_collect_cd_fan(struct device *dev, struct cd_list *
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
+	dev_dbg(&priv->wdev->dev, "Got return value %x for property %#x\n", retval, prop);
+
+	switch (retval) {
+	case LWMI_CHARGE_TYPE_LONGLIFE:
+		val->intval = POWER_SUPPLY_CHARGE_TYPE_LONGLIFE;
+		break;
+	case LWMI_CHARGE_TYPE_STANDARD:
+		val->intval = POWER_SUPPLY_CHARGE_TYPE_STANDARD;
+		break;
+	default:
+		dev_err(&priv->wdev->dev, "Got invalid charge value: %#x\n", retval);
+		return -EINVAL;
+	}
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
+	switch (val->intval) {
+	case POWER_SUPPLY_CHARGE_TYPE_LONGLIFE:
+		args.arg1 = LWMI_CHARGE_TYPE_LONGLIFE;
+		break;
+	case POWER_SUPPLY_CHARGE_TYPE_STANDARD:
+		args.arg1 = LWMI_CHARGE_TYPE_STANDARD;
+		break;
+	default:
+		dev_err(&priv->wdev->dev, "Got invalid charge value: %#x\n", val->intval);
+		return -EINVAL;
+	}
+
+	dev_dbg(&priv->wdev->dev, "Attempting to set %#10x for property %#x to %#x\n",
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
+	dev_dbg(&priv->wdev->dev, "Battery charge mode (%#10x) support level: %#x\n",
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
+	if (force_load_psy_ext)
+		goto load_psy_ext;
+
+	ret = acpi_get_devices(ideapad_hid, lwmi_acpi_match, &handle, NULL);
+	if (ret)
+		return;
+
+	if (handle && acpi_has_method(handle, "GBMD") && acpi_has_method(handle, "SBMC")) {
+		dev_dbg(&priv->wdev->dev, "ideapad_laptop driver manages battery for device.\n");
+		return;
+	}
+
+load_psy_ext:
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
@@ -1318,6 +1565,7 @@ static int lwmi_om_master_bind(struct device *dev)
 		return -ENODEV;
 
 	lwmi_om_fan_info_collect_cd00(priv);
+	lwmi_om_ps_ext_init(priv);
 
 	return lwmi_om_fw_attr_add(priv);
 }
-- 
2.53.0

