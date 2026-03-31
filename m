Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C02E44CF5F
	for <platform-driver-x86@vger.kernel.org>; Tue, 31 Mar 2026 18:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774980742; cv=none; b=d4K5phqGgxqkRLjgkDH4lWEZGgAIfW276dAikKNj5an4gWT4BkzdGAIIapy3QPpLkdc0yL2TYdVsfOeXjs6QekyZX14XjkRUZwcCl47WeQKIiwhmLHLCSnb+uQmYzO+jX/CZBFDkbKKFAW11o8YeBd4fc05PqysPFv210cDoiDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774980742; c=relaxed/simple;
	bh=Fu/ek430KADbRn8h0UGr5ypTmsSr0+phA+E5WxjUeEM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xlq/ZyECxEOJfmq/9BfLBMaDlkPMXScc+F8qK9nYwJV1drahT7X+PuKNhCZjI9isZy9YSSfkuxj9Ksk+fNMqEwF2oW2Zuxf+DOq5scmj1Zusp3SLSIKXnR5Ah614IOzNXN2sqAD2ULHm8de3vFUqn9IYTniNrCifxABJ3/pfml4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iGsar7lW; arc=none smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iGsar7lW"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-12a695044a4so1010506c88.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 31 Mar 2026 11:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774980737; x=1775585537; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hGJIgsgDX1kdBRC+1ZlZdZ0WISHAWEUEuDLIUw0+Dy8=;
        b=iGsar7lWKJ8W75mk/y8qVGFBPz9lujJZjGbwggJdtgGw9n1rFByGQzYPWJbSn0GYdR
         UnnaYABbiN0NabQ4LJ+ZxrcN3upBiIcCp1GBQYK2/ApQ0PO+OoIAQc0YP4ccD0kYifzO
         EFstqoO0LH8SbS1RFmRjeVBCdAp0BAC4E4qaKVgdIHOt3Dcy05Dcmu0TFoO/RodI9iWX
         nC4xa/PeDeIX52Bd8LrhEY24O+hDj6TDMVdESsQweHexOs7Dd6Czkeez6oAOHQq6NDY+
         qeI+ugcReB4toLMATysoJzFMUea8MskHMEw6s+fP/J4KR2wSYs0jOoC5PqPAZMiJ3LV2
         Ic/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774980737; x=1775585537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hGJIgsgDX1kdBRC+1ZlZdZ0WISHAWEUEuDLIUw0+Dy8=;
        b=UD5aph5uGS/uJHOCrdVKzfP0WED/8VQeX9YG7CUfIxDvPzUjJd6z/w8oZxG5DqtcuU
         HFI7Fq3IFk/aYDl567ukDvqEvQ2b9k/fwZDoc+z00rfUMnBUCoxErrB19XRpihMAXohS
         Uv9jzmQ+FdR2aS8mMTriWN2TgWX911ijkBqNFF+i6V/5EdALoBY0E4vr60CBpRzOD6Do
         /rMQLVx3nBTJy5VAT2LRZkduLrh4TnQ2brIAWgqgxXdAfX9N8hX++E+moaafADUXOQlo
         XDE7iAFJzITHGYoxGIL1xBjQ8uMWYWIfWnhhR72bsLlOBPoMjG9xZpmV7uzBVnz+pMkI
         mfag==
X-Forwarded-Encrypted: i=1; AJvYcCWNHuSciT2tOTALjy77xwy2M4OpNJjrUqxXiIz5UUyNf/zVTbA+Iqv2/j4X02zDd6C4zEBxDnhcrPpwhPKmOGPlzRr9@vger.kernel.org
X-Gm-Message-State: AOJu0YwYGdxrmfa/hTtGshi3LLV8ksXXvnoOMwHG4P1X4d1l+h4isPBQ
	h1WvLsJUnE5NeczGnXN8/wThCaK9i33b/3hOBDrg93WuN5+DpFn5ywR8
