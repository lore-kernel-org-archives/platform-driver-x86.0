Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1B23C433B4
	for <platform-driver-x86@archiver.kernel.org>; Sun,  4 Apr 2021 14:38:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ADBE76137A
	for <platform-driver-x86@archiver.kernel.org>; Sun,  4 Apr 2021 14:38:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230502AbhDDOit (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 4 Apr 2021 10:38:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54405 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230168AbhDDOis (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 4 Apr 2021 10:38:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1617547123;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=HY4KYyxO5JjBo5Jat5d/dGB3Kf++X8SVhRNR/9QhK6c=;
        b=cX/EArJ8NtbolUxjEJzjbbB5GqL/8EMcHcqwNLfvzDdHGGTanqizrgf52P5onM6dd0th+H
        SQzn5xB1XIZKwm/Es8cwJ8LlU7jBdEHUpXidAhjgZuxPOx//YpK1Wj96fX8x7PrRPaYl46
        4URLK8nIjH1sHkIAHcXtImB80wvdfag=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-231-yafT4FAhOXiT3PU7JFqvrQ-1; Sun, 04 Apr 2021 10:38:41 -0400
X-MC-Unique: yafT4FAhOXiT3PU7JFqvrQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 113381019624;
        Sun,  4 Apr 2021 14:38:34 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-48.ams2.redhat.com [10.36.112.48])
        by smtp.corp.redhat.com (Postfix) with ESMTP id F325667C72;
        Sun,  4 Apr 2021 14:38:32 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Elia Devito <eliadevito@gmail.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH] platform/x86: intel-hid: Fix spurious wakeups caused by tablet-mode events during suspend
Date:   Sun,  4 Apr 2021 16:38:31 +0200
Message-Id: <20210404143831.25173-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Some devices send (duplicate) tablet-mode events when moved around even
though the mode has not changed; and they do this even when suspended.

Change the tablet-mode event handling when priv->wakeup_mode is set to
update the switch state in case it changed and then return immediately
(without calling pm_wakeup_hard_event()) to avoid spurious wakeups.

BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=212537
Fixes: 537b0dd4729e ("platform/x86: intel-hid: Add support for SW_TABLET_MODE")
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/intel-hid.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/intel-hid.c b/drivers/platform/x86/intel-hid.c
index 57cc92891a57..078648a9201b 100644
--- a/drivers/platform/x86/intel-hid.c
+++ b/drivers/platform/x86/intel-hid.c
@@ -483,11 +483,16 @@ static void notify_handler(acpi_handle handle, u32 event, void *context)
 			goto wakeup;
 
 		/*
-		 * Switch events will wake the device and report the new switch
-		 * position to the input subsystem.
+		 * Some devices send (duplicate) tablet-mode events when moved
+		 * around even though the mode has not changed; and they do this
+		 * even when suspended.
+		 * Update the switch state in case it changed and then return
+		 * without waking up to avoid spurious wakeups.
 		 */
-		if (priv->switches && (event == 0xcc || event == 0xcd))
-			goto wakeup;
+		if (event == 0xcc || event == 0xcd) {
+			report_tablet_mode_event(priv->switches, event);
+			return;
+		}
 
 		/* Wake up on 5-button array events only. */
 		if (event == 0xc0 || !priv->array)
@@ -501,9 +506,6 @@ static void notify_handler(acpi_handle handle, u32 event, void *context)
 wakeup:
 		pm_wakeup_hard_event(&device->dev);
 
-		if (report_tablet_mode_event(priv->switches, event))
-			return;
-
 		return;
 	}
 
-- 
2.30.2

