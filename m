Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A20DF35F5FB
	for <platform-driver-x86@vger.kernel.org>; Thu,  2 Apr 2026 03:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775100275; cv=none; b=MV45Iq7t4rvs7C5GV1UNkjyhhS7yI6V0ttgufem4xuTr+oApCXtAMPd0S1bAUxoHDMi26Vuq0ZvPGZJCC1XtcwxFXdD6zIdtTjh/jNbBoa0oGYowfiwmRivNlim1rnCYgvepe9vMyYWclwj5C7/b4bZoxyx4L/XyJx5TjjCGu98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775100275; c=relaxed/simple;
	bh=bXzCjIcapy1IgU2Cyvj/zIULNmtq90aV6y8VdButOUw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g5Ve3MGOOCai1Im9oNXCQIzCA+dpMAZ6G2N/+S1z91Hzg6qtyg+gUHvdiN6hWtLhldZIIlSF8Co6VrcIQi5JQZet/0jrm54JpdIXnfXlTfyU9oRIFLgSqimCjQzNCYvCexumF/rP/cEyd/03lBP9nPq3q8WIdlagmm4tqPJ4UFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p3rL7hnv; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p3rL7hnv"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2c66eafc1easo928159eec.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 01 Apr 2026 20:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775100272; x=1775705072; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7vq+xJhjvZJp46ut7S8v+Qz3a1iucTdFdMZuE5J9yuQ=;
        b=p3rL7hnvOlh192Icplorl3mc/ugZXKICYnPt+wql8MNVyhKURHVGx6MLZNaX+v5dIj
         lBSrHqwHrkF/oVM8CFiNLBKI7N3LkxmjBA8uRQEZ/GK8c2eXuH4C3oQgullrxHg48epe
         8cWkUt8B4ekbpmzegU0ov08JIcfiISF/QYsD3Ui6n5UQoWgW6VusD8PaWXyXVcYd+xZV
         jrwlXdbbdrMw4zjV7dmVXD897pmEslRmTOctLpn/SgaGVM4QrdoT3Pdhb86MUnX9K77W
         b1FUqUcpFtmIyaqrkubMZuqxKgNOz+qHa/sncOLrvqhodNl2EKkitUpi/2NgkiqgxrtW
         8DkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775100272; x=1775705072;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7vq+xJhjvZJp46ut7S8v+Qz3a1iucTdFdMZuE5J9yuQ=;
        b=MbZAVc+31Na1r1p62rXvqNfWjYJhYbOjY8QJlfGNqoeC71IA3BN7uRC2mQ/pw9ytsz
         Ai+jGPG8V7LvJJb/smGNrrDK70vG7ip6LUpvTOHHOShy0Tyvp9ThzqekYHidjky1x4Nb
         QCPCCVX2jRGmKTvzvMlcnSTOEYgNm8xm7fCkcM2u9LLkLP/SqAdQqhXdLJkiGasnGxhZ
         AxzETuHbfMDYSk7UNxb4RU9KeEqEPVRkpgFcemReDbbZbsnpirOBhxvoyY7oFnnEsfkD
         R7qFqbFBVKM/UTiAyeUiZGojbYafl5VsQOb3csMZeTdjEy5VamPUl3gwD/C8GGRmA22u
         85Kw==
X-Forwarded-Encrypted: i=1; AJvYcCUbSZw7iuEdge3MiGbWFGG/lKBSWi2GxpdA5F61FHfmLC5enEv/xCvkcPOKdbLgupY5enaebrJlqBCw8+WlS7I/i1pC@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/r3q5Vz/StEdBdufbrmuYAK5lCBCeUsaHtBB6G+r8jPIPyNys
	eIGWALxeJwcnx0N6LKXgv+BvR1v8+P63wnd51dh5FBeRksOCysQRcU5j
