Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BAD131AA87
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Feb 2026 08:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770970375; cv=none; b=d5Sq29pNAppSdvlqKsRs+M0FmfoDNjG2OQoW35eynynN5IBGNAx5y1f9En0LgQTRrx38GHl62GFG/S9y/1SDIYpSlnh37pwUEe8FrZAYskT+1UUTjU4IdaG4GGegU+pfx/awugT/HuQZeAkxAwTfIPHCva7gjy88doeI1nFWrD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770970375; c=relaxed/simple;
	bh=KdPkHUHHIgp5cMPFy718m0SBxTLs26+2jU02FqTmmpE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z/y0ieF255EBVWqfzt9QE6QjS8+1WV2v39X+ulHXnlg7HhS51emsmhC87K7lR6sWzcqG3eOu6Te7U/RcTk7g4M52c5REbwlN/HPcQAKk4JWTwcGZSFJBEb896Q85uPgYDQvXokTvvNbpiA5qBGbVLX5InRrsD7ngRZMBWLV1zkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d7GfOVNT; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d7GfOVNT"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2ba9c484e5eso700942eec.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 13 Feb 2026 00:12:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770970373; x=1771575173; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WNnTNGaQauNGyuAdgf6YmwFPKlR5RGFWSx3LoZcGKDU=;
        b=d7GfOVNTY8N6hBdcEMRxLBWReh8Qf/9YmFjd1zbmqo0YmDIDkRnOniHtK1TUA4LW27
         Bb+5BuAuZspj01zO82fllQDN0fODktnzct6Sy+y0EC5eGkMc9DgUSGUgERvDi8xa7nDN
         gMoNpOMGmHjn+XTuId8KShkdhH1pb9qgrZ/2v7fgIlxFylfn9UxYy09mnA2fzhKeiFVt
         F5YHEeiWAg4Lm1l4j+ju+921FneLaXnn4akpSz5llfRR/Ze3dCFxX1Ejc6ilxJnH+oNn
         MNF/iQbBAfYxQ6ohFoWl2JC6Qfsdd7qT3d90JD8HjecPtxOo3bUeE0ZtKEocUgLAKCMQ
         8yLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770970373; x=1771575173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WNnTNGaQauNGyuAdgf6YmwFPKlR5RGFWSx3LoZcGKDU=;
        b=FKVxz/h2zvxkns2b2o6FWbBFLul0nAdTXDxtHqsdjfxoweisseLZawoZqvMjOkh3Ox
         gNvMplP/D+plwOZm1fbnW5FIJjyJIagHjlVLn/eDn60cpa3UExIIde73k4ldpeSR794Q
         4QPx3DUERgDJF8aOaR3l64gnGJloeqD9p6eFCYeIQA/yDXDebwGD1IxNGwJ+qRaXDJZl
         Yn88+GGY5X7wG+ocGnXAsRVzVt4SBnsR8Qdb0xl92t3/AMKzNXlw5LYeTj3OAz2haOpt
         F5OIsF/fmhVXpuoJA1TnitPhLQqbKZM/eqev9DvuGuBn4y7OnI/buzkUhpxR1ya0xx5x
         5muA==
X-Forwarded-Encrypted: i=1; AJvYcCX+FeLuqiYyS4Ro3Ac1m4A7Tih53msvkv8qOTO7vCdJ1TaPSBQyl9GOkzZXju4wNvh4cNJmXa/8jXKA0X3F4PdXZOiM@vger.kernel.org
X-Gm-Message-State: AOJu0Ywn9Y/LSv3gZtceIFNnrCDMRrlrpL4Fa0OO/ThL3r/Ln/VbD1H5
	8ApRuJ+7AK8RZiXSi54N6PJB5u9kl0ZuuNYZUOKlVkYtVzD99VbyQecA
