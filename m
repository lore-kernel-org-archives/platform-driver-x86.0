Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DATE_IN_PAST_03_06,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 844F5C4338F
	for <platform-driver-x86@archiver.kernel.org>; Wed, 18 Aug 2021 13:41:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 697FC60EBC
	for <platform-driver-x86@archiver.kernel.org>; Wed, 18 Aug 2021 13:41:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238701AbhHRNlm (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 18 Aug 2021 09:41:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238766AbhHRNl2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 18 Aug 2021 09:41:28 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5F7CC06124C
        for <platform-driver-x86@vger.kernel.org>; Wed, 18 Aug 2021 06:40:21 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id d6so3198965edt.7
        for <platform-driver-x86@vger.kernel.org>; Wed, 18 Aug 2021 06:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=svgalib-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:in-reply-to:references:from:date:subject:to:cc;
        bh=KMhjj96O+PrGwbv0Y7vL4JfO5cFeGuTfE66+AVBtE00=;
        b=JGj+ZhIzKfms2do/fjCuYjnt3KXucjsyrc7a5DZoGG1vRFHzZTuBhr44v6DKCtj8BG
         ydN+slpZ+czxiMcwvdiL7pbP+K7Q8qWEKtCdKeWhKOFs1XYCoEF/fditHJIMji3LuyYQ
         fin0PCAlBHE9WNkwc43/LPw+wYL+ETYVvKG5T7DaIPtzAmX5SB8my2C/5ClEdeL7u/ux
         z64nLoF4edAVL/XEH0kq1E8FwdB17w4jca28Tnjb5s8WjUJfPlQ9nFSfXEFBBrIzka9v
         ZhPqOzBZRtyhp/K3X1U/4m/YAntf5liUKkiWpxBZgaHCuPQpeZhFLQEvFzR+2doiMHuq
         3HDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:in-reply-to:references:from:date
         :subject:to:cc;
        bh=KMhjj96O+PrGwbv0Y7vL4JfO5cFeGuTfE66+AVBtE00=;
        b=F4BWchA1+Qh0Gi5TClkMzUF1k+S3ZbTFK6xd5uvAHML4VNPHc0NqohiCJjQxrgrBiI
         VIBGyTBlwlYNnT9wrut/PWYwn82P5CeY05aFzWh3rqmD3y42906+TKR5qcbnBEj+UTjO
         PO3XpstLMq/QVaPRdiByQM48+rEZt+5Yk8VgB5IgijXdtTaHwgO/1eONNYeNZcn6DJnm
         L5V+CzZgfbfAf39Hk89TTHGKtBTLsmUedhuxeRm+xRTDKSrDaMELb7ZEjcHRpkqtQbei
         X9o8Vg0AEourw+9yl6d3K78MKwKRdgwhkxO2mZpsok4mcGI5vb1sq4E6yYubucLvclu5
         9OtA==
X-Gm-Message-State: AOAM531ZrYxqvubxlAqQ45o6Pt2tMrWZ9hs8Xhy132B9p8TvSkjoK5pS
        JQg1Vn01SeH+SQUHGK+C+goXWH1E2RLGCy4=
X-Google-Smtp-Source: ABdhPJzOvGs/Hz8jkmxOIIZob0iv6v7/rwUTp52db68k5BsMaorvlRntwsrG07chkXrHcuztbIOAKQ==
X-Received: by 2002:aa7:d14b:: with SMTP id r11mr10558013edo.259.1629294019997;
        Wed, 18 Aug 2021 06:40:19 -0700 (PDT)
Received: from localhost ([2a00:a040:195:275f:ad44:6808:2596:8580])
        by smtp.gmail.com with ESMTPSA id v8sm19048edc.2.2021.08.18.06.40.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 06:40:19 -0700 (PDT)
Message-Id: <bd6922a412e50c2dcfb7ce24fc8687f577181d65.1629291912.git.matan@svgalib.org>
In-Reply-To: <cover.1629291912.git.matan@svgalib.org>
References: <cover.1629291912.git.matan@svgalib.org>
From:   Matan Ziv-Av <matan@svgalib.org>
Date:   Wed, 18 Aug 2021 12:25:14 +0300
Subject: [PATCH V2 1/3] platform/x86: lg-laptop: Support for battery charge
 limit on newer models
To:     Platform Driver <platform-driver-x86@vger.kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add support for the difference between various models:

- Use dmi to detect laptop model.
- 2019 and newer models use _wmbb method to set battery charge limit.

Signed-off-by: Matan Ziv-Av <matan@svgalib.org>
---
 drivers/platform/x86/lg-laptop.c | 75 ++++++++++++++++++++++++++++----
 1 file changed, 66 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/x86/lg-laptop.c b/drivers/platform/x86/lg-laptop.c
index 20145b539335..c78efeee1c19 100644
--- a/drivers/platform/x86/lg-laptop.c
+++ b/drivers/platform/x86/lg-laptop.c
@@ -8,6 +8,7 @@
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <linux/acpi.h>
+#include <linux/dmi.h>
 #include <linux/input.h>
 #include <linux/input/sparse-keymap.h>
 #include <linux/kernel.h>
@@ -69,6 +70,8 @@ static u32 inited;
 #define INIT_INPUT_ACPI         0x04
 #define INIT_SPARSE_KEYMAP      0x80
 
+static int battery_limit_use_wmbb;
+
 static const struct key_entry wmi_keymap[] = {
 	{KE_KEY, 0x70, {KEY_F15} },	 /* LG control panel (F1) */
 	{KE_KEY, 0x74, {KEY_F13} },	 /* Touchpad toggle (F5) */
@@ -461,7 +464,10 @@ static ssize_t battery_care_limit_store(struct device *dev,
 	if (value == 100 || value == 80) {
 		union acpi_object *r;
 
-		r = lg_wmab(WM_BATT_LIMIT, WM_SET, value);
+		if (battery_limit_use_wmbb)
+			r = lg_wmbb(WMBB_BATT_LIMIT, WM_SET, value);
+		else
+			r = lg_wmab(WM_BATT_LIMIT, WM_SET, value);
 		if (!r)
 			return -EIO;
 
@@ -479,16 +485,29 @@ static ssize_t battery_care_limit_show(struct device *dev,
 	unsigned int status;
 	union acpi_object *r;
 
-	r = lg_wmab(WM_BATT_LIMIT, WM_GET, 0);
-	if (!r)
-		return -EIO;
+	if (battery_limit_use_wmbb) {
+		r = lg_wmbb(WMBB_BATT_LIMIT, WM_GET, 0);
+		if (!r)
+			return -EIO;
 
-	if (r->type != ACPI_TYPE_INTEGER) {
-		kfree(r);
-		return -EIO;
-	}
+		if (r->type != ACPI_TYPE_BUFFER) {
+			kfree(r);
+			return -EIO;
+		}
 
-	status = r->integer.value;
+		status = r->buffer.pointer[0x10];
+	} else {
+		r = lg_wmab(WM_BATT_LIMIT, WM_GET, 0);
+		if (!r)
+			return -EIO;
+
+		if (r->type != ACPI_TYPE_INTEGER) {
+			kfree(r);
+			return -EIO;
+		}
+
+		status = r->integer.value;
+	}
 	kfree(r);
 	if (status != 80 && status != 100)
 		status = 0;
@@ -602,6 +621,8 @@ static struct platform_driver pf_driver = {
 static int acpi_add(struct acpi_device *device)
 {
 	int ret;
+	const char *product;
+	int year = 2017;
 
 	if (pf_device)
 		return 0;
@@ -619,6 +640,42 @@ static int acpi_add(struct acpi_device *device)
 		pr_err("unable to register platform device\n");
 		goto out_platform_registered;
 	}
+	product = dmi_get_system_info(DMI_PRODUCT_NAME);
+	if (strlen(product) > 4)
+		switch (product[4]) {
+		case '5':
+		case '6':
+			year = 2016;
+			break;
+		case '7':
+			year = 2017;
+			break;
+		case '8':
+			year = 2018;
+			break;
+		case '9':
+			year = 2019;
+			break;
+		case '0':
+			if (strlen(product) > 5)
+				switch (product[5]) {
+				case 'N':
+					year = 2020;
+					break;
+				case 'P':
+					year = 2021;
+					break;
+				default:
+					year = 2022;
+				}
+			break;
+		default:
+			year = 2019;
+		}
+	pr_info("product: %s  year: %d\n", product, year);
+
+	if (year >= 2019)
+		battery_limit_use_wmbb = 1;
 
 	ret = sysfs_create_group(&pf_device->dev.kobj, &dev_attribute_group);
 	if (ret)
-- 
Matan.