X-Gm-Gg: ATEYQzzehO1XyuOj9ff/HqOOXGU4dcdOQl0a8v5dAdH6HX0EeB6uaTQMe3FXKr9Sh41
	NyDvHlJ76YQRSbCJp14pIkxVP4t7/Vop95dEFft2j5Ds1a3/o4gGaeP3yksrts226rjAEibIPHC
	SZ6KYI6q/3v/RpKzWP5WDQBUKAG5L9MFYFci1zNg0IUrWh6WWmeThvn+0yIwCt3bEFp4UXqo2dE
	6GwjefYlX4SBATMv9PQAFLJoyrKICiX2opx8EO0+0iok0hNFatKgZvfQujGBkeQMArCN0t7QFn1
	VuKHVJbJySpzUEmchdCKjkDgjNke2ziZJTrG5ak72aQrxBBs11AFpTd/bE9Qb6j3wsOlKN0YcZg
	FVNIgRIL/xYB5C2VqcpYtDkHLcVPBaW2YhEdCyDQ618UMm9aKPZ15+aO32FWTF/spLyUxnMbs0D
	Csp9Gh3fVjX+30rhM4kq6kxiRLltrFncHAiyfiYINkE7NogZqxzfYS7xPwwHY1w9dowzmows/8u
	B1Q
X-Received: by 2002:a05:7301:6781:b0:2c1:7b61:8731 with SMTP id 5a478bee46e88-2c930e6c1eamr3081064eec.10.1775100271525;
        Wed, 01 Apr 2026 20:24:31 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca7cae9e9esm1265981eec.23.2026.04.01.20.24.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 20:24:31 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v7 06/16] platform/x86: lenovo-wmi-other: Limit adding attributes to supported devices
Date: Thu,  2 Apr 2026 03:24:14 +0000
Message-ID: <20260402032424.678528-7-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260402032424.678528-1-derekjohn.clark@gmail.com>
References: <20260402032424.678528-1-derekjohn.clark@gmail.com>
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
 drivers/platform/x86/lenovo/wmi-gamezone.h |   1 +
 drivers/platform/x86/lenovo/wmi-other.c    | 114 ++++++++++++++++++---
 2 files changed, 98 insertions(+), 17 deletions(-)

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
index 0e8a69309ec4..3e7dfe94499b 100644
--- a/drivers/platform/x86/lenovo/wmi-other.c
+++ b/drivers/platform/x86/lenovo/wmi-other.c
@@ -550,6 +550,8 @@ struct tunable_attr_01 {
 	u8 feature_id;
 	u8 device_id;
 	u8 type_id;
+	u8 cd_mode_id; /* mode arg for searching capdata */
+	u8 cv_mode_id; /* mode arg for set/get current_value */
 };
 
 static struct tunable_attr_01 ppt_pl1_spl = {
@@ -775,7 +777,6 @@ static ssize_t attr_current_value_store(struct kobject *kobj,
 	struct wmi_method_args_32 args = {};
 	struct capdata01 capdata;
 	enum thermal_mode mode;
-	u32 attribute_id;
 	u32 value;
 	int ret;
 
@@ -786,13 +787,12 @@ static ssize_t attr_current_value_store(struct kobject *kobj,
 	if (mode != LWMI_GZ_THERMAL_MODE_CUSTOM)
 		return -EBUSY;
 
-	attribute_id =
-		FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, tunable_attr->device_id) |
-		FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, tunable_attr->feature_id) |
-		FIELD_PREP(LWMI_ATTR_MODE_ID_MASK, mode) |
-		FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, tunable_attr->type_id);
+	args.arg0 = FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, tunable_attr->device_id) |
+		    FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, tunable_attr->feature_id) |
+		    FIELD_PREP(LWMI_ATTR_MODE_ID_MASK, tunable_attr->cd_mode_id) |
+		    FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, tunable_attr->type_id);
 
-	ret = lwmi_cd01_get_data(priv->cd01_list, attribute_id, &capdata);
+	ret = lwmi_cd01_get_data(priv->cd01_list, args.arg0, &capdata);
 	if (ret)
 		return ret;
 
