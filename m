Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8BF8C433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon, 10 Jan 2022 10:40:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244054AbiAJKkF (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 10 Jan 2022 05:40:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45554 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S244041AbiAJKkE (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 10 Jan 2022 05:40:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1641811203;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=tTUl7MHw2SmU3w5sCUfA1osezLT/lXCKYslHp7MzepI=;
        b=RQvoqZeSd9xnMVUc5+uMvTjrzl5bN/tSXgegS1MK2EAIk+zkgi1lLuzkS0RfYJvmv3TZuT
        lJ9C2nI8Ak/tVvdMlX8AZQvFpuV6Nci3bvGQS6dP+PQI4r3S0YdRhtjIKjra7l4lvADs+7
        6UPMOx8NchEu7RKWNTgtJRq+hl4PHTA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-526-NnqpnGtaOWi2Wz6-xZ8trQ-1; Mon, 10 Jan 2022 05:39:58 -0500
X-MC-Unique: NnqpnGtaOWi2Wz6-xZ8trQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F3F7E1006AA5;
        Mon, 10 Jan 2022 10:39:56 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.195.64])
        by smtp.corp.redhat.com (Postfix) with ESMTP id DFE3C7AB68;
        Mon, 10 Jan 2022 10:39:53 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Lubomir Rintel <lkundrak@v3.sk>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 1/3] platform/x86: x86-android-tablets: Add support for disabling ACPI _AEI handlers
Date:   Mon, 10 Jan 2022 11:39:50 +0100
Message-Id: <20220110103952.48760-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Some of the broken DSDTs on these devices often also include broken / wrong
_AEI (ACPI Event Interrupt) handlers, which can cause e.g. interrupt storms
by listening to a floating GPIO pin.

Add support for disabling these and disable them on the Asus ME176C and
TF103C tablets.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/x86-android-tablets.c | 23 ++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/x86-android-tablets.c b/drivers/platform/x86/x86-android-tablets.c
index 3ba63ad91b28..d125d7a5189a 100644
--- a/drivers/platform/x86/x86-android-tablets.c
+++ b/drivers/platform/x86/x86-android-tablets.c
@@ -26,6 +26,7 @@
 #include <linux/string.h>
 /* For gpio_get_desc() which is EXPORT_SYMBOL_GPL() */
 #include "../../gpio/gpiolib.h"
+#include "../../gpio/gpiolib-acpi.h"
 
 /*
  * Helper code to get Linux IRQ numbers given a description of the IRQ source
@@ -47,7 +48,7 @@ struct x86_acpi_irq_data {
 	int polarity; /* ACPI_ACTIVE_HIGH / ACPI_ACTIVE_LOW / ACPI_ACTIVE_BOTH */
 };
 
-static int x86_acpi_irq_helper_gpiochip_find(struct gpio_chip *gc, void *data)
+static int gpiochip_find_match_label(struct gpio_chip *gc, void *data)
 {
 	return gc->label && !strcmp(gc->label, data);
 }
@@ -73,7 +74,7 @@ static int x86_acpi_irq_helper_get(const struct x86_acpi_irq_data *data)
 		return irq;
 	case X86_ACPI_IRQ_TYPE_GPIOINT:
 		/* Like acpi_dev_gpio_irq_get(), but without parsing ACPI resources */
-		chip = gpiochip_find(data->chip, x86_acpi_irq_helper_gpiochip_find);
+		chip = gpiochip_find(data->chip, gpiochip_find_match_label);
 		if (!chip) {
 			pr_err("error cannot find GPIO chip %s\n", data->chip);
 			return -ENODEV;
@@ -143,6 +144,7 @@ struct x86_serdev_info {
 };
 
 struct x86_dev_info {
+	char *invalid_aei_gpiochip;
 	const char * const *modules;
 	struct gpiod_lookup_table **gpiod_lookup_tables;
 	const struct x86_i2c_client_info *i2c_client_info;
@@ -317,6 +319,7 @@ static const struct x86_dev_info asus_me176c_info __initconst = {
 	.serdev_count = ARRAY_SIZE(asus_me176c_serdevs),
 	.gpiod_lookup_tables = asus_me176c_gpios,
 	.modules = bq24190_modules,
+	.invalid_aei_gpiochip = "INT33FC:02",
 };
 
 /* Asus TF103C tablets have an Android factory img with everything hardcoded */
@@ -417,6 +420,7 @@ static const struct x86_dev_info asus_tf103c_info __initconst = {
 	.pdev_count = ARRAY_SIZE(int3496_pdevs),
 	.gpiod_lookup_tables = asus_tf103c_gpios,
 	.modules = bq24190_modules,
+	.invalid_aei_gpiochip = "INT33FC:02",
 };
 
 /*
@@ -795,6 +799,7 @@ static __init int x86_android_tablet_init(void)
 {
 	const struct x86_dev_info *dev_info;
 	const struct dmi_system_id *id;
+	struct gpio_chip *chip;
 	int i, ret = 0;
 
 	id = dmi_first_match(x86_android_tablet_ids);
@@ -803,6 +808,20 @@ static __init int x86_android_tablet_init(void)
 
 	dev_info = id->driver_data;
 
+	/*
+	 * The broken DSDTs on these devices often also include broken
+	 * _AEI (ACPI Event Interrupt) handlers, disable these.
+	 */
+	if (dev_info->invalid_aei_gpiochip) {
+		chip = gpiochip_find(dev_info->invalid_aei_gpiochip,
+				     gpiochip_find_match_label);
+		if (!chip) {
+			pr_err("error cannot find GPIO chip %s\n", dev_info->invalid_aei_gpiochip);
+			return -ENODEV;
+		}
+		acpi_gpiochip_free_interrupts(chip);
+	}
+
 	/*
 	 * Since this runs from module_init() it cannot use -EPROBE_DEFER,
 	 * instead pre-load any modules which are listed as requirements.
-- 
2.33.1

