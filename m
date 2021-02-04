Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6057DC433E9
	for <platform-driver-x86@archiver.kernel.org>; Thu,  4 Feb 2021 14:04:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2E13964E31
	for <platform-driver-x86@archiver.kernel.org>; Thu,  4 Feb 2021 14:04:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236477AbhBDOEc (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 4 Feb 2021 09:04:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56331 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236474AbhBDODf (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 4 Feb 2021 09:03:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1612447328;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=UR+AJHhEF52v3IqMX2WI/qgX1ebauGN7dyW3GG09TQs=;
        b=TsDqvjh74Z9U4o1dzxlebZFf0zpJP1y1y9A46HOP8etvw1sf9zpDBXhDgM4dij6qaEPbmJ
        UNdGFu0zkUeU/4kK347k8LrksFfo0JrYjjeLItdQ6y8sk/7oX6eXN0dlsCAtggyCjDUzsD
        RQRCi5mk9Ay7l5fnKK0Ai0KfXmr43vE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-557-igWK42KIPGmNXORWQhHQIg-1; Thu, 04 Feb 2021 09:02:03 -0500
X-MC-Unique: igWK42KIPGmNXORWQhHQIg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 27DBB107ACE6;
        Thu,  4 Feb 2021 14:02:02 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-112.ams2.redhat.com [10.36.112.112])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 0DEE65C54B;
        Thu,  4 Feb 2021 14:02:00 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <mgross@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andy@infradead.org>,
        platform-driver-x86@vger.kernel.org,
        Mark Pearson <markpearson@lenovo.com>
Subject: [PATCH 2/2] platform/x86: thinkpad_acpi: Replace ifdef CONFIG_ACPI_PLATFORM_PROFILE with depends on
Date:   Thu,  4 Feb 2021 15:01:58 +0100
Message-Id: <20210204140158.268289-2-hdegoede@redhat.com>
In-Reply-To: <20210204140158.268289-1-hdegoede@redhat.com>
References: <20210204140158.268289-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

With the #if IS_ENABLED(CONFIG_ACPI_PLATFORM_PROFILE), we get the following
errors when thinkpad_acpi is builtin while CONFIG_ACPI_PLATFORM_PROFILE=m :

drivers/platform/x86/thinkpad_acpi.c:10186: undefined reference to `platform_profile_notify'
drivers/platform/x86/thinkpad_acpi.c:10226: undefined reference to `platform_profile_register'
drivers/platform/x86/thinkpad_acpi.c:10246: undefined reference to `platform_profile_remove'

This could be fixed by changing the IS_ENABLED to IS_REACHABLE, but
I believe that it is better to just switch to using depends on.

Using depends on ensures that platform-profile support is always
available when thinkpad_acpi is build, hopefully leading to less
confusing bug-reports about it sometimes not working.

Cc: Mark Pearson <markpearson@lenovo.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/Kconfig         | 1 +
 drivers/platform/x86/thinkpad_acpi.c | 7 -------
 2 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 0e1723b3d312..39b588bf791a 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -655,6 +655,7 @@ config THINKPAD_ACPI
 	depends on RFKILL || RFKILL = n
 	depends on ACPI_VIDEO || ACPI_VIDEO = n
 	depends on BACKLIGHT_CLASS_DEVICE
+	depends on ACPI_PLATFORM_PROFILE
 	select DRM_PRIVACY_SCREEN
 	select HWMON
 	select NVRAM
diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 8e9acbd9a1a8..59113059649e 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -10034,8 +10034,6 @@ static struct ibm_struct proxsensor_driver_data = {
 	.exit = proxsensor_exit,
 };
 
-#if IS_ENABLED(CONFIG_ACPI_PLATFORM_PROFILE)
-
 /*************************************************************************
  * DYTC Platform Profile interface
  */
@@ -10290,7 +10288,6 @@ static struct ibm_struct  dytc_profile_driver_data = {
 	.name = "dytc-profile",
 	.exit = dytc_profile_exit,
 };
-#endif /* CONFIG_ACPI_PLATFORM_PROFILE */
 
 /*************************************************************************
  * Keyboard language interface
@@ -10515,11 +10512,9 @@ static void tpacpi_driver_event(const unsigned int hkey_event)
 
 	if (hkey_event == TP_HKEY_EV_THM_CSM_COMPLETED) {
 		lapsensor_refresh();
-#if IS_ENABLED(CONFIG_ACPI_PLATFORM_PROFILE)
 		/* If we are already accessing DYTC then skip dytc update */
 		if (!atomic_add_unless(&dytc_ignore_event, -1, 0))
 			dytc_profile_refresh();
-#endif
 	}
 
 	if (lcdshadow_dev && hkey_event == TP_HKEY_EV_PRIVACYGUARD_TOGGLE) {
@@ -10971,12 +10966,10 @@ static struct ibm_init_struct ibms_init[] __initdata = {
 		.init = tpacpi_proxsensor_init,
 		.data = &proxsensor_driver_data,
 	},
-#if IS_ENABLED(CONFIG_ACPI_PLATFORM_PROFILE)
 	{
 		.init = tpacpi_dytc_profile_init,
 		.data = &dytc_profile_driver_data,
 	},
-#endif
 	{
 		.init = tpacpi_kbdlang_init,
 		.data = &kbdlang_driver_data,
-- 
2.29.2

