Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EE3AEE4981
	for <platform-driver-x86@archiver.kernel.org>; Sat, 19 Aug 2023 07:15:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232553AbjHSHOs (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 19 Aug 2023 03:14:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237395AbjHSHOn (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 19 Aug 2023 03:14:43 -0400
X-Greylist: delayed 114 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 19 Aug 2023 00:14:42 PDT
Received: from smtprelay08.ispgateway.de (smtprelay08.ispgateway.de [134.119.228.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F4023C23
        for <platform-driver-x86@vger.kernel.org>; Sat, 19 Aug 2023 00:14:42 -0700 (PDT)
Received: from [77.64.243.219] (helo=note-book.lan)
        by smtprelay08.ispgateway.de with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <git@apitzsch.eu>)
        id 1qXG8c-00040A-Gc; Sat, 19 Aug 2023 09:12:46 +0200
From:   =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Date:   Sat, 19 Aug 2023 09:12:15 +0200
Subject: [PATCH] platform/x86: ideapad-laptop: Add support for new hotkeys
 found on ThinkBook 14s Yoga ITL
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230819-lenovo_keys-v1-1-9d34eac88e0a@apitzsch.eu>
X-B4-Tracking: v=1; b=H4sIAE5r4GQC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI2MDC0NL3ZzUvPyy/Pjs1Mpi3dQUM1OLNJMUY5MUcyWgjoKi1LTMCrBp0bG
 1tQD3vOGNXQAAAA==
To:     Ike Panhc <ike.pan@canonical.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
X-Mailer: b4 0.12.3
X-Df-Sender: YW5kcmVAYXBpdHpzY2guZXU=
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The Lenovo Thinkbook 14s Yoga ITL has 4 new symbols/shortcuts on their
F9-F11 and PrtSc keys:

F9:    Has a symbol of a head with a headset, the manual says "Service key"
F10:   Has a symbol of a telephone horn which has been picked up from the
       receiver, the manual says: "Answer incoming calls"
F11:   Has a symbol of a telephone horn which is resting on the receiver,
       the manual says: "Reject incoming calls"
PrtSc: Has a symbol of a siccor and a dashed ellipse, the manual says:
       "Open the Windows 'Snipping' Tool app"

This commit adds support for these 4 new hkey events.

Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
 drivers/platform/x86/ideapad-laptop.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
index d2fee9a3e239..6d9297c1d96c 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -1049,6 +1049,11 @@ static const struct key_entry ideapad_keymap[] = {
 	{ KE_IGNORE,	0x03 | IDEAPAD_WMI_KEY },
 	/* Customizable Lenovo Hotkey ("star" with 'S' inside) */
 	{ KE_KEY,	0x01 | IDEAPAD_WMI_KEY, { KEY_FAVORITES } },
+	{ KE_KEY,	0x04 | IDEAPAD_WMI_KEY, { KEY_SELECTIVE_SCREENSHOT } },
+	/* Lenovo Support */
+	{ KE_KEY,	0x07 | IDEAPAD_WMI_KEY, { KEY_HELP } },
+	{ KE_KEY,	0x0e | IDEAPAD_WMI_KEY, { KEY_PICKUP_PHONE } },
+	{ KE_KEY,	0x0f | IDEAPAD_WMI_KEY, { KEY_HANGUP_PHONE } },
 	/* Dark mode toggle */
 	{ KE_KEY,	0x13 | IDEAPAD_WMI_KEY, { KEY_PROG1 } },
 	/* Sound profile switch */

---
base-commit: 7271b2a530428b879443b274c191b34536a4ea11
change-id: 20230819-lenovo_keys-ed658f4d34d7

Best regards,
-- 
André Apitzsch <git@apitzsch.eu>

