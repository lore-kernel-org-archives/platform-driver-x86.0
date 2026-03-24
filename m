Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34EB63C6A46
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Mar 2026 22:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774390242; cv=none; b=PsqHKQUrzHIt8wq10vxhfBCRQc9pmnVot18EUEPwkLpEkRYAzcmWa9ifi/vU8VCDwIFAVBdmZEYA/z8o/kI3Gwcc1wkA4F2J7q5OKXzW7Gtdz0XZjoILdP4wGiuyIaNF1j2Ucbo7NDZFUhvQ04qAfJA77CdTf/7MJw/Evdfb7h0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774390242; c=relaxed/simple;
	bh=zk2PMq1pfwQicynBW9pC2cx2syEO+ArZHTP+J/ldLT0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h5ys2JsUt4/20lQvyfijrvyb92iEIZJcBo7CCZYRoU4wrol1+HCcXmtDyOBrsBJxABRwtprE5nXIp2lWkRgdrohaIEj4+e+Xd7cmAmNdvl9tii0x3YizCSYMh0KM+f6r/a6lTiEs9nckX4YwmD+K+uA5AKfpzwZFibL3qyGqswk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YcHLza+l; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YcHLza+l"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2c107ef474fso4194003eec.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 24 Mar 2026 15:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774390238; x=1774995038; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1YcZeN4ErQAIW4bmYlM2mRp93tMYFqqmCe0N61Nwzx4=;
        b=YcHLza+lUUL15COXjDY9FL3AVtuBIDrrvhZ2WKWNFLgFbCpMvjk3NUeA3MTbBb2aXf
         xA59GVeHqCAWUU5ifflsM18J7QQT+0ysFJL/NphMNSTaBSznMarZ7FfYhxoVDAyA1ZFy
         1FM16O1q+tUezYVG0S9d4wP0QqqZzunly1Z160i6aujBGN/tkmiKD/5a6XqD2C4lHWmn
         5fqQ61j6qqnJQM0xb5dWEO3bCqAOJ2j7NWq3mOYFm/dSKhpn6l4O5eD2utUf5zifAICF
         HmSoXwjLB8nIwfPAH/3czCej9C0cp8UrCuVUUBBom3nZamAzsPunRYDRFAaMAPok2MkI
         tNjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774390238; x=1774995038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1YcZeN4ErQAIW4bmYlM2mRp93tMYFqqmCe0N61Nwzx4=;
        b=Lk22W10hux+uw7lgrJ2+wpx1HvCnA9FTcYYkPc3MBaBpJrB2W7Mbx4baPorDnJlMTe
         CJdRg8AIFu+3b8gLzsBQiZtAih6sfO0G4qCnnJlRmE/OEEmrDDYzyFIwJe+eDKMpu+nv
         R7ZKWcmtPaFT76RAPBgO+9iUcGQZc4LYw4s9TLkOKLxXluANHFB6RDd4F9ciPMQT+4FD
         DT8khFN9r/Mj0k4gf4geJDR6WYBExPKXQgeg5Ru7Oqt/aWJeJZMJpyq0jB31c2snTmuC
         F6bi6Hv1pzfSIDigGfsVB+W994FznowjGRbckvMRitlJHQU2MUNk66YSDsK9rImWKAca
         zGDA==
X-Forwarded-Encrypted: i=1; AJvYcCVPdhZKVfw7GfT7resRVIlv9USDC5ikrD/fDDeheNjQO0YMrO6Q1vGlt9cwe5eMwmdxQxajOcwLtIl9KgQ4OeYm2Quu@vger.kernel.org
X-Gm-Message-State: AOJu0YypPKfcIzYCsT5l59f2o+iAJGPCVmYK04PdkZTwQ1e7vsSTfPca
	rbVPynFlMS5vnrqGjCpIMhOVw6YK3KZuGeZqfmHLYWfiRK8+rZi3Dq6Z
