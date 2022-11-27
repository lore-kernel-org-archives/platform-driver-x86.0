Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4E6FC4332F
	for <platform-driver-x86@archiver.kernel.org>; Sun, 27 Nov 2022 22:20:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229711AbiK0WUj (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 27 Nov 2022 17:20:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229504AbiK0WUi (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 27 Nov 2022 17:20:38 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36C1665D6
        for <platform-driver-x86@vger.kernel.org>; Sun, 27 Nov 2022 14:19:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669587583;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=9y+CU3oHeWRrLbE1yFz9UBRyMVnaLU/j+iKJrrpbhGM=;
        b=E8oHUqy6N5ueW8e2NVbl1BNFHvX5UsUhuTHc7IGvmb02QvclAU0wEeDZmYbKSAP4qPu6Pn
        7+mNf5vKRzfWNoea0xLO5eK8nwLYtGHROYoElP/tlJF1KWWe1rnbtmCIK9KSRIDoJbdcim
        tjQHJdRYvK9e/oMvCoqtg3F74aRmxJU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-74-9fNHKNiwPdmY2Vwpb-Us2w-1; Sun, 27 Nov 2022 17:19:40 -0500
X-MC-Unique: 9fNHKNiwPdmY2Vwpb-Us2w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A99B829AA38B;
        Sun, 27 Nov 2022 22:19:39 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.80])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 0132340C83AA;
        Sun, 27 Nov 2022 22:19:38 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH] platform/x86: x86-android-tablets: Add Advantech MICA-071 extra button
Date:   Sun, 27 Nov 2022 23:19:28 +0100
Message-Id: <20221127221928.123660-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The Advantech MICA-071 is a standard Windows tablet, but it has an extra
"quick launch" button which is not described in the ACPI tables in anyway.

Use the x86-android-tablets infra to create a gpio-button device for this.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/x86-android-tablets.c | 58 ++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/drivers/platform/x86/x86-android-tablets.c b/drivers/platform/x86/x86-android-tablets.c
index 916e37a4f85e..5a7adcc76b1e 100644
--- a/drivers/platform/x86/x86-android-tablets.c
+++ b/drivers/platform/x86/x86-android-tablets.c
@@ -265,6 +265,56 @@ static struct gpiod_lookup_table int3496_gpo2_pin22_gpios = {
 	},
 };
 
+/*
+ * Advantech MICA-071
+ * This is a standard Windows tablet, but it has an extra "quick launch" button
+ * which is not described in the ACPI tables in anyway.
+ * Use the x86-android-tablets infra to create a gpio-button device for this.
+ */
+static struct gpio_keys_button advantech_mica_071_button = {
+	.code = KEY_PROG1,
+	/* .gpio gets filled in by advantech_mica_071_init() */
+	.active_low = true,
+	.desc = "prog1_key",
+	.type = EV_KEY,
+	.wakeup = false,
+	.debounce_interval = 50,
+};
+
+static const struct gpio_keys_platform_data advantech_mica_071_button_pdata __initconst = {
+	.buttons = &advantech_mica_071_button,
+	.nbuttons = 1,
+	.name = "prog1_key",
+};
+
+static const struct platform_device_info advantech_mica_071_pdevs[] __initconst = {
+	{
+		.name = "gpio-keys",
+		.id = PLATFORM_DEVID_AUTO,
+		.data = &advantech_mica_071_button_pdata,
+		.size_data = sizeof(advantech_mica_071_button_pdata),
+	},
+};
+
+static int __init advantech_mica_071_init(void)
+{
+	struct gpio_desc *gpiod;
+	int ret;
+
+	ret = x86_android_tablet_get_gpiod("INT33FC:00", 2, &gpiod);
+	if (ret < 0)
+		return ret;
+	advantech_mica_071_button.gpio = desc_to_gpio(gpiod);
+
+	return 0;
+}
+
+static const struct x86_dev_info advantech_mica_071_info __initconst = {
+	.pdev_info = advantech_mica_071_pdevs,
+	.pdev_count = ARRAY_SIZE(advantech_mica_071_pdevs),
+	.init = advantech_mica_071_init,
+};
+
 /* Asus ME176C and TF103C tablets shared data */
 static struct gpio_keys_button asus_me176c_tf103c_lid = {
 	.code = SW_LID,
@@ -1379,6 +1429,14 @@ static const struct x86_dev_info xiaomi_mipad2_info __initconst = {
 };
 
 static const struct dmi_system_id x86_android_tablet_ids[] __initconst = {
+	{
+		/* Advantech MICA-071 */
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Advantech"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "MICA-071"),
+		},
+		.driver_data = (void *)&advantech_mica_071_info,
+	},
 	{
 		/* Asus MeMO Pad 7 ME176C */
 		.matches = {
-- 
2.38.1

