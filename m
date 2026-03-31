Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5239F44CAFB
	for <platform-driver-x86@vger.kernel.org>; Tue, 31 Mar 2026 18:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774980743; cv=none; b=T4TPCAEwarT9pU+b2nD0642N49ewDB4yzYDF8/TnRYLlRXGUaXmm1KfJRUZ+s38wT+MvMVovZmr2OK9RhXvCJV0ON+tENvNctohsN3ZsgbrBdq0mj0xuXtQde1JWyqQqPshNuWDg9DwX3W7t2rjP4k6wCzUFlknJ8g0QoWWOMGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774980743; c=relaxed/simple;
	bh=q8JGrV6KJhUSwiZjgl2CUSRkfrDMU1uKkcj3HAJzSbg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RC0ZL+/cz0HO3Lr0VMWD0oBETNiodVP9dSprvkXhCn8zheaaUO2zS7GALBfurOMGvONhw9BnPqzO54grftMaB+UIcivLcMybjL4TXNgfkiIPKraRi4PHXaGgGTnYfvimoXWa2AnPafWnJh8Bf044PP9ECW7JBqQDLeqcaIJjdAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ubc1LTMW; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ubc1LTMW"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1271257ae53so6080342c88.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 31 Mar 2026 11:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774980737; x=1775585537; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ko354mo2jPZFUuDoRSYAuKC4SLTQth//Q2eyF8C2Mck=;
        b=Ubc1LTMWgG9l0ZuLUYbP23BMJd9pDGEguuL6Edwn301LUtewZmLNsNtRwu9sZ0Uesp
         xt8Aj9O4Pcr3IpMO3nn+tqScE2PilotObDZkbwYozoHWCrz7BykfFt2sCGBnbwdz5w5f
         2C6Al7xuqkxKUYfnYbiEwCNOBKBt5TkJSoD0W1Areaw3myeP4nETmej9L3UvZjtCHiQK
         sz4qftX7by0Yi5GYfeNIhKjET01Qy9P3Fcf7C9jfOII/S/9HzU1xCkDU148Lo1SUeCNs
         S9wjUL9eCSctZgq06SxTtr9V/Qa6nTHLUspOudUtxfBNnKnNJIeCrVztCtTkXFO09KGF
         A0dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774980737; x=1775585537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ko354mo2jPZFUuDoRSYAuKC4SLTQth//Q2eyF8C2Mck=;
        b=pC3m4M4W/KBT8WdtTd/r/wQUjbMjrhImy9KKsW34nBjqUF3RilwcTXkfYC9wvsB9Wm
         XemsQg00eGDFvUfJMnZmtfosJjrsri0e/ZmJyFrmqcfEbLnfazt2z1pP/Zzf5Xy+/+jC
         pTuy4+0hMWbotvLIRX72zO+h0NEndZpUHMiQ+LANDyzQHPySC5jCPW9NDxGp7ErnWEyh
         MUl7rAiKldbw/jRED18qGbBma1ACrW14COyu5Bk140+Rh/5SnnzH969Jz9Uf3JCgZqnL
         knAJIlSqetzeGAL77GrOo6NPYkOdUb8vGVPdXxdULjs13RM1UaiAFx3uWbIyCf5qDuF9
         qB0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUBaUB7+x6nJX/awGHrHlqNotoWBvfRsgrlY3ZJ/VXJN1dixGozd21CB0jBPE3dZNNqC51y1XvF6822k3mUQTkeemFE@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0H2irIwZCzILZaegRW8GO3+B24eQDLyP6Ut/SWd9DEaLfOlU3
	7XKss2SoT3RD6kiOPi4gQluMJ84KmC+g+9ieHyRURZkeYU4lg+BESx2X
X-Gm-Gg: ATEYQzzC1OS//SW2pUxrADzS/kQYRRkCsVeYqGAyvV/R7v1lDmPnembdU/K9rsUsxjA
	a/2Me9MUAAwBBqQTL0Q/KJmHrhNgXcf4DdFM4YIMCUQr+qiKIHWwwbJtmtecEqfnfzjQS/U3v2k
	le77zVCS7ZXBFufDMTuNglh4EnCTXGgR9MZdLr/IzhISFde8ZYrcbWi+MgPN2FsCknVgUWfeWz7
	+r+TONyKFRlb8EXsmbxgrC4s5lIb84eFZnoxqyW7zGAEhO8/O1BGcZPx3Y5vvtmb+v2y2pq+DBX
	Ul/u4FI7lpi2DiY0HK5Cvw1QGOph840XLWa+7GJv717cIJloqilmvxPOu86neUY6DBNRekHzg7h
	Th7KjiyF+Q4/xbnJtT4OEwtj6z19NimxTxiA/EQ1Dz4graVCWRO6P0/ZMi9sZ1vBbXc7DfxW52b
	lVXn4zCHnod38U5nl+tXQ6SbHfle29tgPyCIE+47i2AU+2IPv56JLtB+Jz+GXiD/w6HSSS5YuHL
	rwD2kKj/LN4/GI=
