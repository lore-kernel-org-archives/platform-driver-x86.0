Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36DA3E8C56
	for <platform-driver-x86@vger.kernel.org>; Thu,  7 May 2026 18:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778177125; cv=none; b=YgBBXtEF7UUw3qej0BuQSRTqXoWoWEsURze1LWT73kaax55ygU5D1CZpyFB+FJ2jn4U2d4j8aT4TshsnHMS4XTV26alo7HKgUYuk0RIHDik+CAxDkgEeZZX7A8SM9ZX+qvfF1rnqGXObFY3CRgEDqP4JUb9PT0c3EqqhMOUYUWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778177125; c=relaxed/simple;
	bh=8LUDQtMderd6djIBXviEFlt08t4GGAhmClar2YVACLg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IfdeE0WnJhg+8dGBks2sh4ShCvRBUm5OyV9MEF4vVk/loBNVK0W4Faf9vHhRKCR0DQRjG7iHMIVE6cbAZKLncWeW/UFx9rUGrLWlEXCZVAzrbhngxVSz1luuZ2Fj8Cjm+eBbTB7oR9oP7b28l476jL4cohkqzFq9fnNwD0Dtcr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SVYOqRhH; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SVYOqRhH"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2f36da5c8fbso1156359eec.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 07 May 2026 11:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778177123; x=1778781923; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JnJVHMF3J4KnB49uOjeY/NdO1ByBdmanEQTbiS1LzsE=;
        b=SVYOqRhHV8FQe5A/tvQI8xFnDHyoihaEoqEvqLYcb63KrkytLpek67cFeoJ81R081a
         1lULaG4uihQxlvPUQSrqFsLgSeuFuVzkMb9fNSFm8nAGN77k8b0+Z7YH/7cCTdRldXjw
         sw07mh8AIC3g+KU3Sq8gqL86Dj/ByNGqSR7nC2z5/spiYBa1PD+2HAhPrBfd+kmsC/1t
         WGxVhMBuRTCRjXEeL4TAUEyYwgipLnvFwYGlT1dOXDFwcfyS0Hzdo7Rd+SkEY5cozw/N
         r0UbKqXDwuNO5Bv+KifRg7k/PiU7JImIuxvJen8JEblB5KfmXG0WNYq3rCKbd86kGB3B
         BFXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778177123; x=1778781923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JnJVHMF3J4KnB49uOjeY/NdO1ByBdmanEQTbiS1LzsE=;
        b=lD9Sa2KfXy0WV0g40y30p/t+cEVXmOO3PjMtbZCeG/E8BNrXoFJ1UHTG/tOazQxvSs
         g9xWO9sReLWTLQxYwX7V9+uCBpNtd3y49ycYVU6h8TwVbOpZiOWfBP4OxUSBT7Ix0nTz
         FFOSqo/8xxr+EVl4aRcd7OcifkwLssuSqm0qXSFy0Uax3Wo9T35dhLH/40B63G/dTh1o
         8jBo9jezOZTkvJiIBNsj4QM6MmZ848xj7JF0xgWzH6wTThU4UAOC/zhxHyqFT/C8Qvr/
         oTGFyZKtfGbl2qci87POLypQvA03tFQf31AcKVYM1wgfFkIGf81ZyehK+qcJJ6XecRFd
         sI5A==
X-Forwarded-Encrypted: i=1; AFNElJ+1cB69vSM8Ccn2Ud4SrP35VkJpoptxFMKm16g0LKpF1ugj/nh9Xw6HCB+Grw7ZsVacPewxcIiFaJt8VY4zMVkflm/n@vger.kernel.org
X-Gm-Message-State: AOJu0YxjVOuRXTwGhtBiw8ZT4soQPcyWCxQJz3T3ZrlaNqzFuqMVrcnx
	jQU+bjT80mVv0MH8TnujpCsPE4BA3b0JmjGACVysXf+Bka8gUpWXBzos
X-Gm-Gg: Acq92OHtBpBF9hJ+rkC+Ohb4FGPEOryx78GUyT2Gd/tfLDsrhMKCS3ua+47l9QTnEv4
	65jYVqQqeRWAS/r+kMSUYZuDdD1sGM3QJQ/HuGmbD86kHkECvw+FXx1ewT5opv0mFSCYmMbPMgR
	/9471BB9/J7k6XTw/0Yjc67DmYfQfMbaMkHt+JkBcUobMvz/LsxBP07hOUVGOkLXifaGwvSjpC9
	L5ZQ9CPDVux90HwQ+DP3sohSNGhpGcrcss1YqYitA4eguuhoaOj+K/HzQPua+D9NPT2eYQZRjd0
	DBdBOYEJeJdhFpBP9GSysmtAcyMBV+7xKS7IpWuXJPinT8qLaeD1Kv85LyWbWq4JvkimucbBa8s
	8/KO+wlU/h7d7dWj1bIISMt9KfYf2tpwxFpzl4i5I3cljd+jz0pZrjS0JT+OPDKCX/wsz9WHB7M
	1G3ZhkuIhjgFlUZw4j8OpAFT6Kk8jxjC/dmnj0Rr0pWYB1BTe2vyRjyB9fPSknTFpgfy9Zym1qD
	j6YzwgrxSv0T4I=
X-Received: by 2002:a05:693c:2c02:b0:2de:cc07:e83 with SMTP id 5a478bee46e88-2f549294192mr4506652eec.15.1778177122894;
        Thu, 07 May 2026 11:05:22 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f82bd73a64sm44332eec.12.2026.05.07.11.05.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 11:05:22 -0700 (PDT)
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
Subject: [PATCH v11 02/15] platform/x86: lenovo-wmi-other: Balance IDA id allocation and free
Date: Thu,  7 May 2026 18:04:54 +0000
Message-ID: <20260507180507.912966-3-derekjohn.clark@gmail.com>
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

