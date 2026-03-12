Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2815438424F
	for <platform-driver-x86@vger.kernel.org>; Thu, 12 Mar 2026 03:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773285040; cv=none; b=JL6LwGsBb8iJEtouCIb2iTzNzjP0zHzLwK/MFlM/x/8iQe3pfyRBHT5+HyQJiN+lQHNqf7nsz6B+7jYXp823U7b1R1iT+TGtlB+aUpwxFBMaAznSOkHiGHc07X0epvIu4HcPmGMCFybgU5oideS9+LxbQqKkYtD4kWjXJNoKB9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773285040; c=relaxed/simple;
	bh=GZx66QH4s1fRNtSvLsssk0BTCtezNoNWKFyAnw8TXmM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QKiprhFLjg1BodfgFMY1jWEnwPLHMUnSJObqZYim5Wng0BtduvHthj1vBfbXtDK49NxG/Aglg7kIAUVd+M0tBUkudLuRp9JWq/L2r04dTxRn03UZTGjsmLWTOBMdV0Dr2101S7JSyjEodPFiAHgbZCsEYnEPgeOjxq7JdZzOvNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TONW9yW9; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TONW9yW9"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2bd9a485bd6so1165734eec.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 11 Mar 2026 20:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773285038; x=1773889838; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V9coopxWI7PMIieiIS2sg8rOAHMXedH4sD+nHdF54Dw=;
        b=TONW9yW9ZXYTm4EsqjtLHK79hERf9+r+C1O3gT2X+8s/JBTqDeOlQi6iAFM836cZbZ
         yNFy7sjKeGUOjVWOElWDZQ7X8R/MjOGzqgGEEA9YEB2Wtf6scVv7laBYj0LZyU9qOFJK
         taMq2xIjTp8gR1q+RUe69M5C+fwMXqXeaAPZ89Y62gH9RRXEqVJ+Of19pG0aWg160CyH
         2JDt5vbqQCkEBCsQC0JdSFLDMa/cP98feJhm5nLXpeN2gMZ6LVsdRAosief8MU8Utrgs
         doat/LT84KnuCVp/wgSJGwS/YBts5XsHT4tKabT9Vv9SZddcCxbgFJ3jpwBjl7ISo3eP
         f0/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773285038; x=1773889838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V9coopxWI7PMIieiIS2sg8rOAHMXedH4sD+nHdF54Dw=;
        b=a9UK6dMc1SN2rhAPlCGBeXL51d7cWZQ2Odf21KvBxfvLa54kaF1HvxG3kHL7QIrhPf
         IxKYqYaBm5OaGmiUXHgUdyfCRC0S9uJEmCjOncfwE1woPMDZQZX0HAhvRDPsMURsdbTN
         VqZOpYcRXVdzmW7FZhNxicwTsoOfxdqnw/n1sWQAKNx2fzbtutYbCObo6ZcJNjqwomeK
         yy3AvrTdnTy00mZI7E+cykVayGksrLKbAPZEEXgVQBPg/jI/s9qwthKbWQwPKpNaNLnH
         aGEf1h8pm+UAgTwRun9RaCCONG0WH+rkAWB7LgQoZ04OYBw+Ggs+BJDLQjoLsS2qLNyj
         h9Mw==
X-Forwarded-Encrypted: i=1; AJvYcCXEWt20WpneOj8uiIHpxaKOpKlB0R3c5tGcKdNFtbSL02BwbRMwH6KzKvoqQZelwtyCQZ4o13m7x6G/9bK4DYvrj8Gi@vger.kernel.org
X-Gm-Message-State: AOJu0YxA3TclcUJBltjs2LRdNmOtvSFdol2pvKoZL/96XWeHWbEe8NZt
	4CciTGU9RuneinDhS0OhirooWcS1+CxiF1PSFayMJ111e0sBT7f9V/q3