X-Received: by 2002:a05:7022:307:b0:128:d450:bc76 with SMTP id a92af1059eb24-12be656aa63mr254836c88.26.1774980737321;
        Tue, 31 Mar 2026 11:12:17 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12abbe21787sm10769272c88.11.2026.03.31.11.12.16
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
Subject: [PATCH v6 06/13] platform/x86: lenovo-wmi-other: Limit adding attributes to supported devices
Date: Tue, 31 Mar 2026 18:12:01 +0000
Message-ID: <20260331181208.421552-7-derekjohn.clark@gmail.com>
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

Reviewed-by: Rong Zhang <i@rong.moe>
Tested-by: Rong Zhang <i@rong.moe>
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Reported-by: Kurt Borja <kuurtb@gmail.com>
Closes: https://lore.kernel.org/platform-driver-x86/DG60P3SHXR8H.3NSEHMZ6J7XRC@gmail.com/
Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
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
 drivers/platform/x86/lenovo/wmi-other.c | 87 ++++++++++++++++++++++++-
 1 file changed, 84 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x86/lenovo/wmi-other.c
index d2838ae5934f..f689d19d711a 100644
--- a/drivers/platform/x86/lenovo/wmi-other.c
+++ b/drivers/platform/x86/lenovo/wmi-other.c
@@ -27,10 +27,12 @@
  */
 
 #include <linux/acpi.h>
+#include <linux/array_size.h>
 #include <linux/cleanup.h>
 #include <linux/component.h>
 #include <linux/container_of.h>
 #include <linux/device.h>
+#include <linux/dev_printk.h>
 #include <linux/export.h>
 #include <linux/gfp_types.h>
 #include <linux/hwmon.h>
@@ -545,6 +547,8 @@ struct tunable_attr_01 {
 	u8 feature_id;
 	u8 device_id;
 	u8 type_id;
+	u8 cd_mode_id; /* mode arg for searching capdata */
+	u8 cv_mode_id; /* mode arg for set/get current_value */
 };
 
 static struct tunable_attr_01 ppt_pl1_spl = {
@@ -777,7 +781,7 @@ static ssize_t attr_current_value_store(struct kobject *kobj,
 		return -EBUSY;
 
 	args.arg0 = lwmi_attr_id(tunable_attr->device_id, tunable_attr->feature_id,
-				 mode, tunable_attr->type_id);
+				 tunable_attr->cd_mode_id, tunable_attr->type_id);
 
 	ret = lwmi_cd01_get_data(priv->cd01_list, args.arg0, &capdata);
 	if (ret)
@@ -830,6 +834,10 @@ static ssize_t attr_current_value_show(struct kobject *kobj,
 	if (ret)
 		return ret;
 
+	/* If "no-mode" is the supported mode, ensure we never send current mode */
+	if (tunable_attr->cv_mode_id == LWMI_GZ_THERMAL_MODE_NONE)
+		mode = tunable_attr->cv_mode_id;
+
 	args.arg0 = lwmi_attr_id(tunable_attr->device_id, tunable_attr->feature_id,
 				 mode, tunable_attr->type_id);
 
@@ -842,6 +850,77 @@ static ssize_t attr_current_value_show(struct kobject *kobj,
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
+		args.arg0 = lwmi_attr_id(tunable_attr->device_id, tunable_attr->feature_id,
+					 modes[i], tunable_attr->type_id);
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
+	/* Determine tunable_attr->cv_mode_id, returns 1 if supported*/
+	for (i = 0; i < ARRAY_SIZE(modes); i++) {
+		args.arg0 = lwmi_attr_id(tunable_attr->device_id, tunable_attr->feature_id,
+					 modes[i], tunable_attr->type_id);
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
+	dev_dbg(tunable_attr->dev,
+		"cd_mode_id: %#010x, cv_mode_id: %#010x, attribute support level: %#010x\n",
+		lwmi_attr_id(tunable_attr->device_id, tunable_attr->feature_id,
+			     tunable_attr->cd_mode_id, tunable_attr->type_id),
+		args.arg0, capdata.supported);
+
+	return capdata.supported > 0 ? true : false;
+}
+
 /* Lenovo WMI Other Mode Attribute macros */
 #define __LWMI_ATTR_RO(_func, _name)                                  \
 	{                                                             \
@@ -965,12 +1044,14 @@ static int lwmi_om_fw_attr_add(struct lwmi_om_priv *priv)
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
 	return 0;
 
-- 
2.53.0