X-Gm-Gg: ATEYQzyOwdSjHsl2W0rBOrvobI3AXJ5S5R+4HhVmXH/cJUhVa/9KaSU9UUbBkYt0e6L
	rNfdow9/MFtnmtkxQyCl4l66DSviVgHrEN0tb/74T4mfcDysKSFLO+zwsorIHFeZ5uoELQWTV7X
	YCGxpIvnckGmYZD0Sydni4hZqmPIfxQYXS4vcKUm4NBdyaVy4hNtqlWPWAb4OGtHwHPvgjmC/jI
	D6OP07jDnb9W1fPFaxzWKGQiNTfCU8qUS5wYkMqKdRg2sQE2zZMr7LVipH+Cg/io9piArFzVPUn
	2b/E+/ABUYLgcl6WP18k8oXFzTHjE5FhE7oLO3o8+VaxFhVDyLstw+pdt8aMgXf7LpiRYhOz2i7
	hTrGNCL0aoAMP2U5rFx76QujwHETTSs0h+gpEsea61S8TkawRTA4d46adBYKqe0NQq3Kn7qb1l6
	WuKTj18PnqBWp91PjSfuL5a4L3UfNx3ddAPm+A+nkZQs5OEZiqyhD7VEjOPRZPP6kxFjNXdIMCa
	Rh3YPgKS6E9/mw=
X-Received: by 2002:a05:7301:60b:b0:2be:2f58:2ef5 with SMTP id 5a478bee46e88-2c15d2b54d1mr599587eec.1.1774390238235;
        Tue, 24 Mar 2026 15:10:38 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b14c299sm16282832eec.6.2026.03.24.15.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 15:10:37 -0700 (PDT)
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
Subject: [PATCH v5 4/8] platform/x86: lenovo-wmi-other: Limit adding attributes to supported devices
Date: Tue, 24 Mar 2026 22:10:28 +0000
Message-ID: <20260324221032.1333636-5-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260324221032.1333636-1-derekjohn.clark@gmail.com>
References: <20260324221032.1333636-1-derekjohn.clark@gmail.com>
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
index 7aa512ff1446..dd98e7f930f5 100644
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
@@ -546,6 +548,8 @@ struct tunable_attr_01 {
 	u8 feature_id;
 	u8 device_id;
 	u8 type_id;
+	u8 cd_mode_id; /* mode arg for searching capdata */
+	u8 cv_mode_id; /* mode arg for set/get current_value */
 };
 
 static struct tunable_attr_01 ppt_pl1_spl = {
@@ -778,7 +782,7 @@ static ssize_t attr_current_value_store(struct kobject *kobj,
 		return -EBUSY;
 
 	args.arg0 = lwmi_attr_id(tunable_attr->device_id, tunable_attr->feature_id,
-				 mode, tunable_attr->type_id);
+				 tunable_attr->cd_mode_id, tunable_attr->type_id);
 
 	ret = lwmi_cd01_get_data(priv->cd01_list, args.arg0, &capdata);
 	if (ret)
@@ -831,6 +835,10 @@ static ssize_t attr_current_value_show(struct kobject *kobj,
 	if (ret)
 		return ret;
 
+	/* If "no-mode" is the supported mode, ensure we never send current mode */
+	if (tunable_attr->cv_mode_id == LWMI_GZ_THERMAL_MODE_NONE)
+		mode = tunable_attr->cv_mode_id;
+
 	args.arg0 = lwmi_attr_id(tunable_attr->device_id, tunable_attr->feature_id,
 				 mode, tunable_attr->type_id);
 
@@ -843,6 +851,77 @@ static ssize_t attr_current_value_show(struct kobject *kobj,
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
+		"cd_mode_id: %#10x, cv_mode_id: %#10x attribute support level: %#10x\n",
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
@@ -966,12 +1045,14 @@ static int lwmi_om_fw_attr_add(struct lwmi_om_priv *priv)
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

