Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4195CC4167B
	for <platform-driver-x86@archiver.kernel.org>; Mon,  7 Dec 2020 17:00:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0E2C923884
	for <platform-driver-x86@archiver.kernel.org>; Mon,  7 Dec 2020 17:00:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727116AbgLGRAt (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 7 Dec 2020 12:00:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35676 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725822AbgLGRAt (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 7 Dec 2020 12:00:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1607360363;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=g7Fjdnz9vE2phWfn/29bGGRygSu3DQzg+1X8gPZ9aEE=;
        b=J2/XFgi+0aO1d81UVXfAMjb8oHXC4mGH1GpHRmaWuV8kVC/hJuWy1JY5IJGD7wzWrcqN3P
        7AKtbSDCDK2aXCZlR5JaZgnk+wRqjAwpzt0wUUoDwtHfQc80MvD3x3/QF7nqwpVFpYJa1b
        z4N0AddieeQZMlkoZhp8YNQA2uURgnA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-267-H5DAqKLANbq9M6NIT4yTCg-1; Mon, 07 Dec 2020 11:59:17 -0500
X-MC-Unique: H5DAqKLANbq9M6NIT4yTCg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6FF681934102;
        Mon,  7 Dec 2020 16:59:16 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-114.ams2.redhat.com [10.36.112.114])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 7A56B5C1A1;
        Mon,  7 Dec 2020 16:59:15 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <mgross@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andy@infradead.org>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH] platform/x86: intel-vbtn: Fix SW_TABLET_MODE always reporting 1 on some HP x360 models
Date:   Mon,  7 Dec 2020 17:59:14 +0100
Message-Id: <20201207165914.414091-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Some HP x360 models have an ACPI VGBS method which sets bit 4 instead of
bit 6 when NOT in tablet mode at boot. Inspecting all the DSDTs in my DSDT
collection shows only one other model, the Medion E1239T ever setting bit 4
and it always sets this together with bit 6.

So lets treat bit 4 as a second bit which when set indicates the device not
being in tablet-mode, as we already do for bit 6.

While at it also prefix all VGBS constant defines with "VGBS_".

Note this wrokaround was first added to the kernel as
commit d823346876a9 ("platform/x86: intel-vbtn: Fix SW_TABLET_MODE always
reporting 1 on the HP Pavilion 11 x360").
After commit 8169bd3e6e19 ("platform/x86: intel-vbtn: Switch to an
allow-list for SW_TABLET_MODE reporting") got added to the kernel this
was reverted, because with the new allow-list approach the workaround
was no longer necessary for the model on which the issue was first
reported.

But it turns out that the workaround is still necessary because some
affected models report a chassis-type of 31 which is on the allow-list.

BugLink: https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1894017
Fixes: 21d64817c724 ("platform/x86: intel-vbtn: Revert "Fix SW_TABLET_MODE always reporting 1 on the HP Pavilion 11 x360"")
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/intel-vbtn.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/intel-vbtn.c b/drivers/platform/x86/intel-vbtn.c
index 3d1ace124032..3b49a1f4061b 100644
--- a/drivers/platform/x86/intel-vbtn.c
+++ b/drivers/platform/x86/intel-vbtn.c
@@ -15,9 +15,13 @@
 #include <linux/platform_device.h>
 #include <linux/suspend.h>
 
+/* Returned when NOT in tablet mode on some HP Stream x360 11 models */
+#define VGBS_TABLET_MODE_FLAG_ALT	0x10
 /* When NOT in tablet mode, VGBS returns with the flag 0x40 */
-#define TABLET_MODE_FLAG 0x40
-#define DOCK_MODE_FLAG   0x80
+#define VGBS_TABLET_MODE_FLAG		0x40
+#define VGBS_DOCK_MODE_FLAG		0x80
+
+#define VGBS_TABLET_MODE_FLAGS (VGBS_TABLET_MODE_FLAG | VGBS_TABLET_MODE_FLAG_ALT)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("AceLan Kao");
@@ -72,9 +76,9 @@ static void detect_tablet_mode(struct platform_device *device)
 	if (ACPI_FAILURE(status))
 		return;
 
-	m = !(vgbs & TABLET_MODE_FLAG);
+	m = !(vgbs & VGBS_TABLET_MODE_FLAGS);
 	input_report_switch(priv->input_dev, SW_TABLET_MODE, m);
-	m = (vgbs & DOCK_MODE_FLAG) ? 1 : 0;
+	m = (vgbs & VGBS_DOCK_MODE_FLAG) ? 1 : 0;
 	input_report_switch(priv->input_dev, SW_DOCK, m);
 }
 
-- 
2.28.0

