Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0B1BC61DA4
	for <platform-driver-x86@archiver.kernel.org>; Tue, 14 Feb 2023 16:36:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232029AbjBNQgD (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 14 Feb 2023 11:36:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229930AbjBNQgD (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 14 Feb 2023 11:36:03 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74C1F4218
        for <platform-driver-x86@vger.kernel.org>; Tue, 14 Feb 2023 08:34:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1676392482;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=DW9JYCOsm9ov5IVdh1FUd8CY+YwwvO5ZS1lNa1cls9Q=;
        b=AAo4jmlEy+o6RRs8okj2enHhSQe61a6sI0yefxU0sByFtQ9lIQSxORMCe0bL+6ZKwgyxee
        AX1s++l3+WeoX2+hyyhxU6iAjn78aJjHzq1ikdukf8zqRHO+MXr0fp3LyQD7wzKHnU7nm9
        30qLH1rhZrx6+7mfXOzlfT1V7UIMAkE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-617-bG-fqSZHOB-dhfPhhiuMjQ-1; Tue, 14 Feb 2023 11:34:38 -0500
X-MC-Unique: bG-fqSZHOB-dhfPhhiuMjQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 70D673C0F425;
        Tue, 14 Feb 2023 16:34:38 +0000 (UTC)
Received: from x1.nl (unknown [10.39.192.232])
        by smtp.corp.redhat.com (Postfix) with ESMTP id AE50840B40C9;
        Tue, 14 Feb 2023 16:34:36 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Daniel Dadap <ddadap@nvidia.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Luke McCarthy <mail@lukehmcc.com>, regressions@lists.linux.dev,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH] platform/x86: nvidia-wmi-ec-backlight: Add force module parameter
Date:   Tue, 14 Feb 2023 17:34:35 +0100
Message-Id: <20230214163435.7065-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On models with the Nvidia WMI EC backlight interface, when the laptop is
configured in dynamic mux mode in the BIOS the backlight should always be
controlled by the Nvidia WMI EC backlight interface.

But it turns out that on some laptop models, E.g. Some Lenovo Legion models
/sys/class/backlight/nvidia_wmi_ec_backlight only works when the LCD panel
is muxed to the Nvidia GPU and when muxed to the AMD iGPU amdgpu_bl0
controls the backlight.

This appears to be a firmware bug on these laptops, but prior to 6.1.4
users would have both nvidia_wmi_ec_backlight and amdgpu_bl0 and could
work around this in userspace.

Add a force module parameter which can be used with acpi_backlight=native
to restore the old behavior as a workound (for now):

"acpi_backlight=native nvidia-wmi-ec-backlight.force=1"

Fixes: 8d0ca287fd8c ("platform/x86: nvidia-wmi-ec-backlight: Use acpi_video_get_backlight_type()")
Link: https://bugzilla.kernel.org/show_bug.cgi?id=217026
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/nvidia-wmi-ec-backlight.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/nvidia-wmi-ec-backlight.c b/drivers/platform/x86/nvidia-wmi-ec-backlight.c
index baccdf658538..1b572c90c76e 100644
--- a/drivers/platform/x86/nvidia-wmi-ec-backlight.c
+++ b/drivers/platform/x86/nvidia-wmi-ec-backlight.c
@@ -12,6 +12,10 @@
 #include <linux/wmi.h>
 #include <acpi/video.h>
 
+static bool force;
+module_param(force, bool, 0444);
+MODULE_PARM_DESC(force, "Force loading (disable acpi_backlight=xxx checks");
+
 /**
  * wmi_brightness_notify() - helper function for calling WMI-wrapped ACPI method
  * @w:    Pointer to the struct wmi_device identified by %WMI_BRIGHTNESS_GUID
@@ -91,7 +95,7 @@ static int nvidia_wmi_ec_backlight_probe(struct wmi_device *wdev, const void *ct
 	int ret;
 
 	/* drivers/acpi/video_detect.c also checks that SOURCE == EC */
-	if (acpi_video_get_backlight_type() != acpi_backlight_nvidia_wmi_ec)
+	if (!force && acpi_video_get_backlight_type() != acpi_backlight_nvidia_wmi_ec)
 		return -ENODEV;
 
 	/*
-- 
2.39.1

