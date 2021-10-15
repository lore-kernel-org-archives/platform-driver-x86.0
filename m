Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F87AC433F5
	for <platform-driver-x86@archiver.kernel.org>; Fri, 15 Oct 2021 19:13:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E3E25610E5
	for <platform-driver-x86@archiver.kernel.org>; Fri, 15 Oct 2021 19:13:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233820AbhJOTPj (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 15 Oct 2021 15:15:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233027AbhJOTPi (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 15 Oct 2021 15:15:38 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4B5FC061570
        for <platform-driver-x86@vger.kernel.org>; Fri, 15 Oct 2021 12:13:31 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id v17so28054717wrv.9
        for <platform-driver-x86@vger.kernel.org>; Fri, 15 Oct 2021 12:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DZpfRJ5Wsp+elNp3qfYlVSpSmosZFTBdyWRL6bfOz/U=;
        b=V6EKMCFhiZLuL1uEW8i8J2VUQWvHKE6INUIzJyUMbjGnOPunWeiT08Ihd85GD9Kjp2
         63h4rHSYtTzFUySIi5q3+9xk2kaw36E6Lo8XbfGAkpX85yxNl24Vhp2/eH38X3BJ9HfQ
         ShGPkGxDnJn7zI6CrkuAvXVmVxSaencwQJ7UTf57/AClHajNGY0Sp1MgTrWbS/CbU5vJ
         4GT0KSdsl1ZTuZYnm4D8szaII+2Ihx3meECvOMT42aVqcP6C5jDeo2LN/VeL8G4D9hbU
         be1sMY4vJuMf+sN/Df9C6gnIy8aDh3LBkgG2pVByKCWNl9qRZ7uxBd8poxNa7ILbjc/m
         4/3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DZpfRJ5Wsp+elNp3qfYlVSpSmosZFTBdyWRL6bfOz/U=;
        b=uNlwojcc3DSbAZfibvdGTSZ/hPYzbr6kjqr4NQtt81FmUNzE2Lyor/6JDUkgOzM/Nb
         Ki1QVnV9TpppTB3r6UcqkXtRr6DepKJrDtIBaMszUonStgGOd5dD0zDqC8/9Gz5FJv2i
         M9Km5lZ7A4QcIUw8wrr5E3CgjZEUuN6NOAIy8Y32RrIhV1F0vyjiP244s0aXcmyl5DNM
         k2GKDYc4pZfzps3hAc6kHki1W+X/CIXE9l80Ie40zeQcIKDfGgPxlQuJGJvoOOXp/Zr8
         e5LKkT8LlXMcFcZUFL1jNgT2P0UqVf7ocMzfWoqwX1beomDZNg0oMLQHhqqZQAzCBYMX
         uflg==
X-Gm-Message-State: AOAM53074oiCt+FlpGPv3+BLq0Z7JwgpQdOPoJSmzeag9SyMB8zGnGny
        dKy2UDq8I/F29yWmRcCzRBo=
X-Google-Smtp-Source: ABdhPJzX2CyBotSRI/m/S/uqWKdBDuB2QAvy29DvMqGBm5G3tw7V8pVp+lRkM4rNSf0/FNW44IsdrQ==
X-Received: by 2002:a5d:6dad:: with SMTP id u13mr16498691wrs.370.1634325210263;
        Fri, 15 Oct 2021 12:13:30 -0700 (PDT)
Received: from mikalai-laptop.. ([37.214.28.127])
        by smtp.googlemail.com with ESMTPSA id a5sm5658914wrn.71.2021.10.15.12.13.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 12:13:29 -0700 (PDT)
From:   Mikalai Ramanovich <nikolay.romanovich.00@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org,
        Mikalai Ramanovich <nikolay.romanovich.00@gmail.com>
Subject: [PATCH] platform/x86: wmi: change notification handler type
Date:   Fri, 15 Oct 2021 22:13:22 +0300
Message-Id: <20211015191322.73388-1-nikolay.romanovich.00@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Since AML code on some Xiaomi laptops notifies the WMI hotkey with
0x20 event, we need ACPI_ALL_NOTIFY here to be able to handle it.

Signed-off-by: Mikalai Ramanovich <nikolay.romanovich.00@gmail.com>
---
 drivers/platform/x86/wmi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
index e6997be206f1..c34341f4da76 100644
--- a/drivers/platform/x86/wmi.c
+++ b/drivers/platform/x86/wmi.c
@@ -1352,7 +1352,7 @@ static int acpi_wmi_remove(struct platform_device *device)
 {
 	struct acpi_device *acpi_device = ACPI_COMPANION(&device->dev);
 
-	acpi_remove_notify_handler(acpi_device->handle, ACPI_DEVICE_NOTIFY,
+	acpi_remove_notify_handler(acpi_device->handle, ACPI_ALL_NOTIFY,
 				   acpi_wmi_notify_handler);
 	acpi_remove_address_space_handler(acpi_device->handle,
 				ACPI_ADR_SPACE_EC, &acpi_wmi_ec_space_handler);
@@ -1385,7 +1385,7 @@ static int acpi_wmi_probe(struct platform_device *device)
 	}
 
 	status = acpi_install_notify_handler(acpi_device->handle,
-					     ACPI_DEVICE_NOTIFY,
+					     ACPI_ALL_NOTIFY,
 					     acpi_wmi_notify_handler,
 					     NULL);
 	if (ACPI_FAILURE(status)) {
@@ -1414,7 +1414,7 @@ static int acpi_wmi_probe(struct platform_device *device)
 	device_unregister(wmi_bus_dev);
 
 err_remove_notify_handler:
-	acpi_remove_notify_handler(acpi_device->handle, ACPI_DEVICE_NOTIFY,
+	acpi_remove_notify_handler(acpi_device->handle, ACPI_ALL_NOTIFY,
 				   acpi_wmi_notify_handler);
 
 err_remove_ec_handler:
-- 
2.33.0

