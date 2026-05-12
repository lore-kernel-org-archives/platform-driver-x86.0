Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C59B36F8ED
	for <platform-driver-x86@vger.kernel.org>; Tue, 12 May 2026 23:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778630297; cv=none; b=GIEuZiISsDoo3OXv4wveZ7k8fSzjJ1qMcE6fnxbaw43jEG65ds5+JuzaUlDATOkQKzy0yOmvVdwDsiJYwS37ahwBgOljle/YgPfaFyJqyQpPYwYWt+0ECR3qaZtb9rtXsgSPbt++ES0odoi4evgxEFQtu/7p9zjVuhOzvvIGul0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778630297; c=relaxed/simple;
	bh=tnKIwSRG42ieczG3wNX94sfJRu+OY5++SwjknjD2D4E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A0c37+dFwXA+2Gki/ndN6EmoIYIIMo84l/QnvA9u7ntitud3I6MNvOIKreb1r1ZQTpEbBZeRyUzjqR/UO9Vz+N7MqdWuxFD/QVALVnUqyYmOEESOB73DdvE0xrL29Id/8pa/1P4Bb8yZudRfYJD5MVsXl89nr1srcG16Xi0tBRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TTnZx8xH; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TTnZx8xH"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2f0ad52830cso9028480eec.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 12 May 2026 16:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778630294; x=1779235094; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zqSHX2AgOYIsr1JiV0saj2NCpwr5noJFsDyG+tZ9cOI=;
        b=TTnZx8xHFxM8o5sSXadNkR8r7wbCehcJcmAYfRMrraE3EQ7YoU7QqGTZ0DberEgLId
         ugBDjM6kF/Fh4NEOXrwVkBsBgv4dJ2jb1FVyK7vuHLm42q1mnweO0X32Bay/iEGwc1aq
         p1KXrwsi+7JIOHr7seo+EaOxgWZQHYc0PdZH2o1PIpzpaaU1KFm/wzXK4V28EoAIZT8U
         dIdgRbMICxhWSuzFTwPH78X3vwSmkUvoujKhyUVHMReiqnHeGGK9sQO5ycc/l7LPjbJh
         RTXTIYWlUpvkElBg1ZzI+jUpx1/K7hplpwiXj/Q/h7ewlvL9mxslSaSRPfD8xUDbFUfw
         wNHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778630294; x=1779235094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zqSHX2AgOYIsr1JiV0saj2NCpwr5noJFsDyG+tZ9cOI=;
        b=R0eN5i+p04B7HIG8q49R+nELMPQed9eS6cJqrclRqANuwWhVXRCyWZ2MJHTLEwgGe+
         driqKPkRl+2seaM6Ojn5706J3LMWaIYcXpKPNe/znNXoDSzqW+xoM+uKM0sqyqTGo9QY
         X+hm1piaKvw684USZxUdDVcZBYej+7IZREkqzZmc94EzK1r2wLKwKmY4ctayTCTkDYSo
         liyLtrzDXUOfNYJYN8B2kO969u3CxS/q5U+trxrDs2gtaETiB4UqHHCMiheEZhF4kQzt
         B0u+NXaWTVuGTc7iHjrIfFeyabtcc2V3n6u7tJs3rydHigOOMRtTGcdSv8+tIxdaicYP
         5RxA==
X-Forwarded-Encrypted: i=1; AFNElJ91WjpvWPJpA7SYl8sDULaVZ7tTIVLVMn6DrlgqUm9iisWcGxaDyC4/Z98yLUcd+cUANnrNI2GraOvjZiqxmX0V1Xpi@vger.kernel.org
X-Gm-Message-State: AOJu0YzBqMewLODFLcMaphZb6x694zpcRO0/XI0Jpq03nJ1+2ZPqkliA
	qheFRCpTDV/e47I+Gpqj8FlvpVFsyMrwsDhTj7avt4tXTrg54usQiTmb
