Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DAAEC4708E
	for <platform-driver-x86@archiver.kernel.org>; Sat, 29 May 2021 15:26:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 35B1161185
	for <platform-driver-x86@archiver.kernel.org>; Sat, 29 May 2021 15:26:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229716AbhE2P2e (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 29 May 2021 11:28:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59198 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229693AbhE2P2d (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 29 May 2021 11:28:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1622302016;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=HGWJAjJBCtARDEJg2wj3S/Nn7TkHnQaBURTNlC4KGR0=;
        b=ba+T2nDY9j2Cw7+ztcjpk2zPUbdZ70XMMebidL9tQPdd8h/W0t9EYHfkFL9orSsu9oQm39
        8rGDw5ZWAbYec/M/WwrmW5a9e7T+bo+kqIzXOQUCF2vsUXntUi0FQOm8R1dWtht8R3EK0M
        /8JypFp6rR7Vl5WtDd7nOc4n54ox9kg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-587-fjjKN2FfN5uE1SM6aZjFPA-1; Sat, 29 May 2021 11:26:54 -0400
X-MC-Unique: fjjKN2FfN5uE1SM6aZjFPA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BC101180FD65;
        Sat, 29 May 2021 15:26:52 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-39.ams2.redhat.com [10.36.112.39])
        by smtp.corp.redhat.com (Postfix) with ESMTP id D46241002F12;
        Sat, 29 May 2021 15:26:51 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH] platform/x86: touchscreen_dmi: Fix Chuwi Hi10 Prus typo in comment
Date:   Sat, 29 May 2021 17:26:50 +0200
Message-Id: <20210529152650.12604-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Fix the entry for the Chuwi Hi10 Pro tablet having a comment describing
it as the "Chuwi Hi10 Prus.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/touchscreen_dmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
index 424cf2a84744..988a2e5a98a8 100644
--- a/drivers/platform/x86/touchscreen_dmi.c
+++ b/drivers/platform/x86/touchscreen_dmi.c
@@ -971,7 +971,7 @@ const struct dmi_system_id touchscreen_dmi_table[] = {
 		},
 	},
 	{
-		/* Chuwi Hi10 Prus (CWI597) */
+		/* Chuwi Hi10 Pro (CWI597) */
 		.driver_data = (void *)&chuwi_hi10_pro_data,
 		.matches = {
 			DMI_MATCH(DMI_BOARD_VENDOR, "Hampoo"),
-- 
2.31.1

