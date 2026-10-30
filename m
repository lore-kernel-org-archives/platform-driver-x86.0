Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793368503;
	b=46N/J+1Vjr9/PtEoSP9b0jJ8vIq2pMA+K5Re5KAHnYht8AOCTO6Fhluq8Q4zTqYWMG/2
	 jbXxlRnkpFP4TX/3GCeJZa31E7/ni1wdtFK++GgVKmK5gJttNDuGn5fXo2kfAP60LCMo8
	 9exLqOpIX8ItDNcTlMdm2Hz+tteJ1I7GqYs0K75GHw1XOuisluMMYAOrV5GQb/xcTS4A4
	 L8mY6SX1+gwbQf+KDNIbBuG2A3vldhh/N0BkasO3SrdYgl7Gp7AvE3W2nFsCt12jXLnzY
	 b9x8sKyBQARTeyI8F4ZFN9fyICFhbjiuH3OahYDzZ/3Iuk/ws+hKgUjHRdBTRyhjPhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793368503;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=NZCDYcK+JY9VUF/cNFEZgHG1OlXA2AsSHrrLvrSXcGw=;
	b=OK5HGdDPR439SdYm6LjkjxFZ1aqMKEXEJL0S9QRAFqJSULiemOD5345rdpHbMKiHMY+w
	 FcfoMhoQW278YDZ4095awo4Vb3ffVM8MY9CLmJqp+UT6Ezga8k1TrVzhio4wWLgglpzw5
	 oRSnm4Gu6nXWSXup/VDPoclqpsuf3EkvxccXpjalHqh+5/3qrnj6nSuCCwyNrkOxouMGF
	 TUTSEVMdQqLF/Drc6wi2V8RfsCOLFhRVBxKrLqh2QO2qhUEJr3y7rQopp8nOuVVJV+c7v
	 fv3EUp69EeXCxodn+kaIV+ORnmoCRhTQ/6t6J/b3NlXdtwGpvI2OknneQQjVYFhEbGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gpew9uGa;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C39606A31C
	for <platform-driver-x86@vger.kernel.org>; Fri, 30 Oct 2026 13:55:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5C39606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Gpew9uGa
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3514b90bb89so1434648eec.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 30 Oct 2026 06:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793368502; x=1793973302; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NZCDYcK+JY9VUF/cNFEZgHG1OlXA2AsSHrrLvrSXcGw=;
        b=Gpew9uGaUaAO9WYj5i8Jx6XaBcRG2K0y1smsGi9tJAA6a55iqJHuc2hiXg03kC3jT0
         ejbcaVE0Oj98ZxtJtRvT1x3+h3RxJrkjDQ5SRrt4VcD9/OCLVrsG90RnFbDMZEK7kg1b
         bfBmPJsgQwlrCxMjy+q1q1D1VoFimE1pjh5E4o9R3cMWs4G4D+ktZsXZ2lYKkrZ9WISK
         x6NNTck5fiwZpsqcRM4QnbjnyMxFTMrDmL91sAoXGHYw1y/EEzly4A9xbYj/CVnJuirg
         8G+Yoj2HLFo8EAk1wS8mkfcbJe7RRR/NYS2EQ16Od1pgiGYJBKHBFHauX3FJmpB24bD0
         +VIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793368502; x=1793973302;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NZCDYcK+JY9VUF/cNFEZgHG1OlXA2AsSHrrLvrSXcGw=;
        b=gNwfYnRytSkz72v/gsTgLCxacYGLe1F2qoCEN+g73iapE1mBuibaWC0dhMvtrUNzV2
         eIUGPk+IXe9kirabXEgMIVm9UUzK+HO1w7s2qcNAY8dPRSXzj2tUjTP+Eudz95+NY77P
         qctjN5KPqIKBQTORViuilmN5Q/So5WFIburAAZ0kCos6SC2uFlB+eipGAtrvjJrqr9Hl
         8Cj6Iut6GUmTYPP4q7hFTwSB4iR3eTlvfJrJAc6f/tDwrJk+bgsSH7TeNP/AAk3EZKvH
         OZXHZH7qQa2zeTb9Hz0txtmUNFuSIk06wR7Yz2IcTQNx26ECDS6u/9D2WULfU45R9Rjg
         OuyQ==
X-Gm-Message-State: AFq9FYJYHVmZIfRogmm2wbXOAOTPX0jiXe9inryG5diR6DUK2bhrzNcT
	5n8QwugH6AUfiMBxH/HmN5EYBQ3qA589GaevEE9n6YRVIwpHKafgHMBC
