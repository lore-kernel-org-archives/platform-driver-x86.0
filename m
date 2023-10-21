Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63C19C001E0
	for <platform-driver-x86@archiver.kernel.org>; Sat, 21 Oct 2023 09:49:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229803AbjJUJto (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 21 Oct 2023 05:49:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229583AbjJUJto (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 21 Oct 2023 05:49:44 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0699C19E
        for <platform-driver-x86@vger.kernel.org>; Sat, 21 Oct 2023 02:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1697881738;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=Cb5Y1/TnITgC0z3hFYicG9oxsiF2Ye/hCATZ1hO++GA=;
        b=W2FdCU28uCtgOI4SBMEuvaXlfOeqqIyjWgE5EBQZW+2xQ+4ogdngdUjBnDtIhGDC7lmAPo
        lVlvSQC1f2HCUGk/edFi3gPF73W9IajmjQ9XVC7yj7E4BxVF3fyzHB7m/3/La6aNSiuJem
        zQ14tm/39udd8BkkeQJH4HkrZSfoqIs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-657-XA2rKlrqNLKulcjvVs4Yrg-1; Sat, 21 Oct 2023 05:48:49 -0400
X-MC-Unique: XA2rKlrqNLKulcjvVs4Yrg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E2C7A80171C;
        Sat, 21 Oct 2023 09:48:48 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.56])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 716E940C6F7B;
        Sat, 21 Oct 2023 09:48:47 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Corentin Chary <corentin.chary@gmail.com>,
        "Luke D . Jones" <luke@ljones.dev>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Kai Heng Feng <kai.heng.feng@canonical.com>,
        James John <me@donjajo.com>,
        acpi4asus-user@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH] platform/x86: asus-wmi: Do not report brightness up/down keys when also reported by acpi_video
Date:   Sat, 21 Oct 2023 11:48:41 +0200
Message-ID: <20231021094841.7419-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

For a long time now the acpi_video driver reports evdev brightness up/down
key events for the brightness hotkeys on most (non ancient) laptops.

asus-wmi also reports evdev brightness up/down key events for these
keys leading to each press being reported twice and e.g. GNOME increasing
the brightness by 2 steps instead of 1 step.

Use the acpi_video_handles_brightness_key_presses() helper to detect if
acpi_video is reporting brightness key-presses and if it is then don't
report the same events also from the asus-wmi driver.

Note there is a chance that this may lead to regressions where
the brightness hotkeys stop working because they are not actually
reported by the acpi_video driver. Unfortunately the only way to
find out if this is a problem is to try.

To at least avoid regressions on old hw using the eeepc-wmi driver,
implement this as a key filter in asus-nb-wmi so that the eeepc-wmi
driver is not affected.

Reported-by: James John <me@donjajo.com>
Closes: https://lore.kernel.org/platform-driver-x86/a2c441fe-457e-44cf-a146-0ecd86b037cf@donjajo.com/
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/asus-nb-wmi.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
index df1db54d4e18..9aa1226e74e6 100644
--- a/drivers/platform/x86/asus-nb-wmi.c
+++ b/drivers/platform/x86/asus-nb-wmi.c
@@ -16,6 +16,8 @@
 #include <linux/dmi.h>
 #include <linux/i8042.h>
 
+#include <acpi/video.h>
+
 #include "asus-wmi.h"
 
 #define	ASUS_NB_WMI_FILE	"asus-nb-wmi"
@@ -606,6 +608,19 @@ static const struct key_entry asus_nb_wmi_keymap[] = {
 	{ KE_END, 0},
 };
 
+static void asus_nb_wmi_key_filter(struct asus_wmi_driver *asus_wmi, int *code,
+				   unsigned int *value, bool *autorelease)
+{
+	switch (*code) {
+	case ASUS_WMI_BRN_DOWN:
+	case ASUS_WMI_BRN_UP:
+		if (acpi_video_handles_brightness_key_presses())
+			*code = ASUS_WMI_KEY_IGNORE;
+
+		break;
+	}
+}
+
 static struct asus_wmi_driver asus_nb_wmi_driver = {
 	.name = ASUS_NB_WMI_FILE,
 	.owner = THIS_MODULE,
@@ -614,6 +629,7 @@ static struct asus_wmi_driver asus_nb_wmi_driver = {
 	.input_name = "Asus WMI hotkeys",
 	.input_phys = ASUS_NB_WMI_FILE "/input0",
 	.detect_quirks = asus_nb_wmi_quirks,
+	.key_filter = asus_nb_wmi_key_filter,
 };
 
 
-- 
2.41.0

