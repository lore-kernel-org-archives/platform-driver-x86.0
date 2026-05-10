Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02DBA2D8DC2
	for <platform-driver-x86@vger.kernel.org>; Sun, 10 May 2026 04:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778387160; cv=none; b=OI9v6TaG0AbvR8r+I1tgdRs/TnWGQ3Mnh0mIj5h2feUbAgSDInm/qL+xpEDRl0rfuObyo04JgPDvzy2CUUOxKKJd4GHGsx7tk2LlvGvOxL501gQuudQjYbkFPO/kKFGw1eD+4vpqPMzdPPMrfvFslrRQaKyQf0N9XoeKeDAMsAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778387160; c=relaxed/simple;
	bh=rtB7kXOAbEEnFe5fLjtmYZkBLTuwzu9NfWjFUgacF8s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=enKlum/P58AmIeHlGKEVV9dK1YWjRmpozDO/u8arObX/in3id0bvY1AiC89am3jmbb5wNuaefNUaH6JMt7g9i6JTRBDoRzOKEFA1qwlMNm4nayBmJrVIq1shkqghM3OqwVA9/1D3/XkeIYb/Eoeheth/v4NTl2Hya5BxFumCrO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=af06FwvA; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="af06FwvA"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2f68f3b075fso3369205eec.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 09 May 2026 21:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778387156; x=1778991956; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=no/pDLERRqLa/cFmcAEOSiBCI+pFTd4yzVbvME7Rz5c=;
        b=af06FwvATsoSO2s1PEiyH3HmaVYh86CDIvk50FEhMor0lg/wT0UO45IAikOjakrmr4
         /F03alD8/P+GVjrLMoUNTUk0xigHw+/4IEkg0x/LGL21Lo3UVPKtzioGMJAi3J43IGvW
         j266klSNt39vJZw7HitUHHVxE9TVj0CZl5J3JC/Ua3PaDP4GvPk5wCb47mQlw2uvRN3p
         H5uanYUQ858npyFRzf3t4gAI0U+zyzaJryiUhyjenTc5/mih32puQp/HilDhB/4mvWt7
         rO4KYVdTKUStee8etI5zEGKGtV7yGHRDYz1GWoc3b0aayBNG8MHysIsDlqWMwKYtJBKB
         pjGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778387156; x=1778991956;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=no/pDLERRqLa/cFmcAEOSiBCI+pFTd4yzVbvME7Rz5c=;
        b=OV3FHmsBS4zDG4MsrJUrTBfuilpNP/ho8by5+WbQS78KHS0l8vQjxeYBOrvDoFmBdR
         V1fkJey5bSadN+yUoQXq55uzriY/6SmRMYGl9JkrRdFjh7Gu7qy2Ps6Ah49NvftoziKp
         CLjUEoC+6fuF0SxELbHFSxWifTFIKs1nY69kMKxUI2BNyJ46A4miHNrftXDnoYRY+PTw
         MYcsRS5fKXeRs1+E4zcWvb8I1X7HtDrKIEHOtsVRXUMQ4A5R2w9/L+1cBBm1ncora1U8
         jG/50H7ZrmwJWA+Ze3F2kEw26YYjwgQ5gTxMnM/jLNfJy+M35590b10HYmeaOxdca/bZ
         x8Ww==
X-Forwarded-Encrypted: i=1; AFNElJ8aKJcbecwGrvuEB5R7Bt4Oz/ysz4wx7d9MmiNoJhSNbBfH3f11qia1wuYm/FqpuvbenOdo7Q7j8G7gj4oipRiwzcq+@vger.kernel.org
X-Gm-Message-State: AOJu0YwhqR/X3Q8tG1oHmTQ0f/RwsZCZTYXRQf9q581IVfG64Lbb33Nq
	4j9oTwMD2ydAcZOKiHrg6/fNWGYtu1Nxg96Laopl60igfmn3IpYHO63J
