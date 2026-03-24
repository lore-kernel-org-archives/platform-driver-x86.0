Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F8D3C6603
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Mar 2026 22:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774390240; cv=none; b=VggcH30xVzg57ehLZiyDCj4zbcAhmptNBNLuqMGwyCwLu5MALNbHAcUO8DwPX+ehWA9kWeEGik+VQeIOiaIMoQIxOz7clfNGOdKEjCtYQ7Iwicte42FIZIAgkxDWJcjFwL5BTdXEXOeRBiCyZB7eoMMm1MWKfGEZR6tbbSRaG08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774390240; c=relaxed/simple;
	bh=Pc3sAaXzwQS4fT6oy/dAnfR9bvz0ywfoOoPIB9D9HNs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N4QFg+QPvjLTMsfhyRewvD9nVcCBMm0rzKhSFHqftYXtKsG1K9zi8hdo/P0OH+B0A+heiHNPu67FbIL0FZ5vMdVZd48jXjk6JeSBwgzESDUdMWgbndkUwGffzag06RfE6KUNecO/vGWGwacX32Ufa1DxSSWi4n78GB8IXgTB5P4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IBdPwVW6; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IBdPwVW6"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2bdcf5970cdso300474eec.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 24 Mar 2026 15:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774390238; x=1774995038; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=djDoCNG99snwNhYF4bOVVKdkPIFPpULHg36c9f29rYs=;
        b=IBdPwVW6llh5cD2KHCXQivbvwbCTB7+LdqV1eNEme+hEQeTER455xLi/PS00tdkwhe
         7WEusALWzR+3anRVVOC4Bn3k8qJRKjEpmnFlUp/REH8ASQLURwqMFqlGpb4P6yvZpmyX
         ptAsSxlcOb/mBqiMqcSA/sQFh1pN40WpcbM6riWbbk0SwN/zAqslmvunI10vsBejyNGd
         y+BQqKpeztVlNt1xRgCPoX5ox4lPw3s229T/Ns46f7Sa43Y5PpVSvsZW33jzZJgMoSGY
         tvGZrpwEPDhHPQd1IeKyIDzyw6O7S4YFjobt/iRrjyuUszsfvGApiv4dKAlBzQBfgfI/
         XzSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774390238; x=1774995038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=djDoCNG99snwNhYF4bOVVKdkPIFPpULHg36c9f29rYs=;
        b=D41ZoeNlpcMraw9YsDztu8i7OoAvUc946Ot1CFbQJ5CnlMEDc6Dt6rZqrO+KdSRIO2
         ztvwSqS/Gf8ZNCUTzLCAF4/0AoSQmYQ2Z8Q/ut5I4iUw5Lik+toYxZt4T9WPCXdKXizs
         4JtOJ178RWwzEyL1rkL4BiSGPm6hqX95B71t2EVJZUEBuBUZ8KTrEXBbeH/4sxHMhAZx
         3kGi5RrchugAaQiig9t0vE4xoqP0K+IzIsZeF2dzH5M2iQcQndJ0GBvQN4LNoPvupaXY
         eRr2zViKNFfqVXJ0vgOCcwXyXe2vaqXBxaK/izvrkxSMQsCaopBvS96378lBpP9U1Wk1
         wGcA==
X-Forwarded-Encrypted: i=1; AJvYcCWl5JKcC36uwLgam1X+MZYQ/Gbps9Lxtm5jRBLQo+TuzQn4b2VNVsx4DVwForGYg/h6Aw5wKCmtlmPGVXnEaHb5yTCO@vger.kernel.org
X-Gm-Message-State: AOJu0YzRfhqF6d/1jmEDfnWInv3hcEBTTgVuNrAcTKOSPDepmNxvOGhU
	uzTFTNl1+tEDA8EGdfiCxU5urivQn5o1jr7rx5SL0b7m5ZoxUz4xJn88
