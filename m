Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D941C433E0
	for <platform-driver-x86@archiver.kernel.org>; Sun, 21 Mar 2021 16:36:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2E5276193A
	for <platform-driver-x86@archiver.kernel.org>; Sun, 21 Mar 2021 16:36:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230018AbhCUQfc (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 21 Mar 2021 12:35:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20462 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229991AbhCUQfW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 21 Mar 2021 12:35:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1616344521;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=vI3UIUJaYTtYpBxzIMxx4mMN6XVPMPaiGo0xw6r2l8Y=;
        b=UFP0mMQV5T/QLZvB2BRSBtNCuOuCVPEZPY4eTex+12bMT7TFRUt+oiML4aZ0BfJpbpyK+G
        wGQPWRvjv9vwy/rMThuqY0lmavm3NBzKaKZQJ0Zn5Xalow2lK+29lDUrOHSdi0Bwv7WZSi
        b9CbnRUGGNKtv9sAL+9elQOane5sAmc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-309-akTcFGRTPlWimYxkUTTSGA-1; Sun, 21 Mar 2021 12:35:17 -0400
X-MC-Unique: akTcFGRTPlWimYxkUTTSGA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BDA4B593A0;
        Sun, 21 Mar 2021 16:35:15 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-68.ams2.redhat.com [10.36.112.68])
        by smtp.corp.redhat.com (Postfix) with ESMTP id AAE802B0AA;
        Sun, 21 Mar 2021 16:35:14 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org, stable@vger.kernel.org
Subject: [PATCH] platform/x86: intel-vbtn: Stop reporting SW_DOCK events
Date:   Sun, 21 Mar 2021 17:35:13 +0100
Message-Id: <20210321163513.72328-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Stop reporting SW_DOCK events because this breaks suspend-on-lid-close.

SW_DOCK should only be reported for docking stations, but all the DSDTs in
my DSDT collection which use the intel-vbtn code, always seem to use this
for 2-in-1s / convertibles and set SW_DOCK=1 when in laptop-mode (in tandem
with setting SW_TABLET_MODE=0).

This causes userspace to think the laptop is docked to a port-replicator
and to disable suspend-on-lid-close, which is undesirable.

Map the dock events to KEY_IGNORE to avoid this broken SW_DOCK reporting.

Note this may theoretically cause us to stop reporting SW_DOCK on some
device where the 0xCA and 0xCB intel-vbtn events are actually used for
reporting docking to a classic docking-station / port-replicator but
I'm not aware of any such devices.

Also the most important thing is that we only report SW_DOCK when it
reliably reports being docked to a classic docking-station without any
false positives, which clearly is not the case here. If there is a
chance of reporting false positives then it is better to not report
SW_DOCK at all.

Cc: stable@vger.kernel.org
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/intel-vbtn.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/intel-vbtn.c b/drivers/platform/x86/intel-vbtn.c
index 8a8017f9ca91..3fdf4cbec9ad 100644
--- a/drivers/platform/x86/intel-vbtn.c
+++ b/drivers/platform/x86/intel-vbtn.c
@@ -48,8 +48,16 @@ static const struct key_entry intel_vbtn_keymap[] = {
 };
 
 static const struct key_entry intel_vbtn_switchmap[] = {
-	{ KE_SW,     0xCA, { .sw = { SW_DOCK, 1 } } },		/* Docked */
-	{ KE_SW,     0xCB, { .sw = { SW_DOCK, 0 } } },		/* Undocked */
+	/*
+	 * SW_DOCK should only be reported for docking stations, but DSDTs using the
+	 * intel-vbtn code, always seem to use this for 2-in-1s / convertibles and set
+	 * SW_DOCK=1 when in laptop-mode (in tandem with setting SW_TABLET_MODE=0).
+	 * This causes userspace to think the laptop is docked to a port-replicator
+	 * and to disable suspend-on-lid-close, which is undesirable.
+	 * Map the dock events to KEY_IGNORE to avoid this broken SW_DOCK reporting.
+	 */
+	{ KE_IGNORE, 0xCA, { .sw = { SW_DOCK, 1 } } },		/* Docked */
+	{ KE_IGNORE, 0xCB, { .sw = { SW_DOCK, 0 } } },		/* Undocked */
 	{ KE_SW,     0xCC, { .sw = { SW_TABLET_MODE, 1 } } },	/* Tablet */
 	{ KE_SW,     0xCD, { .sw = { SW_TABLET_MODE, 0 } } },	/* Laptop */
 	{ KE_END }
-- 
2.30.2

