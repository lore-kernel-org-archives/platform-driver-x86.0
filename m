Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7015F3B530A
	for <platform-driver-x86@vger.kernel.org>; Sat, 11 Apr 2026 16:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775924621; cv=none; b=cLulFR9OwcQhsQBKpPOPqUcK2RVGBOX5ohtmrOH+1JY/pzX6yjDwgs/+YAoo3tk3zQilPVRUuyo0WFzP6lxQz21RabQRExLAxYJrVNegcRZbgiwQMaXhmG/L7jfEPfeTJm82JWGj5cooz7cjcfr+GdaOZJu2uHf3Rm+GZ4VLyDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775924621; c=relaxed/simple;
	bh=8LUDQtMderd6djIBXviEFlt08t4GGAhmClar2YVACLg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VFBk4rcN4b9h/W3IQtUVW8YLkXKCEK+tHUg4LxNZGf2MIpu0aSUfAVREsb19NbR/TRySgJoDbeL8mv9ie81cCDA0Ieq8ydqCxB3tmDxRsZlpJksRUEH/65AJA/Cs/fins2y4YKZ3ESF829YMm6XSs6cVbWGXHl0L76ZOxDKVqvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IAojLqQV; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IAojLqQV"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2b4520f6b32so3283776eec.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 11 Apr 2026 09:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775924620; x=1776529420; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JnJVHMF3J4KnB49uOjeY/NdO1ByBdmanEQTbiS1LzsE=;
        b=IAojLqQVk3e0TxMkw94hA0kuPHdmBQg6zMhNc9I1VvAJ4FzySm9LHMcA1qdzJajc1s
         8SIPZm2KAt9jNzjx1tdjf9iWXlMdfzKpoI9b2vFhdtHcjxKyCMib7pkz/v4TE61ZLZ4G
         K9apq2OxVY4AP798Y/QuG/VXMqXCszWGx556uonRK2sAYAmw0aZabVutppAAYRoVWLiV
         3sjTNPVcv3nmbiIEZ7HgfZFdJ6IYeM7P2Z+Uzu/95xsiTwkAJpVWNs4QHjuDhrFxcS2g
         gKn2vY2VpROlTrxR5kzla4q809VKQRVEKDJEz2UAtQb6nOhRWr5JxDXVV5thHmprxNub
         hqCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775924620; x=1776529420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JnJVHMF3J4KnB49uOjeY/NdO1ByBdmanEQTbiS1LzsE=;
        b=bQUBaWzU7VSCASqETTLfk75iCU0xyvELOoVU71bhMoa+iDtgG6kwSiKlN7jkQjlEbI
         K2gXcH99XCZynA+aJTmQipsJfsblT7QuJvdC5U8N50LxSaKTL0MsqAmx+TFykcRUQMfL
         qjTyX26uzxItqdGOrPtJXLh69dl6e8+3ifVippZ77iHWHKkAMdrqaosr578JmbD9cpT/
         K5zQOeRnDDjDRMyjs0TnZk7kRMMqEtFmGZtmkN2z2Hzj96ORpmrcB2tZ7F2wvqdvott7
         z/aEy2Oj6Cih6Ltaw9JztGK/WZeKIFHiu9rIFX2nocjVWQ6wFdE0ZYQgwZWMNl2Rlmpr
         CddQ==
X-Forwarded-Encrypted: i=1; AJvYcCWK2psEd8g4Df76LofHjkwJxmznhCadI2fIvWwZ3mYFlrjtLqZWUOtiJ9IOuqjR3/Pg5Mu15Ax4XiyVlOejfGBe3zIS@vger.kernel.org
X-Gm-Message-State: AOJu0YwZqGMIFjB/z83Bll/xyuCSB6jvRrHXhy1MZ/G+CzRE7Q5O3Y5z
	FLAb+SJoXGRc1My5pzaq4KAsoGGw8LN/G9fvvZRuTvuUd0FMuBjseLaAZskhyg==
X-Gm-Gg: AeBDiev8ZEs8Z99kJtP41CGzHbVKvf1LmhIEQze/LkluqfO2AVHQWDh+BW3LVwSbyZd
	Qd6riIpjuRNhvV/kTrL6Oou0risTMOSKipr2RW+uWX8xlVyGk232UjDzkIZljqEhw4Pgs+kFCM9
	nlasI/c4Id+2X/T8gsVB0vpTnh5MqxAmDAlyekLYZtlMoUaSPmwQxs7/l317H9jomK7UXjRTixL
	Z/Jvhvj1w7XI+YdU1v4Mg+q3URK99gWF1J6QARrEPTAHRvXpqXgEX2549XGCYaC9oTacQ5rMtYx
	qQ+xqSylxPXb6p7CylE5MeaR5UFZd1OAWkeAoO+YyDJRgonIiPXhWYljnHdIjXjLDymmsNISqxS
	qYrWiG5ta/kY25VGQGjW4XciHG+ujAjRt/+71JPc1Ty08ZpjoUjEETDjPwQcOt4mlAaPYXzs8hX
	2c7Hy41XcOWNeJoRCb2CYmXVfk0h/fWY6LqS7M5SaWcYmHJCq3kwr++I01fbRWDvC6Ykjoregxo
	VB0
X-Received: by 2002:a05:7301:1e87:b0:2c6:2bac:8b1 with SMTP id 5a478bee46e88-2d5895690c0mr3446728eec.24.1775924619510;
        Sat, 11 Apr 2026 09:23:39 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d55ce46a65sm9358907eec.0.2026.04.11.09.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 09:23:39 -0700 (PDT)
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
Subject: [PATCH v9 02/16] platform/x86: lenovo-wmi-other: Balance IDA id allocation and free
Date: Sat, 11 Apr 2026 16:23:20 +0000
Message-ID: <20260411162334.25682-3-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260411162334.25682-1-derekjohn.clark@gmail.com>
References: <20260411162334.25682-1-derekjohn.clark@gmail.com>
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