X-Gm-Gg: ATEYQzw4yWZkpaK6hm7KLDHDP4FOT18WqKbtzhW6xBnTwGOPNPcw9wiaybto+SZ17/m
	24P4dqIvbWOrS7kFh6DFQcO3W92aCxHoJfoIuc3LyscRzjqaUYR5am77TjeeOt4hZS6j7prsvQi
	Wmx65OV0j1yp3T3PlQNHSpa9Qzq5151PZhpiNhs9p+3oQgtuq/RTGIeXUu9WFuIQg3IFUTLEUkF
	RoIta035rX3ZJe+yQJDI/UBPr2CqVuX0GF6/ls+SfSFk4PyyJMWiKfiiNQ0fRpNeOTP1Y5wRbkb
	5zxhUmOGJOXpMs5VzYfYiy+0FxavFao5xxGFDj6FhB6wHgKwVwR+TP8WaRBpot3tf4kHFkmaK6t
	qqFBUQjt1rn2OKNb4FG8/ybLLeaI7ssTsVJ2x/AYxXiQ350Hr/cOiuUX559ji/iCN0y2HZBSnVc
	9dPnJyN/HoS+RqP5llkb8phBGmFnS/XoTi2RZn7BRu5ykDXVvKJJh2QtSksax+1YpB+9eJT/92b
	oGz
X-Received: by 2002:a05:7022:ea22:b0:12a:713b:8961 with SMTP id a92af1059eb24-12be6470479mr303818c88.14.1774980736554;
        Tue, 31 Mar 2026 11:12:16 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12abbe21787sm10769272c88.11.2026.03.31.11.12.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 11:12:16 -0700 (PDT)
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
Subject: [PATCH v6 05/13] platform/x86: lenovo-wmi-other: Add lwmi_attr_id() function
Date: Tue, 31 Mar 2026 18:12:00 +0000
Message-ID: <20260331181208.421552-6-derekjohn.clark@gmail.com>
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

Adds lwmi_attr_id() function. In the same vein as LWMI_ATTR_ID_FAN_RPM(),
but as a generic, to de-duplicate attribute_id assignment biolerplate.

Reviewed-by: Rong Zhang <i@rong.moe>
Tested-by: Rong Zhang <i@rong.moe>
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
v6:
  - Move lwmi_attr_id to wmi-capdata.h as static inline.
v5:
  - Move references to cv/cd_mode_id to patch 4/8.
  - Move lwmi_attr_id to wmi-capdata.c and export with namespace.
v4:
  - Switch from macro to static inline to preserve types.
---
 drivers/platform/x86/lenovo/wmi-capdata.c |  8 ++---
 drivers/platform/x86/lenovo/wmi-capdata.h | 20 ++++++++++++
 drivers/platform/x86/lenovo/wmi-other.c   | 39 ++++++-----------------
 3 files changed, 34 insertions(+), 33 deletions(-)

diff --git a/drivers/platform/x86/lenovo/wmi-capdata.c b/drivers/platform/x86/lenovo/wmi-capdata.c
index ee1fb02d8e31..169665be4dcf 100644
--- a/drivers/platform/x86/lenovo/wmi-capdata.c
+++ b/drivers/platform/x86/lenovo/wmi-capdata.c
@@ -27,7 +27,6 @@
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <linux/acpi.h>
-#include <linux/bitfield.h>
 #include <linux/bug.h>
 #include <linux/cleanup.h>
 #include <linux/component.h>
@@ -48,6 +47,7 @@
 #include <linux/wmi.h>
 
 #include "wmi-capdata.h"
+#include "wmi-helpers.h"
 
 #define LENOVO_CAPABILITY_DATA_00_GUID "362A3AFE-3D96-4665-8530-96DAD5BB300E"
 #define LENOVO_CAPABILITY_DATA_01_GUID "7A8F5407-CB67-4D6E-B547-39B3BE018154"
@@ -58,9 +58,9 @@
 
 #define LWMI_FEATURE_ID_FAN_TEST 0x05
 
