Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 295FD2E0925
	for <platform-driver-x86@vger.kernel.org>; Sun, 10 May 2026 04:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778387164; cv=none; b=ERv7WUZnjGYNz8zPStZi1UGjx0t8VxKuv7FjtKCXnS5fSKO9W2K96RUQObPk+F42zi50n9ZsuVKzGSrHa7GvwofKMWm2wIk0WfFPYsBOxDkX6L+3hOVsgo48zlIqyZyyGKBL7IZ55Lf9acU6f4ZtfGUikA1oEhv7Gjq+moHsR9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778387164; c=relaxed/simple;
	bh=wrZCEpxGJ1HrG+ZmPhbTEh8zz+vUelD8MO2uqSqDolI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TSKmaxYDor0fewMiHmCnTOMg1zNT86HaFAZL0wIOlDRMtI99voTfXqMVc/tz/KHMwxFKxoUoFfScurgxsVl2nTVvHNd2RE0/uuc33/8qTWqq917xzNMMmVe9yLZFfc7SMowfUWsquZLOFPPeMX4RszyfGTd1KLutwS6TQZSF2X4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DJMFxTz2; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DJMFxTz2"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2f3c623322bso5361462eec.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 09 May 2026 21:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778387157; x=1778991957; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iMjJCm7j0mrZhLPBJddnmVOHTjp+7AQzabv6smV3XbA=;
        b=DJMFxTz2QGIAI/qxnYg1VdzC93EXAhC9Q+3oEVguYL6z/qe/QxL51h0L/5wNTUauvL
         FWlciqObmPDdj/SlOQvrMet41vyTg/+15l+VHUb3Aq0oH0gpkQ4ogw3wOXrhvJeTvTI8
         KoJRlNo87eTiwOa83hu9hA1rHs3VVbe8PSQEm88QvfKIxgG4DHt2Z+tSfFCRmYfj/nAe
         8ZWJj9vwJFftQ5TVKszdphNUB9ZjjfnYmHrhvJSbPNrLJaU2Gryd+fS1Bm9WzNmXlgrv
         wH//+2NZ54OUX2akOOewm+eHeCNT33bQ0uJKsuhXAj1J3zt1xJtZYYATXKDeqlxXx5tb
         aPrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778387157; x=1778991957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iMjJCm7j0mrZhLPBJddnmVOHTjp+7AQzabv6smV3XbA=;
        b=JPasoyCYkyqltY10AfytsYgmWHd0TQ23BXH3J2y+4M8f6Z/tlpcjn6ByJRx+YpQ/Ge
         wc46rdtR8GR2iPxzivyJjxmhrzxlwPg15TYAxE8j9YqCthl/U1Yh94xHKlqQCvoNreyA
         zidK8fdC7ttujKycNe5QZfc6c/ECOgGVy17V5JGv664ncc5yDR5r5EebYn3/Po9egjJJ
         xHksSbLYf7pWco3wEaj6cW5Kb0gJzaOqzpJjQ4vIpBg4DP8868AMa8t8KDh9zkuPIoxZ
         Xd4LB4GGVkDQOxtFmFC2K9gZguIQ9xKKjMVUZr9YmUsJCLpBciVr8POJ6YWQ8uM2eyJo
         V3Dw==
X-Forwarded-Encrypted: i=1; AFNElJ+pRY7hvs/RrrV7ukLI2oamESlHmfAArtojR4WAAVgxNSyfj1tmwdY5zR7Xwa6I1CM9UQ/bMQb15MxECZWBjKcPwWfN@vger.kernel.org
X-Gm-Message-State: AOJu0YxVgQ+2jA/nMjkmKvWiIu7fUJany/4zprRbWRD0Bchbubc8XVTg
	dqpA9HbbT0GiJN1PScRCyiiwI8RNYgrb+ddCN8ZQyKg5xf2+0q9bkYSd
X-Gm-Gg: Acq92OG2XcPEf0VWBkjtn0ug9g37L4VTGF+NVN1rIqr5dzlmyn5G5bq3lKeCMPsmse9
	NL5g5TngNPzDajDSN2qdhKr3K5oTgxKEmbJ4O0Zt2S/zvl55EZUSc1i/rDHe/t4St9SeZpXrQJu
	b5bX3PYBvVzuvB7qp41dkGFpsT1nam/qJF8QPjgvH/Sxn8CHvSRyshWhepVXJCxdKqdJ8voPyed
	8IKzq7vCgrRSt75w/vKE+sAUkq/dIwOaaf/TAD5zx+cE3ZSwZ8UJ73Pk2gOM+bOu7dec5Z83YOh
	IHY1E2pm2ah64PXNLQ5u5/vLJ3TFEXq0SWm8mMneHvCAuKqiDmSRyz3LzSkFmm31XaD2Fb78/87
	jYs04FL/kWPumAxljd3H02hBn6q1dUfsEILSqb7ghxk63hLu6ProiNrrqFgqoLx9d7gdpWOBVof
	WyGmwEjt+l55AP118TBw/6GEKd8QY3dYRyQMgDCPy83EqwOk/61Gwtb2QypwtT+VSDohoRQWhlb
	TYB7Rjx31L3S48=