X-Gm-Gg: ATEYQzwAR7u6QZLv8lygpkujleSrtFVQWbB8Z1k2/m8l+qt+MILEZ4iuus4M/mFyhY5
	6quhDfYzV/SLgdgQYICyuAyLkPG6p/6GMIGvCz0lepqoa4BPKl65u0qDA/+GIP0XgBbDqe2BCqq
	+yPqkMfUC9PhFDUCRLSurMGmsMTG0vXan5H7lQ/e7dF394DDvhCxzfcrcYPsTiIxGNVJnl4HNPn
	eGfUPoY/sz91iJCb1TwSWeAk3yn0tS0IAFUY95uaCIRMojgC/wIq+2JSigG5OMYD5LCjM1Lrfa7
	TGsqZ359TTtUPFJ6zTcv7hab/okfmkWJLDGgQ58AyUDzpxfU8JO8MGCqAeiuZEI6dLuixOwQkgq
	kKJ7r25Rll2FBqp8ngMfpthfYkCun384BKm+bo85hWjzKYxik0F2kGTWMm6SvZ796G6OUByMp4s
	bbw7CH0K0KYPu9/aBmH1Ts24NuoYNy4o79MWB4s2lxi3vDJnwoQdi16tp+tTbR3q4ewEd7ZHNKO
	thO
X-Received: by 2002:a05:7301:4195:b0:2c1:1a55:e4b7 with SMTP id 5a478bee46e88-2c14b679191mr2371073eec.21.1774390237539;
        Tue, 24 Mar 2026 15:10:37 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b14c299sm16282832eec.6.2026.03.24.15.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 15:10:37 -0700 (PDT)
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
Subject: [PATCH v5 3/8] platform/x86: lenovo-wmi-other: Add lwmi_attr_id() function
Date: Tue, 24 Mar 2026 22:10:27 +0000
Message-ID: <20260324221032.1333636-4-derekjohn.clark@gmail.com>
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

Adds lwmi_attr_id() function. In the same vein as LWMI_ATTR_ID_FAN_RPM(),
but as a generic, to de-duplicate attribute_id assignment biolerplate.

Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
v5:
  - Move references to cv/cd_mode_id to patch 4/8.
  - Move lwmi_attr_id to wmi-capdata.c and export with namespace.
v4:
  - Switch from macro to static inline to preserve types.
---
 drivers/platform/x86/lenovo/wmi-capdata.c  | 25 ++++++++++++--
 drivers/platform/x86/lenovo/wmi-capdata.h  |  3 ++
 drivers/platform/x86/lenovo/wmi-gamezone.h |  1 +
 drivers/platform/x86/lenovo/wmi-other.c    | 39 ++++++----------------
 4 files changed, 36 insertions(+), 32 deletions(-)

diff --git a/drivers/platform/x86/lenovo/wmi-capdata.c b/drivers/platform/x86/lenovo/wmi-capdata.c
index ee1fb02d8e31..6cb3665e9399 100644
--- a/drivers/platform/x86/lenovo/wmi-capdata.c
+++ b/drivers/platform/x86/lenovo/wmi-capdata.c
@@ -48,6 +48,7 @@
 #include <linux/wmi.h>
 
 #include "wmi-capdata.h"
+#include "wmi-gamezone.h"
 
 #define LENOVO_CAPABILITY_DATA_00_GUID "362A3AFE-3D96-4665-8530-96DAD5BB300E"
 #define LENOVO_CAPABILITY_DATA_01_GUID "7A8F5407-CB67-4D6E-B547-39B3BE018154"
@@ -58,9 +59,27 @@
 
 #define LWMI_FEATURE_ID_FAN_TEST 0x05
 
