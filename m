Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4C4BC2BB3F
	for <platform-driver-x86@archiver.kernel.org>; Mon, 20 Nov 2023 15:42:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233712AbjKTPnB (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 20 Nov 2023 10:43:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233944AbjKTPnB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 20 Nov 2023 10:43:01 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1AFFA0
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Nov 2023 07:42:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1700494976;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=I2oVjMGny6N0gcThe2HmIhPxJ2rXJ/79sQYzpj9m2lU=;
        b=B+ATsT/LGGSU14nXMDIBgH8yiDpUQIWzl23jmpN3P3IOiJZUMZQAKYXuZ1lSutQ6c1jxFI
        iFW2LsmIhgF/MGb0Qu4Ko45LMX6437FCN0De4AXvGxsXuOIkhnrs9ZHI54DIRTjFYuYM14
        71RQt5BgaFVqsERYzClC2eBSG9zESVY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-662-yKaCvjLWM-SZJa2bjFDAMw-1; Mon, 20 Nov 2023 10:42:50 -0500
X-MC-Unique: yKaCvjLWM-SZJa2bjFDAMw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1A395811E86;
        Mon, 20 Nov 2023 15:42:50 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.193.19])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 098A810F44;
        Mon, 20 Nov 2023 15:42:48 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Corentin Chary <corentin.chary@gmail.com>,
        "Luke D . Jones" <luke@ljones.dev>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Kai Heng Feng <kai.heng.feng@canonical.com>,
        acpi4asus-user@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 3/3] platform/x86: asus-wmi: Filter Volume key presses if also reported via atkbd
Date:   Mon, 20 Nov 2023 16:42:35 +0100
Message-ID: <20231120154235.610808-4-hdegoede@redhat.com>
In-Reply-To: <20231120154235.610808-1-hdegoede@redhat.com>
References: <20231120154235.610808-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Use the i8042-filter to check if Volume key presses are also reported
via atkbd and if yes then filter out the WMI events to avoid reporting
each key-press twice.

Note depending on in which order the PS/2 data vs the WMI event are
handled the first volume key press may still be reported twice. This is
a compromise versus DMI quirks (unmaintainable) or other more complex
solutions.

Closes: https://bbs.archlinux.org/viewtopic.php?pid=2128536#p2128536
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/asus-nb-wmi.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
index 16241556f6fb..fceffe2082ec 100644
--- a/drivers/platform/x86/asus-nb-wmi.c
+++ b/drivers/platform/x86/asus-nb-wmi.c
@@ -48,9 +48,11 @@ module_param(tablet_mode_sw, uint, 0444);
 MODULE_PARM_DESC(tablet_mode_sw, "Tablet mode detect: -1:auto 0:disable 1:kbd-dock 2:lid-flip 3:lid-flip-rog");
 
 static struct quirk_entry *quirks;
+static bool atkbd_reports_vol_keys;
 
 static bool asus_i8042_filter(unsigned char data, unsigned char str, struct serio *port)
 {
+	static bool extended_e0;
 	static bool extended_e1;
 
 	if (str & I8042_STR_AUXDATA)
@@ -68,6 +70,20 @@ static bool asus_i8042_filter(unsigned char data, unsigned char str, struct seri
 		}
 	}
 
+	if (data == 0xe0) {
+		extended_e0 = true;
+	} else if (extended_e0) {
+		extended_e0 = false;
+
+		switch (data & 0x7f) {
+		case 0x20: /* e0 20 / e0 a0, Volume Mute press / release */
+		case 0x2e: /* e0 2e / e0 ae, Volume Down press / release */
+		case 0x30: /* e0 30 / e0 b0, Volume Up press / release */
+			atkbd_reports_vol_keys = true;
+			break;
+		}
+	}
+
 	return false;
 }
 
@@ -608,6 +624,13 @@ static void asus_nb_wmi_key_filter(struct asus_wmi_driver *asus_wmi, int *code,
 		if (acpi_video_handles_brightness_key_presses())
 			*code = ASUS_WMI_KEY_IGNORE;
 
+		break;
+	case 0x30: /* Volume Up */
+	case 0x31: /* Volume Down */
+	case 0x32: /* Volume Mute */
+		if (atkbd_reports_vol_keys)
+			*code = ASUS_WMI_KEY_IGNORE;
+
 		break;
 	}
 }
-- 
2.41.0

