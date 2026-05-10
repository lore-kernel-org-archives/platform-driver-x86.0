Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ABA02877C3
	for <platform-driver-x86@vger.kernel.org>; Sun, 10 May 2026 04:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778387153; cv=none; b=OfrTg3UJh7YC5zTm9nIigtXFh0UNaMR7bH1+ElecBVqTr/a6r/bJoDAPDP2grYcaM4ORkNpAIHrPh6jrm9wOHp6aXQie8ws6ovWOW6bK7r4WTqn63rJQScbDMPBY4H4EeBReQtEB6GJXIXfp594HTi3DN3SFIs3lQhd0aRc/4Oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778387153; c=relaxed/simple;
	bh=8LUDQtMderd6djIBXviEFlt08t4GGAhmClar2YVACLg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u+Q0TeVVoOHGFNQdJFLnZ8zuZx8kFeCStK+/sV+9aLF48VluvEMgAxG1wgogKmFwvDPjwiSMPx0tmSzo8mrmySw5CH4pxNf2akg7ao0hWq9T3Jpng08P/klIJenAWeqHvDMmvXRL/QOlnTd3x6jdtUNSYYyQGjjHscUGEXU9xIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gSGWCjEw; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gSGWCjEw"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2f68f3b075fso3369136eec.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 09 May 2026 21:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778387151; x=1778991951; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JnJVHMF3J4KnB49uOjeY/NdO1ByBdmanEQTbiS1LzsE=;
        b=gSGWCjEwr+ZPfijtrCy69MG15wxzsq9xLzv3dY4e9UqdbQ+Z8WK/2nCo11I4S8xtp4
         0j84obEcGJnJhxyb3fAeB5fncC0NtBwVR9Z0F3TVt/+f6Ij8tk3Bp5d1bnHtEVoUPkTg
         thcDHy1h20dM2xDSElSS7VGu7wxhF8RxGnQLKzlOxSyTTQ9I1lIq5ue0U4RHkp+WU5Wn
         diIZcJWpPG2oqKaqJdKdeuwcHbzbWb/i8r8ziiu45pBUYADkm9ZSTqTwZjZOQ0fiyiZK
         uAXpFDlD0KM64YLIewjor9v902HYNyOeSMFvhJiQ/aiIb3KOJsuj1+Ew3df/f4Hi+v0x
         9zyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778387151; x=1778991951;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JnJVHMF3J4KnB49uOjeY/NdO1ByBdmanEQTbiS1LzsE=;
        b=SK4qdbam1nkUwXeC+QC1a+tDHWpc77FK7PO7xeNuTZkrha7zaLGojxK+VmaDV3OEvN
         GVS92qYjh3/gy4+BVznQ+06lIzqb7TVtZZdqamb0Zip9Zr7W8h+wx+fiqsCAZu4jwdpR
         7YkvBhBKytlKvyAERG+cTPrsOAdVvJ8Bj89tAkhDwqlQVz3wlptOOFDdAVQyKK5jrx0O
         poi4NUyyd3hIlQpY+uLEXCx7ePxjXXYSCrB+phRYetB0YImzx5pRtlsOQvJ8jQhyLEsj
         w8P8KGXx/z/n/eQjOyYXZ2OWLOqnSyl87OLtAqMu4QPRBURi2o2iObfa3G7c/wjcpjkx
         DIYw==
X-Forwarded-Encrypted: i=1; AFNElJ+UP/dsOTseZwtnnjKH5Xq8sHQ/7n3jl03k8O6ykTqIUg6V6b1dPC/pvo30MRvTBCuCpogaECKcRk9tHU3seDCpmnhN@vger.kernel.org
X-Gm-Message-State: AOJu0Yx33TT/MgGYggFx2mggVWI/JFx0khD//yhUvvDDYsAdwAI5faOT
	4kJSJvrR0uZDywfwW58CD88g/1VbAiU244R3FV5UAnAmMbs/YadBiUp8
X-Gm-Gg: Acq92OFgn4eBLNKiBOn1KaZjArndsof5jMICdvpidADzz9YY8F5XDFi5ISE4B4oUgau
	0Qm/OSxYlM5vyl5/Kqoo3LiuA8N2GQ+whWYWgc8D5HtNfZAmq4Xj9Nqglx23fHMbRyH6eL1r+kL
	tE98ff9on4yvfBuTPKDZyp0uJvDaBuz5wHRsdtSTafWJDw3h2Xe3qzWT4+VRBJeSR2ZqqS5ppST
	54vzve3QwZURH+GGlTSR43ASVsL6jKKbO7Ke+5amMNQlNLMJDxEjFkdjrBzgnUwcZshc1xkLSqu
	FfOMKxFXgt3UecYi9bb/c21KsuKlgp3DL3EBfYxBe/regLZgsWWzuldBeYBNPLKAx7vj1BFTZjy
	LngbWOG5XC3AvUdkY1qI5sfyo/VWdpFPC3ZB7YPa5zZcNOq/gp9HZ54iwjv06C8bglBq1iUDnwx
	hLiy/HfyTB7VKMI6oeuxtnd9gjw97l2Sh5ky5hlztbxL1yGdKatzTX+VUdqh5v+mxag+b8U/yMH
	BNQ
X-Received: by 2002:a05:7301:4088:b0:2ed:6f94:9d9f with SMTP id 5a478bee46e88-2f85c07ca45mr4571233eec.11.1778387151021;
        Sat, 09 May 2026 21:25:51 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8862d3047sm10069960eec.10.2026.05.09.21.25.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 21:25:50 -0700 (PDT)
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
Subject: [PATCH v12 02/16] platform/x86: lenovo-wmi-other: Balance IDA id allocation and free
Date: Sun, 10 May 2026 04:25:32 +0000
Message-ID: <20260510042546.436874-3-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260510042546.436874-1-derekjohn.clark@gmail.com>
References: <20260510042546.436874-1-derekjohn.clark@gmail.com>
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

