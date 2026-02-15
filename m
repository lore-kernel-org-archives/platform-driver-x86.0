Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F0E261B6D
	for <platform-driver-x86@vger.kernel.org>; Sun, 15 Feb 2026 06:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771136030; cv=none; b=kPhDrbn1vtAbVa4zHaLAarofxbiS5Y2HizV/ttnh5ahjgXYfyRkhB2tVSICkqdxI7wrrI/hSA0ZkPR1aiuY2OTGyw3uzu1HZ6NyOperKFtMjKDI/uUhS56mtA4iD/sRKROmjDG22JvJJMyn1hYEkCba+kB5WEs3SMvh3o4nuVZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771136030; c=relaxed/simple;
	bh=wZ9xabQUkHqtqC3jkEGT+Zqanc8nlXjAOp1zXQUfI4w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GZWHL1SGx4Ow/d0JbwHmpQNdDbbkX386bpm+UMj9RbJ8KHKx60Wa1FwNQVBaZRcaek6kLPhrZgnYLDdy475NZKoOGJ+lB3yHS/VcevLrRV8hgh+vHX5+S7imNw/ZZ1YiLlHjCW4LCDSxNDx/TtTsvHazuyOKq1/ONuTyT+z8Yf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l4HHd1/R; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l4HHd1/R"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2b4520f6b32so2520745eec.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 14 Feb 2026 22:13:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771136027; x=1771740827; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HnG6U+oeOzP9TzbbrF5UKJqUPdR6+ZgY34ulfRGGHcc=;
        b=l4HHd1/RvngzI3/rP/H563Q1EfHk/ffQrSihMuj+BaKNvVcA5JEN3MV8/vSYmLiQL6
         OajvCOd2iUrCjmmfMGFOP9KTPGQy/f9mOTlNF580uBm0bWvrssO7uATClYBUK6XnLJd6
         WGOxOfVaWr4XZbjibFHxWr6VaGQtFbte4DYU7hWiS+faQ7zA86zbBODVrJd6Dk6sKKbc
         AzVxeuM7CFppX9sb7wmFIY0GYmhKMayfUFJHKdhLZnRqziTuCZuAfscM8T755GyoXWcQ
         oWtb42iNOuepFwvXuPNJ0gqXXRfY8AIOBmW+Dlof9dR68fBOaxnQdr5hJvvd2EP1t+g+
         WTjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771136027; x=1771740827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HnG6U+oeOzP9TzbbrF5UKJqUPdR6+ZgY34ulfRGGHcc=;
        b=Wr7e32RFTHeRlmpd3dHv+snajkZZu9ihZbTwdc4rp9o1J/yY+pqLRDJ1OFnu1KB/tn
         MviqNSLc2muRPBGMQrJMg8CPQemjGwKPJPS0FxLp2GqxRyki4flu6gaKC8x1o/3OLZnH
         juJmEeuKgMv4iY3jFXrJU1PFOnmvv2xt2H2O/Ng//kBOzATNwu/0cdL7i3d4ZiWtpiRB
         of34qH4obCFHkdBHbyZZEw1OULVEvI2UCAgTKzUuiwdOZ94P10OKCm4Cwth6mEmF4gy9
         x8WUzpkN5Qw5oDrqGa2CA6pbltJpgn1bbAea4Nnoi8NoI2rN3kqoUymBBiHHNILqZhhj
         ScCw==
X-Forwarded-Encrypted: i=1; AJvYcCWcm+/KpyFfYfybQKD3Ms8+qK4d7wAzThGkFAEAUYcT0m2+XF9Uq995626pS3AHw8qKG4WiQmCgLO5BXLXC1D2SxwPt@vger.kernel.org
X-Gm-Message-State: AOJu0YyUGZXz/lhMucXtacE8bbhcy3EODzc7t910NNxV3/a9bIQ64K16
	OY6Y0Ke+zNd9mdcOJbfAjnhU4/WQjLdS7yzqtyg+afEHfx5XYZ2S6YKh
X-Gm-Gg: AZuq6aL5WLQxEb0jd982rpmVdv1P2B23EMO+hPwGZrbV0AeeQ/TxfPSNbXhI2C3MmIK
	whxFMeE7pjgm0UFo/q16Bli+r/q3MFA93/jF+1QjRgj/+HiLl8qewvTsWaIYoXnOfm0QFLNNk2i
	kEy2zi6Ivjd6fMeV/oB1G7X2xNuSyjfsnF0vf06tJUreRMICkHGlf9I7O/pz4VHNHCtSJXzgOD+
	QgwOYK7480hIUEHnlFufuEWrujJjs8xhXrETEzz+9VVUMkDZJ1kRbVZZWrDeHBG39XZ8SK9E9QF
	y1qHKx8U6LEq3VZc2e5gufiFuUB46MsDlt/Q73qpPYrrT5iqx+iHBurA1jL774pS+fZDo0tcoCc
	r5F7OV4asbynDRExMlA2bfGDjG/DnpkRB99Ly4TFUTv1IoHdEOfYsRFNByh/sLOu8AD8ZVoT16G
	rlIwf9n1KUy+Dhxwf5RxBorlWrARMO0+aO1XWQNwBZ0rDZ1ijX8tcYK8fI96y6K6ELdraRAYIIQ
	v0=
X-Received: by 2002:a05:7300:f082:b0:2ba:70d6:e371 with SMTP id 5a478bee46e88-2babc3d06afmr2844941eec.19.1771136026904;
        Sat, 14 Feb 2026 22:13:46 -0800 (PST)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bacb577bcasm4759245eec.12.2026.02.14.22.13.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Feb 2026 22:13:46 -0800 (PST)
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
Subject: [PATCH v2 6/6] platform/x86: lenovo-wmi-other: Add WMI battery charge limiting.
Date: Sun, 15 Feb 2026 06:12:59 +0000
Message-ID: <20260215061339.2842486-7-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260215061339.2842486-1-derekjohn.clark@gmail.com>
References: <20260215061339.2842486-1-derekjohn.clark@gmail.com>
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

Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
 drivers/platform/x86/lenovo/wmi-capdata.h |   1 +
 drivers/platform/x86/lenovo/wmi-other.c   | 229 ++++++++++++++++++++++
 2 files changed, 230 insertions(+)

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
index 8e52f692f8605..7b6074062a09d 100644
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
@@ -94,10 +103,17 @@ enum lwmi_feature_id_gpu {
 
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
 #define LWMI_OM_NAME "lenovo-wmi-other"
 
 static BLOCKING_NOTIFIER_HEAD(om_chain_head);
@@ -138,6 +154,8 @@ struct lwmi_om_priv {
 		bool capdata00_collected : 1;
 		bool capdata_fan_collected : 1;
 	} fan_flags;
+
+	struct acpi_battery_hook battery_hook;
 };
 
 /*
@@ -562,6 +580,216 @@ static void lwmi_om_fan_info_collect_cd_fan(struct device *dev, struct cd_list *
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
@@ -1344,6 +1572,7 @@ static int lwmi_om_master_bind(struct device *dev)
 		return -ENODEV;
 
 	lwmi_om_fan_info_collect_cd00(priv);
+	lwmi_om_ps_ext_init(priv);
 
 	return lwmi_om_fw_attr_add(priv);
 }
-- 
2.52.0