X-Gm-Gg: Acq92OFe4Q2dN1NeTy5U83jAPXJciPueFvf6GBkAF0Q3URWjLEZqC5mlNU5a84k75m+
	tglXSZVNa4wKtIrdSz1OSd62/4A/scHbS55ydh87WcWdJh96gJY4Uo+HOuA6rLMXfqSUn2pVUly
	MAxNhHG4sVUM22Tdcrje2bkD/ab6OpcbqSv3VfcnuH+fRDhfdbWqeSNsPI/ttrDaOaEku/xqFl8
	xbV6fxtUvfrepAraaaUIZMan7SAbo6kiqQIuLz2Mud8LTLPuPSbiy6d2b536+FNZQ0GlHASShm3
	nWmEVc7QHFy/9hxc9PPw8M4R8hZ5Et156ZBb9NgHBaLsL30116zwQhK568o8+TefZqJ2Q1Msp1m
	RVu2mx6MCZx3z15/b1F37oSviEoiZKj/PmyI8PoN28Zzat+EFmoMUZ9/c/PVXrXyCGkY6bjf0aB
	VLqg7uEVwVqMQbF53SzIkBeqsS6vHsEKL4o1WpEzLB8XXgkcEZ78EzWXCraI6HD/c2DIUmPifEO
	gbl
X-Received: by 2002:a05:7300:3207:b0:2c5:60d0:701e with SMTP id 5a478bee46e88-2f85bb73083mr4372047eec.3.1778387156148;
        Sat, 09 May 2026 21:25:56 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8862d3047sm10069960eec.10.2026.05.09.21.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 21:25:55 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v12 08/16] platform/x86: lenovo-wmi-other: Add Attribute ID helper functions
Date: Sun, 10 May 2026 04:25:38 +0000
Message-ID: <20260510042546.436874-9-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260510042546.436874-1-derekjohn.clark@gmail.com>
References: <20260510042546.436874-1-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds lwmi_attr_id() function. In the same vein as LWMI_ATTR_ID_FAN_RPM(),
but as a generic, to de-duplicate attribute_id assignment biolerplate.

Adds tunable_attr_01_id() function that breaks out the members of a
tunable_attr_01 struct and passes them to lwmi_attr_id().

No functional change intended.

Cc: stable@vger.kernel.org
Reviewed-by: Rong Zhang <i@rong.moe>
Tested-by: Rong Zhang <i@rong.moe>
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
v12:
  - Drop fixes tag in patch with no functional changes.
  - Clarify kerneldocs comments.
v11:
  - Move to earlier in the series to clean up later patches that can
    use it.
  - Add helper function that takes a tunable_attr_01 instead of breaking
    out all struct members manually each time the macro is used.
v9:
  - Fix dropped use of mode variable in current_value_show.
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
 drivers/platform/x86/lenovo/wmi-capdata.h | 20 +++++++++
 drivers/platform/x86/lenovo/wmi-other.c   | 49 +++++++++--------------
 3 files changed, 44 insertions(+), 33 deletions(-)

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
index 8c1df3efcc55..c3e760b8c3c3 100644
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
+ * Return: encoded capability data attribute ID.
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
index b4ed7af50a24..4da0da8459c7 100644
--- a/drivers/platform/x86/lenovo/wmi-other.c
+++ b/drivers/platform/x86/lenovo/wmi-other.c
@@ -59,8 +59,6 @@
 
 #define LWMI_FEATURE_ID_FAN_RPM 0x03
 
-#define LWMI_TYPE_ID_NONE 0x00
-
 #define LWMI_FEATURE_VALUE_GET 17
 #define LWMI_FEATURE_VALUE_SET 18
 
@@ -68,13 +66,12 @@
 #define LWMI_FAN_NR 4
 #define LWMI_FAN_ID(x) ((x) + LWMI_FAN_ID_BASE)
 
-#define LWMI_ATTR_ID_FAN_RPM(x)						\
-	(FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, LWMI_DEVICE_ID_FAN) |	\
-	 FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, LWMI_FEATURE_ID_FAN_RPM) |	\
-	 FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, LWMI_FAN_ID(x)))
-
 #define LWMI_FAN_DIV 100
 
+#define LWMI_ATTR_ID_FAN_RPM(x)                                   \
+	lwmi_attr_id(LWMI_DEVICE_ID_FAN, LWMI_FEATURE_ID_FAN_RPM, \
+		     LWMI_GZ_THERMAL_MODE_NONE, LWMI_FAN_ID(x))
+
 #define LWMI_OM_FW_ATTR_BASE_PATH "lenovo-wmi-other"
 #define LWMI_OM_HWMON_NAME "lenovo_wmi_other"
 