X-Received: by 2002:a05:7301:6790:b0:2de:c5ca:c1f3 with SMTP id 5a478bee46e88-2f54ad72101mr8973026eec.4.1778387156999;
        Sat, 09 May 2026 21:25:56 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8862d3047sm10069960eec.10.2026.05.09.21.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 21:25:56 -0700 (PDT)
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
Subject: [PATCH v12 09/16] platform/x86: lenovo-wmi-other: Limit adding attributes to supported devices
Date: Sun, 10 May 2026 04:25:39 +0000
Message-ID: <20260510042546.436874-10-derekjohn.clark@gmail.com>
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

Adds lwmi_is_attr_01_supported, and only creates the attribute subfolder
if the attribute is supported by the hardware. Due to some poorly
implemented BIOS this is a multi-step sequence of events. This is
because:
- Some BIOS support getting the capability data from custom mode (0xff),
  while others only support it in no-mode (0x00).
- Some BIOS support get/set for the current value from custom mode (0xff),
  while others only support it in no-mode (0x00).
- Some BIOS report capability data for a method that is not fully
  implemented.
- Some BIOS have methods fully implemented, but no complimentary
  capability data.

To ensure we only expose fully implemented methods with corresponding
capability data, we check each outcome before reporting that an
attribute can be supported.

Checking for lwmi_is_attr_01_supported during remove is not done to
ensure that we don't attempt to call cd01 or send WMI events if one of
the interfaces being removed was the cause of the driver unloading.

Fixes: edc4b183b794 ("platform/x86: Add Lenovo Other Mode WMI Driver")
Reported-by: Kurt Borja <kuurtb@gmail.com>
Closes: https://lore.kernel.org/platform-driver-x86/DG60P3SHXR8H.3NSEHMZ6J7XRC@gmail.com/
Cc: stable@vger.kernel.org
Reviewed-by: Rong Zhang <i@rong.moe>
Tested-by: Rong Zhang <i@rong.moe>
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
v12:
  - Reword lwmi_is_attr_01_supported kerneldoc text block.
  - Fix formatting in lwmi_is_attr_01_supported.
  - Use correct type cast when passing args in new funciton.
v11:
  - Also use cd_mode_id in attr_capdata_show.
v7:
  - Move earlier in the series. This required dropping the use of
    lwmi_attr_id as it will be added later.
  - Add missing switch between cd_mode_id and cv_mode_id in
    current_value_store.
v6:
  - Zero initialize args in lwmi_is_attr_01_supported.
  - Fix formatting.
v5:
  - Move cv/cd_mode_id refrences from path 3/4.
  - Add missing import for ARRAY_SIZE.
  - Make lwmi_is_attr_01_supported return bool instead of u32.
  - Various formatting fixes.
v4:
  - Use for loop instead of backtrace gotos for checking if an attribute
    is supported.
  - Add include for dev_printk.
  - Wrap dev_dbg in lwmi_is_attr_01_supported earlier.
  - Don't use symmetric cleanup of attributes in error states.
---
 drivers/platform/x86/lenovo/wmi-other.c | 92 +++++++++++++++++++++++--
 1 file changed, 88 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x86/lenovo/wmi-other.c
