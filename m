Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9498C39E6CD
	for <platform-driver-x86@vger.kernel.org>; Mon,  6 Apr 2026 20:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775506455; cv=none; b=pQp1wyqasiNupv5vd4bgH/f3y3IiSSeFhQosuXD7fckIAkZKHj9s+LAI+PuF7u/p0c7mmWbBHjlnu03+TOWkVGsL8n2/k4VQy203+m+IOfRy82J/K//0QNqSXeEk7iDSmxU2qFP+JXl1QVreXQNg5LVV16BYzTJcQe77frabEFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775506455; c=relaxed/simple;
	bh=bPryRTTEH+Q2w1E1N8JH2TQcaWKQ4Soh5LbEk2u1sbc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LF1HTGsEmT40XiDWWpjv9flkNQguOCkaMsbMZR95q1GQwKcdP7v3xY7qlFvvDG70nSO0wvsZEXOJ9x14Dh8y0i7/ZJonbwjTn7OVBgpBh1+oZF/JLl7ASp6O7PUlkMtkmnqVRNjxV/HneUTaGLAa4mxEk26dpMWg3FHaX+lnFgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fG5+oIk8; arc=none smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fG5+oIk8"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1271195d2a7so9286378c88.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 06 Apr 2026 13:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775506450; x=1776111250; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T7odj6rBktOkCaSzuwYo02uinsQt9nFQM4fAXGo/q7k=;
        b=fG5+oIk8mMLjTnJ62j47wL+Ws/NsQwm4Hghsj7nTbRCdCyB5TurIObe/wqnsPrHXkx
         uLhiJe7XUe8yvasHThv/k5mBfBxrLlvh7LQBSq0muo+LwcRZ8ZiF/e4PiQ6g+H9Q+FCH
         weNhgYfZGPPeK5jlWKK8knmUeGD9KcOZRPaWHtVQlKTI/wwej/eO0P3lN7Pj41q6Rgvf
         LBB1Ce87OsQtNETP5290f0vpSCLQtWpOKofoMDLKZa1a7IcjtfDjEb7kSzbClb8+vMQE
         GUHtjeeHH5ZFYrYWMxoAJcxj0OA5/h43I4ErKcv+Mdw1gbtbAaNsSjYIXRidgKMrNQ6l
         gwMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775506450; x=1776111250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T7odj6rBktOkCaSzuwYo02uinsQt9nFQM4fAXGo/q7k=;
        b=L+BeN5Juo2C4J03ASiJvQjP0mhadMt/lIcfMzra2Y4u5rDVA+DE73w/h+i7ZQ36uRE
         dHsAXHR0egwcMMoFZL8zTd71BIvU4ULO2xFl/npm/KtXJNm3e5BFbOh4wLVsTraOV08G
         i/NKIoZLNVyXR2zP9Dj94T5DiM25ZDrzkAmb4K7He77RagjmKje+dsYFGYsEDGzH4cLo
         uwmG8zv7gr/Irn8RgiwS4caQBWtV2USdUZol9m1I0PDq3WB2JefrUhF+2beLNcTTMXTy
         A4LHgSuCs3KcUC+kY9wgs6nvmh6AbrweU/xoMybpGzF9z2NftDyQ1+0a/9OoLJF9iN6o
         +U5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUvKGOe56ttrl/fSr5X8yEeiw/pQH/x7lXJdcEB1ZIUY+Athdc0ip9HrDeMcIhFsv/auS/uzckDkYGEl8Ov6Yx837hq@vger.kernel.org
X-Gm-Message-State: AOJu0YwyRlSoL/YqkdE1tBXK7XxDxr+3Weqnzhih1ejGUQg0zxNW9brX
	riZC82GHjUQ2Xwn7K7Uaoten56/HEtGKhPTwZVf8QUlNlcdKAE1VdbC3
