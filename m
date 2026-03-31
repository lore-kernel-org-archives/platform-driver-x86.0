Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B230F2AE78
	for <platform-driver-x86@vger.kernel.org>; Tue, 31 Mar 2026 18:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774980748; cv=none; b=aAp2EHEk1R3yhuIg0zqWwWqEm3WQ5x+L7JIMyGgLwbO/O+CsTbbsrOlAABZ2xjczrrJfYmNq568vondOmtX8/KK97TC2wdX8/C9dC+ztYdC3JRiaz+mf3AewTyksILgne7avSCmXQkv2B9WkvOiDlShGY2PoQLMFNHtS1eI74Wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774980748; c=relaxed/simple;
	bh=7HycbsaLS/PKgVHoceLIlxdSw8SGNJAi1rpvET61b2Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sGAsnJnTTO2awZKrUGPGIdXqW9yBw4iLxHQJAgGqbHmNXZ+7wRkZ0GqilFR0fuCHwU2YXbB9SW+8C3qwX/qwZQHQKqfA4QoTIP0PL+Ss2FFkF6lTUF9T5BmTF1FcUe05pkqFgEa8Utbhnvk/FSHvrCX4uf9DsspV35Ob+GWl8ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D2VSelFV; arc=none smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D2VSelFV"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-127380532eeso1237653c88.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 31 Mar 2026 11:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774980740; x=1775585540; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xqwVghcaNo2QxS0QZs2piVcCNzPaDilddcB/rgUaEDI=;
        b=D2VSelFVL1ji+w245Yfc0z08tT9qW1LUEyiOhQvfdBkuAiewhlyXLO0YKjMCsCGgPg
         KKHw8X9Arrj6BSTjDVBdecFobXjSw+u8Mgc4vXQ163BURheC3k2wNdkULbLSbp8PLC/6
         xD78pG5oWpjnBXsFH791mkIVat94hvMLGDfT6Tpo2e1aSvwKoW3fHiTvZqY+Y+T2KJbz
         txE8eR0JlJY8eK0N3axm0wrtC3Q8Kibfm9+qK4zDNdEMXaNnc3nPfI56OH/q/CVObBqE
         PymgWD7SUId8uGpIqYPi4diaH2U0wDdXinLHgcF3F4QRJNJhsuLKhr8EXBxx/w37loEg
         V7Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774980740; x=1775585540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xqwVghcaNo2QxS0QZs2piVcCNzPaDilddcB/rgUaEDI=;
        b=S6hWUlelI0GbbFCuvTB3s7nRwwPgUMLfdNnith6M0PG1r2RNVE2fvLBCeROEGKbXH7
         t9UUpJyg1Jh6mPgrr1WSJ64t72SoV8T+Pg10t6I/C32IoQbk8sTQBHouYaUP3U8WGpSd
         5BGHRbsVvqphKQ4S2EEWUrYPJEAJhYNW2e4555vM9GdNikZDAmA1Ki93gQpdSOwMuDZH
         +f2G6//DzV8cJp/Z/GII/HuTdIT4vaZuDDrEti96FydgyhmC6YrmZFJmK7edvkePv4gR
         iVL6GE5dkzzzLbHfxFFW3VqJ/hTC+fegq6siX7KKoBX7gUn+fof7LyxzLnG/ArJP8i7G
         F+lQ==
X-Forwarded-Encrypted: i=1; AJvYcCX51cUUY5SPvh9fog46+r0O659dR5l2epKOqhIcrC5T7s0UfVjtjtgfZLfUGcLk6ffa+VoDE9Ha5xENE7TrapoV/fEO@vger.kernel.org
X-Gm-Message-State: AOJu0YxSu7lNa1N1EDb3xcCNV61Il+PpNoszRf+zk49fleuD2wHezCZj
	mJEoVQORtI/Pge3QpxSb7UMVVgv0qV9zk1LhKmlQHJQIg7YU+X79nlGK
