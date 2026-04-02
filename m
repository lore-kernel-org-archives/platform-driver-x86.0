Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB9C035AC05
	for <platform-driver-x86@vger.kernel.org>; Thu,  2 Apr 2026 03:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775100271; cv=none; b=nkIn8t63PShdbz1ehwSYl3HzrUR7zcHFN/qjWG5wICU57ju5N0g6aaG70QdhxH/eyQGcgiuzjIa/TCGxm63A/XZdrinT61LwqnOaiUbotcLjmQWgOU6QY7pMpWSnLrZ4GssMFrUzhjEEchB6vyJFpYWSWOw9sc+uslW5kdNALmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775100271; c=relaxed/simple;
	bh=WAyuXvHg+IDaHK96s8SFan2J1QbE5G5c5VzthemtNBg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jhuGp11BeO3KKKKtYLnIks2c4JcUV7kAkLI+7L5tcZW2dVsCZHGsGq5RICJLQkyttdK5ZIVMVDzpEEtQWCa+MHFhr9RbUVEVK12KlM2qFhPvAfZgJAA8/Vq8jrzSFc4ZdKHbqtOzr+sSvrFZ7KFJlOnW5jc4vwUwbuLXcOQdymI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AzMg0njM; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AzMg0njM"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2c54c68db4dso825260eec.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 01 Apr 2026 20:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775100269; x=1775705069; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dtWSJAsPoNeIGexvUzam2g4A6bay7wxoWEXeu9FJabM=;
        b=AzMg0njMn0/kNGALFGS5YQVXzYWCXMHMJbqqGV3kmREZzrMnJtv+Y/DqvEJqa5gxDu
         xLSGjTeU8aobc1Ek0GFem8ObsrAmgzn5UR8Nyx9fxpsWb7F7aJch2/mIgAaoffQFcHYz
         5Qj/tw8J7TXNjk44THIT2dU56A/Q/yChWOE+FOtyMceEKeedPHnqZidA3E3/zn7Antk/
         k2o/MWlVIWEhZpslhEtU1WyvFo10k13wXPFIIDF6LWGWBu95iZQTWsng8F+Bh7cJwwzZ
         gmYvMw0tEIpgTycei4XpDO2QgscAtq6hMM8Qh+Eh9KGwoHWRL6HZQJwfXJNGwXE5rGJJ
         pLDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775100269; x=1775705069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dtWSJAsPoNeIGexvUzam2g4A6bay7wxoWEXeu9FJabM=;
        b=bGkxIHIOjxBEYsrRm484CKcIMBcQam/m4xy//81GYbFU4lW3gaGw3WcF+nz7pXp9fD
         stCC35IyaajTbgTd5XFBVegQ8Nx9ErkEawD1x34Nd6TD9UxKPcKx1btgIuRL1y0G60uN
         XmGkWiBPEN9w4Hik8PCtsUMxNyO1yZ4Ow8nMYqOfbPWkVOdi4SW+kIC0BQpfWQt2Y9VS
         u0Kr1BlA5GjCf5IdaFF7gcPv9WqAxXm/MadyBf7J1gOsqNdUkuGMABTl3wQWNEoGO6hV
         p+E3RFZwMsdY2WAY5QYCU1bWFpJGRpsLg4LaZbS2styxha82OKtlWlBqUNRxaXJPn6GS
         dwLQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8ca2cKva/cowGgFdyf9AhUQA+qvbQAxAg9NX5uUiYyhLexS314UszkSjbjndyZ5y3J1vJFMpcQtNJPjuGpgjJTNBB@vger.kernel.org
X-Gm-Message-State: AOJu0YzXHaz0Z8Qt6FQrA9x9qYUOuaFvdhZVe2cth3aVrjOHZgZRQ4fC
	HRJ1SH/vujzW5ByQR8riftnhgL12GXRLG8sVGYSxyspEsvXuzRORU25U
X-Gm-Gg: ATEYQzwEtFk8Sc3z4NwqzlAcf7m9NbWl3AXmoqlzOOAkiWkPPfrMxLSKrtHXXZlN35f
	uN+UcrHHwXvzEWHrxfJRcYSA15wbf73MoQaoQsqJQUn8QyBMYnC2Ep6wny7t7ctEtVvCqhaiL49
	ky84mhK/rPBinyUqQfYca0tJrlPJMpPkr7Si2XgxtuiKcAMl3qDdOXebpob0VK3LJpk4vxrdTqT
	Ggnt4Ri8qLqY0oHSq4gdJMz9PBYQqoAsKofCl1JJ+j0uQlXAOp0WaIAHMngo3vD1y8aGgXtmqhW
	vpHau+cj+icsJft6I88TC413FKWWyCE9O92KCvuf5tL/VhINaBLvHN2RBZf4TYjFQVS5PgXVASe
	wuKFkMZE3KGCueiZW3Wnxrs8gudiLIFIQEP+bct51r/SfMJEOFnMuWPxcU7bJJQYkiSgnZsBUXs
	GtX1t97OfuKUeuOWgvepd5HFvuOjVjz8WVbWBrPrZBOWL9U1BIF1t9d+ejr94nqswqDl8af9CCp
	Y+b
X-Received: by 2002:a05:7300:a483:b0:2c4:ec89:bd3 with SMTP id 5a478bee46e88-2c932bb1d1amr3029865eec.24.1775100268688;
        Wed, 01 Apr 2026 20:24:28 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca7cae9e9esm1265981eec.23.2026.04.01.20.24.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 20:24:28 -0700 (PDT)
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
Subject: [PATCH v7 02/16] platform/x86: lenovo-wmi-other: Balance IDA id allocation and free
Date: Thu,  2 Apr 2026 03:24:10 +0000
Message-ID: <20260402032424.678528-3-derekjohn.clark@gmail.com>
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

