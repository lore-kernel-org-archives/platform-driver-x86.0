Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF139C433DB
	for <platform-driver-x86@archiver.kernel.org>; Thu, 14 Jan 2021 14:36:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C410F23A57
	for <platform-driver-x86@archiver.kernel.org>; Thu, 14 Jan 2021 14:36:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727313AbhANOgG (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 14 Jan 2021 09:36:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45024 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726175AbhANOgG (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 14 Jan 2021 09:36:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1610634879;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=AminTM+JmcklWWEPw2/l1521ldDupyU3M/j5IBDP7hE=;
        b=R10aHy5xlD+Di2hpvpZjiYHCWEEnnAPOTWjvwqB2yobwEltzCFjQicimp7g8g8g3F0dFDn
        8JIt+dfMz8IzUhHFagQg8yyveZTmN6bJD/a6mRYa5r4fHzK+Rr7o9H1x88ZUJQ+iGJ6Qme
        NDQJqEtNCZ4fCHd2QPMvCfPcAcxR8cc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-69-6BVhOC7-MsCdIvzSWk933A-1; Thu, 14 Jan 2021 09:34:36 -0500
X-MC-Unique: 6BVhOC7-MsCdIvzSWk933A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 77B56107ACF8;
        Thu, 14 Jan 2021 14:34:35 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-113-237.ams2.redhat.com [10.36.113.237])
        by smtp.corp.redhat.com (Postfix) with ESMTP id F12D060C47;
        Thu, 14 Jan 2021 14:34:33 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <mgross@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andy@infradead.org>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH] platform/x86: intel-vbtn: Drop HP Stream x360 Convertible PC 11 from allow-list
Date:   Thu, 14 Jan 2021 15:34:32 +0100
Message-Id: <20210114143432.31750-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

THe HP Stream x360 Convertible PC 11 DSDT has the following VGBS function:

            Method (VGBS, 0, Serialized)
            {
                If ((^^PCI0.LPCB.EC0.ROLS == Zero))
                {
                    VBDS = Zero
                }
                Else
                {
                    VBDS = Zero
                }

                Return (VBDS) /* \_SB_.VGBI.VBDS */
            }

Which is obviously wrong, because it always returns 0 independent of the
2-in-1 being in laptop or tablet mode. This causes the intel-vbtn driver
to initially report SW_TABLET_MODE = 1 to userspace, which is known to
cause problems when the 2-in-1 is actually in laptop mode.

During earlier testing this turned out to not be a problem because the
2-in-1 would do a Notify(..., 0xCC) or Notify(..., 0xCD) soon after
the intel-vbtn driver loaded, correcting the SW_TABLET_MODE state.

Further testing however has shown that this Notify() soon after the
intel-vbtn driver loads, does not always happen. When the Notify
does not happen, then intel-vbtn reports SW_TABLET_MODE = 1 resulting in
a non-working touchpad.

IOW the tablet-mode reporting is not reliable on this device, so it
should be dropped from the allow-list, fixing the touchpad sometimes
not working.

Fixes: 8169bd3e6e19 ("platform/x86: intel-vbtn: Switch to an allow-list for SW_TABLET_MODE reporting")
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/intel-vbtn.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/platform/x86/intel-vbtn.c b/drivers/platform/x86/intel-vbtn.c
index 9bbdb26d4305..30a9062d2b4b 100644
--- a/drivers/platform/x86/intel-vbtn.c
+++ b/drivers/platform/x86/intel-vbtn.c
@@ -204,12 +204,6 @@ static const struct dmi_system_id dmi_switches_allow_list[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "Venue 11 Pro 7130"),
 		},
 	},
-	{
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Hewlett-Packard"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "HP Stream x360 Convertible PC 11"),
-		},
-	},
 	{
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Hewlett-Packard"),
-- 
2.28.0