X-Gm-Gg: Acq92OE0UYMPN4yw4KOTiQ5t97TTl6C8mFB5e8d7wrUrEOIYCDW8e9/E3+8Kdo6NnYw
	E5Dvjdogmf2KT4Rstx2w1K18A0vEUyb5ZZT/VdZgM+9iO8udocVAl+zzh20qn6up/UzAIUuvvm4
	dXHyv3HDXhabtkN6FiFJBi8zF3MVN0oSNJU/usVxphZZEZvAke1hzc0hZUsOieUxCxVp5Pb4pdr
	TkW1u6FYbPGoJJQcy6L9O8WhJXNdqJ3Feoq2asSepJR85pIYT0r0dgT+WIDhpPpV7Dreq6zQOrJ
	Bp5XadjcPWOE9f8IzPFxs8WIWeMax+uL/PFCtRNyMrP6NjB8eYT+fHBTaVkgorwaGZ5UVzajpda
	NabWkJKqbe8eK8CI7hJyljSic1pXOex1wMuFv5YBytMh/ER8D4Na3/tvDKbQAQZq+A/g18QgzlP
	1fYTHz3ZLoRC1RyYTbf1SJZKGOw1v3Xi8jUxynHwdHGEmQy69TeD9LVRFEc260JVZmFU3RjOh6q
	wL9
X-Received: by 2002:a05:7300:b54d:b0:2da:44ac:6d17 with SMTP id 5a478bee46e88-3011996d2c2mr603980eec.17.1778630294167;
        Tue, 12 May 2026 16:58:14 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f888e3e285sm23625851eec.27.2026.05.12.16.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 16:58:13 -0700 (PDT)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>,
	Armin Wolf <W_Armin@gmx.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Rong Zhang <i@rong.moe>,
	Kurt Borja <kuurtb@gmail.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	"Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	marshall@shzj.cc,
	hyacinth@shzj.cc,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v13 4/7] platform/x86: lenovo-wmi-other: Add WMI battery charge limiting
Date: Tue, 12 May 2026 23:58:05 +0000
Message-ID: <20260512235808.691046-5-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260512235808.691046-1-derekjohn.clark@gmail.com>
References: <20260512235808.691046-1-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add charge_behaviour and charge_types attributes through a power supply
extension for devices that support WMI based charge enable & disable.

Lenovo Legion devices that implement WMI function and capdata ID
0x03010001 in their BIOS are able to enable or disable charging at 80%
through the lenovo-wmi-other interface. Add a charge_types attribute for
BATX devices to expose this capability with Standard and Long_Life types
enabled.

Additionally, devices that support WMI function and capdata ID 0x03020000
are able to force discharge of the battery. Expose this capability with
a charge_behaviour attribute in the power supply extension, with the auto
and force-discharge behaviors enabled. The GET method for this attribute
is bugged. After analyzing the DSDT, and some testing, it appears the
method grabs bit(3) instead of bit(4) from the EC register that stores the
current status, and will only report if charging has been inhibited or
not. To work around this, store and report the last setting written to the
attribute.

As some devices only expose one attribute or the other, a bitmask is
added with a lookup table and some helper macros to select the correct
configuration for the hardware at runtime.

The ideapad_laptop driver provides the charge_types attribute to provide
similar functionality. When the WMI method is set this can corrupt the
ACPI method return and cause hardware and driver errors. To avoid
conflicts between the drivers, we get the acpi_handle and do the same
check that ideapad_laptop does when it enables the feature. If the
feature is supported in ideapad_laptop, abort adding the extension from
lenovo-wmi-other. The ACPI method is more reliable when both are
present from my testing, so we can prefer that implementation and do
not need to worry about de-conflicting from inside that driver.

Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
v13:
  - Switch back to charge_types instead of charge_control_end_threshold.
  - Add helper function to reduce duplicated code when checking support
    level for a given attribute.
  - Remove setting priv->bh_registered to false during psy init.
v12:
  - Move force_load_psy_ext into its own patch after this.
  - Use correct type casting for args in new functions.
  - Remove extra parenthesis.
v11:
  - Refactor to use charge_behaviour and charge_control_end_threshold,
    per the class documentation. The ideapad_laptop driver will be fixed
    in a separate patch series.
  - Due to the extensive refactoring, I have removed the reviewed-by
    tags from Rong and Mark to allow them to recertify the code in its
    current state.
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
 drivers/platform/x86/lenovo/wmi-other.c   | 391 ++++++++++++++++++++++
 3 files changed, 393 insertions(+)

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
index a7cfdeaa58f7..a49229cec245 100644
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
index beb92c7cff25..a423bd563291 100644
--- a/drivers/platform/x86/lenovo/wmi-other.c
+++ b/drivers/platform/x86/lenovo/wmi-other.c
@@ -41,9 +41,12 @@
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
@@ -75,9 +78,15 @@ enum lwmi_feature_id_gpu {
 	LWMI_FEATURE_ID_GPU_NV_CPU_BOOST =	0x0b,
 };
 