X-Gm-Gg: ATEYQzyBRHNUJ6xzFD5nKA0eptdFVuvNaGZcMXaqkiHe3AuBOBkj9rEPN0gimFZGc2/
	gEaWoYxJsJ8IQPXFTfyIA7gbOxwDPvJIbLi6ZRmOm5b5BGSfSkwRxDX5mUZKXLQa0z+XZ86NPLi
	d2kkljrtVvtP5fK6ugfIsMCWMMxir/ay+e/9W9loGmoI9B42YkWA7DnkeMtSbBvdJsmcTc+N+eh
	4rTgoGvn8ONUfInFyANC3fNKx5mdIHfFD3C3se+mXa1QUm3bFYKKC9kJQFoF+pC1GLkWQt4NX4H
	eGJUiBjhIJi6wfQ6T5MhNAOQmCAG8JFUYFmzzNFbdxZMWULiD7MEr+4XPKTWC8YoRdXRnxnwnFL
	vgTuquDgZV0UGsOtBDvWy0ZD+c2ac6cDV5PqcKvfTrP5gpUdxuaxbuXulIkMp+4dd7nW/EXfN4P
	Scew4oukkXQv7d1f7lYQJWXnmi4dY2vEljZEhLQ/Dp9ETzmNVtIjo+0Z9RUVwmJ1WevL4/Hw8yN
	OrI
X-Received: by 2002:a05:693c:3003:b0:2be:833c:1486 with SMTP id 5a478bee46e88-2be8a567ac9mr2257428eec.18.1773285038172;
        Wed, 11 Mar 2026 20:10:38 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be8aa97dcfsm4802495eec.33.2026.03.11.20.10.37
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
Subject: [PATCH v4 4/8] platform/x86: lenovo-wmi-other: Limit adding attributes to supported devices
Date: Thu, 12 Mar 2026 03:10:28 +0000
Message-ID: <20260312031032.3467565-5-derekjohn.clark@gmail.com>
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

Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Reported-by: Kurt Borja <kuurtb@gmail.com>
Closes: https://lore.kernel.org/platform-driver-x86/DG60P3SHXR8H.3NSEHMZ6J7XRC@gmail.com/
Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
v4:
  - Use for loop instead of backtrace gotos for checking if an attribute
    is supported.
  - Add include for dev_printk.
  - Wrap dev_dbg in lwmi_is_attr_01_supported earlier.
  - Don't use symmetric cleanup of attributes in error states.
---
 drivers/platform/x86/lenovo/wmi-other.c | 76 ++++++++++++++++++++++++-
 1 file changed, 74 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x86/lenovo/wmi-other.c
index 9fff9c1f768c..55a26e5617d4 100644
--- a/drivers/platform/x86/lenovo/wmi-other.c
+++ b/drivers/platform/x86/lenovo/wmi-other.c
@@ -32,6 +32,7 @@
 #include <linux/component.h>
 #include <linux/container_of.h>
 #include <linux/device.h>
+#include <linux/dev_printk.h>
 #include <linux/export.h>
 #include <linux/gfp_types.h>
 #include <linux/hwmon.h>
@@ -871,6 +872,76 @@ static ssize_t attr_current_value_show(struct kobject *kobj,
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
+	u8 modes[2] = { LWMI_GZ_THERMAL_MODE_CUSTOM, LWMI_GZ_THERMAL_MODE_NONE };
+	struct lwmi_om_priv *priv = dev_get_drvdata(tunable_attr->dev);
+	struct wmi_method_args_32 args;
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
+		return -EOPNOTSUPP;
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
+		return -EOPNOTSUPP;
+
+	dev_dbg(tunable_attr->dev,
+		"cd_mode_id: %02x%02x%02x%02x, cv_mode_id: %#08x attribute support level: %x\n",
+		tunable_attr->device_id, tunable_attr->feature_id, tunable_attr->cd_mode_id,
+		tunable_attr->type_id, args.arg0, capdata.supported);
+
+	return capdata.supported;
+}
+
 /* Lenovo WMI Other Mode Attribute macros */
 #define __LWMI_ATTR_RO(_func, _name)                                  \
 	{                                                             \
@@ -994,12 +1065,13 @@ static int lwmi_om_fw_attr_add(struct lwmi_om_priv *priv)
 	}
 
 	for (i = 0; i < ARRAY_SIZE(cd01_attr_groups) - 1; i++) {
+		cd01_attr_groups[i].tunable_attr->dev = &priv->wdev->dev;
+		if (lwmi_attr_01_is_supported(cd01_attr_groups[i].tunable_attr)  <= 0)
+			continue;
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