X-Gm-Gg: ATEYQzwVqiZ13r5fCNypcRg3LnrDDRqwkR/Tj5tG/nMEaFKjWJNiryOfYrNurDylxuW
	myADTn0O3mEhL0YlIAN4wvRhd2f7gxIoxm69GzrqOn3LobvTkJiuKk2++00TTPIcUU3lr5zPCG4
	fo/ZW92ITzXcmhnRldn0L1FUnmZ9JjSKy0VhqLxkHZuhvb5TZjePqQFIRuecQjXqMUl0Oyqj4uS
	YDzvvXSZQ/Dndbh4/5cu3RoHzVfv1CqatV/ZR1v2X0sN0uonqabO+rhPgSXMqAskmblYUSr04tI
	juwk902B5vcVjGukToqAg7doFZyXlVt5/bIXnATo2FS7NFuGDwbZ9IhupnSMSlnRcxntOAWLqSe
	Prdjv2oHR/a5iUSpLV08Y/Wea2mYbwCydKTG8zR1DCOYVnQIWiRJJHbCe5sJmGZ40fcQGezN5Rk
	MSXMWzZumiUaK+wPLSScZeeCFaw4T2FX7gWBpM75Ul8RsLNZDneLiyzjp+2gPBwfLMt0+qrdRwT
	qqz
X-Received: by 2002:a05:7022:6290:b0:123:34e8:aec2 with SMTP id a92af1059eb24-12be6420269mr313030c88.1.1774980740121;
        Tue, 31 Mar 2026 11:12:20 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12abbe21787sm10769272c88.11.2026.03.31.11.12.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 11:12:19 -0700 (PDT)
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
Subject: [PATCH v6 10/13] platform/x86: lenovo-wmi-other: Add WMI battery charge limiting
Date: Tue, 31 Mar 2026 18:12:05 +0000
Message-ID: <20260331181208.421552-11-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260331181208.421552-1-derekjohn.clark@gmail.com>
References: <20260331181208.421552-1-derekjohn.clark@gmail.com>
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

Reviewed-by: Rong Zhang <i@rong.moe>
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
v6:
  - Check feature flags to determine if the extension should be loaded
    and if it is writable.
  - Zero initialize wmi_method_args_32.
  - Fix formatting.
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
 drivers/platform/x86/lenovo/wmi-other.c   | 274 +++++++++++++++++++++-
 3 files changed, 275 insertions(+), 1 deletion(-)

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
index 891b12ca1db6..e0a30f2c0c87 100644
--- a/drivers/platform/x86/lenovo/wmi-capdata.h
+++ b/drivers/platform/x86/lenovo/wmi-capdata.h
@@ -21,6 +21,7 @@
 enum lwmi_device_id {
 	LWMI_DEVICE_ID_CPU = 0x01,
 	LWMI_DEVICE_ID_GPU = 0x02,
+	LWMI_DEVICE_ID_PSU = 0x03,
 	LWMI_DEVICE_ID_FAN = 0x04,
 };
 
diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x86/lenovo/wmi-other.c
index 0366acf04ae5..e0633c42972c 100644
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
 #include "wmi-helpers.h"
@@ -78,9 +81,11 @@ enum lwmi_feature_id_gpu {
 	LWMI_FEATURE_ID_GPU_NV_CPU_BOOST =	0x0b,
 };
 
-#define LWMI_FEATURE_ID_FAN_RPM 0x03
+#define LWMI_FEATURE_ID_FAN_RPM		0x03
+#define LWMI_FEATURE_ID_PSU_CHARGE_TYPE	0x01
 
 #define LWMI_TYPE_ID_CROSSLOAD	0x01
+#define LWMI_TYPE_ID_PSU_AC	0x01
 
 #define LWMI_FEATURE_VALUE_GET 17
 #define LWMI_FEATURE_VALUE_SET 18
