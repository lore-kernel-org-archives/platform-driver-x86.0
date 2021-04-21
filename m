Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE9A8C43462
	for <platform-driver-x86@archiver.kernel.org>; Wed, 21 Apr 2021 20:48:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B1EE361430
	for <platform-driver-x86@archiver.kernel.org>; Wed, 21 Apr 2021 20:48:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245684AbhDUUtK (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 21 Apr 2021 16:49:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28590 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S245687AbhDUUtK (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 21 Apr 2021 16:49:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1619038116;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=nZa1VsY9J66ae3sOriU9W9Lm8gotUDSdg4sxvLFb+k0=;
        b=J7I3zMej56pGro3u9UceHrzqTJnKxfefk6Ns+lSx73UC8bgM8hmcki467L55pMHnVAul9w
        xufNunVGsat7mnE+3o+kXIWdVFOEBhLoMWyz4a9Cw0NCVcdlxjT0yBjq7llsl5uwIdiXEZ
        /6smLD8hAkRYmQ0ReiTS/+OMeabjhaM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-569-IxtE8fvxPp-yArQlPvYOsA-1; Wed, 21 Apr 2021 16:48:34 -0400
X-MC-Unique: IxtE8fvxPp-yArQlPvYOsA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AB1A4107ACCA;
        Wed, 21 Apr 2021 20:48:31 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-17.ams2.redhat.com [10.36.112.17])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 4CDFC5D736;
        Wed, 21 Apr 2021 20:48:28 +0000 (UTC)
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
Subject: [PATCH v2 6/9] platform/x86: thinkpad_acpi: Add hotkey_notify_extended_hotkey() helper
Date:   Wed, 21 Apr 2021 22:48:01 +0200
Message-Id: <20210421204804.589962-7-hdegoede@redhat.com>
In-Reply-To: <20210421204804.589962-1-hdegoede@redhat.com>
References: <20210421204804.589962-1-hdegoede@redhat.com>
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

