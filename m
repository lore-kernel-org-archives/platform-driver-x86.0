Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BD6CC433B4
	for <platform-driver-x86@archiver.kernel.org>; Wed, 14 Apr 2021 15:11:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4D5F661155
	for <platform-driver-x86@archiver.kernel.org>; Wed, 14 Apr 2021 15:11:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348697AbhDNPLq (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 14 Apr 2021 11:11:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56849 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1348646AbhDNPLq (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 14 Apr 2021 11:11:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1618413084;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=nZa1VsY9J66ae3sOriU9W9Lm8gotUDSdg4sxvLFb+k0=;
        b=HW1duMC6oMn+TdfDguVbXWxs1i2B+Qjdzo+mJG2MFjr4+X//HtA6+P4TWopboF7peYaWQS
        wpiWqq7kaYQFqIzEZow2y/bUc/q3NC0g4cvAKkdmGYSl4ybPRR+XktVR6nkQ2ndOrpPbw4
        ldHAWtw+wTRESQoSZnQO8yIDAhB7x1s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-419-nWzQwiCzMzW-4DzvF_deig-1; Wed, 14 Apr 2021 11:11:21 -0400
X-MC-Unique: nWzQwiCzMzW-4DzvF_deig-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 346E0107ACCD;
        Wed, 14 Apr 2021 15:11:18 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-168.ams2.redhat.com [10.36.112.168])
        by smtp.corp.redhat.com (Postfix) with ESMTP id B75575D6A8;
        Wed, 14 Apr 2021 15:11:14 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Rajat Jain <rajatja@google.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Pekka Paalanen <pekka.paalanen@collabora.com>,
        Mario Limonciello <mario.limonciello@outlook.com>,
        Sebastien Bacher <seb128@ubuntu.com>,
        Marco Trevisan <marco.trevisan@canonical.com>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        dri-devel@lists.freedesktop.org,
        Mark Pearson <markpearson@lenovo.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH resend 6/9] platform/x86: thinkpad_acpi: Add hotkey_notify_extended_hotkey() helper
Date:   Wed, 14 Apr 2021 17:10:46 +0200
Message-Id: <20210414151049.95828-7-hdegoede@redhat.com>
In-Reply-To: <20210414151049.95828-1-hdegoede@redhat.com>
References: <20210414151049.95828-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Factor the extended hotkey handling out of hotkey_notify_hotkey() and
into a new hotkey_notify_extended_hotkey() helper.

This is a preparation patch for adding support the privacy-screen hotkey
toggle (which needs some special handling, it should NOT send an evdev
key-event to userspace...).

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 30 ++++++++++++++++++----------
 1 file changed, 19 insertions(+), 11 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 0d9e2ddbf904..683c175cc28a 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -3878,6 +3878,24 @@ static bool adaptive_keyboard_hotkey_notify_hotkey(unsigned int scancode)
 	}
 }
 
+static bool hotkey_notify_extended_hotkey(const u32 hkey)
+{
+	unsigned int scancode;
+
+	/* Extended keycodes start at 0x300 and our offset into the map
+	 * TP_ACPI_HOTKEYSCAN_EXTENDED_START. The calculated scancode
+	 * will be positive, but might not be in the correct range.
+	 */
+	scancode = (hkey & 0xfff) - (0x300 - TP_ACPI_HOTKEYSCAN_EXTENDED_START);
+	if (scancode >= TP_ACPI_HOTKEYSCAN_EXTENDED_START &&
+	    scancode < TPACPI_HOTKEY_MAP_LEN) {
+		tpacpi_input_send_key(scancode);
+		return true;
+	}
+
+	return false;
+}
+
 static bool hotkey_notify_hotkey(const u32 hkey,
 				 bool *send_acpi_ev,
 				 bool *ignore_acpi_ev)
@@ -3912,17 +3930,7 @@ static bool hotkey_notify_hotkey(const u32 hkey,
 		return adaptive_keyboard_hotkey_notify_hotkey(scancode);
 
 	case 3:
-		/* Extended keycodes start at 0x300 and our offset into the map
-		 * TP_ACPI_HOTKEYSCAN_EXTENDED_START. The calculated scancode
-		 * will be positive, but might not be in the correct range.
-		 */
-		scancode -= (0x300 - TP_ACPI_HOTKEYSCAN_EXTENDED_START);
-		if (scancode >= TP_ACPI_HOTKEYSCAN_EXTENDED_START &&
-		    scancode < TPACPI_HOTKEY_MAP_LEN) {
-			tpacpi_input_send_key(scancode);
-			return true;
-		}
-		break;
+		return hotkey_notify_extended_hotkey(hkey);
 	}
 
 	return false;
-- 
2.31.1

