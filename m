Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06F09C433EF
	for <platform-driver-x86@archiver.kernel.org>; Tue, 23 Nov 2021 21:05:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229674AbhKWVIL (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 23 Nov 2021 16:08:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41616 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234219AbhKWVII (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 23 Nov 2021 16:08:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1637701499;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=oJizWNla0Bx1p2WPsVrXer/3brzItymFAsdyS/jbyv8=;
        b=D1TNYUzhsak6tn94qmwTq4euFD/dlhjuvRXa3Vf84nOXiJsSWoBcL8XmNf72/flCOw09zm
        u6qtUT1J/Qy86LhtbUP4lsvDEnwz7IW6FwFC/GsD2l4BavqU2MCYiyC9G5xu7wO1MtpkQn
        W5yhZMqu1UosZVktc/Gzdn3ixSGXR9Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-63-82RDL0fWPIm_qPWT0d5tpg-1; Tue, 23 Nov 2021 16:04:55 -0500
X-MC-Unique: 82RDL0fWPIm_qPWT0d5tpg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9F307104446E;
        Tue, 23 Nov 2021 21:04:54 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.192.41])
        by smtp.corp.redhat.com (Postfix) with ESMTP id B102579448;
        Tue, 23 Nov 2021 21:04:50 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Mark Pearson <markpearson@lenovo.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, Len Baker <len.baker@gmx.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 6/6] platform/x86: thinkpad_acpi: Move input_unregister_device() to the top of thinkpad_acpi_module_exit()
Date:   Tue, 23 Nov 2021 22:04:24 +0100
Message-Id: <20211123210424.266607-7-hdegoede@redhat.com>
In-Reply-To: <20211123210424.266607-1-hdegoede@redhat.com>
References: <20211123210424.266607-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Make input_unregister_device() the first step of
thinkpad_acpi_module_exit(), so that the order in
thinkpad_acpi_module_exit() properly mirrors the order in
thinkpad_acpi_module_init();

And move the kfree(hotkey_keycode_map) call to hotkey_exit()
(the exit handler of the hotkey subdriver) where it belongs.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 392af8f1c213..a4ef57ddcc90 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -3050,6 +3050,8 @@ static void hotkey_exit(void)
 	      hotkey_mask_set(hotkey_orig_mask)) |
 	     hotkey_status_set(false)) != 0)
 		pr_err("failed to restore hot key mask to BIOS defaults\n");
+
+	kfree(hotkey_keycode_map);
 }
 
 static void __init hotkey_unmap(const unsigned int scancode)
@@ -11184,6 +11186,8 @@ static void thinkpad_acpi_module_exit(void)
 
 	tpacpi_lifecycle = TPACPI_LIFE_EXITING;
 
+	if (tp_features.input_device_registered)
+		input_unregister_device(tpacpi_inputdev);
 	if (tpacpi_hwmon)
 		hwmon_device_unregister(tpacpi_hwmon);
 	if (tp_features.sensors_pdrv_registered)
@@ -11199,14 +11203,8 @@ static void thinkpad_acpi_module_exit(void)
 
 	dbg_printk(TPACPI_DBG_INIT, "finished subdriver exit path...\n");
 
-	if (tpacpi_inputdev) {
-		if (tp_features.input_device_registered)
-			input_unregister_device(tpacpi_inputdev);
-		else
-			input_free_device(tpacpi_inputdev);
-		kfree(hotkey_keycode_map);
-	}
-
+	if (tpacpi_inputdev)
+		input_free_device(tpacpi_inputdev);
 	if (tpacpi_sensors_pdev)
 		platform_device_unregister(tpacpi_sensors_pdev);
 	if (tpacpi_pdev)
-- 
2.33.1

