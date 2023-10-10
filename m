Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2735CD8CAC
	for <platform-driver-x86@archiver.kernel.org>; Tue, 10 Oct 2023 17:22:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234015AbjJJRWD (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 10 Oct 2023 13:22:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233970AbjJJRWC (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 10 Oct 2023 13:22:02 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D7BE8E
        for <platform-driver-x86@vger.kernel.org>; Tue, 10 Oct 2023 10:22:00 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-50433d8385cso7956149e87.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 10 Oct 2023 10:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696958518; x=1697563318; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uKxtMXjcsXq1ad3+ROeY4NR6VvCZzHU/kFj4HlyMsXo=;
        b=IL7AChrQl8RISijZalosmXmR+xfO+ZArC/c+hk1dIf9b9xo+4KD6TuZ2YXeL92Jsv4
         wnFGtm/PSYzaQ8p01FvBHkDks0qwl/jakYcF0asSNDs2teWK6u5NX0Wq+X+CHrteYMZK
         26AHTGOnjnAsJWeDM0aFXrvyzTwcc9eqxyIamksm7Zt+u/VIXWQeU1tTxRW4j7KE8dPy
         cNzDnP3Sjv56NEumFsCEMJQU1DXReIebX+6DAgaMHN0c2z0Wiz42/YjPw2TPOdDdELOt
         6Dz7F12rRKLawII2c9IoyZT9z4AHtUUOeDajScWk25GPaSWxhnWwLCDiza5FlF8uOqgm
         EdDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696958518; x=1697563318;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uKxtMXjcsXq1ad3+ROeY4NR6VvCZzHU/kFj4HlyMsXo=;
        b=TkYN27tEiCGzzy69ceRqgCTLoHpTdSSwgHhN6RprRMiHZLzZHx5oiuypNBcAJ3SFfJ
         UL0pGHNQvsXPr+K8tUp67qtesLruq8x43pbPcHOBaGUUoVCGr9yaBsFZhgg/HK9p7420
         PK7bkt+egNxfkThBRxOQik693oFuiFn67ZR9UB6yNLK6hCqCdbWbIyzMzRcx9/PtfCsq
         nX0XbnnbCHynzWnnAYjOBHfIiTEAZ6yhVcGT7eHwmmxdwPbcjH3KbZE2R1X2bGzECo4y
         jQ/Tci5l0fO526aehNeTimiwbd8rzCsWs5aYDRP+E7DAS2MxPwJeiR9rY9AvS+MR5kTX
         L2qg==
X-Gm-Message-State: AOJu0YxNVQkJ1XVIxl2FmBLQq4UxrojlmFCjEhwK58dghpef+Lq2/F+J
        HxPurYM7gq+KhEHbDqAXVk8fqxsH2uI=
X-Google-Smtp-Source: AGHT+IGY8lYVGSuaAgm9cCu13jLiQB96eMAVf6E5y/PMXwvzlC8R67tPxy5PhtEpCf/OWDxOZBHwtw==
X-Received: by 2002:ac2:4d87:0:b0:4fb:77d6:89c3 with SMTP id g7-20020ac24d87000000b004fb77d689c3mr14886248lfe.12.1696958518343;
        Tue, 10 Oct 2023 10:21:58 -0700 (PDT)
Received: from localhost.localdomain ([81.177.126.138])
        by smtp.gmail.com with ESMTPSA id y2-20020a197502000000b005041f004d33sm1881636lfe.90.2023.10.10.10.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 10:21:58 -0700 (PDT)
From:   Nikita Kravets <teackot@gmail.com>
To:     platform-driver-x86@vger.kernel.org
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Nikita Kravets <teackot@gmail.com>,
        Aakash Singh <mail@singhaakash.dev>,
        Jose Angel Pastrana <japp0005@red.ujaen.es>
Subject: [PATCH 1/5] platform/x86: msi-ec: Register a platform driver
Date:   Tue, 10 Oct 2023 20:20:36 +0300
Message-ID: <20231010172037.611063-5-teackot@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231010172037.611063-3-teackot@gmail.com>
References: <20231010172037.611063-3-teackot@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Register a platform driver for the future features.

Cc: Aakash Singh <mail@singhaakash.dev>
Cc: Jose Angel Pastrana <japp0005@red.ujaen.es>
Signed-off-by: Nikita Kravets <teackot@gmail.com>
---
 drivers/platform/x86/msi-ec.c | 44 +++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/drivers/platform/x86/msi-ec.c b/drivers/platform/x86/msi-ec.c
index f26a3121092f..12c559c9eac4 100644
--- a/drivers/platform/x86/msi-ec.c
+++ b/drivers/platform/x86/msi-ec.c
@@ -818,6 +818,30 @@ static struct acpi_battery_hook battery_hook = {
 	.name = MSI_EC_DRIVER_NAME,
 };
 
+/*
+ * Sysfs platform driver
+ */
+
+static int msi_platform_probe(struct platform_device *pdev)
+{
+	return 0;
+}
+
+static int msi_platform_remove(struct platform_device *pdev)
+{
+	return 0;
+}
+
+static struct platform_device *msi_platform_device;
+
+static struct platform_driver msi_platform_driver = {
+	.driver = {
+		.name = MSI_EC_DRIVER_NAME,
+	},
+	.probe = msi_platform_probe,
+	.remove = msi_platform_remove,
+};
+
 /*
  * Module load/unload
  */
@@ -878,6 +902,23 @@ static int __init msi_ec_init(void)
 	if (result < 0)
 		return result;
 
+	result = platform_driver_register(&msi_platform_driver);
+	if (result < 0)
+		return result;
+
+	msi_platform_device = platform_device_alloc(MSI_EC_DRIVER_NAME, -1);
+	if (msi_platform_device == NULL) {
+		platform_driver_unregister(&msi_platform_driver);
+		return -ENOMEM;
+	}
+
+	result = platform_device_add(msi_platform_device);
+	if (result < 0) {
+		platform_device_del(msi_platform_device);
+		platform_driver_unregister(&msi_platform_driver);
+		return result;
+	}
+
 	battery_hook_register(&battery_hook);
 	return 0;
 }
@@ -885,6 +926,9 @@ static int __init msi_ec_init(void)
 static void __exit msi_ec_exit(void)
 {
 	battery_hook_unregister(&battery_hook);
+
+	platform_driver_unregister(&msi_platform_driver);
+	platform_device_del(msi_platform_device);
 }
 
 MODULE_LICENSE("GPL");
-- 
2.42.0

