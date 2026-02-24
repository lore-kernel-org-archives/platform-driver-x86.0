Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD1D1A38F9
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Feb 2026 04:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771907530; cv=none; b=JUoT7fLuku+/CLhRlW3rwf3oVwXi3H+zuSdytAMWHNwemxHP7SpTo/O71ClSGpFEniwj8fXNzQIzBjN5k2jzGW6L2qP35WX6Zq4JM4uG8iq2CU36TPy5PlIMOoWAkLzJb7eOSBJACgAvvKiIRAfjDs3QxRG/ECqtTsbXvrHs65A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771907530; c=relaxed/simple;
	bh=GRWHAjsDZQLJvOahwj/eKOpyw5l4+67wzGbbkgCj/5I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KssP7z1sNMKey1execkf3p1YAG9VOKfD/TSca5BmcGF/+2xsyeVNBF5iFVKBk6I2Knc8BLxam0ZkWCQh2uVbqqB97NgoXbdS/r761BQTa2XH0eJtpmxLj5cjFeiBBNcxdC8zcrAZq7jXdgf56QJuoVT2sTfgvsrB/KgylySbL1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xi40oL7S; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xi40oL7S"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-12713e56abdso3383856c88.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 23 Feb 2026 20:32:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771907528; x=1772512328; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HILna4J1JaHWKh8vgw8UaORe+PQkERxPpDpgU+CN4GE=;
        b=Xi40oL7SqavdzaORV/Mm4GDXgTQwQ8G/OaRMj2eI1AAn57XcwuGPCtJTt0JhV6PLvy
         JVbGK/eRg07ku8cLnO9VZyxFBZ/23mUERjWd3KWFukDqRF5CuDiCIohFNYR26sOUKFgL
         7tF0MNKCVP9obNpGGbIUTIpq4P7IxOQjmc4aYVTVLOoyh8z+GFoo9EYXHj1XwQ7LxlHQ
         ALYgZ3dDJC6idQ3N2RDThnn9DLUGz3lVjKOcze/rDhlUtO6AG1egeWC+P60ZpZ1bScZT
         FGtPTFMBKu6Rz6TIlWP7iD/GJVrEXZyX43BYeONPBHGH7KAHF28TE7B6p0ODBEYrq933
         KQww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771907528; x=1772512328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HILna4J1JaHWKh8vgw8UaORe+PQkERxPpDpgU+CN4GE=;
        b=dSEt15Q7z1f2IyKQE4Ew7KA1I8/y5OdzK35kyEBCmwX0k20JraPE8TkyMA+kH7aVSu
         QC6xsLHFAEACf0ZBaM/gIhdgRFAdoWV/QL1Q2KIzuLhFdfRR9Ph6EQpTfeI2svli2y1H
         Yp8UeNArdaayMju0jvRQ0QZzUV5o5Jad9jc1DtdWtkSuXTkz/QJNfe1DnV7IdWKkXccS
         jN+vvuxJwT7nhScB535cvGfeKjK3RzAhsj0Em7o/BlkYCGqDxJ3JssKKBKcnpJe20my9
         /lwyEj8owHd0Ee9YR0sY0wDd7HrVkBMFmjxCpAoosWdLw5r6szpw97Ojtt/kcoIFuiMP
         9L7A==
X-Forwarded-Encrypted: i=1; AJvYcCWMx6baqVme0b25066FI9yjwzplgdgu33IGvq8i3gk/4K7BSlRNBnSTRdr7EiG8VGNGiY0tI9/8IF3UCWMImM83Hw2j@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5bgZXJQuQdG4w/NuX8HsXaRh/6k0rp6MJquvOas+sA66qo1KA
	J+MFaT8f4k/PF4s7QExKkW+iedOnHIp2GqNNpPiBjxPp94YaEzLlZXFL
