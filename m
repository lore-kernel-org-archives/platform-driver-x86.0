Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A012477E4A
	for <platform-driver-x86@vger.kernel.org>; Thu,  7 May 2026 18:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778177131; cv=none; b=lJzI2DWhCWvMiVOOCjTrbEUlindhH9oYwZMrexOsiq7zTIXOJBB3Fv15b9KQNIB8WHwb5NFsShQZyz59Fkqs4C09jQOJ95Wqbo0RItlpNHrbs0APW/jB73jvkM6JWarXF0Y24CYSGU03mbD6s9C47tC8S/ZWw4y3e3awsh/BvJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778177131; c=relaxed/simple;
	bh=T4aRXknDQwMTNu9P1SJYUebCzEXCCGChFfvBtxKvA2I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ijc6fyBGuXs4anEwirjSDNUFof6bDRdsVADeGtL0niCXmvyX8cAqfnFicF2NThQCRGEWeyIII/muFOet2WhYO7QTpxc0zu5Vm1GQfTR+JjSo1UsBW/LohyhUXrCo8io9lRWuilfKD4Oa6cymrY9+RXJR+geHzrdmsf0d2k2MWRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D4W+aXhe; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D4W+aXhe"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2f33ae12f97so2106846eec.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 07 May 2026 11:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778177129; x=1778781929; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MB9xcF1UeOpmjEj/AGTJRZmAzkM+hmCLAylWOoD7Z3I=;
        b=D4W+aXheAcsgIWhnZptjQGafE1wxWfauMVK/30M0ihhWyf6HVyAJnkSDyshGbhGJ3M
         /+6KC6Qh+Icv4ycWeiWR3ZlfWl3SC4IKaLam+HQxZPuknVydd/+9gshNyJk+wYf+GmAT
         Kx28ujzmj9t1njg/hI/xRYu1vDoKdo2VnO80RiqK9ljMQuEwUHEtDksDtPIqP5Rcs3fc
         r7/XqLTkVnpIvjyJD4q04TMJxXZe8MXl17dUzWui/dnPs/QK1v6r9boVucWLgMGlGNAO
         v3xXNDMVRoPQbgQE0y3jGoMNsg0e22u9PYJSgUIAVX76dbSixmjTj5I6kC+6G1gIBOUR
         F/dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778177129; x=1778781929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MB9xcF1UeOpmjEj/AGTJRZmAzkM+hmCLAylWOoD7Z3I=;
        b=fOSDoGf6D7/ev+MIVdoHwFBRHQhDvWl/+nmiSJsz20hEDDXQE5zQnUEm1KygdyI9xL
         86PcK6F00e2G0iMWAomA4Ld2Ch9mw0dUPe8Q8mJcTFD5+e/tC1bprWvJmrRuNWmoi42X
         afQGBCt9DSQHPfMD4hq45TgSZ2/LuF8O1Jz0Bsn7k6sgSaLVOLZSco7IGnEDqs8iOEcd
         mi/HP2wFMxnErHztDUN8C7IG7yl9viF/nP/uF4Ez3y7A2HN2wuGKcfqTFEKBOybYopiA
         r0i9GPnHNy+iZetYnKND07f2AuE0qrKZSQdDFn/OSDDfKhtlSJD8lA1IAHAbU1/7XTNp
         Awag==
X-Forwarded-Encrypted: i=1; AFNElJ9R78W62XCCR+tpsaPP8YHC3DS5eigG3ZMtfx3c9Y6Uj4SApSCW68IlD462Y8Htk5umXP9bXCZ0TzZD9oJMUSqvlaZ2@vger.kernel.org
X-Gm-Message-State: AOJu0YyH3erEMqmkZ9zVjXN6JTWypQRaIQhm0eN2i+cjQvXhysDn+YU0
	3JD98HAzBs7SaXpHTPVyvHZH7YWCrA8J5H2bXf4Y4X6uhUJFMZlhijv3
X-Gm-Gg: Acq92OF8MRPh+Aq5nLHrhLAV316wGaLx06a6kQj6wArb6VUSAoWcF8IpX/356GFJWMy
	OmsWxzv65S5OADBfwsEGRmLcUC5/8DWJJVHKCOIVKT0xNsmzPZEdquHOF8FDdylkSVwweOEWMM1
	kxErqixO7uhxH1ElfVMHfJckzqA2ZfVh2C8JGTWar/XDzsRy2T3CmevBoQlvP9pw49qJ40rQOH6
	ZBR5ysDAtZeCgV5iQHMDhnSigHrrM0BmnFI1awoJIW4Na0fbE6/GaYVe2soFXV0HNEir0yXuTai
	WgGuMiSlTP2pkIpHzwnqmkVlJ0VjnEsEr8t2jFhuizvEgU5dHEVS0ylr0nq1FpvGBBtvA5+1Dz+
	e7bpOeSVg8HNI5cR9tFy8ohfg3G5kkTb2YxDkFCw9C17Q5BkqWOYuvCCLlpFrQlEYfajQlTy8GG
	DKFyU28Fy/P+XcAiu1saXpeJaYY/S7N89DjFeDoRg7axGRT5V+mXMqudARPL+QKRNOhFdiGLjRD
	yuf
X-Received: by 2002:a05:7300:ac82:b0:2ef:9961:27fa with SMTP id 5a478bee46e88-2f54ad75680mr4610166eec.18.1778177128710;
        Thu, 07 May 2026 11:05:28 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f82bd73a64sm44332eec.12.2026.05.07.11.05.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 11:05:28 -0700 (PDT)
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
Subject: [PATCH v11 09/15] platform/x86: lenovo-wmi-other: Limit adding attributes to supported devices
Date: Thu,  7 May 2026 18:05:01 +0000
Message-ID: <20260507180507.912966-10-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260507180507.912966-1-derekjohn.clark@gmail.com>
References: <20260507180507.912966-1-derekjohn.clark@gmail.com>
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
 drivers/platform/x86/lenovo/wmi-other.c | 86 +++++++++++++++++++++++--
 1 file changed, 82 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x86/lenovo/wmi-other.c
index e69bea72e6d3..e3cdcd0f4331 100644
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
@@ -752,6 +759,75 @@ static ssize_t attr_current_value_show(struct kobject *kobj,
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
+	struct wmi_method_args_32 args = {};
+	bool cd_mode_found = false;
+	bool cv_mode_found = false;
+	struct capdata01 capdata;
+	int retval, ret, i;
+
+	/* Determine tunable_attr->cd_mode_id*/
+	for (i = 0; i < ARRAY_SIZE(modes); i++) {
+		args.arg0 = tunable_attr_01_id(tunable_attr, modes[i]);
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
+		args.arg0 = tunable_attr_01_id(tunable_attr, modes[i]);
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
@@ -875,12 +951,14 @@ static void lwmi_om_fw_attr_add(struct lwmi_om_priv *priv)
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

