Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 763CC15DBBB
	for <platform-driver-x86@vger.kernel.org>; Thu,  9 May 2024 14:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715263943; cv=none; b=PQ2KwaoorYJxAdFPfRILfj8ZdW/ztBSLod5RZknCXWZ3RscajvBvuGPv89A18yIEBHTxptKe1YysjS5zMmJOssWbT+6QAqym/KuAGlw6unH5cdi2EG2NYARbM7p3PHiaVzOEFRCZb4pCDoReSeR1/jBgPOnSdfpfxZx2qY775as=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715263943; c=relaxed/simple;
	bh=FE+2Nvfiz2zgeCYuksRlf5P+9/7HZGZe/AWkadm7IHE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=QIjKOHGDC/CxXysws+074dTKY69KeFDwx+CXddd7V7fVTe7IwmdD/WBMPoM4sFFcbAPH+LlPnKLFlYjpaHqHrbi35zN85wx3mk1FLaSfIdSaAATj51q50XPRB0zpQtroZ8z19ANqbpDImxpt5gG1XU+5Zt4xkddigr2uXpa7n74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dQF26U49; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dQF26U49"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715263940;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=T6BMaKtPjWpwLOG4KlbuRF5TuU2+iZx7D8ijbgHoWSU=;
	b=dQF26U49J0CITLbi9LjkUEp5t0mLar+8lCnjREaAJ0Fx7MlKWB6yVb8I5IMy6ZdxQnIkMK
	Hos6xUt8mpEghhSBraJUg04e9xFVdXg0inJp+plf7WgYlS/WXrKscni704VELWIuaR/tBb
	JhIJekzY5TfC5Y46ZCIGDfSihDp8+Gk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-377-KA4OQHRIPRygrBtVY77ppw-1; Thu, 09 May 2024 10:12:17 -0400
X-MC-Unique: KA4OQHRIPRygrBtVY77ppw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 28F198030C3;
	Thu,  9 May 2024 14:12:17 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.19])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 689B620441E0;
	Thu,  9 May 2024 14:12:16 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org,
	Kate Hsuan <hpa@redhat.com>
Subject: [PATCH v2 1/2] platform/x86: x86-android-tablets: Pass struct device to init()
Date: Thu,  9 May 2024 16:12:05 +0200
Message-ID: <20240509141207.63570-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6

Pass a struct device pointer for x86_android_tablet_device to the board
specific init() functions, so that these functions can use this for
e.g. devm_*() functions.

Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
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