X-Gm-Gg: AeBDieuWQQ0Hq/kBesJ8zvaJxvkUaKrCOA3y4nfXKadfl/yJsqdS+WzGNMwxhnssI8P
	QLkXR3HS1wh/1Qh3JbsEEMFJVsI8/S5RgJ6zXclAgjefhVWIBd0J2QgNWP7O+PuHPz8GCSwQMJq
	jH78dASWfLHmyEVntYI65+RQtO52Op0Cdgc5i7e3l2F3F/LBu9nFHTdSQAKR/dWyp9p5rPb1rln
	JSQoT8z80r43+m9/Hb+oXSrxNtp/iV0oliYVv3BSgBrqtZ3EhVuuKNJ072SPiyIB65d4nEjiUaI
	l69Cx9TPBl0a/hHwwzL+E+3I51ZZwGJvF3HgKt/Jf2Zfq6+nNT0hYISylkO+TwxJrTIhTYa2nAx
	TJguQDYezbUGLmKD52f/g2CHhmqLCS8wNDPy6s2FnPqewvfEJhhh+Wk57zMyiveIhqIn16s8MAA
	LeTYLIh7HJ0iNSgBqgmhAPp03GDOqTLpuThrzFX0MH1klu0chHQVOdxCPwTs1O4D84HjYqSxSyu
	tRB
X-Received: by 2002:a05:7022:45a6:b0:128:dbbf:fd35 with SMTP id a92af1059eb24-12bfb76607fmr6511116c88.28.1775506450200;
        Mon, 06 Apr 2026 13:14:10 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12bed93f861sm17022333c88.0.2026.04.06.13.14.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 13:14:09 -0700 (PDT)
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
Subject: [PATCH v8 10/16] platform/x86: lenovo-wmi-other: Add lwmi_attr_id() function
Date: Mon,  6 Apr 2026 20:13:54 +0000
Message-ID: <20260406201400.438221-11-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260406201400.438221-1-derekjohn.clark@gmail.com>
References: <20260406201400.438221-1-derekjohn.clark@gmail.com>
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
v7:
  - Incorporate additional replacements in lwmi_attr_01_is_supported
    after moving the patch that adds it to earlier in the series.
v6:
  - Move lwmi_attr_id to wmi-capdata.h as static inline.
v5:
  - Move references to cv/cd_mode_id to patch 4/8.
  - Move lwmi_attr_id to wmi-capdata.c and export with namespace.
v4:
  - Switch from macro to static inline to preserve types.
---
 drivers/platform/x86/lenovo/wmi-capdata.c |  8 ++--
 drivers/platform/x86/lenovo/wmi-capdata.h | 20 ++++++++
 drivers/platform/x86/lenovo/wmi-other.c   | 56 ++++++++---------------
 3 files changed, 43 insertions(+), 41 deletions(-)

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
index 25ddfd54f692..19a072bea2d4 100644
--- a/drivers/platform/x86/lenovo/wmi-other.c
+++ b/drivers/platform/x86/lenovo/wmi-other.c
@@ -27,7 +27,6 @@
  */
 
 #include <linux/acpi.h>
-#include <linux/bitfield.h>
 #include <linux/cleanup.h>
 #include <linux/component.h>
 #include <linux/container_of.h>
@@ -59,8 +58,6 @@
 
 #define LWMI_FEATURE_ID_FAN_RPM 0x03
 
-#define LWMI_TYPE_ID_NONE 0x00
-
 #define LWMI_FEATURE_VALUE_GET 17
 #define LWMI_FEATURE_VALUE_SET 18
 
@@ -70,10 +67,9 @@
 
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
@@ -616,12 +612,8 @@ static ssize_t attr_capdata01_show(struct kobject *kobj,
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
@@ -686,10 +678,8 @@ static ssize_t attr_current_value_store(struct kobject *kobj,
 	if (mode != LWMI_GZ_THERMAL_MODE_CUSTOM)
 		return -EBUSY;
 
-	args.arg0 = FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, tunable_attr->device_id) |
-		    FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, tunable_attr->feature_id) |
-		    FIELD_PREP(LWMI_ATTR_MODE_ID_MASK, tunable_attr->cd_mode_id) |
-		    FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, tunable_attr->type_id);
+	args.arg0 = lwmi_attr_id(tunable_attr->device_id, tunable_attr->feature_id,
+				 tunable_attr->cd_mode_id, tunable_attr->type_id);
 
 	ret = lwmi_cd01_get_data(priv->cd01_list, args.arg0, &capdata);
 	if (ret)