-#define LWMI_ATTR_ID_FAN_TEST							\
-	(FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, LWMI_DEVICE_ID_FAN) |		\
-	 FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, LWMI_FEATURE_ID_FAN_TEST))
+/**
+ * lwmi_attr_id() - Formats a capability data attribute ID
+ * @dev_id: The u8 corresponding to the device ID.
+ * @feat_id: The u8 corresponding to the feature ID on the device.
+ * @mode_id: The u8 corresponding to the wmi-gamezone mode for set/get.
+ * @type_id: The u8 corresponding to the sub-device.
+ *
+ * Return: u32.
+ */
+u32 lwmi_attr_id(u8 dev_id, u8 feat_id, u8 mode_id, u8 type_id)
+{
+	return (FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, dev_id)   |
+		FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, feat_id) |
+		FIELD_PREP(LWMI_ATTR_MODE_ID_MASK, mode_id) |
+		FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, type_id));
+}
+EXPORT_SYMBOL_NS_GPL(lwmi_attr_id, "LENOVO_WMI_CAPDATA");
+
+#define LWMI_ATTR_ID_FAN_TEST                                      \
+	lwmi_attr_id(LWMI_DEVICE_ID_FAN, LWMI_FEATURE_ID_FAN_TEST, \
+		     LWMI_GZ_THERMAL_MODE_NONE, LWMI_TYPE_ID_NONE)
 
 enum lwmi_cd_type {
 	LENOVO_CAPABILITY_DATA_00,
diff --git a/drivers/platform/x86/lenovo/wmi-capdata.h b/drivers/platform/x86/lenovo/wmi-capdata.h
index 8c1df3efcc55..b5b6d0305b6a 100644
--- a/drivers/platform/x86/lenovo/wmi-capdata.h
+++ b/drivers/platform/x86/lenovo/wmi-capdata.h
@@ -19,6 +19,8 @@
 
 #define LWMI_DEVICE_ID_FAN	0x04
 
+#define LWMI_TYPE_ID_NONE 0x00
+
 struct component_match;
 struct device;
 struct cd_list;
@@ -57,6 +59,7 @@ struct lwmi_cd_binder {
 	cd_list_cb_t cd_fan_list_cb;
 };
 
+u32 lwmi_attr_id(u8 dev_id, u8 feat_id, u8 mode_id, u8 type_id);
 void lwmi_cd_match_add_all(struct device *master, struct component_match **matchptr);
 int lwmi_cd00_get_data(struct cd_list *list, u32 attribute_id, struct capdata00 *output);
 int lwmi_cd01_get_data(struct cd_list *list, u32 attribute_id, struct capdata01 *output);
diff --git a/drivers/platform/x86/lenovo/wmi-gamezone.h b/drivers/platform/x86/lenovo/wmi-gamezone.h
index 6b163a5eeb95..ddb919cf6c36 100644
--- a/drivers/platform/x86/lenovo/wmi-gamezone.h
+++ b/drivers/platform/x86/lenovo/wmi-gamezone.h
@@ -10,6 +10,7 @@ enum gamezone_events_type {
 };
 
 enum thermal_mode {
+	LWMI_GZ_THERMAL_MODE_NONE =	   0x00,
 	LWMI_GZ_THERMAL_MODE_QUIET =	   0x01,
 	LWMI_GZ_THERMAL_MODE_BALANCED =	   0x02,
 	LWMI_GZ_THERMAL_MODE_PERFORMANCE = 0x03,
diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x86/lenovo/wmi-other.c
index c1728c7c2957..7aa512ff1446 100644
--- a/drivers/platform/x86/lenovo/wmi-other.c
+++ b/drivers/platform/x86/lenovo/wmi-other.c
@@ -27,7 +27,6 @@
  */
 
 #include <linux/acpi.h>
-#include <linux/bitfield.h>
 #include <linux/cleanup.h>
 #include <linux/component.h>
 #include <linux/container_of.h>
@@ -62,8 +61,6 @@
 
 #define LWMI_FEATURE_ID_FAN_RPM 0x03
 
-#define LWMI_TYPE_ID_NONE 0x00
-
 #define LWMI_FEATURE_VALUE_GET 17
 #define LWMI_FEATURE_VALUE_SET 18
 
@@ -73,10 +70,9 @@
 
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
@@ -715,12 +711,8 @@ static ssize_t attr_capdata01_show(struct kobject *kobj,
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
@@ -775,7 +767,6 @@ static ssize_t attr_current_value_store(struct kobject *kobj,
 	struct wmi_method_args_32 args;
 	struct capdata01 capdata;
 	enum thermal_mode mode;
-	u32 attribute_id;
 	u32 value;
 	int ret;
 
@@ -786,13 +777,10 @@ static ssize_t attr_current_value_store(struct kobject *kobj,
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
 
@@ -803,7 +791,6 @@ static ssize_t attr_current_value_store(struct kobject *kobj,
 	if (value < capdata.min_value || value > capdata.max_value)
 		return -EINVAL;
 
-	args.arg0 = attribute_id;
 	args.arg1 = value;
 
 	ret = lwmi_dev_evaluate_int(priv->wdev, 0x0, LWMI_FEATURE_VALUE_SET,
@@ -837,7 +824,6 @@ static ssize_t attr_current_value_show(struct kobject *kobj,
 	struct lwmi_om_priv *priv = dev_get_drvdata(tunable_attr->dev);
 	struct wmi_method_args_32 args;
 	enum thermal_mode mode;
-	u32 attribute_id;
 	int retval;
 	int ret;
 
@@ -845,13 +831,8 @@ static ssize_t attr_current_value_show(struct kobject *kobj,
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

