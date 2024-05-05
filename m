Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 495E722081
	for <platform-driver-x86@vger.kernel.org>; Sun,  5 May 2024 16:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714925327; cv=none; b=NbaPNOuDdD7Vq3cXzr2vJPiy2pwJoo0wOFqbTd92dO8W2QwqzBDqkZ3VMrR+ieayp5vRroYKfc4prklr2CUWV6vONYv4nzLWIHsyzfsw2hidI8zmERfDSKst/OyL9vzxLsLq4t4ZXDIRie6uIWuRwpF4i6YpuK+TQZo62Dg+dRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714925327; c=relaxed/simple;
	bh=BBsbYwOA5HNTXkdGMTwdoYkc9DlnuYCmJ900U1T9zEI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oZco11Q7Naa3eDtn/8KEv3u5Tci4zaJUYbP2xikQHFZfi4/drY1bYdYtAeMbG5n+G2AGrXw8Fp9nrQRi15ov6u+rTORiUSUVpAIeCLEqm+xaW6uzoxY2BXxxTp9QALokQkOa9IGDIZU30HhHsBTWwk8yb1/Yi8qgt/7x1v8wVjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hRIa/tSw; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hRIa/tSw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714925323;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=0ZsU6TEj5G3bpFZxbMiKX7oZ18OwQ7OZ1IrSH3kWVXo=;
	b=hRIa/tSw4Mh+bn4g9g4eFWb56CGRhUCTPtHF0TPzEYYNNIZzCWl8hQ1MA/c0tP6Hd698Ta
	TGylsyocjz3Y87r2n73dogBp58lY2ZrUNRBktwl2RVsxRBQJqHgcncCeLVOnleW9t2oN7x
	2NfpODvSU+pOeXhxlxn3IHbvvl3bF4s=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-186-PgPZ3f_mNdylOzQlMw6sOw-1; Sun,
 05 May 2024 12:08:41 -0400
X-MC-Unique: PgPZ3f_mNdylOzQlMw6sOw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3797F1C03143;
	Sun,  5 May 2024 16:08:41 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.17])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 75691EC680;
	Sun,  5 May 2024 16:08:40 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org,
	Kate Hsuan <hpa@redhat.com>
Subject: [PATCH 1/2] platform/x86: x86-android-tablets: Pass struct device to init()
Date: Sun,  5 May 2024 18:08:31 +0200
Message-ID: <20240505160832.44216-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5

Pass a struct device pointer for x86_android_tablet_device to the board
specific init() functions, so that these functions can use this for
e.g. devm_*() functions.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/x86-android-tablets/core.c        |  2 +-
 drivers/platform/x86/x86-android-tablets/lenovo.c      | 10 +++++-----
 drivers/platform/x86/x86-android-tablets/other.c       |  6 +++---
 .../x86/x86-android-tablets/x86-android-tablets.h      |  2 +-
 4 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/platform/x86/x86-android-tablets/core.c b/drivers/platform/x86/x86-android-tablets/core.c
index 9bb10eadb699..919ef4471229 100644
--- a/drivers/platform/x86/x86-android-tablets/core.c
+++ b/drivers/platform/x86/x86-android-tablets/core.c
@@ -341,7 +341,7 @@ static __init int x86_android_tablet_probe(struct platform_device *pdev)
 		gpiod_add_lookup_table(gpiod_lookup_tables[i]);
 
 	if (dev_info->init) {
-		ret = dev_info->init();
+		ret = dev_info->init(&pdev->dev);
 		if (ret < 0) {
 			x86_android_tablet_remove(pdev);
 			return ret;
diff --git a/drivers/platform/x86/x86-android-tablets/lenovo.c b/drivers/platform/x86/x86-android-tablets/lenovo.c
index 16fa04d604a0..74f39b658d2c 100644
--- a/drivers/platform/x86/x86-android-tablets/lenovo.c
+++ b/drivers/platform/x86/x86-android-tablets/lenovo.c
@@ -230,7 +230,7 @@ static struct gpiod_lookup_table * const lenovo_yb1_x90_gpios[] = {
 	NULL
 };
 
-static int __init lenovo_yb1_x90_init(void)
+static int __init lenovo_yb1_x90_init(struct device *dev)
 {
 	/* Enable the regulators used by the touchscreens */
 
@@ -412,7 +412,7 @@ static struct gpiod_lookup_table * const lenovo_yoga_tab2_830_1050_gpios[] = {
 	NULL
 };
 
-static int __init lenovo_yoga_tab2_830_1050_init(void);
+static int __init lenovo_yoga_tab2_830_1050_init(struct device *dev);
 static void lenovo_yoga_tab2_830_1050_exit(void);
 
 const struct x86_dev_info lenovo_yoga_tab2_830_1050_info __initconst = {
@@ -534,7 +534,7 @@ static int lenovo_yoga_tab2_830_1050_power_off(struct sys_off_data *data)
 	return NOTIFY_DONE;
 }
 
-static int __init lenovo_yoga_tab2_830_1050_init(void)
+static int __init lenovo_yoga_tab2_830_1050_init(struct device *dev)
 {
 	int ret;
 
@@ -731,7 +731,7 @@ const char * const lenovo_yoga_tab2_1380_modules[] __initconst = {
 	NULL
 };
 
-static int __init lenovo_yoga_tab2_1380_init(void)
+static int __init lenovo_yoga_tab2_1380_init(struct device *dev)
 {
 	int ret;
 
@@ -978,7 +978,7 @@ static const struct x86_spi_dev_info lenovo_yt3_spi_devs[] __initconst = {
 	}
 };
 
-static int __init lenovo_yt3_init(void)
+static int __init lenovo_yt3_init(struct device *dev)
 {
 	int ret;
 
diff --git a/drivers/platform/x86/x86-android-tablets/other.c b/drivers/platform/x86/x86-android-tablets/other.c
index d3fb19cff555..ff7b1d0abaa3 100644
--- a/drivers/platform/x86/x86-android-tablets/other.c
+++ b/drivers/platform/x86/x86-android-tablets/other.c
@@ -183,7 +183,7 @@ static const struct x86_i2c_client_info chuwi_hi8_i2c_clients[] __initconst = {
 	},
 };
 
-static int __init chuwi_hi8_init(void)
+static int __init chuwi_hi8_init(struct device *dev)
 {
 	/*
 	 * Avoid the acpi_unregister_gsi() call in x86_acpi_irq_helper_get()
@@ -244,7 +244,7 @@ const struct x86_dev_info cyberbook_t116_info __initconst = {
 #define CZC_EC_EXTRA_PORT	0x68
 #define CZC_EC_ANDROID_KEYS	0x63
 
-static int __init czc_p10t_init(void)
+static int __init czc_p10t_init(struct device *dev)
 {
 	/*
 	 * The device boots up in "Windows 7" mode, when the home button sends a
@@ -662,7 +662,7 @@ static const struct software_node *ktd2026_node_group[] = {
 	NULL
 };
 
-static int __init xiaomi_mipad2_init(void)
+static int __init xiaomi_mipad2_init(struct device *dev)
 {
 	return software_node_register_node_group(ktd2026_node_group);
 }
diff --git a/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h b/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
index 821dc094b025..86402b9b46a3 100644
--- a/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
+++ b/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
@@ -89,7 +89,7 @@ struct x86_dev_info {
 	int pdev_count;
 	int serdev_count;
 	int gpio_button_count;
-	int (*init)(void);
+	int (*init)(struct device *dev);
 	void (*exit)(void);
 };
 
-- 
2.44.0

