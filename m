Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0C61C4321A
	for <platform-driver-x86@archiver.kernel.org>; Fri, 15 Jan 2021 16:20:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 794DB2395A
	for <platform-driver-x86@archiver.kernel.org>; Fri, 15 Jan 2021 16:20:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728704AbhAOQU3 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 15 Jan 2021 11:20:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51993 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726751AbhAOQU3 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 15 Jan 2021 11:20:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1610727542;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=XmnlWSG9j841vqLme9jhs1RsEHFzRjpKiyCDixbZvSc=;
        b=fxeDg7Uyypd4mFz6XtjYzYBjViahd6LWh0YlNTt+uHIFjZ2N6Ke6JJs/Rio060Rj8iks+V
        qdGX8dmnwF1b1y7Yizs1AQt/UCZXdvIrAagyRKwJ61kSv1c+O9KhzulcRolTPyjlHPFDFg
        lrhSfe+xZDbzpdT3RGZBBnC5oIzxghc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-160-jde5AtoPNSaWKDQ02PcAnw-1; Fri, 15 Jan 2021 11:18:58 -0500
X-MC-Unique: jde5AtoPNSaWKDQ02PcAnw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C111B107ACF8;
        Fri, 15 Jan 2021 16:18:56 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-172.ams2.redhat.com [10.36.112.172])
        by smtp.corp.redhat.com (Postfix) with ESMTP id A56505F9C5;
        Fri, 15 Jan 2021 16:18:55 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <mgross@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andy@infradead.org>,
        platform-driver-x86@vger.kernel.org,
        Elia Devito <eliadevito@gmail.com>
Subject: [PATCH 4/4] platform/x86: intel-vbtn: Eval VBDL after registering our notifier
Date:   Fri, 15 Jan 2021 17:18:50 +0100
Message-Id: <20210115161850.117614-4-hdegoede@redhat.com>
In-Reply-To: <20210115161850.117614-1-hdegoede@redhat.com>
References: <20210115161850.117614-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The VBDL ACPI method enables button/switch reporting through the
intel-vbtn device. In some cases the embedded-controller (EC) might
call Notify() on the intel-vbtn device immediately after the
the VBDL call to make sure that the OS is synced with the EC's
button and switch state.

If we register our notify_handler after evaluating VBDL this means
that we might miss the Notify() calls made by the EC to sync the
state.

E.g. the HP Stream x360 Convertible PC 11 has a VGBS method which
always returns 0, independent of the actual SW_TABLET_MODE state
of the device; and immediately after the VBDL call it calls
Notify(0xCD) or Notify(0xCC) to report the actual state.

Move the evaluation of VBDL to after registering our notify_handler
so that we don't miss any events.

Cc: Elia Devito <eliadevito@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/intel-vbtn.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/x86/intel-vbtn.c b/drivers/platform/x86/intel-vbtn.c
index 852cb07c3dfd..8a8017f9ca91 100644
--- a/drivers/platform/x86/intel-vbtn.c
+++ b/drivers/platform/x86/intel-vbtn.c
@@ -189,14 +189,6 @@ static void notify_handler(acpi_handle handle, u32 event, void *context)
 	sparse_keymap_report_event(input_dev, event, val, autorelease);
 }
 
-static bool intel_vbtn_has_buttons(acpi_handle handle)
-{
-	acpi_status status;
-
-	status = acpi_evaluate_object(handle, "VBDL", NULL, NULL);
-	return ACPI_SUCCESS(status);
-}
-
 /*
  * There are several laptops (non 2-in-1) models out there which support VGBS,
  * but simply always return 0, which we translate to SW_TABLET_MODE=1. This in
@@ -271,7 +263,7 @@ static int intel_vbtn_probe(struct platform_device *device)
 	acpi_status status;
 	int err;
 
-	has_buttons = intel_vbtn_has_buttons(handle);
+	has_buttons = acpi_has_method(handle, "VBDL");
 	has_switches = intel_vbtn_has_switches(handle);
 
 	if (!has_buttons && !has_switches) {
@@ -300,6 +292,12 @@ static int intel_vbtn_probe(struct platform_device *device)
 	if (ACPI_FAILURE(status))
 		return -EBUSY;
 
+	if (has_buttons) {
+		status = acpi_evaluate_object(handle, "VBDL", NULL, NULL);
+		if (ACPI_FAILURE(status))
+			dev_err(&device->dev, "Error VBDL failed with ACPI status %d\n", status);
+	}
+
 	device_init_wakeup(&device->dev, true);
 	/*
 	 * In order for system wakeup to work, the EC GPE has to be marked as
-- 
2.28.0

