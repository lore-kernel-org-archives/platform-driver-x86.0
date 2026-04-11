Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7403B8950
	for <platform-driver-x86@vger.kernel.org>; Sat, 11 Apr 2026 16:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775924631; cv=none; b=YIMSnHjkHGaxAZK1fNjH7nwkt4R8H70zys8tFx42l1I6SI2fqlfAHPCriIoukoZ181EQ7jjluF8voEy6zWyG8dkGEDDk4KHkwH8XapW6xagBGFdkGzDqg1VdADQrduHgTjahBevePrZhHsfGLmTgnXzMm02U9ME6sboOgsKuunE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775924631; c=relaxed/simple;
	bh=P/6/9yEoYxtpvG64CTOosJ9v+2HaJ2SiEj9kcTaJ88U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ewL9lchBANSk/OLnvUhY3eYSXSTJFMb/bUUqDZDvsEImgURk1xC7+yY3rFEqB+OBCPfeRxnfhOyLPZX0m5aqokM0GaIvZ3X1e00LoBg8oPziFlrhlXnitErH1ksUjxtW19tA6vDnrtfQ12BwSM94bm4TZ/qyNwP1Ycrd5kXeRS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A3KeP99H; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A3KeP99H"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-12c20010f10so7746961c88.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 11 Apr 2026 09:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775924628; x=1776529428; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z3dXAhVxmLyejeeby60t9RRJ6wP27YUUCnrGsXOS1xw=;
        b=A3KeP99HbUAvPnlOidXlE1GOgGPhS7KuRbKUE+I03zXROZKiiOZKH606oSrzKVscs2
         cXbfS4ZvSACVRf1W/fH3nGULqzh2v6BUNHQQt/FLF6l4JCYJdt8xdfuCi9ScLMP3BVxk
         nzWdVOMqUMYHsqa8oUCR12iJyPqBwllR+XqIfJnHpS1YOSWdoo3LoWWgbWvF3ufSMFlO
         wr3GPrWoJuXgKaKg2AHisfIZ2gBz4qCRjZmF/zZLRQuHgKW4FvSOZ+QvD4+WMbFOX/1B
         Uw1d6DZymt7Ir5/2u2dnGkrONtdprMpf4etVvF9F8vawECt6n1noVKLbOVYvGasAEcm4
         qdVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775924628; x=1776529428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=z3dXAhVxmLyejeeby60t9RRJ6wP27YUUCnrGsXOS1xw=;
        b=efJvBd2CBiVyutVKuB/MIRqg35ozGGqvZrXEOzFpL4sFqX1zW/XI5UmorytpD7Zugn
         G4CFjmfPQKev1GqVe/l4YYM3kMHOnLVN6S7s6/mpInN2ZWXWi2QfGIaitHt3kZquGHOI
         kAw8m80PJwWdwBsq+VtcBbbPAJM7rEJh6kQEyWASOq9WBnAF/NiTAzp2urluzUbVcKx4
         /XP6vpVQBfh40U/kNNSQ1TfAxqXe/4EQmwpipmA1Dg1rTaQWxlJAyPnq3DvJGzI4XQf8
         n8xwhx5Zv90k1JyjINYX1/73AVKK7nv71LW/steErQlIT9Qg0IKDTtpP/GgTEVXTdRwX
         6L1A==
X-Forwarded-Encrypted: i=1; AJvYcCUdEd4vvCDLLdBzA3ZvHrbzTMQSM8ZikKAdiYczoJmHPj+WT5VZdcACSENYXzCYUx3pLIB29dSllPYAlQYAAvuzoi+x@vger.kernel.org
X-Gm-Message-State: AOJu0YzZjxWcgQuAGxpzUHcBKG0HVpP0K4P4eTtR8WmA5OGt7eHpuorP
	atpR+1QhUF3/6jjcDZMWZPUJsYlYRIru4LmJDibLYFAfOrQ522rbheEu
X-Gm-Gg: AeBDiev3CTo0nQ+ELAc6zidY0jxOwaOACsb7KrFiCbCrhFQtmsxfLmUljYiwvcKW4Xp
	JhXxBipTRInUit4+4CtNIpqv5hTcsFmeoEqXOjNXQM5Fg3TWRLra/1G729FORaTcdM1dx1O2NyX
	CKw9yvKyS+JEyGxcVjwu3Ey89gz8QU08y2Uzk1Ev5wn3/LM5t2tKsD35fu2XeXma/4bq1a2Jjtg
	6G8vpGWHySodQ6ICF36wWGnmsf3EG4o4Pb/uI7jj0rnGxODwYYUYlEBvZbV4C/mbpCFhJSVLZeV
	fgdJeDl6szk1jXvorIj0po7CdfMWWYOFSFpxsASV43QsIE3+oR+iaLYv37Sim/zpOeA1Kci3oi5
	t5yQkvPTq10t/tnohYSl5QCggGUxVYS1XHKMrrGcJYUz+DuWHU1OnZf/T56brYR4euXxgzBJY44
	aLDKNf7Y5Q/JdKHS8jv2yTG4CNOXHSsf72ODkkCweWd0ZqMhKQk1ZqwKeirvmaW9G9jFSndrVa4
	RHCNj+jNDHBYXk=