-#define LWMI_ATTR_ID_FAN_TEST							\
-	(FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, LWMI_DEVICE_ID_FAN) |		\
-	 FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, LWMI_FEATURE_ID_FAN_TEST))
+#define LWMI_ATTR_ID_FAN_TEST                                      \
+	lwmi_attr_id(LWMI_DEVICE_ID_FAN, LWMI_FEATURE_ID_FAN_TEST, \
+		     LWMI_GZ_THERMAL_MODE_NONE, LWMI_TYPE_ID_NONE)
 
 enum lwmi_cd_type {
 	LENOVO_CAPABILITY_DATA_00,
diff --git a/drivers/platform/x86/lenovo/wmi-capdata.h b/drivers/platform/x86/lenovo/wmi-capdata.h
index 8c1df3efcc55..1388eaf4ab4a 100644
--- a/drivers/platform/x86/lenovo/wmi-capdata.h
+++ b/drivers/platform/x86/lenovo/wmi-capdata.h
@@ -6,6 +6,7 @@
 #define _LENOVO_WMI_CAPDATA_H_
 
 #include <linux/bits.h>
+#include <linux/bitfield.h>
 #include <linux/types.h>
 
 #define LWMI_SUPP_VALID		BIT(0)
@@ -19,6 +20,8 @@
 
 #define LWMI_DEVICE_ID_FAN	0x04
 
+#define LWMI_TYPE_ID_NONE 0x00
+
 struct component_match;
 struct device;
 struct cd_list;
@@ -57,6 +60,23 @@ struct lwmi_cd_binder {
 	cd_list_cb_t cd_fan_list_cb;
 };
 
+/**
+ * lwmi_attr_id() - Formats a capability data attribute ID
+ * @dev_id: The u8 corresponding to the device ID.
+ * @feat_id: The u8 corresponding to the feature ID on the device.
+ * @mode_id: The u8 corresponding to the wmi-gamezone mode for set/get.
+ * @type_id: The u8 corresponding to the sub-device.
+ *
+ * Return: u32.
+ */
+static inline u32 lwmi_attr_id(u8 dev_id, u8 feat_id, u8 mode_id, u8 type_id)
+{
+	return (FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, dev_id)   |
+		FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, feat_id) |
+		FIELD_PREP(LWMI_ATTR_MODE_ID_MASK, mode_id) |
+		FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, type_id));
+}
+
 void lwmi_cd_match_add_all(struct device *master, struct component_match **matchptr);
 int lwmi_cd00_get_data(struct cd_list *list, u32 attribute_id, struct capdata00 *output);
 int lwmi_cd01_get_data(struct cd_list *list, u32 attribute_id, struct capdata01 *output);
diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x86/lenovo/wmi-other.c
index b24bf98c19ad..d2838ae5934f 100644
--- a/drivers/platform/x86/lenovo/wmi-other.c
+++ b/drivers/platform/x86/lenovo/wmi-other.c
@@ -27,7 +27,6 @@
  */
 
 #include <linux/acpi.h>
-#include <linux/bitfield.h>
 #include <linux/cleanup.h>
 #include <linux/component.h>
 #include <linux/container_of.h>
@@ -61,8 +60,6 @@
 
 #define LWMI_FEATURE_ID_FAN_RPM 0x03
 
-#define LWMI_TYPE_ID_NONE 0x00
-
 #define LWMI_FEATURE_VALUE_GET 17
 #define LWMI_FEATURE_VALUE_SET 18
 
@@ -72,10 +69,9 @@
 
 #define LWMI_FAN_DIV 100
 
-#define LWMI_ATTR_ID_FAN_RPM(x)						\
-	(FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, LWMI_DEVICE_ID_FAN) |	\
-	 FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, LWMI_FEATURE_ID_FAN_RPM) |	\
-	 FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, LWMI_FAN_ID(x)))
+#define LWMI_ATTR_ID_FAN_RPM(x)                                   \
+	lwmi_attr_id(LWMI_DEVICE_ID_FAN, LWMI_FEATURE_ID_FAN_RPM, \
+		     LWMI_GZ_THERMAL_MODE_NONE, LWMI_FAN_ID(x))
 
 #define LWMI_OM_FW_ATTR_BASE_PATH "lenovo-wmi-other"
 #define LWMI_OM_HWMON_NAME "lenovo_wmi_other"
