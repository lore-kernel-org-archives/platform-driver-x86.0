Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A0C39C62D
	for <platform-driver-x86@vger.kernel.org>; Mon,  6 Apr 2026 20:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775506446; cv=none; b=kwWdsm5mZGA8XX25ok1dakVsc/Nm0IUzWXINXya1ZV23YdW6hxBJ+cpejigbQ3K8yT4vXTumam1dbi9OR3VjRyAQngobyPENxKg4iA4Qjd/UlKFpSkgCgMxLM4KFEReD3pLjP9KjBKj1YkY1ILmtaUEfioV09la1xw8kRnJxPUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775506446; c=relaxed/simple;
	bh=WAyuXvHg+IDaHK96s8SFan2J1QbE5G5c5VzthemtNBg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s/5BUn2X/+mCnxU7ZOuNfJqmZrfdoTlgCxjtN7ncRAO/VUPUbBC+vPhGoxcf7F1nPDA7lgc1+zn/wXLCNg1J9McX2wSIgbusObeeO5b9a2sU9k1QewfdyVGnSqgq5Qs9tBXgwNBaAdblTwDHqP1HPFKkmQQR1gUEYAN5yz59zR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PzF24vC+; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PzF24vC+"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-12c0f979c16so560379c88.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 06 Apr 2026 13:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775506444; x=1776111244; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dtWSJAsPoNeIGexvUzam2g4A6bay7wxoWEXeu9FJabM=;
        b=PzF24vC+vYWCfIvwd9U5wFTsDs1cYnKBwsfqHYD8CQJxYnRujtA/UWbEY6j/WORXiO
         5Pn0ohyRJsV/iVjnhAjQV7SoDg6kdBDSHcLOVud6oqRww154NsoS9e/m7rh6Uvstye0C
         1M+vtCfikxA9hoK3xTo9Le/NckovI5c6m+Ya/RSI1lFzaF4BUZAWEEB+aUM1yOyltuPZ
         gREFYh+j0vbFMsxhEGDXGhn7t0e6ske20+y743qy9Mir7BKKEwHYHDTRE54sMyrHRv6i
         WO8b6woSfv6AO4guer3cW3FTBrRZyQGkW3cdbwsYyuqtEV/6tcJC/DpltJa7qExfZZ7f
         bHYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775506444; x=1776111244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dtWSJAsPoNeIGexvUzam2g4A6bay7wxoWEXeu9FJabM=;
        b=h5ASn4vyU8dq1C2Cml/JibiaSsq3nX4AThEsZDEpj7nSokSgghgngWE9mFfjhLsRdE
         YTtmR6Xt1m5w97Wm63Aix38mcF48RmHh0SVPnvWM0PHIC8oXIoz26VGFrMzk4uvdCPPu
         9F4T4dVzSPCcZhvtKoEKD23is7C9cIe9MYk6y1eaC5jjdrs/OiRD/5nM4Cc3lChsjCL+
         Bvlrwbbh90oLBAPEumpDi7Weg3RkEBWaiMsq46+k/+nGn1wZkZXpSIEKRhFkrsSIIb1q
         JLTrtTQ/qCWbVV7D7WT0/d/IBywPLqHz3MDIUqVC7nz2+FQZBQF7bo7udfUbkZmwbfGO
         S95g==
X-Forwarded-Encrypted: i=1; AJvYcCUvVwrtMvtP4tFuIn4WC/zQJCp+FTpCywYEykmlYGyXMT4/ZKr6ZwtdkUgbQkX7/70tzDy6kujdGNf8xs5Gu9gggiGo@vger.kernel.org
X-Gm-Message-State: AOJu0YyHcmYUXeBDLbsfU8PQxAbpY/ZsBTV66+cSgq3Tjqxhhq7MnOTQ
	OqVkOSsUcx0UyUsddIgLojeMctX3xZV6kk9GkQgj1FpsWoH4ezf5K6nP
X-Gm-Gg: AeBDietycW1KjDs4ZgxzWxKmJ4rTEBlef/I7enfvOi61Vo4NiJyAwyVj8bNB71J8ilE
	TaUxdFzvjDoFJy3cHBGn6Wya7xoexbWl+tBlJx02bXHlsrStYtmGBRNtKC+dpaiwvo5WJmFPQxh
	LHUg7sq5SmppfYpWOtR3piCZqqVTbHl3Cq0SVmEsOQgaIzhkM8fQPL07VLsHSocqz+i6Z6QNcSd
	6J7sKcNh4VGKchIu1JaF48Cn0ueZ5rf7G/sK8/suuOcTrA82/zIXQfDvwYn/5dFDaPPqd6FiImG
	Vm2DD1D9RV1GnkFJ8TXpOIo2tOvPh3YxrI3zSUGQSIx4VBxv6NLyRlH7JPStyVyyvorOVhAJQxe
	+xGymkcXgYt2aJqztHaG89i6AfBPUZE/Z8x26coQszLWJLmkdKQrt72SxQJ1IKcvwpfyY1Y9iES
	sfSsqJ48oUEeeoyO5VYF6HfJ6hJ0Hzb3E7VChZAeqkIgIDnW247APOvah8H16qbigvkBRvMQehc
	AUM
X-Received: by 2002:a05:7022:112:b0:128:e6d0:d7c3 with SMTP id a92af1059eb24-12bfb73eec9mr6480840c88.20.1775506444250;
        Mon, 06 Apr 2026 13:14:04 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12bed93f861sm17022333c88.0.2026.04.06.13.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 13:14:03 -0700 (PDT)
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
Subject: [PATCH v8 02/16] platform/x86: lenovo-wmi-other: Balance IDA id allocation and free
Date: Mon,  6 Apr 2026 20:13:46 +0000
Message-ID: <20260406201400.438221-3-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260406201400.438221-1-derekjohn.clark@gmail.com>
References: <20260406201400.438221-1-derekjohn.clark@gmail.com>
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

Fixes: edc4b183b794 ("platform/x86: Add Lenovo Other Mode WMI Driver")
Cc: stable@vger.kernel.org
Link: https://sashiko.dev/#/patchset/20260331181208.421552-1-derekjohn.clark%40gmail.com [1]
Signed-off-by: Rong Zhang <i@rong.moe>
---
 drivers/platform/x86/lenovo/wmi-other.c | 34 +++++++++++++++----------
 1 file changed, 20 insertions(+), 14 deletions(-)

diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x86/lenovo/wmi-other.c
index 6040f45aa2b0..b47418df099f 100644
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
 
 	priv->ida_id = ida_alloc(&lwmi_om_ida, GFP_KERNEL);
-	if (priv->ida_id < 0)
-		return priv->ida_id;
+	if (priv->ida_id < 0) {
+		err = priv->ida_id;
+		goto err;
+	}
 
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
+err:
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