X-Received: by 2002:a05:7301:1003:b0:2c5:50fe:c795 with SMTP id 5a478bee46e88-2d58a788298mr4676905eec.29.1775924627426;
        Sat, 11 Apr 2026 09:23:47 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d55ce46a65sm9358907eec.0.2026.04.11.09.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 09:23:47 -0700 (PDT)
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
Subject: [PATCH v9 14/16] platform/x86: lenovo-wmi-other: Add WMI battery charge limiting
Date: Sat, 11 Apr 2026 16:23:32 +0000
Message-ID: <20260411162334.25682-15-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260411162334.25682-1-derekjohn.clark@gmail.com>
References: <20260411162334.25682-1-derekjohn.clark@gmail.com>
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
v7:
  - Use devm_battery_hook_register, manually unregister during unbind.
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
 drivers/platform/x86/lenovo/wmi-other.c   | 293 +++++++++++++++++++++-
 3 files changed, 294 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/lenovo/Kconfig b/drivers/platform/x86/lenovo/Kconfig
index 09b1b055d2e0..b9a5d18caa1e 100644
--- a/drivers/platform/x86/lenovo/Kconfig
+++ b/drivers/platform/x86/lenovo/Kconfig
@@ -262,6 +262,7 @@ config LENOVO_WMI_GAMEZONE
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
index 0bc9122ee4c9..f1170d987cfc 100644
--- a/drivers/platform/x86/lenovo/wmi-other.c
+++ b/drivers/platform/x86/lenovo/wmi-other.c
@@ -40,9 +40,12 @@
 #include <linux/limits.h>
 #include <linux/module.h>
 #include <linux/platform_profile.h>
+#include <linux/power_supply.h>
 #include <linux/types.h>
 #include <linux/wmi.h>
 
+#include <acpi/battery.h>
+
 #include "wmi-capdata.h"
 #include "wmi-events.h"
 #include "wmi-helpers.h"
@@ -74,9 +77,11 @@ enum lwmi_feature_id_gpu {
 	LWMI_FEATURE_ID_GPU_NV_CPU_BOOST =	0x0b,
 };
 
-#define LWMI_FEATURE_ID_FAN_RPM 0x03
+#define LWMI_FEATURE_ID_FAN_RPM		0x03
+#define LWMI_FEATURE_ID_PSU_CHARGE_TYPE	0x01
 
 #define LWMI_TYPE_ID_CROSSLOAD	0x01
+#define LWMI_TYPE_ID_PSU_AC	0x01
 
 #define LWMI_FEATURE_VALUE_GET 17
 #define LWMI_FEATURE_VALUE_SET 18
@@ -87,10 +92,17 @@ enum lwmi_feature_id_gpu {
 
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
 
@@ -130,6 +142,9 @@ struct lwmi_om_priv {
 		bool capdata00_collected : 1;
 		bool capdata_fan_collected : 1;
 	} fan_flags;
+
+	struct acpi_battery_hook battery_hook;
+	bool bh_registered;
 };
 
 /*
@@ -554,6 +569,279 @@ static void lwmi_om_fan_info_collect_cd_fan(struct device *dev, struct cd_list *
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
+	struct wmi_method_args_32 args = {};
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
+	struct wmi_method_args_32 args = {};
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
+	priv->bh_registered = false;
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
+	priv->bh_registered = true;
+
+	battery_hook_register(&priv->battery_hook);
+}
+
+/**
+ * lwmi_om_psy_remove() - Unregister battery hook
+ * @priv: Driver private data
+ *
+ * Unregisters the battery hook if applicable.
+ */
+static void lwmi_om_psy_remove(struct lwmi_om_priv *priv)
+{
+	if (!priv->bh_registered)
+		return;
+
+	battery_hook_unregister(&priv->battery_hook);
+	priv->bh_registered = false;
+}
+
 /* ======== fw_attributes (component: lenovo-wmi-capdata 01) ======== */
 
 struct tunable_attr_01 {
@@ -1228,6 +1516,7 @@ static int lwmi_om_master_bind(struct device *dev)
 	}
 
 	lwmi_om_fan_info_collect_cd00(priv);
+	lwmi_om_psy_ext_init(priv);
 
 	lwmi_om_fw_attr_add(priv);
 
@@ -1250,6 +1539,8 @@ static void lwmi_om_master_unbind(struct device *dev)
 
 	lwmi_om_hwmon_remove(priv);
 
+	lwmi_om_psy_remove(priv);
+
 	component_unbind_all(dev, NULL);
 }
 
-- 
2.53.0