@@ -714,12 +710,8 @@ static ssize_t attr_capdata01_show(struct kobject *kobj,
 	u32 attribute_id;
 	int value, ret;
 
-	attribute_id =
-		FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, tunable_attr->device_id) |
-		FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, tunable_attr->feature_id) |
-		FIELD_PREP(LWMI_ATTR_MODE_ID_MASK,
-			   LWMI_GZ_THERMAL_MODE_CUSTOM) |
-		FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, tunable_attr->type_id);
+	attribute_id = lwmi_attr_id(tunable_attr->device_id, tunable_attr->feature_id,
+				    LWMI_GZ_THERMAL_MODE_CUSTOM, tunable_attr->type_id);
 
 	ret = lwmi_cd01_get_data(priv->cd01_list, attribute_id, &capdata);
 	if (ret)
@@ -774,7 +766,6 @@ static ssize_t attr_current_value_store(struct kobject *kobj,
 	struct wmi_method_args_32 args = { 0x0, 0x0 };
 	struct capdata01 capdata;
 	enum thermal_mode mode;
-	u32 attribute_id;
 	u32 value;
 	int ret;
 
@@ -785,13 +776,10 @@ static ssize_t attr_current_value_store(struct kobject *kobj,
 	if (mode != LWMI_GZ_THERMAL_MODE_CUSTOM)
 		return -EBUSY;
 
-	attribute_id =
-		FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, tunable_attr->device_id) |
-		FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, tunable_attr->feature_id) |
-		FIELD_PREP(LWMI_ATTR_MODE_ID_MASK, mode) |
-		FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, tunable_attr->type_id);
+	args.arg0 = lwmi_attr_id(tunable_attr->device_id, tunable_attr->feature_id,
+				 mode, tunable_attr->type_id);
 
-	ret = lwmi_cd01_get_data(priv->cd01_list, attribute_id, &capdata);
+	ret = lwmi_cd01_get_data(priv->cd01_list, args.arg0, &capdata);
 	if (ret)
 		return ret;
 
@@ -802,7 +790,6 @@ static ssize_t attr_current_value_store(struct kobject *kobj,
 	if (value < capdata.min_value || value > capdata.max_value)
 		return -EINVAL;
 
-	args.arg0 = attribute_id;
 	args.arg1 = value;
 
 	ret = lwmi_dev_evaluate_int(priv->wdev, 0x0, LWMI_FEATURE_VALUE_SET,
@@ -836,7 +823,6 @@ static ssize_t attr_current_value_show(struct kobject *kobj,
 	struct lwmi_om_priv *priv = dev_get_drvdata(tunable_attr->dev);
 	struct wmi_method_args_32 args = { 0x0, 0x0 };
 	enum thermal_mode mode;
-	u32 attribute_id;
 	int retval;
 	int ret;
 
@@ -844,13 +830,8 @@ static ssize_t attr_current_value_show(struct kobject *kobj,
 	if (ret)
 		return ret;
 
-	attribute_id =
-		FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, tunable_attr->device_id) |
-		FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, tunable_attr->feature_id) |
-		FIELD_PREP(LWMI_ATTR_MODE_ID_MASK, mode) |
-		FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, tunable_attr->type_id);
-
-	args.arg0 = attribute_id;
+	args.arg0 = lwmi_attr_id(tunable_attr->device_id, tunable_attr->feature_id,
+				 mode, tunable_attr->type_id);
 
 	ret = lwmi_dev_evaluate_int(priv->wdev, 0x0, LWMI_FEATURE_VALUE_GET,
 				    (unsigned char *)&args, sizeof(args),
-- 
2.53.0

