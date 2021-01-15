Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD281C433DB
	for <platform-driver-x86@archiver.kernel.org>; Fri, 15 Jan 2021 16:20:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 914DC238A0
	for <platform-driver-x86@archiver.kernel.org>; Fri, 15 Jan 2021 16:20:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726475AbhAOQUW (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 15 Jan 2021 11:20:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43624 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725818AbhAOQUW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 15 Jan 2021 11:20:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1610727535;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=tp/61DcshJ1UVwzarIX8rW6yr7gLDQGpiZ7jjqyFuc8=;
        b=PL8IZCXnJQOmDh1YtVdtb57OOO6FUlkBbnHC3Ww6Y0IxZFjVNJ3mmrIyzR5mlTpc1HdNJw
        s27ulgAj/ikMAm9eymm5YSI8TeMB+nHhdgCmfagBg3k5K9Sa6z/h6A+8B6pTCOatjx4pmc
        lQcqd8pp7r48ywb/R41nNNF2GFD3KNo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-348-doZUmSbsPPKcrZPRHVig5g-1; Fri, 15 Jan 2021 11:18:53 -0500
X-MC-Unique: doZUmSbsPPKcrZPRHVig5g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 943A5AFA83;
        Fri, 15 Jan 2021 16:18:52 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-172.ams2.redhat.com [10.36.112.172])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 769A261D2D;
        Fri, 15 Jan 2021 16:18:51 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <mgross@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andy@infradead.org>,
        platform-driver-x86@vger.kernel.org,
        Elia Devito <eliadevito@gmail.com>
Subject: [PATCH 1/4] platform/x86: intel-vbtn: Rework wakeup handling in notify_handler()
Date:   Fri, 15 Jan 2021 17:18:47 +0100
Message-Id: <20210115161850.117614-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Rework the wakeup path inside notify_handler() to special case the
buttons (KE_KEY) case instead of the switches case.

In case of a button wake event we want to skip reporting this,
mirroring how the drivers/acpi/button.c code skips the reporting
in the wakeup case (suspended flag set) too.

The reason to skip reporting in this case is that some Linux
desktop-environments will immediately resuspend if we report an
evdev event for the power-button press on wakeup.

Before this commit the skipping of the button-press was done
in a round-about way: In case of a wakeup the regular
sparse_keymap_report_event() would always be skipped by
an early return, and then to avoid not reporting switch changes
on wakeup there was a special KE_SW path with a duplicate
sparse_keymap_report_event() call.

This commit refactors the wakeup handling to explicitly skip the
reporting for button wake events, while using the regular
reporting path for non button (switches) wakeup events.

No intentional functional impact.

Cc: Elia Devito <eliadevito@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/intel-vbtn.c | 25 ++++++++++---------------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/drivers/platform/x86/intel-vbtn.c b/drivers/platform/x86/intel-vbtn.c
index 30a9062d2b4b..e1bb37a03ba3 100644
--- a/drivers/platform/x86/intel-vbtn.c
+++ b/drivers/platform/x86/intel-vbtn.c
@@ -131,22 +131,17 @@ static void notify_handler(acpi_handle handle, u32 event, void *context)
 
 	if (priv->wakeup_mode) {
 		ke = sparse_keymap_entry_from_scancode(priv->input_dev, event);
-		if (ke) {
-			pm_wakeup_hard_event(&device->dev);
-
-			/*
-			 * Switch events like tablet mode will wake the device
-			 * and report the new switch position to the input
-			 * subsystem.
-			 */
-			if (ke->type == KE_SW)
-				sparse_keymap_report_event(priv->input_dev,
-							   event,
-							   val,
-							   0);
+		if (!ke)
+			goto out_unknown;
+
+		pm_wakeup_hard_event(&device->dev);
+
+		/*
+		 * Skip reporting an evdev event for button wake events,
+		 * mirroring how the drivers/acpi/button.c code skips this too.
+		 */
+		if (ke->type == KE_KEY)
 			return;
-		}
-		goto out_unknown;
 	}
 
 	/*
-- 
2.28.0

