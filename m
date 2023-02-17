Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08E15C05027
	for <platform-driver-x86@archiver.kernel.org>; Fri, 17 Feb 2023 14:43:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229734AbjBQOnC (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 17 Feb 2023 09:43:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229580AbjBQOnB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 17 Feb 2023 09:43:01 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C36F6D271
        for <platform-driver-x86@vger.kernel.org>; Fri, 17 Feb 2023 06:42:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1676644934;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=+to4UHiUaaWlmqhp9/u5LSsHFJ9FxRfzJ2CJA+u2D2g=;
        b=hkh/o14UhNFu4nwKbCyXb3VHz8sFUl8qU+cRQFXhp4Lns/QYreq0Q5X63xj9B9eTkRNdu7
        ++xcrEHwgzllBu5chZ0uI0fuVodMiylIKHjg0ierMhQ8pkSgQQwup8dznuq81lMPKGliVI
        pauGzyabCvaVHxCOZ1A+pqpCKQKI0G0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-474-t72OOqcFOTG-bJR1AhkMIQ-1; Fri, 17 Feb 2023 09:42:10 -0500
X-MC-Unique: t72OOqcFOTG-bJR1AhkMIQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3D8E2185A794;
        Fri, 17 Feb 2023 14:42:10 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.193.199])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 32D232026D4B;
        Fri, 17 Feb 2023 14:42:09 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Daniel Dadap <ddadap@nvidia.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Luke McCarthy <mail@lukehmcc.com>,
        platform-driver-x86@vger.kernel.org, regressions@lists.linux.dev
Subject: [PATCH v2] platform/x86: nvidia-wmi-ec-backlight: Add force module parameter
Date:   Fri, 17 Feb 2023 15:42:08 +0100
Message-Id: <20230217144208.5721-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On some Lenovo Legion models, the backlight might be driven by either
one of nvidia_wmi_ec_backlight or amdgpu_bl0 at different times.

When the Nvidia WMI EC backlight interface reports the backlight is
controlled by the EC, the current backlight handling only registers
nvidia_wmi_ec_backlight (and registers no other backlight interfaces).

This hides (never registers) the amdgpu_bl0 interface, where as prior
to 6.1.4 users would have both nvidia_wmi_ec_backlight and amdgpu_bl0
and could work around things in userspace.

Add a force module parameter which can be used with acpi_backlight=native
to restore the old behavior as a workound (for now) by passing:

"acpi_backlight=native nvidia-wmi-ec-backlight.force=1"

Fixes: 8d0ca287fd8c ("platform/x86: nvidia-wmi-ec-backlight: Use acpi_video_get_backlight_type()")
Link: https://bugzilla.kernel.org/show_bug.cgi?id=217026
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
- Reword commit message
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

