Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B9CF383C7B
	for <platform-driver-x86@vger.kernel.org>; Thu, 12 Mar 2026 03:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773285041; cv=none; b=PV7/mEcz9HeXZ1ZRx5ObydoAbWPaYnGANXqYA3s+Wfljtg0+8nTcKxMMf+47yKTv8Y81o2CzISyv5pIwv5QPW37dSibLl2O1RUZfMjVfsKIYzp5q52PcrrWJHobBV+/RrvTIZymuu0ASG5SDHD7eIx7EPJCCDdFOhCJm19o/oEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773285041; c=relaxed/simple;
	bh=EHszIbgPf3Pj1SlsxCaIWbxPiGpyfzBK/0p9Mu5UyrM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZQYZZ6mctRS/1h3E6ke/PrvDDobl1ZwZdqyyFZTMCV5ht8hfHd2vzs5/f1d/OuU4DtUyBqVVIXB6KOhpFt1HLwrDaVaCBNd/X5CeA9qcNq9Lu57yCc52S7yllvp38Lfuh2Ec+F/31XlndQuhIaTwkd0Ldue9ukaho5MLG6FJiKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Po1+T5zk; arc=none smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Po1+T5zk"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-12776bebe9fso1086086c88.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 11 Mar 2026 20:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773285038; x=1773889838; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MPSmt+yaVGqHLHpRv6ym/e/BrIWJwmP5C5mFkiIOv04=;
        b=Po1+T5zkVfuRvGBP6H7sZpzeNWHHXxIf58IgQbqDO2//WCvB5wMY3OCJujOvC98mbU
         PyNGwLL9f79Fp0g/9v52WRyVwkLQBgWcx1W68qCVmH9kotnFZp4lWhyVNdlKb2M40Ohh
         1637u+yHOgkuXNAuTmlsIL+PqTVW2jKvUjkpukfvX5T2MvqvdZxiYpTi4I8ekoSZGeiU
         PHXtzEG0udIl9EH6ORZ1pPQ5aW7Jqggmm2sfdekcpsf9yxPDLrdoOnNIkpCGQM2VFkX1
         PdwV+0qY13CctTNhZRLDdkvIB4HveZLqoeMPcJNZ85L85K8+21MDLWODEyWvC4rT4ooR
         Qy4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773285038; x=1773889838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MPSmt+yaVGqHLHpRv6ym/e/BrIWJwmP5C5mFkiIOv04=;
        b=dhClggsj6pZzmB/d+33mjX6ZaNBcpxM68rQeIMeGeFdrhOoir6W9BArSWOHQk6DC7X
         JSE4KOHHk6WxLmsazKD/FG1UvnP4clEyI25UKZJpWtEK5GQRWY3goRdaJZKLXt0fRigB
         qaYTxJb0Lzgu4PwMpH2QR/y7dKUvcw1MeSjvZkzAZvX6Z7WKhhzEMBN8o242r30ayaFs
         s4OhwAnJ4zW5409mnET47HfOulSHY5TfMGQoPOkUI1b7tfDdHhAzEq2pQ2elDmStU3JN
         bxY6Ug4WkLDDLBsEoQweAK+pxJMttZLIhOU+zN0RarC0ClK396pkTIm8U3ujkdF0jmHF
         iVsQ==
X-Forwarded-Encrypted: i=1; AJvYcCXEGIXvc5IcS5Jkz6B0rHqWEITId3lTNNqwWfllLZmw0vM5hrd4h7dNZMOyTkEeHhUsLw4q+DLrXVNyaotxEAhCNYtj@vger.kernel.org
X-Gm-Message-State: AOJu0YwX9h10bBGtn66M4oUEPBGXAhMk0t611l0wOAjbYbvTBDKASW5k
	eGsjsJmo76BoCcP8WZ96c9fiMKNSXyFRU/aFeC1EBkiW3aj74O+6LwwI
X-Gm-Gg: ATEYQzz9lkmhIt2t3rfmlme3MnWSZIiDGW6bF0UcD0ghA6TlLuj7Z7tArNUzIQ43Wrw
	pnFDnHvJ2Fef64YWIwmhh0VxswcEj0fsn6Hcd+X8Cl+DQ/YdyyFeXQRQX48hJjxiV9pNMytotMw
	XWmdwG/RXldjGmojz+2imMTz8jZYD6fbI/HLqmkBFmC2cTk32X5kRH/IjWv46Sseewph4PqUc06
	sdDdlK0nPXhfuYaVBVrFMjZzw+T0JCobcv3tT8pImLauUZYEgj8/V6mer4QZ/3J1BnQXg1LgXWm
	Yrp7bI9yqvaTIgQ8V/bDQHbJo1ixj1TZpj7+q8SmpRSHDBIGrHfNO9plJ87teaJMXimG91SfN/Y
	HPu1DaxVk7ZUnpYzESvFPWYvdvG/CzsGnBl+Ue9TK15UJir0PcXEBXuTC1+6aN/4ACTXDpoKAD/
	/oYjlFTqIAeVTEBKQzC/j+OfKyO/0SpviAde2JxnDuIzuVVOVJUxTsI3Bp2wTlb7NLsXLKOREgr
	3mr