index 4da0da8459c7..e6834dec2381 100644
--- a/drivers/platform/x86/lenovo/wmi-other.c
+++ b/drivers/platform/x86/lenovo/wmi-other.c
@@ -542,6 +542,8 @@ struct tunable_attr_01 {
 	u8 feature_id;
 	u8 device_id;
 	u8 type_id;
+	u8 cd_mode_id; /* mode arg for searching capdata */
+	u8 cv_mode_id; /* mode arg for set/get current_value */
 };
 
 /**
@@ -623,7 +625,7 @@ static ssize_t attr_capdata01_show(struct kobject *kobj,
 	u32 attribute_id;
 	int value, ret;
 
-	attribute_id = tunable_attr_01_id(tunable_attr, LWMI_GZ_THERMAL_MODE_CUSTOM);
+	attribute_id = tunable_attr_01_id(tunable_attr, tunable_attr->cd_mode_id);
 
 	ret = lwmi_cd01_get_data(priv->cd01_list, attribute_id, &capdata);
 	if (ret)
@@ -688,7 +690,7 @@ static ssize_t attr_current_value_store(struct kobject *kobj,
 	if (mode != LWMI_GZ_THERMAL_MODE_CUSTOM)
 		return -EBUSY;
 
-	args.arg0 = tunable_attr_01_id(tunable_attr, mode);
+	args.arg0 = tunable_attr_01_id(tunable_attr, tunable_attr->cd_mode_id);
 
 	ret = lwmi_cd01_get_data(priv->cd01_list, args.arg0, &capdata);
 	if (ret)
@@ -701,6 +703,7 @@ static ssize_t attr_current_value_store(struct kobject *kobj,
 	if (value < capdata.min_value || value > capdata.max_value)
 		return -EINVAL;
 
+	args.arg0 = tunable_attr_01_id(tunable_attr, tunable_attr->cv_mode_id);
 	args.arg1 = value;
 
 	ret = lwmi_dev_evaluate_int(priv->wdev, 0x0, LWMI_FEATURE_VALUE_SET,
@@ -741,6 +744,10 @@ static ssize_t attr_current_value_show(struct kobject *kobj,
 	if (ret)
 		return ret;
 
+	/* If "no-mode" is the supported mode, ensure we never send current mode */
+	if (tunable_attr->cv_mode_id == LWMI_GZ_THERMAL_MODE_NONE)
+		mode = tunable_attr->cv_mode_id;
+
 	args.arg0 = tunable_attr_01_id(tunable_attr, mode);
 
 	ret = lwmi_dev_evaluate_int(priv->wdev, 0x0, LWMI_FEATURE_VALUE_GET,
@@ -752,6 +759,81 @@ static ssize_t attr_current_value_show(struct kobject *kobj,
 	return sysfs_emit(buf, "%d\n", retval);
 }
 
+/**
+ * lwmi_attr_01_is_supported() - Determine if the given attribute is supported.
+ * @tunable_attr: The attribute to verify.
+ *
+ * For an attribute to be supported it must have a functional get/set method,
+ * as well as associated capability data stored in the capdata01 table.
+ *
+ * First check if the attribute has a corresponding data table under custom mode
+ * (0xff), then under no mode (0x00). If either of those passes, check if the
+ * supported field of the capdata struct is > 0. If it is supported, store the
+ * successful mode in the cd_mode_id field of tunable_attr.
+ *
+ * If the attribute capdata shows it is supported, attempt to determine the mode
+ * for the current value property get/set methods using a similar pattern to the
+ * capdata table check. If the value returned by either mode is 0 or an error,
+ * assume that mode is not supported. Otherwise, store the successful mode in the
+ * cv_mode_id field of tunable_attr.
+ *
+ * If any of the above checks fail then the attribute is not fully supported.
+ *
+ * Return: true if capdata and set/get modes are found, otherwise false.
+ */
+static bool lwmi_attr_01_is_supported(struct tunable_attr_01 *tunable_attr)
+{
+	u8 modes[2] = { LWMI_GZ_THERMAL_MODE_CUSTOM, LWMI_GZ_THERMAL_MODE_NONE };
+	struct lwmi_om_priv *priv = dev_get_drvdata(tunable_attr->dev);
+	struct wmi_method_args_32 args = {};
+	bool cd_mode_found = false;
+	bool cv_mode_found = false;
+	struct capdata01 capdata;
+	int retval, ret, i;
+
+	/* Determine tunable_attr->cd_mode_id */
+	for (i = 0; i < ARRAY_SIZE(modes); i++) {
+		args.arg0 = tunable_attr_01_id(tunable_attr, modes[i]);
+
+		ret = lwmi_cd01_get_data(priv->cd01_list, args.arg0, &capdata);
+		if (ret || !capdata.supported)
+			continue;
+
+		tunable_attr->cd_mode_id = modes[i];
+		cd_mode_found = true;
+		break;
+	}
+
+	if (!cd_mode_found)
+		return cd_mode_found;
+
+	dev_dbg(tunable_attr->dev,
+		"cd_mode_id: %#010x\n", args.arg0);
+
+	/* Determine tunable_attr->cv_mode_id, returns 1 if supported */
+	for (i = 0; i < ARRAY_SIZE(modes); i++) {
+		args.arg0 = tunable_attr_01_id(tunable_attr, modes[i]);
+
+		ret = lwmi_dev_evaluate_int(priv->wdev, 0x0, LWMI_FEATURE_VALUE_GET,
+					    (u8 *)&args, sizeof(args),
+					    &retval);
+		if (ret || !retval)
+			continue;
+
+		tunable_attr->cv_mode_id = modes[i];
+		cv_mode_found = true;
+		break;
+	}
+
+	if (!cv_mode_found)
+		return cv_mode_found;
+
+	dev_dbg(tunable_attr->dev, "cv_mode_id: %#010x, attribute support level: %#010x\n",
+		args.arg0, capdata.supported);
+
+	return capdata.supported > 0;
+}
+
 /* Lenovo WMI Other Mode Attribute macros */
 #define __LWMI_ATTR_RO(_func, _name)                                  \
 	{                                                             \
@@ -875,12 +957,14 @@ static void lwmi_om_fw_attr_add(struct lwmi_om_priv *priv)
 	}
 
 	for (i = 0; i < ARRAY_SIZE(cd01_attr_groups) - 1; i++) {
+		cd01_attr_groups[i].tunable_attr->dev = &priv->wdev->dev;
+		if (!lwmi_attr_01_is_supported(cd01_attr_groups[i].tunable_attr))
+			continue;
+
 		err = sysfs_create_group(&priv->fw_attr_kset->kobj,
 					 cd01_attr_groups[i].attr_group);
 		if (err)
 			goto err_remove_groups;
-
-		cd01_attr_groups[i].tunable_attr->dev = &priv->wdev->dev;
 	}
 	return;
 
-- 
2.53.0

