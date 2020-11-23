Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00FFEC6379F
	for <platform-driver-x86@archiver.kernel.org>; Mon, 23 Nov 2020 13:22:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ADAA12075A
	for <platform-driver-x86@archiver.kernel.org>; Mon, 23 Nov 2020 13:22:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732432AbgKWNWN (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 23 Nov 2020 08:22:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388856AbgKWNWM (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 23 Nov 2020 08:22:12 -0500
Received: from sipsolutions.net (s3.sipsolutions.net [IPv6:2a01:4f8:191:4433::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AC91C0613CF
        for <platform-driver-x86@vger.kernel.org>; Mon, 23 Nov 2020 05:22:11 -0800 (PST)
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
        (Exim 4.94)
        (envelope-from <benjamin@sipsolutions.net>)
        id 1khBnB-00DBRV-Hd; Mon, 23 Nov 2020 14:22:05 +0100
From:   Benjamin Berg <benjamin@sipsolutions.net>
To:     Hans de Goede <hdegoede@redhat.com>,
        Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>
Cc:     ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org,
        Benjamin Berg <bberg@redhat.com>
Subject: [PATCH] platform/x86: thinkpad_acpi: Send tablet mode switch at wakeup time
Date:   Mon, 23 Nov 2020 14:21:57 +0100
Message-Id: <20201123132157.866303-1-benjamin@sipsolutions.net>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Benjamin Berg <bberg@redhat.com>

The lid state may change while the machine is suspended. As such, we may
need to re-check the state at wake-up time (at least when waking up from
hibernation).
Add the appropriate call to the resume handler in order to sync the
SW_TABLET_MODE switch state with the hardware state.

Fixes: dda3ec0aa631 ("platform/x86: thinkpad_acpi: Implement tablet mode using GMMS method")
BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=210269
Signed-off-by: Benjamin Berg <bberg@redhat.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index e3810675090a..9104e0ee37cd 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -4228,6 +4228,7 @@ static void hotkey_resume(void)
 		pr_err("error while attempting to reset the event firmware interface\n");
 
 	tpacpi_send_radiosw_update();
+	tpacpi_input_send_tabletsw();
 	hotkey_tablet_mode_notify_change();
 	hotkey_wakeup_reason_notify_change();
 	hotkey_wakeup_hotunplug_complete_notify_change();
-- 
2.26.2