@@ -702,10 +692,8 @@ static ssize_t attr_current_value_store(struct kobject *kobj,
 	if (value < capdata.min_value || value > capdata.max_value)
 		return -EINVAL;
 
-	args.arg0 = FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, tunable_attr->device_id) |
-		    FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, tunable_attr->feature_id) |
-		    FIELD_PREP(LWMI_ATTR_MODE_ID_MASK, tunable_attr->cv_mode_id) |
-		    FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, tunable_attr->type_id);
+	args.arg0 = lwmi_attr_id(tunable_attr->device_id, tunable_attr->feature_id,
+				 tunable_attr->cv_mode_id, tunable_attr->type_id);
 	args.arg1 = value;
 
 	ret = lwmi_dev_evaluate_int(priv->wdev, 0x0, LWMI_FEATURE_VALUE_SET,
@@ -750,10 +738,8 @@ static ssize_t attr_current_value_show(struct kobject *kobj,
 	if (tunable_attr->cv_mode_id == LWMI_GZ_THERMAL_MODE_NONE)
 		mode = tunable_attr->cv_mode_id;
 
-	args.arg0 = FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, tunable_attr->device_id) |
-		    FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, tunable_attr->feature_id) |
-		    FIELD_PREP(LWMI_ATTR_MODE_ID_MASK, mode) |
-		    FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, tunable_attr->type_id);
+	args.arg0 = lwmi_attr_id(tunable_attr->device_id, tunable_attr->feature_id,
+				 tunable_attr->cv_mode_id, tunable_attr->type_id);
 
 	ret = lwmi_dev_evaluate_int(priv->wdev, 0x0, LWMI_FEATURE_VALUE_GET,
 				    (unsigned char *)&args, sizeof(args),
@@ -794,10 +780,8 @@ static bool lwmi_attr_01_is_supported(struct tunable_attr_01 *tunable_attr)
 
 	/* Determine tunable_attr->cd_mode_id*/
 	for (i = 0; i < ARRAY_SIZE(modes); i++) {
-		args.arg0 = FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, tunable_attr->device_id) |
-			    FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, tunable_attr->feature_id) |
-			    FIELD_PREP(LWMI_ATTR_MODE_ID_MASK, modes[i]) |
-			    FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, tunable_attr->type_id);
+		args.arg0 = lwmi_attr_id(tunable_attr->device_id, tunable_attr->feature_id,
+					 modes[i], tunable_attr->type_id);
 
 		ret = lwmi_cd01_get_data(priv->cd01_list, args.arg0, &capdata);
 		if (ret || !capdata.supported)
@@ -810,15 +794,10 @@ static bool lwmi_attr_01_is_supported(struct tunable_attr_01 *tunable_attr)
 	if (!cd_mode_found)
 		return cd_mode_found;
 
-	dev_dbg(tunable_attr->dev,
-		"cd_mode_id: %#010x\n", args.arg0);
-
 	/* Determine tunable_attr->cv_mode_id, returns 1 if supported*/
 	for (i = 0; i < ARRAY_SIZE(modes); i++) {
-		args.arg0 = FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, tunable_attr->device_id) |
-			    FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, tunable_attr->feature_id) |
-			    FIELD_PREP(LWMI_ATTR_MODE_ID_MASK, modes[i]) |
-			    FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, tunable_attr->type_id);
+		args.arg0 = lwmi_attr_id(tunable_attr->device_id, tunable_attr->feature_id,
+					 modes[i], tunable_attr->type_id);
 
 		ret = lwmi_dev_evaluate_int(priv->wdev, 0x0, LWMI_FEATURE_VALUE_GET,
 					    (unsigned char *)&args, sizeof(args),
@@ -833,7 +812,10 @@ static bool lwmi_attr_01_is_supported(struct tunable_attr_01 *tunable_attr)
 	if (!cv_mode_found)
 		return cv_mode_found;
 
-	dev_dbg(tunable_attr->dev, "cv_mode_id: %#010x, attribute support level: %#010x\n",
+	dev_dbg(tunable_attr->dev,
+		"cd_mode_id: %#010x, cv_mode_id: %#010x, attribute support level: %#010x\n",
+		lwmi_attr_id(tunable_attr->device_id, tunable_attr->feature_id,
+			     tunable_attr->cd_mode_id, tunable_attr->type_id),
 		args.arg0, capdata.supported);
 
 	return capdata.supported > 0 ? true : false;
-- 
2.53.0

