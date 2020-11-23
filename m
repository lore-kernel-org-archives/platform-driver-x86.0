Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31347C2D0E4
	for <platform-driver-x86@archiver.kernel.org>; Mon, 23 Nov 2020 15:16:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CED7820782
	for <platform-driver-x86@archiver.kernel.org>; Mon, 23 Nov 2020 15:16:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Yh4C/X4m"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389394AbgKWPQd (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 23 Nov 2020 10:16:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30772 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1733292AbgKWPQc (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 23 Nov 2020 10:16:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1606144591;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=Bdt8Id7KUVhhBTiXwj3TrBCwu8vVpqnxfg4qS5sPaHw=;
        b=Yh4C/X4m7ioIaFDH7ZKonlo2ESviDQahMs67f4Y2V3BaSSryDGyGiVcEqfjd8k5/YpkVKJ
        QNtUhRrioEimSKK87tZkxhlOYh8ky/tfwuaexsDYIZ6RcyXfuMJf1fd4yPtN+FRxf6bQgK
        80YWpOkP+yWgkva3iakM+hZyqNMDQ8M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-138-83_8H0iMPeebXUNgIBafJQ-1; Mon, 23 Nov 2020 10:16:28 -0500
X-MC-Unique: 83_8H0iMPeebXUNgIBafJQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 412F4802B63;
        Mon, 23 Nov 2020 15:16:27 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-208.ams2.redhat.com [10.36.112.208])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 472135D6DC;
        Mon, 23 Nov 2020 15:16:26 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <mgross@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andy@infradead.org>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH] platform/x86: acer-wmi: Add ACER_CAP_KBD_DOCK quirk for the Aspire Switch 10E SW3-016
Date:   Mon, 23 Nov 2020 16:16:25 +0100
Message-Id: <20201123151625.5530-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add the Acer Aspire Switch 10E SW3-016 to the list of models which use the
Acer Switch WMI interface for reporting SW_TABLET_MODE.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/acer-wmi.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index f888f5a6e250..c1a5357da885 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -508,6 +508,15 @@ static const struct dmi_system_id acer_quirks[] __initconst = {
 		},
 		.driver_data = &quirk_acer_travelmate_2490,
 	},
+	{
+		.callback = set_force_caps,
+		.ident = "Acer Aspire Switch 10E SW3-016",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Aspire SW3-016"),
+		},
+		.driver_data = (void *)ACER_CAP_KBD_DOCK,
+	},
 	{
 		.callback = set_force_caps,
 		.ident = "Acer Aspire Switch 10 SW5-012",
-- 
2.28.0

