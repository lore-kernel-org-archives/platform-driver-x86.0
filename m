Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29424C433EF
	for <platform-driver-x86@archiver.kernel.org>; Tue, 23 Nov 2021 21:05:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234200AbhKWVJB (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 23 Nov 2021 16:09:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30858 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234024AbhKWVJA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 23 Nov 2021 16:09:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1637701551;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4YtW5XacuK3VcIVAyk/xM2AfABXQweum9UH4JcN/Dl0=;
        b=OowT+qVhxyqIkuOBNuMcrTXwMqru6lH27415K2iTGwEKKxptq3Bc6A4JiL5jK+G5eB0+Gl
        PfKkf0cRhwMCD1NGE+X2pCUQmbSHLEjtLjRDUv2yTIA101dKgTITG5bebj5pRb+gDwLhAH
        0KjpmkgG3ZCH+Z78hFbGEbtGPFZ1aD4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-2-9Dz5wQ-dOkmTVUdeixxRxw-1; Tue, 23 Nov 2021 16:04:46 -0500
X-MC-Unique: 9Dz5wQ-dOkmTVUdeixxRxw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C68041DDF3;
        Tue, 23 Nov 2021 21:04:45 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.192.41])
        by smtp.corp.redhat.com (Postfix) with ESMTP id C6B1F79448;
        Tue, 23 Nov 2021 21:04:40 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Mark Pearson <markpearson@lenovo.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, Len Baker <len.baker@gmx.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 4/6] platform/x86: thinkpad_acpi: Fix the hwmon sysfs-attr showing up in the wrong place
Date:   Tue, 23 Nov 2021 22:04:22 +0100
Message-Id: <20211123210424.266607-5-hdegoede@redhat.com>
In-Reply-To: <20211123210424.266607-1-hdegoede@redhat.com>
References: <20211123210424.266607-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The hwmon sysfs-attr should show up under the hwmon-classdev, not under
the tpacpi_sensors_pdev. Pass the tpacpi_hwmon_groups attr-groups array
to hwmon_device_register_with_groups() instead of setting
tpacpi_hwmon_pdriver.driver.dev_groups to it to fix this.

This also requires moving the hwmon_device_register_with_groups() call to
after the subdriver init functions have run so that the is_visible()
calls will work properly.

Fixes: 79f960e29cfc ("platform/x86: thinkpad_acpi: Convert platform driver to use dev_groups")
Cc: Len Baker <len.baker@gmx.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 7680bb0ee2d5..2f290ed59d92 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -10537,7 +10537,6 @@ static struct platform_driver tpacpi_hwmon_pdriver = {
 	.driver = {
 		.name = TPACPI_HWMON_DRVR_NAME,
 		.groups = tpacpi_hwmon_driver_groups,
-		.dev_groups = tpacpi_hwmon_groups,
 	},
 };
 
@@ -11186,6 +11185,8 @@ static void thinkpad_acpi_module_exit(void)
 
 	tpacpi_lifecycle = TPACPI_LIFE_EXITING;
 
+	if (tpacpi_hwmon)
+		hwmon_device_unregister(tpacpi_hwmon);
 	if (tp_features.sensors_pdrv_registered)
 		platform_driver_unregister(&tpacpi_hwmon_pdriver);
 	if (tp_features.platform_drv_registered)
@@ -11207,8 +11208,6 @@ static void thinkpad_acpi_module_exit(void)
 		kfree(hotkey_keycode_map);
 	}
 
-	if (tpacpi_hwmon)
-		hwmon_device_unregister(tpacpi_hwmon);
 	if (tpacpi_sensors_pdev)
 		platform_device_unregister(tpacpi_sensors_pdev);
 	if (tpacpi_pdev)
@@ -11287,16 +11286,7 @@ static int __init thinkpad_acpi_module_init(void)
 		return ret;
 	}
 	tp_features.sensors_pdev_attrs_registered = 1;
-	tpacpi_hwmon = hwmon_device_register_with_groups(
-		&tpacpi_sensors_pdev->dev, TPACPI_NAME, NULL, NULL);
 
-	if (IS_ERR(tpacpi_hwmon)) {
-		ret = PTR_ERR(tpacpi_hwmon);
-		tpacpi_hwmon = NULL;
-		pr_err("unable to register hwmon device\n");
-		thinkpad_acpi_module_exit();
-		return ret;
-	}
 	mutex_init(&tpacpi_inputdev_send_mutex);
 	tpacpi_inputdev = input_allocate_device();
 	if (!tpacpi_inputdev) {
@@ -11345,6 +11335,16 @@ static int __init thinkpad_acpi_module_init(void)
 	}
 	tp_features.sensors_pdrv_registered = 1;
 
+	tpacpi_hwmon = hwmon_device_register_with_groups(
+		&tpacpi_sensors_pdev->dev, TPACPI_NAME, NULL, tpacpi_hwmon_groups);
+	if (IS_ERR(tpacpi_hwmon)) {
+		ret = PTR_ERR(tpacpi_hwmon);
+		tpacpi_hwmon = NULL;
+		pr_err("unable to register hwmon device\n");
+		thinkpad_acpi_module_exit();
+		return ret;
+	}
+
 	ret = input_register_device(tpacpi_inputdev);
 	if (ret < 0) {
 		pr_err("unable to register input device\n");
-- 
2.33.1