+enum lwmi_feature_id_psu {
+	LWMI_FEATURE_ID_PSU_CHARGE_TYPES =	0x01,
+	LWMI_FEATURE_ID_PSU_CHARGE_BEHAVIOUR =	0x02,
+};
+
 #define LWMI_FEATURE_ID_FAN_RPM 0x03
 
 #define LWMI_TYPE_ID_CROSSLOAD	0x01
+#define LWMI_TYPE_ID_PSU_AC	0x01
 
 #define LWMI_FEATURE_VALUE_GET 17
 #define LWMI_FEATURE_VALUE_SET 18
@@ -88,10 +97,19 @@ enum lwmi_feature_id_gpu {
 
 #define LWMI_FAN_DIV 100
 
+#define LWMI_CHARGE_BEHAVIOR_DISCHARGE	0x00
+#define LWMI_CHARGE_BEHAVIOR_AUTO	0x01
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
 
@@ -131,6 +149,11 @@ struct lwmi_om_priv {
 		bool capdata00_collected : 1;
 		bool capdata_fan_collected : 1;
 	} fan_flags;
+
+	enum power_supply_charge_behaviour charge_behaviour;
+	const struct power_supply_ext *battery_ext;
+	struct acpi_battery_hook battery_hook;
+	bool bh_registered;
 };
 
 /*
@@ -557,6 +580,371 @@ static void lwmi_om_fan_info_collect_cd_fan(struct device *dev, struct cd_list *
 	lwmi_om_hwmon_add(priv);
 }
 
+/* ======== Power Supply Extension (component: lenovo-wmi-capdata 00) ======== */
+
+/**
+ * lwmi_psy_ext_get_prop() - Get a power_supply_ext property
+ * @ps: The battery that was extended
+ * @ext: The extension
+ * @ext_data: Pointer to the lwmi_om_priv drvdata
+ * @prop: The property to read
+ * @val: The value to return
+ *
+ * Reads the given value from the power_supply_ext property
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
+	struct wmi_method_args_32 args = {};
+	u32 retval;
+	int ret;
+
+	switch (prop) {
+	case POWER_SUPPLY_PROP_CHARGE_BEHAVIOUR:
+		/* Reading from BIOS reads the wrong bit. Use cached value */
+		val->intval = priv->charge_behaviour;
+		return 0;
+	case POWER_SUPPLY_PROP_CHARGE_TYPES:
+		args.arg0 = LWMI_ATTR_ID_PSU(LWMI_FEATURE_ID_PSU_CHARGE_TYPES,
+					     LWMI_TYPE_ID_PSU_AC);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	ret = lwmi_dev_evaluate_int(priv->wdev, 0x0, LWMI_FEATURE_VALUE_GET,
+				    (u8 *)&args, sizeof(args),
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
+		dev_err(&priv->wdev->dev, "Got invalid charge limit value: %#x\n", retval);
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
+ * @ext_data: Pointer to the lwmi_om_priv drvdata
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
+	struct wmi_method_args_32 args = {};
+
+	switch (prop) {
+	case POWER_SUPPLY_PROP_CHARGE_BEHAVIOUR:
+		args.arg0 = LWMI_ATTR_ID_PSU(LWMI_FEATURE_ID_PSU_CHARGE_BEHAVIOUR,
+					     LWMI_TYPE_ID_NONE);
+		switch (val->intval) {
+		case POWER_SUPPLY_CHARGE_BEHAVIOUR_AUTO:
+			args.arg1 = LWMI_CHARGE_BEHAVIOR_AUTO;
+			break;
+		case POWER_SUPPLY_CHARGE_BEHAVIOUR_FORCE_DISCHARGE:
+			args.arg1 = LWMI_CHARGE_BEHAVIOR_DISCHARGE;
+			break;
+		default:
+			dev_err(&priv->wdev->dev, "Got invalid charge behavior value: %#x\n",
+				val->intval);
+			return -EINVAL;
+		}
+		priv->charge_behaviour = val->intval;
+		break;
+	case POWER_SUPPLY_PROP_CHARGE_TYPES:
+		args.arg0 = LWMI_ATTR_ID_PSU(LWMI_FEATURE_ID_PSU_CHARGE_TYPES,
+					     LWMI_TYPE_ID_PSU_AC);
+		switch (val->intval) {
+		case POWER_SUPPLY_CHARGE_TYPE_LONGLIFE:
+			args.arg1 = LWMI_CHARGE_TYPE_LONGLIFE;
+			break;
+		case POWER_SUPPLY_CHARGE_TYPE_STANDARD:
+			args.arg1 = LWMI_CHARGE_TYPE_STANDARD;
+			break;
+		default:
+			dev_err(&priv->wdev->dev, "Got invalid charge limit value: %#x\n",
+				val->intval);
+			return -EINVAL;
+		}
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	dev_dbg(&priv->wdev->dev, "Attempting to set %#010x for property %#x to %#x\n",
+		args.arg0, prop, args.arg1);
+
+	return lwmi_dev_evaluate_int(priv->wdev, 0x0, LWMI_FEATURE_VALUE_SET,
+				     (u8 *)&args, sizeof(args), NULL);
+}
+
+/** lwmi_psy_prop_get_supported() - Gets the support level from capdata for a given property
+ * @priv: Pointer to the lwmi_om_priv drvdata
+ * @prop: The power supply property to be evaluated
+ *
+ * Return: capability data support level, or an error
+ */
+static int lwmi_psy_prop_get_supported(struct lwmi_om_priv *priv, enum power_supply_property prop)
+{
+	struct capdata00 capdata;
+	u32 attribute_id;
+	int ret;
+
+	switch (prop) {
+	case POWER_SUPPLY_PROP_CHARGE_BEHAVIOUR:
+		attribute_id = LWMI_ATTR_ID_PSU(LWMI_FEATURE_ID_PSU_CHARGE_BEHAVIOUR,
+						LWMI_TYPE_ID_NONE);
+		break;
+	case POWER_SUPPLY_PROP_CHARGE_TYPES:
+		attribute_id = LWMI_ATTR_ID_PSU(LWMI_FEATURE_ID_PSU_CHARGE_TYPES,
+						LWMI_TYPE_ID_PSU_AC);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	ret = lwmi_cd00_get_data(priv->cd00_list, attribute_id, &capdata);
+	if (ret)
+		return ret;
+
+	dev_dbg(&priv->wdev->dev, "Battery charge feature (%#010x) support level: %#x\n",
+		attribute_id, capdata.supported);
+
+	return capdata.supported;
+}
+
+/**
+ * lwmi_psy_prop_is_supported() - Determine if the property is supported
+ * @priv: Pointer to the lwmi_om_priv drvdata
+ * @prop: The power supply property to be evaluated
+ *
+ * Checks capdata 00 to determine if the property is supported.
+ *
+ * Return: true if readable, or false
+ */
+static bool lwmi_psy_prop_is_supported(struct lwmi_om_priv *priv, enum power_supply_property prop)
+{
+	int ret;
+
+	ret = lwmi_psy_prop_get_supported(priv, prop);
+	if (ret < 0)
+		return false;
+
+	return (ret & LWMI_SUPP_VALID) && (ret & LWMI_SUPP_GET);
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
+	struct lwmi_om_priv *priv = ext_data;
+	int ret;
+
+	ret = lwmi_psy_prop_get_supported(priv, prop);
+	if (ret < 0)
+		return false;
+
+	return !!(ret & LWMI_SUPP_SET);
+}
+
+#define DEFINE_LWMI_POWER_SUPPLY_EXTENSION(_name, _props, _behaviours, _types)	\
+	static const struct power_supply_ext _name = {				\
+		.name			= LWMI_OM_SYSFS_NAME,			\
+		.properties		= _props,				\
+		.num_properties		= ARRAY_SIZE(_props),			\
+		.charge_behaviours	= _behaviours,				\
+		.charge_types		= _types,				\
+		.get_property		= lwmi_psy_ext_get_prop,		\
+		.set_property		= lwmi_psy_ext_set_prop,		\
+		.property_is_writeable	= lwmi_psy_prop_is_writeable,		\
+	}
+
+static const enum power_supply_property lwmi_psy_ext_props_all[] = {
+	POWER_SUPPLY_PROP_CHARGE_BEHAVIOUR,
+	POWER_SUPPLY_PROP_CHARGE_TYPES,
+};
+
+static const enum power_supply_property lwmi_psy_ext_props_types[] = {
+	POWER_SUPPLY_PROP_CHARGE_TYPES,
+};
+
+static const enum power_supply_property lwmi_psy_ext_props_behaviour[] = {
+	POWER_SUPPLY_PROP_CHARGE_BEHAVIOUR,
+};
+
+#define LWMI_CHARGE_BEHAVIOURS (BIT(POWER_SUPPLY_CHARGE_BEHAVIOUR_AUTO) | \
+				BIT(POWER_SUPPLY_CHARGE_BEHAVIOUR_FORCE_DISCHARGE))
+
+#define LWMI_CHARGE_TYPES (BIT(POWER_SUPPLY_CHARGE_TYPE_STANDARD) | \
+			   BIT(POWER_SUPPLY_CHARGE_TYPE_LONGLIFE))
+
+DEFINE_LWMI_POWER_SUPPLY_EXTENSION(lwmi_psy_ext_all, lwmi_psy_ext_props_all,
+				   LWMI_CHARGE_BEHAVIOURS, LWMI_CHARGE_TYPES);
+DEFINE_LWMI_POWER_SUPPLY_EXTENSION(lwmi_psy_ext_types, lwmi_psy_ext_props_types,
+				   0, LWMI_CHARGE_TYPES);
+DEFINE_LWMI_POWER_SUPPLY_EXTENSION(lwmi_psy_ext_behaviour, lwmi_psy_ext_props_behaviour,
+				   LWMI_CHARGE_BEHAVIOURS, 0);
+
+#define LWMI_PSY_PROP_BEHAVIOUR BIT(0)
+#define LWMI_PSY_PROP_TYPES BIT(1)
+
+static const struct power_supply_ext *lwmi_psy_exts[] = {
+	[LWMI_PSY_PROP_BEHAVIOUR] =				&lwmi_psy_ext_behaviour,
+	[LWMI_PSY_PROP_TYPES] =					&lwmi_psy_ext_types,
+	[LWMI_PSY_PROP_BEHAVIOUR | LWMI_PSY_PROP_TYPES] =	&lwmi_psy_ext_all,
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
+	return power_supply_register_extension(battery, priv->battery_ext, &priv->wdev->dev, priv);
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
+	struct lwmi_om_priv *priv = container_of(hook, struct lwmi_om_priv, battery_hook);
+
+	power_supply_unregister_extension(battery, priv->battery_ext);
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
+/**
+ * lwmi_om_psy_ext_init() - Hooks power supply extension to device battery
+ * @priv: Pointer to the lwmi_om_priv drvdata.
+ *
+ * Checks if the ideapad_laptop driver is going to manage charge attributes first,
+ * then if not, hooks the battery to our WMI methods if they are supported.
+ */
+static void lwmi_om_psy_ext_init(struct lwmi_om_priv *priv)
+{
+	static const char * const ideapad_hid = "VPC2004";
+	acpi_handle handle = NULL;
+	unsigned int props = 0;
+	int ret;
+
+	if (lwmi_psy_prop_is_supported(priv, POWER_SUPPLY_PROP_CHARGE_BEHAVIOUR))
+		props |= LWMI_PSY_PROP_BEHAVIOUR;
+	if (lwmi_psy_prop_is_supported(priv, POWER_SUPPLY_PROP_CHARGE_TYPES))
+		props |= LWMI_PSY_PROP_TYPES;
+	if (!props)
+		return;
+
+	/* Deconflict ideapad_laptop driver */
+	ret = acpi_get_devices(ideapad_hid, lwmi_acpi_match, &handle, NULL);
+	if (ret)
+		return;
+
+	if (handle && acpi_has_method(handle, "GBMD") && acpi_has_method(handle, "SBMC")) {
+		dev_dbg(&priv->wdev->dev, "ideapad_laptop driver manages battery for device\n");
+		return;
+	}
+
+	/* Add battery hooks */
+	priv->battery_ext = lwmi_psy_exts[props];
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
@@ -1243,6 +1631,7 @@ static int lwmi_om_master_bind(struct device *dev)
 	}
 
 	lwmi_om_fan_info_collect_cd00(priv);
+	lwmi_om_psy_ext_init(priv);
 
 	lwmi_om_fw_attr_add(priv);
 
@@ -1265,6 +1654,8 @@ static void lwmi_om_master_unbind(struct device *dev)
 
 	lwmi_om_hwmon_remove(priv);
 
+	lwmi_om_psy_remove(priv);
+
 	component_unbind_all(dev, NULL);
 }
 
-- 
2.53.0

