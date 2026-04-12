Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D68381B0B
	for <platform-driver-x86@vger.kernel.org>; Sun, 12 Apr 2026 21:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776028287; cv=none; b=mI3mJZ+as6wjnYDSbg9uT3SR73RzvxfeqDYC1wSGOCctB6bESXgOwn59p3IlYqmjUIgTs6lu5BkP5hOqlFkc5zL/Xc4B5dy3p0SSGAuUB9jtQ83j1Ja9cC7p1AHLPB1GweHuv4TdjprB4DO0cZIblZGIqQuFUiW9TvSQvEunvdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776028287; c=relaxed/simple;
	bh=8LUDQtMderd6djIBXviEFlt08t4GGAhmClar2YVACLg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e1hmh2Iv+13g3sfz+2oZ77RImC4XmQ3Ojd6TPqnXHXmsAM6tqoeI4MWqDzkBtLcRij0DwofAZp7WatzPYv18fG4NxAEH7fRhVS9BIEUo90yEICuyETJ11whhMSOGiBF/fg5gqaGZ+KoXuIX1oT5Bb3E1oPRYbYGkPh6dFWVHP64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cek/NTrw; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cek/NTrw"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-12732165d1eso13329243c88.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 12 Apr 2026 14:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776028285; x=1776633085; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JnJVHMF3J4KnB49uOjeY/NdO1ByBdmanEQTbiS1LzsE=;
        b=Cek/NTrwj0gnqNy56kJ0w7TIKVANFl6GBb1SjPx5H2SsR4UPpIriCh0LjkVCsAELZn
         7fYKBWxAVn3Oos9qvdrebals4LjHCxDgPLe43Ck8uPUPCGWeQE7d/vFZActRdtTHeopO
         ksdQSepVZuQKKIYIeMXgqdhBifnN0KyXf3QzyvAM7cjKR7q3bRb8iCYcKvvV7TS8Ro3d
         icEY9DBSoLFalAtVdfdLd6N/8bM49M6h79qiocUUvB1z7c8yGuK6aezUfY1uqSLu03RR
         MhytgPpNCWDczuv7skkRE8pMr127CfkZK7zEgP3NLDkF5y+WZ5MWf3RBu/bUUaUh/nKT
         LuXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776028285; x=1776633085;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JnJVHMF3J4KnB49uOjeY/NdO1ByBdmanEQTbiS1LzsE=;
        b=Z2Cxo725gGwLFYSN4Ckvy26QUSul644p+D3vJzjYhMyK+WN1v6X+0U6zdntF0MlMlo
         WyA7ffmU3EyuBETxdFNjrmCH9sla1Qpnx3j2Ph06drTDhMukaoH/TqDfOw2EA9iploql
         RN7XwtMsqT//YOLKYc7Ksga37Q3nDxOU//+kuXOlm7/GPjtA0Lb57U5klZ3R3goe/J8O
         NPavPDgg80nhF94AoxAszesFxpdmYaRZGRqP9V/fSTBzugjZpafe/6nd/Qk7KBljxpp2
         4wU8NPzwyY38A3zQjEZuNUc0A5vGAOdx7sW2JjFVK1nBGDOn5729Lu022DjmixQMX3Pe
         oJQQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2RJdmYuP39TaNCQKJSYzkWzP9H1UhVfBcEtKHwFdky6mCD7Q3pK3LEVimNuOxvytBFN4D84Dj5AxiSGFIa3BXPBOi@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8bLWKMg+bv0CzunSiw6rVeSVJXcdLkxiPz2F7sXdtHnasqmiM
	gVkQdXWFoKDBkzAMLS1m6kPfopr3Z0XH1Qh3pDqDH7SIObyDHTNoCFblkZUzig==
X-Gm-Gg: AeBDievvb//dy044AmbRovmu5N/USMB9DafTfO54aiht6kbZh+wa7IYzM6hS3fcs/ag
	+NeXlg11+9BNuFFvxk/OLypLICZilxJX4scC4Fa27AHTd8rnWp8yyFsOsAAYWC5jK57VeLOG//z
	z+/7Io4VTsbzwusxGxvgAXnaiCGT6RZqsg4X5JJb8Xd9BB/nMCIx3UkZeMVrGEIsyJHcCLmjcS+
	EwDPEtzlkA0N3FtUPHlZIrtIuembNnzBWynzNMtXMyZLeeuSklTagwr6op3UTj5LTfRlHdiR9xM
	9jsY8SIKBZtVceg/81ucfGIpaQyU61CIMoRmDmC2UEI89xj2vSf0ptNWFCZ8jKz0f70Gd/qXvqH
	FrPOFwXlFdzL/kxa/MPVAJjpJY4WINjKRnH2gZSZNn9jiEtZoZCGUr72z1+SlZy7l913WCw+9eK
	tE/lEdETnK6e5WL0t7HLsI8YWuG81LtwK0yfCdMV8aEY1XVrykxZG2s7rgDjYTOxCORE9jRzcNS
	F2oYqEFP5TwR6Q=
X-Received: by 2002:a05:7022:622:b0:128:df80:1852 with SMTP id a92af1059eb24-12c34e55bc9mr5865117c88.9.1776028285266;
        Sun, 12 Apr 2026 14:11:25 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c346fb141sm11520856c88.12.2026.04.12.14.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 14:11:25 -0700 (PDT)
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
Subject: [PATCH v10 02/16] platform/x86: lenovo-wmi-other: Balance IDA id allocation and free
Date: Sun, 12 Apr 2026 14:11:07 -0700
Message-ID: <20260412211121.2220556-3-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260412211121.2220556-1-derekjohn.clark@gmail.com>
References: <20260412211121.2220556-1-derekjohn.clark@gmail.com>
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