@@ -803,7 +803,10 @@ static ssize_t attr_current_value_store(struct kobject *kobj,
 	if (value < capdata.min_value || value > capdata.max_value)
 		return -EINVAL;
 
-	args.arg0 = attribute_id;
+	args.arg0 = FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, tunable_attr->device_id) |
+		    FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, tunable_attr->feature_id) |
+		    FIELD_PREP(LWMI_ATTR_MODE_ID_MASK, tunable_attr->cv_mode_id) |
+		    FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, tunable_attr->type_id);
 	args.arg1 = value;
 
 	ret = lwmi_dev_evaluate_int(priv->wdev, 0x0, LWMI_FEATURE_VALUE_SET,
@@ -837,7 +840,6 @@ static ssize_t attr_current_value_show(struct kobject *kobj,
 	struct lwmi_om_priv *priv = dev_get_drvdata(tunable_attr->dev);
 	struct wmi_method_args_32 args = {};
 	enum thermal_mode mode;
-	u32 attribute_id;
 	int retval;
 	int ret;
 
@@ -845,13 +847,14 @@ static ssize_t attr_current_value_show(struct kobject *kobj,
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
+	args.arg0 = FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, tunable_attr->device_id) |
+		    FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, tunable_attr->feature_id) |
+		    FIELD_PREP(LWMI_ATTR_MODE_ID_MASK, mode) |
+		    FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, tunable_attr->type_id);
 
 	ret = lwmi_dev_evaluate_int(priv->wdev, 0x0, LWMI_FEATURE_VALUE_GET,
 				    (unsigned char *)&args, sizeof(args),
@@ -862,6 +865,81 @@ static ssize_t attr_current_value_show(struct kobject *kobj,
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
+ * Return: bool.
+ */
+static bool lwmi_attr_01_is_supported(struct tunable_attr_01 *tunable_attr)
+{
+	u8 modes[2] = { LWMI_GZ_THERMAL_MODE_CUSTOM, LWMI_GZ_THERMAL_MODE_NONE };
+	struct lwmi_om_priv *priv = dev_get_drvdata(tunable_attr->dev);
+	struct wmi_method_args_32 args = { 0x0, 0x0 };
+	bool cd_mode_found = false;
+	bool cv_mode_found = false;
+	struct capdata01 capdata;
+	int retval, ret, i;
+
+	/* Determine tunable_attr->cd_mode_id*/
+	for (i = 0; i < ARRAY_SIZE(modes); i++) {
+		args.arg0 = FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, tunable_attr->device_id) |
+			    FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, tunable_attr->feature_id) |
+			    FIELD_PREP(LWMI_ATTR_MODE_ID_MASK, modes[i]) |
+			    FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, tunable_attr->type_id);
+
+		ret = lwmi_cd01_get_data(priv->cd01_list, args.arg0, &capdata);
+		if (ret || !capdata.supported)
+			continue;
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
+	/* Determine tunable_attr->cv_mode_id, returns 1 if supported*/
+	for (i = 0; i < ARRAY_SIZE(modes); i++) {
+		args.arg0 = FIELD_PREP(LWMI_ATTR_DEV_ID_MASK, tunable_attr->device_id) |
+			    FIELD_PREP(LWMI_ATTR_FEAT_ID_MASK, tunable_attr->feature_id) |
+			    FIELD_PREP(LWMI_ATTR_MODE_ID_MASK, modes[i]) |
+			    FIELD_PREP(LWMI_ATTR_TYPE_ID_MASK, tunable_attr->type_id);
+
+		ret = lwmi_dev_evaluate_int(priv->wdev, 0x0, LWMI_FEATURE_VALUE_GET,
+					    (unsigned char *)&args, sizeof(args),
+					    &retval);
+		if (ret || !retval)
+			continue;
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
+	return capdata.supported > 0 ? true : false;
+}
+
 /* Lenovo WMI Other Mode Attribute macros */
 #define __LWMI_ATTR_RO(_func, _name)                                  \
 	{                                                             \
@@ -985,12 +1063,14 @@ static void lwmi_om_fw_attr_add(struct lwmi_om_priv *priv)
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