@@ -547,6 +544,18 @@ struct tunable_attr_01 {
 	u8 type_id;
 };
 
+/**
+ * tunable_attr_01_id() - Formats a tunable_attr_01 to a capdata attribute ID
+ * @attr: The tunable_attr_01 to format.
+ * @mode: The u8 corresponding to the wmi-gamezone mode for set/get.
+ *
+ * Return: encoded capability data attribute ID.
+ */
+static u32 tunable_attr_01_id(struct tunable_attr_01 *attr, u8 mode)
+{
+	return lwmi_attr_id(attr->device_id, attr->feature_id, mode, attr->type_id);
+}
+
 static struct tunable_attr_01 ppt_pl1_spl = {
 	.device_id = LWMI_DEVICE_ID_CPU,
 	.feature_id = LWMI_FEATURE_ID_CPU_SPL,
@@ -614,12 +623,7 @@ static ssize_t attr_capdata01_show(struct kobject *kobj,
 	u32 attribute_id;
 	int value, ret;
 
-	attribute_id =
-		FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, tunable_attr->device_id) |
-		FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, tunable_attr->feature_id) |
-		FIELD_PREP(LWMI_ATTR_MODE_ID_MASK,
-			   LWMI_GZ_THERMAL_MODE_CUSTOM) |
-		FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, tunable_attr->type_id);
+	attribute_id = tunable_attr_01_id(tunable_attr, LWMI_GZ_THERMAL_MODE_CUSTOM);
 
 	ret = lwmi_cd01_get_data(priv->cd01_list, attribute_id, &capdata);
 	if (ret)
@@ -674,7 +678,6 @@ static ssize_t attr_current_value_store(struct kobject *kobj,
 	struct wmi_method_args_32 args = {};
 	struct capdata01 capdata;
 	enum thermal_mode mode;
-	u32 attribute_id;
 	u32 value;
 	int ret;
 
@@ -685,13 +688,9 @@ static ssize_t attr_current_value_store(struct kobject *kobj,
 	if (mode != LWMI_GZ_THERMAL_MODE_CUSTOM)
 		return -EBUSY;
 
-	attribute_id =
-		FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, tunable_attr->device_id) |
-		FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, tunable_attr->feature_id) |
-		FIELD_PREP(LWMI_ATTR_MODE_ID_MASK, mode) |
-		FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, tunable_attr->type_id);
+	args.arg0 = tunable_attr_01_id(tunable_attr, mode);
 
-	ret = lwmi_cd01_get_data(priv->cd01_list, attribute_id, &capdata);
+	ret = lwmi_cd01_get_data(priv->cd01_list, args.arg0, &capdata);
 	if (ret)
 		return ret;
 
@@ -702,7 +701,6 @@ static ssize_t attr_current_value_store(struct kobject *kobj,
 	if (value < capdata.min_value || value > capdata.max_value)
 		return -EINVAL;
 
-	args.arg0 = attribute_id;
 	args.arg1 = value;
 
 	ret = lwmi_dev_evaluate_int(priv->wdev, 0x0, LWMI_FEATURE_VALUE_SET,
@@ -736,7 +734,6 @@ static ssize_t attr_current_value_show(struct kobject *kobj,
 	struct lwmi_om_priv *priv = dev_get_drvdata(tunable_attr->dev);
 	struct wmi_method_args_32 args = {};
 	enum thermal_mode mode;
-	u32 attribute_id;
 	int retval;
 	int ret;
 
@@ -744,13 +741,7 @@ static ssize_t attr_current_value_show(struct kobject *kobj,
 	if (ret)
 		return ret;
 
-	attribute_id =
-		FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, tunable_attr->device_id) |
-		FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, tunable_attr->feature_id) |
-		FIELD_PREP(LWMI_ATTR_MODE_ID_MASK, mode) |
-		FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, tunable_attr->type_id);
-
-	args.arg0 = attribute_id;
+	args.arg0 = tunable_attr_01_id(tunable_attr, mode);
 
 	ret = lwmi_dev_evaluate_int(priv->wdev, 0x0, LWMI_FEATURE_VALUE_GET,
 				    (unsigned char *)&args, sizeof(args),
-- 
2.53.0