From: Rong Zhang <i@rong.moe>

Currently, the IDA id is only freed on wmi-other device removal or
failure to create firmware-attributes device, kset, or attributes. It
leaks IDA ids if the wmi-other device is bound multiple times, as the
unbind callback never frees the previously allocated IDA id.
Additionally, if the wmi-other device has failed to create a
firmware-attributes device before it gets removed, the wmi-device
removal callback double frees the same IDA id.

These bugs were found by sashiko.dev [1].

Fix them by moving ida_free() into lwmi_om_fw_attr_remove() so it is
balanced with ida_alloc() in lwmi_om_fw_attr_add(). With them fixed,
properly set and utilize the validity of priv->ida_id to balance
firmware-attributes registration and removal, without relying on
propagating the registration error to the component framework, which is
more reliable and aligns with the hwmon device registration and removal
sequences.

No functional change intended.

Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Fixes: edc4b183b794 ("platform/x86: Add Lenovo Other Mode WMI Driver")
Cc: stable@vger.kernel.org
Link: https://sashiko.dev/#/patchset/20260331181208.421552-1-derekjohn.clark%40gmail.com [1]
Signed-off-by: Rong Zhang <i@rong.moe>
Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
v9:
  - Invert err logic for when allocating IDA fails.
  - Rename ida_alloc err goto from 'err' to 'err_no_ida' to disambiguate
    from 'int err'.
---
 drivers/platform/x86/lenovo/wmi-other.c | 36 ++++++++++++++-----------
 1 file changed, 21 insertions(+), 15 deletions(-)

diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x86/lenovo/wmi-other.c
index 6040f45aa2b0..be3309d74e03 100644
--- a/drivers/platform/x86/lenovo/wmi-other.c
+++ b/drivers/platform/x86/lenovo/wmi-other.c
@@ -957,17 +957,17 @@ static struct capdata01_attr_group cd01_attr_groups[] = {
 /**
  * lwmi_om_fw_attr_add() - Register all firmware_attributes_class members
  * @priv: The Other Mode driver data.
- *
- * Return: Either 0, or an error code.
  */
-static int lwmi_om_fw_attr_add(struct lwmi_om_priv *priv)
+static void lwmi_om_fw_attr_add(struct lwmi_om_priv *priv)
 {
 	unsigned int i;
 	int err;
 
-	priv->ida_id = ida_alloc(&lwmi_om_ida, GFP_KERNEL);
-	if (priv->ida_id < 0)
-		return priv->ida_id;
+	err = ida_alloc(&lwmi_om_ida, GFP_KERNEL);
+	if (err < 0)
+		goto err_no_ida;
+
+	priv->ida_id = err;
 
 	priv->fw_attr_dev = device_create(&firmware_attributes_class, NULL,
 					  MKDEV(0, 0), NULL, "%s-%u",
@@ -993,7 +993,7 @@ static int lwmi_om_fw_attr_add(struct lwmi_om_priv *priv)
 
 		cd01_attr_groups[i].tunable_attr->dev = &priv->wdev->dev;
 	}
-	return 0;
+	return;
 
 err_remove_groups:
 	while (i--)
@@ -1007,7 +1007,12 @@ static int lwmi_om_fw_attr_add(struct lwmi_om_priv *priv)
 
 err_free_ida:
 	ida_free(&lwmi_om_ida, priv->ida_id);
-	return err;
+
+err_no_ida:
+	priv->ida_id = -EIDRM;
+
+	dev_warn(&priv->wdev->dev,
+		 "failed to register firmware-attributes device: %d\n", err);
 }
 
 /**
@@ -1016,12 +1021,17 @@ static int lwmi_om_fw_attr_add(struct lwmi_om_priv *priv)
  */
 static void lwmi_om_fw_attr_remove(struct lwmi_om_priv *priv)
 {
+	if (priv->ida_id < 0)
+		return;
+
 	for (unsigned int i = 0; i < ARRAY_SIZE(cd01_attr_groups) - 1; i++)
 		sysfs_remove_group(&priv->fw_attr_kset->kobj,
 				   cd01_attr_groups[i].attr_group);
 
 	kset_unregister(priv->fw_attr_kset);
 	device_unregister(priv->fw_attr_dev);
+	ida_free(&lwmi_om_ida, priv->ida_id);
+	priv->ida_id = -EIDRM;
 }
 
 /* ======== Self (master: lenovo-wmi-other) ======== */
@@ -1063,7 +1073,9 @@ static int lwmi_om_master_bind(struct device *dev)
 
 	lwmi_om_fan_info_collect_cd00(priv);
 
-	return lwmi_om_fw_attr_add(priv);
+	lwmi_om_fw_attr_add(priv);
+
+	return 0;
 }
 
 /**
@@ -1115,13 +1127,7 @@ static int lwmi_other_probe(struct wmi_device *wdev, const void *context)
 
 static void lwmi_other_remove(struct wmi_device *wdev)
 {
-	struct lwmi_om_priv *priv = dev_get_drvdata(&wdev->dev);
-
 	component_master_del(&wdev->dev, &lwmi_om_master_ops);
-
-	/* No IDA to free if the driver is never bound to its components. */
-	if (priv->ida_id >= 0)
-		ida_free(&lwmi_om_ida, priv->ida_id);
 }
 
 static const struct wmi_device_id lwmi_other_id_table[] = {
-- 
2.53.0