@@ -91,10 +96,17 @@ enum lwmi_feature_id_gpu {
 
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
 
@@ -136,6 +148,8 @@ struct lwmi_om_priv {
 		bool capdata00_collected : 1;
 		bool capdata_fan_collected : 1;
 	} fan_flags;
+
+	struct acpi_battery_hook battery_hook;
 };
 
 /*
@@ -560,6 +574,263 @@ static void lwmi_om_fan_info_collect_cd_fan(struct device *dev, struct cd_list *
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
+	struct wmi_method_args_32 args = { 0x0, 0x0 };
+	struct lwmi_om_priv *priv = ext_data;
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
+	dev_dbg(&priv->wdev->dev, "Got return value %#x for property %#x\n", retval, prop);
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
+	struct wmi_method_args_32 args = { 0x0, 0x0 };
+	struct lwmi_om_priv *priv = ext_data;
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
+	dev_dbg(&priv->wdev->dev, "Attempting to set %#010x for property %#x to %#x\n",
+		args.arg0, prop, args.arg1);
+
+	return lwmi_dev_evaluate_int(priv->wdev, 0x0, LWMI_FEATURE_VALUE_SET,
+				     (unsigned char *)&args, sizeof(args), NULL);
+}
+
+/**
+ * lwmi_psy_prop_is_supported() - Determine if the property is supported
+ * @priv: Pointer the lwmi_om_priv drvdata
+ *
+ * Checks capdata 00 to determine if the property is supported.
+ *
+ * Return: true if readable, or false
+ */
+static bool lwmi_psy_prop_is_supported(struct lwmi_om_priv *priv)
+{
+	u32 attribute_id = LWMI_ATTR_ID_PSU(LWMI_FEATURE_ID_PSU_CHARGE_TYPE, LWMI_TYPE_ID_PSU_AC);
+	struct capdata00 capdata;
+	int ret;
+
+	ret = lwmi_cd00_get_data(priv->cd00_list, attribute_id, &capdata);
+	if (ret)
+		return false;
+
+	dev_dbg(&priv->wdev->dev, "Battery charge mode (%#010x) support level: %#x\n",
+		attribute_id, capdata.supported);
+
+	return ((capdata.supported & LWMI_SUPP_VALID) && (capdata.supported & LWMI_SUPP_GET));
+}
+
+/**
+ * lwmi_psy_prop_is_writeable() - Determine if the property is writeable
+ * @ps: The battery that was extended
+ * @ext: The extension
+ * @ext_data: Pointer the lwmi_om_priv drvdata
+ * @prop: The property to check
+ *
+ * Checks capdata 00 to determine if the property is writable.
+ *
+ * Return: true if writable, or false
+ */
+static int lwmi_psy_prop_is_writeable(struct power_supply *ps,
+				      const struct power_supply_ext *ext,
+				      void *ext_data,
+				      enum power_supply_property prop)
+{
+	u32 attribute_id = LWMI_ATTR_ID_PSU(LWMI_FEATURE_ID_PSU_CHARGE_TYPE, LWMI_TYPE_ID_PSU_AC);
+	struct lwmi_om_priv *priv = ext_data;
+	struct capdata00 capdata;
+	int ret;
+
+	ret = lwmi_cd00_get_data(priv->cd00_list, attribute_id, &capdata);
+	if (ret)
+		return false;
+
+	return !!(capdata.supported & LWMI_SUPP_SET);
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
+ * lwmi_om_psy_ext_init() - Hooks power supply extension to device battery
+ * @priv: Driver private data
+ *
+ * Checks if the ideapad_laptop driver is going to manage charge_type first,
+ * then if not, hooks the battery to our WMI methods.
+ */
+static void lwmi_om_psy_ext_init(struct lwmi_om_priv *priv)
+{
+	static const char * const ideapad_hid = "VPC2004";
+	acpi_handle handle = NULL;
+	int ret;
+
+	/* Deconflict ideapad_laptop driver */
+	if (force_load_psy_ext)
+		goto load_psy_ext;
+
+	if (!lwmi_psy_prop_is_supported(priv))
+		return;
+
+	ret = acpi_get_devices(ideapad_hid, lwmi_acpi_match, &handle, NULL);
+	if (ret)
+		return;
+
+	if (handle && acpi_has_method(handle, "GBMD") && acpi_has_method(handle, "SBMC")) {
+		dev_dbg(&priv->wdev->dev, "ideapad_laptop driver manages battery for device\n");
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
@@ -1317,6 +1588,7 @@ static int lwmi_om_master_bind(struct device *dev)
 		return -ENODEV;
 
 	lwmi_om_fan_info_collect_cd00(priv);
+	lwmi_om_psy_ext_init(priv);
 
 	return lwmi_om_fw_attr_add(priv);
 }
-- 
2.53.0