X-Gm-Gg: AZuq6aLlTW4UUISoJzNlSx2yxFU5w5klM6u5qT8GAti23OnXKovTeC1yV+9nT2xDCjO
	6+CfP/Vht4NXnswQKGG9s9zEhytIW0OIM6XC0VFrA/ZJQLDNmaSlUQVAON/AlL2cWWBQXX79vVT
	plVaeNwIPoYzMPSYm6mUlFhky2TsOuXhBSerLyuOyCE5t8DZaT+cBddpuDxc1W0/oFFWb7iSO/f
	EMDKDBT/lBm8Lt7m7nKXhaoA+13r1ndRdMm8m/11YCkHMnvvW8B/z1RmUumrXibx75jfWCXN6cb
	sgOJs0mOTUgasPKwVogd9OBVa03AxMKKGOTY/Co2JfOibgVq9po7cKFg+Vk59+YsGIViFHhKGw0
	FwY9bGPX4CsHNK5Lpo1ZJ0wQzxyba6jURDv+z5nT2qFyWa8wptVv0qtzNI0P/E6TiwhL+tZ1roe
	yzWmPpdArjnjUsGdRjX2wXjmpKo/+4W6814MMJ2iZSaRxjckVQu5YZ4Mpy0MRN0MUZ/rhDgRG12
	tI=
X-Received: by 2002:a05:7300:1495:b0:2ba:64c6:2cd7 with SMTP id 5a478bee46e88-2babc4a9bc1mr298161eec.32.1770970373133;
        Fri, 13 Feb 2026 00:12:53 -0800 (PST)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ba9dd0a04csm4975052eec.33.2026.02.13.00.12.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 00:12:52 -0800 (PST)
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
Subject: [PATCH 2/5] platform/x86: lenovo-wmi-other: Limit adding attributes to supported devices
Date: Fri, 13 Feb 2026 08:02:54 +0000
Message-ID: <20260213081243.794288-3-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260213081243.794288-1-derekjohn.clark@gmail.com>
References: <20260213081243.794288-1-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds lwmi_is_attr_01_supported, and only creates the attribute subfolder
if the attribute is supported by the hardware. Due to some poorly
implemented BIOS, this is a multi-step sequence of events. This is
because:
- Some BIOS support getting the capability data from custom mode (0xff),
  while others only support it in no-mode (0x00).
- Similarly, some BIOS support get/set for the current value from custom
  mode (0xff), while others only support it in no-mode (0x00).
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

While adding members to tunable_attr_01, remove unused capdata pointer
and limit size of all ID's to the appropriate size.

Reported-by: Kurt Borja <kuurtb@gmail.com>
Closes: https://lore.kernel.org/platform-driver-x86/DG60P3SHXR8H.3NSEHMZ6J7XRC@gmail.com/
Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
 drivers/platform/x86/lenovo/wmi-other.c | 123 ++++++++++++++++++++----
 1 file changed, 104 insertions(+), 19 deletions(-)

diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x86/lenovo/wmi-other.c
index 559feb49c9f11..f3f12303e3798 100644
--- a/drivers/platform/x86/lenovo/wmi-other.c
+++ b/drivers/platform/x86/lenovo/wmi-other.c
@@ -545,11 +545,12 @@ static void lwmi_om_fan_info_collect_cd_fan(struct device *dev, struct cd_list *
 /* ======== fw_attributes (component: lenovo-wmi-capdata 01) ======== */
 
 struct tunable_attr_01 {
-	struct capdata01 *capdata;
 	struct device *dev;
-	u32 feature_id;
-	u32 device_id;
-	u32 type_id;
+	u8 feature_id;
+	u8 device_id;
+	u8 type_id;
+	u8 cd_mode_id; /* mode arg for searching capdata */
+	u8 cv_mode_id; /* mode arg for set/get current_value */
 };
 
 static struct tunable_attr_01 ppt_pl1_spl = {
@@ -716,7 +717,7 @@ static ssize_t attr_capdata01_show(struct kobject *kobj,
 	int value, ret;
 
 	attribute_id = LWMI_ATTR_ID(tunable_attr->device_id, tunable_attr->feature_id,
-				    LWMI_GZ_THERMAL_MODE_CUSTOM, tunable_attr->type_id);
+				    tunable_attr->cd_mode_id, tunable_attr->type_id);
 
 	ret = lwmi_cd01_get_data(priv->cd01_list, attribute_id, &capdata);
 	if (ret)
@@ -771,7 +772,6 @@ static ssize_t attr_current_value_store(struct kobject *kobj,
 	struct wmi_method_args_32 args;
 	struct capdata01 capdata;
 	enum thermal_mode mode;
-	u32 attribute_id;
 	u32 value;
 	int ret;
 
@@ -782,10 +782,10 @@ static ssize_t attr_current_value_store(struct kobject *kobj,
 	if (mode != LWMI_GZ_THERMAL_MODE_CUSTOM)
 		return -EBUSY;
 
-	attribute_id = LWMI_ATTR_ID(tunable_attr->device_id, tunable_attr->feature_id,
-				    mode, tunable_attr->type_id);
+	args.arg0 = LWMI_ATTR_ID(tunable_attr->device_id, tunable_attr->feature_id,
+				 tunable_attr->cd_mode_id, tunable_attr->type_id);
 
-	ret = lwmi_cd01_get_data(priv->cd01_list, attribute_id, &capdata);
+	ret = lwmi_cd01_get_data(priv->cd01_list, args.arg0, &capdata);
 	if (ret)
 		return ret;
 
@@ -796,7 +796,8 @@ static ssize_t attr_current_value_store(struct kobject *kobj,
 	if (value < capdata.min_value || value > capdata.max_value)
 		return -EINVAL;
 
-	args.arg0 = attribute_id;
+	args.arg0 = LWMI_ATTR_ID(tunable_attr->device_id, tunable_attr->feature_id,
+				 tunable_attr->cv_mode_id, tunable_attr->type_id);
 	args.arg1 = value;
 
 	ret = lwmi_dev_evaluate_int(priv->wdev, 0x0, LWMI_FEATURE_VALUE_SET,
@@ -830,13 +831,16 @@ static ssize_t attr_current_value_show(struct kobject *kobj,
 	struct lwmi_om_priv *priv = dev_get_drvdata(tunable_attr->dev);
 	struct wmi_method_args_32 args;
 	enum thermal_mode mode;
-	int retval;
-	int ret;
+	int retval, ret;
 
 	ret = lwmi_om_notifier_call(&mode);
 	if (ret)
 		return ret;
 
+	/* If "no-mode" is the supported mode, ensure we never send current mode */
+	if (tunable_attr->cv_mode_id == LWMI_GZ_THERMAL_MODE_NONE)
+		mode = tunable_attr->cv_mode_id;
+
 	args.arg0 = LWMI_ATTR_ID(tunable_attr->device_id, tunable_attr->feature_id,
 				 mode, tunable_attr->type_id);
 
@@ -849,6 +853,85 @@ static ssize_t attr_current_value_show(struct kobject *kobj,
 	return sysfs_emit(buf, "%d\n", retval);
 }
 
+/**
+ * lwmi_attr_01_is_supported() - Determine if the given attribute is supported.
+ * @tunable_attr: The attribute to verify.
+ *
+ * First check if the attribute has a corresponding capdata01 table in the cd01
+ * module under the "custom" mode (0xff). If that is not present then check if
+ * there is a corresponding "no-mode" (0x00) entry. If either of those passes,
+ * check capdata->supported for values > 0. If capdata is available, attempt to
+ * determine the set/get mode for the current value property using a similar
+ * pattern. If the value returned by either custom or no-mode is 0, or we get
+ * an error, we assume that mode is not supported. If any of the above checks
+ * fail then the attribute is not fully supported.
+ *
+ * The probed cd_mode_id/cv_mode_id are stored on the tunable_attr for later
+ * reference.
+ *
+ * Return: Support level, or an error code.
+ */
+static int lwmi_attr_01_is_supported(struct tunable_attr_01 *tunable_attr)
+{
+	struct lwmi_om_priv *priv = dev_get_drvdata(tunable_attr->dev);
+	u8 mode = LWMI_GZ_THERMAL_MODE_CUSTOM;
+	struct wmi_method_args_32 args;
+	struct capdata01 capdata;
+	int retval, ret;
+
+	/* Determine tunable_attr->cd_mode_id */
+no_mode_fallback_1:
+	args.arg0 = LWMI_ATTR_ID(tunable_attr->device_id, tunable_attr->feature_id,
+				 mode, tunable_attr->type_id);
+
+	ret = lwmi_cd01_get_data(priv->cd01_list, args.arg0, &capdata);
+	if (ret && mode) {
+		dev_dbg(tunable_attr->dev, "Attribute id %x not supported\n", args.arg0);
+		mode = LWMI_GZ_THERMAL_MODE_NONE;
+		goto no_mode_fallback_1;
+	}
+	if (ret)
+		goto not_supported;
+	if (!capdata.supported) {
+		ret = -EOPNOTSUPP;
+		goto not_supported;
+	}
+
+	tunable_attr->cd_mode_id = mode;
+
+	/* Determine tunable_attr->cv_mode_id */
+	mode = LWMI_GZ_THERMAL_MODE_CUSTOM;
+no_mode_fallback_2:
+	args.arg0 = LWMI_ATTR_ID(tunable_attr->device_id, tunable_attr->feature_id,
+				 mode, tunable_attr->type_id);
+
+	ret = lwmi_dev_evaluate_int(priv->wdev, 0x0, LWMI_FEATURE_VALUE_GET,
+				    (unsigned char *)&args, sizeof(args),
+				    &retval);
+	if ((ret && mode) || (!retval && mode)) {
+		dev_dbg(tunable_attr->dev, "Attribute id %x not supported\n", args.arg0);
+		mode = LWMI_GZ_THERMAL_MODE_NONE;
+		goto no_mode_fallback_2;
+	}
+	if (ret)
+		goto not_supported;
+	if (retval == 0) {
+		ret = -EOPNOTSUPP;
+		goto not_supported;
+	}
+
+	tunable_attr->cv_mode_id = mode;
+	dev_dbg(tunable_attr->dev, "cd_mode_id: %02x%02x%02x%02x, cv_mode_id: %#08x attribute support level: %x\n",
+		tunable_attr->device_id, tunable_attr->feature_id, tunable_attr->cd_mode_id,
+		tunable_attr->type_id, args.arg0, capdata.supported);
+
+	return capdata.supported;
+
+not_supported:
+	dev_dbg(tunable_attr->dev, "Attribute id %x not supported\n", args.arg0);
+	return ret;
+}
+
 /* Lenovo WMI Other Mode Attribute macros */
 #define __LWMI_ATTR_RO(_func, _name)                                  \
 	{                                                             \
@@ -972,19 +1055,21 @@ static int lwmi_om_fw_attr_add(struct lwmi_om_priv *priv)
 	}
 
 	for (i = 0; i < ARRAY_SIZE(cd01_attr_groups) - 1; i++) {
-		err = sysfs_create_group(&priv->fw_attr_kset->kobj,
-					 cd01_attr_groups[i].attr_group);
-		if (err)
-			goto err_remove_groups;
-
 		cd01_attr_groups[i].tunable_attr->dev = &priv->wdev->dev;
+		if (lwmi_attr_01_is_supported(cd01_attr_groups[i].tunable_attr) > 0) {
+			err = sysfs_create_group(&priv->fw_attr_kset->kobj,
+						 cd01_attr_groups[i].attr_group);
+			if (err)
+				goto err_remove_groups;
+		}
 	}
 	return 0;
 
 err_remove_groups:
 	while (i--)
-		sysfs_remove_group(&priv->fw_attr_kset->kobj,
-				   cd01_attr_groups[i].attr_group);
+		if (lwmi_attr_01_is_supported(cd01_attr_groups[i].tunable_attr) > 0)
+			sysfs_remove_group(&priv->fw_attr_kset->kobj,
+					   cd01_attr_groups[i].attr_group);
 
 	kset_unregister(priv->fw_attr_kset);
 
-- 
2.52.0