X-Gm-Gg: AZuq6aJRVetrD6h1wNQA0Tz/h35pXb40Y4aRQvFujNBrgxafQkLVRMJMLyQSPVkLoiY
	jkC9bgMgdX4MGtGLcKBwpTQVAM+4O8eQHNLJcNlLjRVx41l+1O6DpxbVZzD+IOJ9xh8byW1k3Yn
	dqLWZUfDtjSCRzoiLQEdeNhz18aPBgCT4HbbhIvgImKSM6MPiMgD1M6hjf+uzz75chjs1J3AIx6
	QElFbeG2oMFH28c+nnArnCezQjNNS3RxbWPNUQtRCme8JoS7hm0LDuwxEK9Ah3bGCGyZlaxm4fa
	UpPMz+cdU2bsNMDVRvbb/dUYe+u4rLMpHQu0Nj6UiptZPB9O3GkKDxC1lnC74QJSk1cbtK6xUtL
	wJrL7uE1b1T4OXEDeb6aBeHsuReswn/vJLHn+i4kmGeY7zSvHCH2vycE7NZES1KGuwIbgADWg9Z
	NQo6epiuxk6ciWREPhS/SFXMWoLwqXWjZASLlPyACXRd1w1IdwhpWf/efV353jK4yTQSEayvVhO
	fI=
X-Received: by 2002:a05:7022:24a1:b0:121:d898:edae with SMTP id a92af1059eb24-1276abe9cacmr3849560c88.24.1771907528435;
        Mon, 23 Feb 2026 20:32:08 -0800 (PST)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1276af7b4c7sm9607887c88.9.2026.02.23.20.32.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 20:32:08 -0800 (PST)
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
Subject: [PATCH v3 2/6] platform/x86: lenovo-wmi-other: Limit adding attributes to supported devices
Date: Tue, 24 Feb 2026 04:31:56 +0000
Message-ID: <20260224043200.2680384-3-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260224043200.2680384-1-derekjohn.clark@gmail.com>
References: <20260224043200.2680384-1-derekjohn.clark@gmail.com>
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

Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Reported-by: Kurt Borja <kuurtb@gmail.com>
Closes: https://lore.kernel.org/platform-driver-x86/DG60P3SHXR8H.3NSEHMZ6J7XRC@gmail.com/
Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
 drivers/platform/x86/lenovo/wmi-other.c | 117 +++++++++++++++++++++---
 1 file changed, 102 insertions(+), 15 deletions(-)

diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x86/lenovo/wmi-other.c
index 95886df39c8d..f3f12303e379 100644
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
@@ -782,7 +783,7 @@ static ssize_t attr_current_value_store(struct kobject *kobj,
 		return -EBUSY;
 
 	args.arg0 = LWMI_ATTR_ID(tunable_attr->device_id, tunable_attr->feature_id,
-				 mode, tunable_attr->type_id);
+				 tunable_attr->cd_mode_id, tunable_attr->type_id);
 
 	ret = lwmi_cd01_get_data(priv->cd01_list, args.arg0, &capdata);
 	if (ret)
@@ -795,6 +796,8 @@ static ssize_t attr_current_value_store(struct kobject *kobj,
 	if (value < capdata.min_value || value > capdata.max_value)
 		return -EINVAL;
 
+	args.arg0 = LWMI_ATTR_ID(tunable_attr->device_id, tunable_attr->feature_id,
+				 tunable_attr->cv_mode_id, tunable_attr->type_id);
 	args.arg1 = value;
 
 	ret = lwmi_dev_evaluate_int(priv->wdev, 0x0, LWMI_FEATURE_VALUE_SET,
@@ -828,13 +831,16 @@ static ssize_t attr_current_value_show(struct kobject *kobj,
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
 
@@ -847,6 +853,85 @@ static ssize_t attr_current_value_show(struct kobject *kobj,
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
@@ -970,19 +1055,21 @@ static int lwmi_om_fw_attr_add(struct lwmi_om_priv *priv)
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

