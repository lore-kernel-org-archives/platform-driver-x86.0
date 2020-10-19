Return-Path: <SRS0=1m0M=D2=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6D3AC433E7
	for <platform-driver-x86@archiver.kernel.org>; Mon, 19 Oct 2020 18:57:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3ED8F223BF
	for <platform-driver-x86@archiver.kernel.org>; Mon, 19 Oct 2020 18:57:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VN6USaVJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730464AbgJSS5J (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 19 Oct 2020 14:57:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47853 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727681AbgJSS5J (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 19 Oct 2020 14:57:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1603133828;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=gZBl3Pn6FtCWNQBiXprUb629hE0g38uzM7/kCaPH3uk=;
        b=VN6USaVJq5Cwy1elja6EdjQfT1cVuYm3SPJii3Je+g2uZd31J2YMM6UJo1N5d90HHqzSTn
        W3yaen5klakCkjHxDpGNxPjx9ZLd0s3u0gCQEcfJdLZTKyOxXCQCgtaTeSohOgarBNp87g
        Q/hJL4eEPh0GnU6Av4Z3MrjnXDxOeSM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-EbP9IOpyNxCbjmT7Gg46kQ-1; Mon, 19 Oct 2020 14:57:06 -0400
X-MC-Unique: EbP9IOpyNxCbjmT7Gg46kQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 78BE2802B7A;
        Mon, 19 Oct 2020 18:56:35 +0000 (UTC)
Received: from x1.localdomain (ovpn-114-62.ams2.redhat.com [10.36.114.62])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 5D73A60DA0;
        Mon, 19 Oct 2020 18:56:34 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <mgross@linux.intel.com>, Lee Chun-Yi <jlee@suse.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andy@infradead.org>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 3/6] platform/x86: acer-wmi: Cleanup accelerometer device handling
Date:   Mon, 19 Oct 2020 20:56:25 +0200
Message-Id: <20201019185628.264473-3-hdegoede@redhat.com>
In-Reply-To: <20201019185628.264473-1-hdegoede@redhat.com>
References: <20201019185628.264473-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Cleanup accelerometer device handling:
-Drop acer_wmi_accel_destroy instead directly call input_unregister_device.
-The information tracked by the CAP_ACCEL flag mirrors acer_wmi_accel_dev
 being NULL. Drop the CAP flag, this is a preparation change for allowing
 users to override the capability flags. Dropping the flag stops users
 from causing a NULL pointer dereference by forcing the capability.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/acer-wmi.c | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index 2f69d418ed3b..f728cb5e5115 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -210,7 +210,6 @@ struct hotkey_function_type_aa {
 #define ACER_CAP_BLUETOOTH		BIT(2)
 #define ACER_CAP_BRIGHTNESS		BIT(3)
 #define ACER_CAP_THREEG			BIT(4)
-#define ACER_CAP_ACCEL			BIT(5)
 
 /*
  * Interface type flags
@@ -1510,7 +1509,7 @@ static int acer_gsensor_event(void)
 	struct acpi_buffer output;
 	union acpi_object out_obj[5];
 
-	if (!has_cap(ACER_CAP_ACCEL))
+	if (!acer_wmi_accel_dev)
 		return -1;
 
 	output.length = sizeof(out_obj);
@@ -1884,8 +1883,6 @@ static int __init acer_wmi_accel_setup(void)
 	gsensor_handle = acpi_device_handle(adev);
 	acpi_dev_put(adev);
 
-	interface->capability |= ACER_CAP_ACCEL;
-
 	acer_wmi_accel_dev = input_allocate_device();
 	if (!acer_wmi_accel_dev)
 		return -ENOMEM;
@@ -1911,11 +1908,6 @@ static int __init acer_wmi_accel_setup(void)
 	return err;
 }
 
-static void acer_wmi_accel_destroy(void)
-{
-	input_unregister_device(acer_wmi_accel_dev);
-}
-
 static int __init acer_wmi_input_setup(void)
 {
 	acpi_status status;
@@ -2070,7 +2062,7 @@ static int acer_resume(struct device *dev)
 	if (has_cap(ACER_CAP_BRIGHTNESS))
 		set_u32(data->brightness, ACER_CAP_BRIGHTNESS);
 
-	if (has_cap(ACER_CAP_ACCEL))
+	if (acer_wmi_accel_dev)
 		acer_gsensor_init();
 
 	return 0;
@@ -2260,8 +2252,8 @@ static int __init acer_wmi_init(void)
 error_platform_register:
 	if (wmi_has_guid(ACERWMID_EVENT_GUID))
 		acer_wmi_input_destroy();
-	if (has_cap(ACER_CAP_ACCEL))
-		acer_wmi_accel_destroy();
+	if (acer_wmi_accel_dev)
+		input_unregister_device(acer_wmi_accel_dev);
 
 	return err;
 }
@@ -2271,8 +2263,8 @@ static void __exit acer_wmi_exit(void)
 	if (wmi_has_guid(ACERWMID_EVENT_GUID))
 		acer_wmi_input_destroy();
 
-	if (has_cap(ACER_CAP_ACCEL))
-		acer_wmi_accel_destroy();
+	if (acer_wmi_accel_dev)
+		input_unregister_device(acer_wmi_accel_dev);
 
 	remove_debugfs();
 	platform_device_unregister(acer_platform_device);
-- 
2.28.0

