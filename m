Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3811DC4338F
	for <platform-driver-x86@archiver.kernel.org>; Fri, 13 Aug 2021 22:11:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1DE276103A
	for <platform-driver-x86@archiver.kernel.org>; Fri, 13 Aug 2021 22:11:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235073AbhHMWMR (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 13 Aug 2021 18:12:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235029AbhHMWMR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 13 Aug 2021 18:12:17 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6D05C061756
        for <platform-driver-x86@vger.kernel.org>; Fri, 13 Aug 2021 15:11:49 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id w21-20020a7bc1150000b02902e69ba66ce6so7801580wmi.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 13 Aug 2021 15:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=svgalib-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:mime-version;
        bh=UX+4u3V1Y2tPHth8Wcu+SDOOt5/oAqcVMwJA7Wy8hAE=;
        b=vXY7eoQBDSJQXsd0I1FR5zUwZyVhkVucb6Q2ZI6OBEsQLTiojaybFNhbgthGtenPne
         9SUKzDhzLdxN0mQqeV6/DeBd8zgKmEBHmq1VICyOsHvKAhyFdpaTPXRAZVTltgJglKo/
         l03nL2WblUeaiqK9gpiAqbIEVAxnU4tGPMqMmGR6i6j+WfoSUJkWalIGCdFnOlQF9CE+
         X6rzawQmUhesx93y5PT6E/MAbsnfXV9KhGJJyXYfRuL1UCj3MF7/MK1LAqRaWmAitsR+
         L/quNHRqc/TAWWtA/Nsb6UVfrOTuZL4cb/PoGBxPEDhc5XGk308Rgrwp1U4BYcayTD+I
         o4zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version;
        bh=UX+4u3V1Y2tPHth8Wcu+SDOOt5/oAqcVMwJA7Wy8hAE=;
        b=rZ+scTgclwPlAVvvOexGW5ZI16FdIBuTdba1pR74PFTiOBe8zsKMwyjheZqPotNJvJ
         T1LsNUnTmAD7xzO2zOWPKdbxkYPkGg2qNQzImvAiQIzznoO7yasm8AnQEUA6mMgg6Rpc
         Cbq4n50LV7Vz2H/hlDQsaJ/HNzZsUqR/m85ozfij4z73WFAL/UAzp4hZUeIzYMhB42HW
         6+5zOdJHehsQEWFEKoY4D8gohd6QlckzV7Fp7h9XB6lbSoUp9WOube0qRrMPx71bB164
         A1J2X+WFN7wJgZE17Be2wQsm7zEM3UduO7D6mlqcORHNf/n1ydTs1CTLV+h/OKeYMcTD
         zlEA==
X-Gm-Message-State: AOAM530hLHxmqxQgaisjryNHF+NYI11bFYcd09SZyU/Wh85DDNh0PWZF
        Ai3tnmSnAWoCXwnPMeCh/WMB3TPe36OUB5M=
X-Google-Smtp-Source: ABdhPJyHLmoOaT0pa+OErIQaiQz5b093/9nkjOUJZ0E+mWcdYRtko6EFJUOgX8eiD0yzB5xqMDuq2g==
X-Received: by 2002:a1c:ac05:: with SMTP id v5mr4408683wme.13.1628892708184;
        Fri, 13 Aug 2021 15:11:48 -0700 (PDT)
Received: from localhost ([2a00:a040:195:275f:b5f4:a59c:7c43:6667])
        by smtp.gmail.com with ESMTPSA id a9sm2899591wrv.37.2021.08.13.15.11.46
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Aug 2021 15:11:47 -0700 (PDT)
Received: from 127.0.0.1 (ident=unknown) by matan.home with esmtp
 (masqmail 0.2.21) id 1mEfOx-RWt-00; Sat, 14 Aug 2021 01:11:43 +0300
Date:   Sat, 14 Aug 2021 01:11:43 +0300 (IDT)
From:   Matan Ziv-Av <matan@svgalib.org>
To:     Platform Driver <platform-driver-x86@vger.kernel.org>
cc:     Andy Shevchenko <andy@infradead.org>
Subject: [PATCH] platform/x86: lg-laptop: Support for battery charge limit
 on newer models
Message-ID: <9338b0b1-e76e-68f5-36de-a642745ba6ad@svgalib.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
index 20145b539335..12b0257c0bdd 100644
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
+		if (!battery_limit_use_wmbb)
+			r = lg_wmab(WM_BATT_LIMIT, WM_SET, value);
+		else
+			r = lg_wmbb(WMBB_BATT_LIMIT, WM_SET, value);
 		if (!r)
 			return -EIO;
 
@@ -479,16 +485,29 @@ static ssize_t battery_care_limit_show(struct device *dev,
 	unsigned int status;
 	union acpi_object *r;
 
-	r = lg_wmab(WM_BATT_LIMIT, WM_GET, 0);
-	if (!r)
-		return -EIO;
+	if (!battery_limit_use_wmbb) {
+		r = lg_wmab(WM_BATT_LIMIT, WM_GET, 0);
+		if (!r)
+			return -EIO;
 
-	if (r->type != ACPI_TYPE_INTEGER) {
-		kfree(r);
-		return -EIO;
-	}
+		if (r->type != ACPI_TYPE_INTEGER) {
+			kfree(r);
+			return -EIO;
+		}
 
-	status = r->integer.value;
+		status = r->integer.value;
+	} else {
+		r = lg_wmbb(WMBB_BATT_LIMIT, WM_GET, 0);
+		if (!r)
+			return -EIO;
+
+		if (r->type != ACPI_TYPE_BUFFER) {
+			kfree(r);
+			return -EIO;
+		}
+
+		status = r->buffer.pointer[0x10];
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
2.31.1


-- 
Matan.

