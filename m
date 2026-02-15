Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48105244687
	for <platform-driver-x86@vger.kernel.org>; Sun, 15 Feb 2026 06:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771136027; cv=none; b=UqN0a2zUV7CS1pd2oGNCZLGIbuPVkpLIVfhoLJhIXp6+FRbXyD+BftjjZJH3fgCgsoYSNLEau/9epxEqDUZyj5xUfoupSQDRVQfdTgz2S0Cg6G3a9qvFYwKf9pdj2QK6yLVKDf2FZV66e4JdkxZ3+ZYGSuFXBzfp0jpuY8//NFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771136027; c=relaxed/simple;
	bh=0WY/6++ifxZzESmD3bALeKnLCRCtyf7YwTde+fN6yx4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qf4vbT1vPPJFBBlI7DtbHB83VjT0RIfERXd/5Ovt+4W8wm8VpS8Vdysr500CPLW9hQ7FjUH5ReqpaeGb1HH22WVgswrlmgBnIxyAFdw2FUW3t3+lP4XwU7+9fmxs5Rcn2lNjSWc0uoem0fBynQVNJH9bvGWKflJm38d0ZooMBAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KRODG7JN; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KRODG7JN"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2b82c605dbdso4746877eec.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 14 Feb 2026 22:13:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771136024; x=1771740824; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D9xOxtR3CWKKMh61qfUolY9qoF61BVM7C9Huh+ukUgc=;
        b=KRODG7JNubpNsOt66msFei1r+88YcKjWND8AW3rPpdBXh/dXjznsSMVbqJL7F6PSxN
         Sz7gyRbPaGH5Lz9PhzlcRV+xu5rdkH6qNtLGPt+XcS0sbbzNxNyhWmHAgGjG7dEjboh/
         nRLWMrqSV6NdPWmblUYrEup0CfUfUW4yjJUR9aeUvCE4OvoRXeMcdDw7VocKM/Syk8fL
         iFaZbWWsL0MbY7frdUydmHlONCCaj9dHlvOmYUoGL/wmTfRGqjRpshXWFfXgD2KLNIlS
         5E/W2jPwcCFFABrujMuCGXrcRBbqx+g2gJBN3FTEwS85lpr1T0IqcE8cG+sck3pvyBlT
         NKMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771136024; x=1771740824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=D9xOxtR3CWKKMh61qfUolY9qoF61BVM7C9Huh+ukUgc=;
        b=g8DwfvMnKKgkIrss7REBzvHCmq6uevmrNJI2VI++OjYM+/asFUrUGlQimH/H3xqQOm
         IVRSYTiERLlhF3YsZ3gOJsDYKXxB33tlQqJ6nTIkrfA5vQk/z9Y4bBZxGiwYwlfqVV+0
         ZF4jm/JxYY4CAJX77ecVyWW9A3UrfdDSO2p4K5peFkWLnA8kc2sNgAbCOz9DMiaF/Sy1
         nA2Ha40O44v6QDd+oWKQnRGz7rocpkaJBfYC3tMB2KNeJLr/Rfg8NLq0b51UpUfZpw0N
         mwUTz4/+MGhSN+9qikykRAdGVqVXtVb3OaGPzoUsicKYmUDeD3d9yOufRTHOOcpYorP1
         McOg==
X-Forwarded-Encrypted: i=1; AJvYcCW/0pZfxNB7k7KIsxHB1gfv9NN8nlRmk5z9PSBM3hqeJ91BDB/2a2OPRdEtSDXTeGxtFvFRCvqUPBCkqJvvzjfQE4Hw@vger.kernel.org
X-Gm-Message-State: AOJu0YxzVZ49k9+ejrS8y9+gaIVtCdHXXYOji8wYneyWbQRex2zyYEN1
	EVFLmBBmctMq445M62koxO29H3ZuWrpw7dF8lE3CJCv7Jjc2mZf6rC6F
X-Gm-Gg: AZuq6aI1sXHjaXbb0n3AtxRBhh19W5blo/Xb8BFmQXiFMtlraKo6bgmTdO8bP8Ig5s3
	a5bjD2BXjIpqACdtfoX737yMzk9sSdPPp20Tv2Oi1XCfaL09batE93onGgAHinNNyZAf6oPEc1u
	3HHsJHcohs5Ykheqd1Cc/mhVUHSXEu/riVsFsfcCUm7Jts4vyT9XrOZqsAETZ2AyRvGQfdMaziR
	TOenRojAbAshlFEHAbVOT60bVhrn0jbR/nSAEZ6lpr3QJgG/YasiGyc8ZcBw+oRnBGxqWl11M1Z
	OrQQf1aySBf+IppRk1TBl/fspcockKdCgDKJmv4i0e1MeNLPCmRlZvuZNgPR2E54Abhq8eFze22
	c6kv6GHnZ0A+5lyvOZfhTEwRSNJSSR/rZiASK9p0FxulEQ73Vg9DkhBo3KUuM9Lv1SCdFN5LnDQ
	iC55Wl9au0Wd6O9ZHdUV0mroobgmtDO3LIAk12PwUDAkNTNV0xBJEOznsQG0scrgQB8ldyhdaUm
	bE=
X-Received: by 2002:a05:7300:fe0a:b0:2ba:72b1:40c7 with SMTP id 5a478bee46e88-2babc3b6ae0mr2900521eec.4.1771136024221;
        Sat, 14 Feb 2026 22:13:44 -0800 (PST)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bacb577bcasm4759245eec.12.2026.02.14.22.13.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Feb 2026 22:13:43 -0800 (PST)
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
Subject: [PATCH v2 2/6] platform/x86: lenovo-wmi-other: Limit adding attributes to supported devices
Date: Sun, 15 Feb 2026 06:12:55 +0000
Message-ID: <20260215061339.2842486-3-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260215061339.2842486-1-derekjohn.clark@gmail.com>
References: <20260215061339.2842486-1-derekjohn.clark@gmail.com>
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
 drivers/platform/x86/lenovo/wmi-other.c | 117 +++++++++++++++++++++---
 1 file changed, 102 insertions(+), 15 deletions(-)

diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x86/lenovo/wmi-other.c
index 95886df39c8d2..f3f12303e3798 100644
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