X-Received: by 2002:a05:7022:4597:b0:11d:c91e:3b58 with SMTP id a92af1059eb24-128e784b84emr2187064c88.39.1773285037502;
        Wed, 11 Mar 2026 20:10:37 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be8aa97dcfsm4802495eec.33.2026.03.11.20.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 20:10:37 -0700 (PDT)
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
Subject: [PATCH v4 3/8] platform/x86: lenovo-wmi-other: Add lwmi_attr_id() function
Date: Thu, 12 Mar 2026 03:10:27 +0000
Message-ID: <20260312031032.3467565-4-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260312031032.3467565-1-derekjohn.clark@gmail.com>
References: <20260312031032.3467565-1-derekjohn.clark@gmail.com>
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
v4:
  - Switch from macro to static inline to preserve types.
---
 drivers/platform/x86/lenovo/wmi-gamezone.h |  1 +
 drivers/platform/x86/lenovo/wmi-other.c    | 59 +++++++++++++---------
 2 files changed, 35 insertions(+), 25 deletions(-)

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
index c1728c7c2957..9fff9c1f768c 100644
--- a/drivers/platform/x86/lenovo/wmi-other.c
+++ b/drivers/platform/x86/lenovo/wmi-other.c
@@ -73,10 +73,26 @@
 
 #define LWMI_FAN_DIV 100
 
-#define LWMI_ATTR_ID_FAN_RPM(x)						\
-	(FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, LWMI_DEVICE_ID_FAN) |	\
-	 FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, LWMI_FEATURE_ID_FAN_RPM) |	\
-	 FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, LWMI_FAN_ID(x)))
+/**
+ * lwmi_attr_id() - Formats a capability data attribute ID
+ * @dev_id: The u8 corresponding to the device ID.
+ * @feat_id: The u8 corresponding to the feature ID on the device.
+ * @mode_id: The u8 corresponding to the wmi-gamezone mode for set/get.
+ * @type_id: The u8 corresponding to the sub-device.
+ *
+ * Return: u32.
+ */
+static u32 lwmi_attr_id(u8 dev_id, u8 feat_id, u8 mode_id, u8 type_id)
+{
+	return (FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, dev_id)   |
+		FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, feat_id) |
+		FIELD_PREP(LWMI_ATTR_MODE_ID_MASK, mode_id) |
+		FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, type_id));
+}
+
+#define LWMI_ATTR_ID_FAN_RPM(x)                                   \
+	lwmi_attr_id(LWMI_DEVICE_ID_FAN, LWMI_FEATURE_ID_FAN_RPM, \
+		     LWMI_GZ_THERMAL_MODE_NONE, LWMI_FAN_ID(x))
 
 #define LWMI_OM_FW_ATTR_BASE_PATH "lenovo-wmi-other"
 #define LWMI_OM_HWMON_NAME "lenovo_wmi_other"
@@ -550,6 +566,8 @@ struct tunable_attr_01 {
 	u8 feature_id;
 	u8 device_id;
 	u8 type_id;
+	u8 cd_mode_id; /* mode arg for searching capdata */
+	u8 cv_mode_id; /* mode arg for set/get current_value */
 };
 
 static struct tunable_attr_01 ppt_pl1_spl = {
@@ -715,12 +733,8 @@ static ssize_t attr_capdata01_show(struct kobject *kobj,
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
@@ -775,7 +789,6 @@ static ssize_t attr_current_value_store(struct kobject *kobj,
 	struct wmi_method_args_32 args;
 	struct capdata01 capdata;
 	enum thermal_mode mode;
-	u32 attribute_id;
 	u32 value;
 	int ret;
 
@@ -786,13 +799,10 @@ static ssize_t attr_current_value_store(struct kobject *kobj,
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
 
@@ -803,7 +813,8 @@ static ssize_t attr_current_value_store(struct kobject *kobj,
 	if (value < capdata.min_value || value > capdata.max_value)
 		return -EINVAL;
 
-	args.arg0 = attribute_id;
+	args.arg0 = lwmi_attr_id(tunable_attr->device_id, tunable_attr->feature_id,
+				 tunable_attr->cv_mode_id, tunable_attr->type_id);
 	args.arg1 = value;
 
 	ret = lwmi_dev_evaluate_int(priv->wdev, 0x0, LWMI_FEATURE_VALUE_SET,
@@ -837,7 +848,6 @@ static ssize_t attr_current_value_show(struct kobject *kobj,
 	struct lwmi_om_priv *priv = dev_get_drvdata(tunable_attr->dev);
 	struct wmi_method_args_32 args;
 	enum thermal_mode mode;
-	u32 attribute_id;
 	int retval;
 	int ret;
 
@@ -845,13 +855,12 @@ static ssize_t attr_current_value_show(struct kobject *kobj,
 	if (ret)
 		return ret;
 
-	attribute_id =
-		FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, tunable_attr->device_id) |
-		FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, tunable_attr->feature_id) |
-		FIELD_PREP(LWMI_ATTR_MODE_ID_MASK, mode) |
-		FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, tunable_attr->type_id);
+	/* If "no-mode" is the supported mode, ensure we never send current mode */
+	if (tunable_attr->cv_mode_id == LWMI_GZ_THERMAL_MODE_NONE)
+		mode = tunable_attr->cv_mode_id;
 
-	args.arg0 = attribute_id;
+	args.arg0 = lwmi_attr_id(tunable_attr->device_id, tunable_attr->feature_id,
+				 mode, tunable_attr->type_id);
 
 	ret = lwmi_dev_evaluate_int(priv->wdev, 0x0, LWMI_FEATURE_VALUE_GET,
 				    (unsigned char *)&args, sizeof(args),
-- 
2.53.0