X-Gm-Gg: AYBFou3L9D56j0fd7e3Ze7Nk6DrciYDXv+x1wapCNQcLbwompAzMfLwz4L+27ncpwXU
	tDJ31eoKsG+iNN99KiUTCiuaJSN5CamKp/gQ6JBMsTYjwDEx42D2Q0UvwmBzo89DBlPaUmuWMKA
	5a7uUKkN0Om/9IR65m9hkLh6PUlMhShXd5r2+GrI2TwBXvO7e+RT9tfxyliBvBUsmCzLdS5XHCT
	VUo3CXKsoik5/4RRL/4cIUQRp/AkaHYTvNnoQ8tBS89H72HuULCaHT4qpXGGr81yow6uqXTjpGg
	3lzM+ckJRsuJIJMisQAFvatjGgKXSFKwhhXFzsmMCiDMHj6r6xL29Dwcjd2JbRcjtzPRjo5wujG
	Avk1Yea0CHm9EkeIKTSPXnb0RYe4ZzBobx+0LjVlxLhdMBOY0YUAkeZ0AHUyyez6yhlpMr2y3se
	qZkgU+PJfroGDjbtUYeY2/wOASDuYwJZPuRuS30kvxfGVxU93SgvSHtWzLH5BnGIvAofYLnu+2N
	Jh5OqbM97v4oTUGuU9QdAURh3IO/MriKkEB9umQ2D7yfAQJShGStLKSABtMUQp7wX0k1+iAmaza
	h39WRJ3XySipEU0CHgOcoR6w6aW+cLtqrUpkow7jMPymCKpGFGdP
X-Received: by 2002:a05:693c:41d2:20b0:369:f961:ccf8 with SMTP id 5a478bee46e88-36a423a9233mr3691448eec.19.1793368501692;
        Fri, 30 Oct 2026 06:55:01 -0700 (PDT)
Received: from chitransh.. ([2401:4900:94f3:523c:1f6:344a:9ff1:daf7])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a504c6sm8371902eec.21.2026.10.30.06.54.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 06:55:01 -0700 (PDT)
From: surirajat@gmail.com
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net,
	markpearson@lenovo.com,
	hdegoede@redhat.com,
	rajat.suri@dell.com
Subject: [PATCH] platform/x86: lenovo: convert mutex_init() users to devm_mutex_init()
Date: Fri, 30 Oct 2026 19:24:35 +0530
Message-ID: <20261030135435.308058-1-surirajat@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rajat Suri <rajat.suri@dell.com>

Convert the mutex_init() calls under drivers/platform/x86/lenovo/
to devm_mutex_init() so that the mutex lifecycle is managed by devres.

This removes the need for manual mutex_destroy() calls in wmi-camera and
ideapad-laptop, and fixes thinkpad_acpi, which never destroyed the
hotkey, brightness, volume and fan mutexes on its teardown path.

Details per driver:

 - wmi-camera: bind notify_lock to the WMI device and drop the
   mutex_destroy() from remove().

 - ideapad-laptop: allocate the DYTC private data with devm_kzalloc() and
   bind its mutex to the platform device. Calling mutex_destroy() on a
   manually freed object is not possible with devres, so the kfree() and
   ideapad_dytc_profile_exit() helper are removed as well. The memory now
   outlives the platform profile registration, which is also devm managed
   and therefore released in reverse order.

 - thinkpad_acpi: bind the hotkey, hotkey thread data, brightness, volume
   and fan mutexes to tpacpi_pdev, which is registered before any
   subdriver init runs, and propagate a possible failure from
   devm_mutex_init().

No functional change intended.

Signed-off-by: Rajat Suri <rajat.suri@dell.com>
---
 drivers/platform/x86/lenovo/ideapad-laptop.c | 23 ++++----------------
 drivers/platform/x86/lenovo/thinkpad_acpi.c  | 21 +++++++++++++-----
 drivers/platform/x86/lenovo/wmi-camera.c     |  6 +----
 3 files changed, 21 insertions(+), 29 deletions(-)

diff --git a/drivers/platform/x86/lenovo/ideapad-laptop.c b/drivers/platform/x86/lenovo/ideapad-laptop.c
index fcb5ed7035f5..ee8e00bdaf6b 100644
--- a/drivers/platform/x86/lenovo/ideapad-laptop.c
+++ b/drivers/platform/x86/lenovo/ideapad-laptop.c
@@ -1172,11 +1172,13 @@ static int ideapad_dytc_profile_init(struct ideapad_private *priv)
 		return -ENODEV;
 	}
 
-	priv->dytc = kzalloc_obj(*priv->dytc);
+	priv->dytc = devm_kzalloc(&priv->platform_device->dev, sizeof(*priv->dytc), GFP_KERNEL);
 	if (!priv->dytc)
 		return -ENOMEM;
 
-	mutex_init(&priv->dytc->mutex);
+	err = devm_mutex_init(&priv->platform_device->dev, &priv->dytc->mutex);
+	if (err)
+		goto pp_reg_failed;
 
 	priv->dytc->priv = priv;
 
@@ -1195,24 +1197,11 @@ static int ideapad_dytc_profile_init(struct ideapad_private *priv)
 	return 0;
 
 pp_reg_failed:
