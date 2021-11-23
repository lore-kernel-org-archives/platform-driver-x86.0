Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E01EDC433EF
	for <platform-driver-x86@archiver.kernel.org>; Tue, 23 Nov 2021 21:04:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233393AbhKWVHu (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 23 Nov 2021 16:07:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28002 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233903AbhKWVHu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 23 Nov 2021 16:07:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1637701481;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=l2L21CYho9KDHob5Y2PAr2gF2mAe0yXwpmNhb6izqXY=;
        b=Vgs+nqYqAGHwRm+2kmX4Z0PjYncDkLmG2yeBgZf4rnNdb6mX1yKii7tCt0aEO7fQyo7bw7
        IvpEfgj9AFef5ln57oE3tBpVdYTi6cuoQQV9ChrCw0kwM8c1+lrLurWnnztoTQTciI4qYR
        d7EicO4wtLQacsUbXMQ7Jwz/90LJy4U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-97-6UO52ozXM-iiDceAmxBtDg-1; Tue, 23 Nov 2021 16:04:40 -0500
X-MC-Unique: 6UO52ozXM-iiDceAmxBtDg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E8BCD1006AA4;
        Tue, 23 Nov 2021 21:04:38 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.192.41])
        by smtp.corp.redhat.com (Postfix) with ESMTP id AC90A79457;
        Tue, 23 Nov 2021 21:04:37 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Mark Pearson <markpearson@lenovo.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, Len Baker <len.baker@gmx.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 2/6] platform/x86: thinkpad_acpi: Register tpacpi_pdriver after subdriver init
Date:   Tue, 23 Nov 2021 22:04:20 +0100
Message-Id: <20211123210424.266607-3-hdegoede@redhat.com>
In-Reply-To: <20211123210424.266607-1-hdegoede@redhat.com>
References: <20211123210424.266607-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Commit c99ca78d67a6 ("platform/x86: thinkpad_acpi: Switch to common use
of attributes") introduces the use of attribute_group.is_visible callbacks
replacing the conditional calling of driver_create_file() for optional
attributes.

The is_visible callbacks rely on various tp_features.has_foo flags,
which get set by the subdriver init functions.

But before this fix, thinkpad_acpi_module_init() would call the
subdriver init functions after registering the platform_device and
the tpacpi_pdriver. Which would cause the is_visible callbacks to
get called before the subdriver init functions, which in turn would
cause optional attributes to not get registered at all, even when
the feature is actually present.

Fix this by moving the platform_driver_register(&tpacpi_pdriver) to after
the subdriver init calls; and do the same for the tpacpi_hmon_pdriver.

Fixes: c99ca78d67a6 ("platform/x86: thinkpad_acpi: Switch to common use of attributes")
Cc: Len Baker <len.baker@gmx.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 41 ++++++++++++++--------------
 1 file changed, 21 insertions(+), 20 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index ade3c1bdf80d..ecec5351daed 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -11166,6 +11166,11 @@ static void thinkpad_acpi_module_exit(void)
 
 	tpacpi_lifecycle = TPACPI_LIFE_EXITING;
 
+	if (tp_features.sensors_pdrv_registered)
+		platform_driver_unregister(&tpacpi_hwmon_pdriver);
+	if (tp_features.platform_drv_registered)
+		platform_driver_unregister(&tpacpi_pdriver);
+
 	list_for_each_entry_safe_reverse(ibm, itmp,
 					 &tpacpi_all_drivers,
 					 all_drivers) {
@@ -11188,10 +11193,6 @@ static void thinkpad_acpi_module_exit(void)
 		platform_device_unregister(tpacpi_sensors_pdev);
 	if (tpacpi_pdev)
 		platform_device_unregister(tpacpi_pdev);
-	if (tp_features.sensors_pdrv_registered)
-		platform_driver_unregister(&tpacpi_hwmon_pdriver);
-	if (tp_features.platform_drv_registered)
-		platform_driver_unregister(&tpacpi_pdriver);
 	if (proc_dir)
 		remove_proc_entry(TPACPI_PROC_DIR, acpi_root_dir);
 	if (tpacpi_wq)
@@ -11245,22 +11246,6 @@ static int __init thinkpad_acpi_module_init(void)
 		return -ENODEV;
 	}
 
-	ret = platform_driver_register(&tpacpi_pdriver);
-	if (ret) {
-		pr_err("unable to register main platform driver\n");
-		thinkpad_acpi_module_exit();
-		return ret;
-	}
-	tp_features.platform_drv_registered = 1;
-
-	ret = platform_driver_register(&tpacpi_hwmon_pdriver);
-	if (ret) {
-		pr_err("unable to register hwmon platform driver\n");
-		thinkpad_acpi_module_exit();
-		return ret;
-	}
-	tp_features.sensors_pdrv_registered = 1;
-
 	/* Device initialization */
 	tpacpi_pdev = platform_device_register_simple(TPACPI_DRVR_NAME, -1,
 							NULL, 0);
@@ -11324,6 +11309,22 @@ static int __init thinkpad_acpi_module_init(void)
 
 	tpacpi_lifecycle = TPACPI_LIFE_RUNNING;
 
+	ret = platform_driver_register(&tpacpi_pdriver);
+	if (ret) {
+		pr_err("unable to register main platform driver\n");
+		thinkpad_acpi_module_exit();
+		return ret;
+	}
+	tp_features.platform_drv_registered = 1;
+
+	ret = platform_driver_register(&tpacpi_hwmon_pdriver);
+	if (ret) {
+		pr_err("unable to register hwmon platform driver\n");
+		thinkpad_acpi_module_exit();
+		return ret;
+	}
+	tp_features.sensors_pdrv_registered = 1;
+
 	ret = input_register_device(tpacpi_inputdev);
 	if (ret < 0) {
 		pr_err("unable to register input device\n");
-- 
2.33.1