-	mutex_destroy(&priv->dytc->mutex);
-	kfree(priv->dytc);
 	priv->dytc = NULL;
 
 	return err;
 }
 
-static void ideapad_dytc_profile_exit(struct ideapad_private *priv)
-{
-	if (!priv->dytc)
-		return;
-
-	mutex_destroy(&priv->dytc->mutex);
-	kfree(priv->dytc);
-
-	priv->dytc = NULL;
-}
-
 /*
  * Rfkill
  */
@@ -2487,8 +2476,6 @@ static int ideapad_acpi_add(struct platform_device *pdev)
 	ideapad_backlight_exit(priv);
 
 backlight_failed:
-	ideapad_dytc_profile_exit(priv);
-
 	for (i = 0; i < IDEAPAD_RFKILL_DEV_NUM; i++)
 		ideapad_unregister_rfkill(priv, i);
 
@@ -2516,8 +2503,6 @@ static void ideapad_acpi_remove(struct platform_device *pdev)
 				   ideapad_acpi_notify);
 
 	ideapad_backlight_exit(priv);
-	ideapad_dytc_profile_exit(priv);
-
 	for (i = 0; i < IDEAPAD_RFKILL_DEV_NUM; i++)
 		ideapad_unregister_rfkill(priv, i);
 
diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
index 4f81855ad721..8c7d6f281ae3 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -3381,10 +3381,14 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
 	       tpacpi_inputdev->close != NULL);
 
 	TPACPI_ACPIHANDLE_INIT(hkey);
-	mutex_init(&hotkey_mutex);
+	res = devm_mutex_init(&tpacpi_pdev->dev, &hotkey_mutex);
+	if (res)
+		return res;
 
 #ifdef CONFIG_THINKPAD_ACPI_HOTKEY_POLL
-	mutex_init(&hotkey_thread_data_mutex);
+	res = devm_mutex_init(&tpacpi_pdev->dev, &hotkey_thread_data_mutex);
+	if (res)
+		return res;
 #endif
 
 	/* hotkey not supported on 570 */
@@ -6834,7 +6838,9 @@ static int __init brightness_init(struct ibm_init_struct *iibm)
 
 	vdbg_printk(TPACPI_DBG_INIT, "initializing brightness subdriver\n");
 
-	mutex_init(&brightness_mutex);
+	b = devm_mutex_init(&tpacpi_pdev->dev, &brightness_mutex);
+	if (b)
+		return b;
 
 	quirks = tpacpi_check_quirks(brightness_quirk_table,
 				ARRAY_SIZE(brightness_quirk_table));
@@ -7575,7 +7581,9 @@ static int __init volume_init(struct ibm_init_struct *iibm)
 
 	vdbg_printk(TPACPI_DBG_INIT, "initializing volume subdriver\n");
 
-	mutex_init(&volume_mutex);
+	rc = devm_mutex_init(&tpacpi_pdev->dev, &volume_mutex);
+	if (rc)
+		return rc;
 
 	/*
 	 * Check for module parameter bogosity, note that we
@@ -8913,11 +8921,14 @@ static const struct tpacpi_quirk fan_quirk_table[] __initconst = {
 static int __init fan_init(struct ibm_init_struct *iibm)
 {
 	unsigned long quirks;
+	int rc;
 
 	vdbg_printk(TPACPI_DBG_INIT | TPACPI_DBG_FAN,
 			"initializing fan subdriver\n");
 
-	mutex_init(&fan_mutex);
+	rc = devm_mutex_init(&tpacpi_pdev->dev, &fan_mutex);
+	if (rc)
+		return rc;
 	fan_status_access_mode = TPACPI_FAN_NONE;
 	fan_control_access_mode = TPACPI_FAN_WR_NONE;
 	fan_control_commands = 0;
diff --git a/drivers/platform/x86/lenovo/wmi-camera.c b/drivers/platform/x86/lenovo/wmi-camera.c
index 89ecbce60bf4..de4596686d2a 100644
--- a/drivers/platform/x86/lenovo/wmi-camera.c
+++ b/drivers/platform/x86/lenovo/wmi-camera.c
@@ -107,9 +107,7 @@ static int lenovo_wmi_probe(struct wmi_device *wdev, const void *context)
 
 	dev_set_drvdata(&wdev->dev, priv);
 
-	mutex_init(&priv->notify_lock);
-
-	return 0;
+	return devm_mutex_init(&wdev->dev, &priv->notify_lock);
 }
 
 static void lenovo_wmi_remove(struct wmi_device *wdev)
@@ -118,8 +116,6 @@ static void lenovo_wmi_remove(struct wmi_device *wdev)
 
 	if (priv->idev)
 		input_unregister_device(priv->idev);
-
-	mutex_destroy(&priv->notify_lock);
 }
 
 static const struct wmi_device_id lenovo_wmi_id_table[] = {
-- 
2.43.0

