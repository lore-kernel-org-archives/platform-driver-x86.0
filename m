Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BD52C4338F
	for <platform-driver-x86@archiver.kernel.org>; Fri,  6 Aug 2021 11:55:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E981360EBC
	for <platform-driver-x86@archiver.kernel.org>; Fri,  6 Aug 2021 11:55:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235480AbhHFLzf (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 6 Aug 2021 07:55:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56683 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S242112AbhHFLzf (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 6 Aug 2021 07:55:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1628250919;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=5G0wT++V9ar2YsovTfynr87bocFkk/vYX8BXwOYJXx4=;
        b=V2jWJBBTgvlr8V4DOOpXNtuVVk7jlSdUtaVEoeTBRRAeoWO2L9q6XraTj4fHu5GloG1h0T
        AC+vOCl+ZKMMTj3Lpe99Gk1U+/f+ecn2LAbNfQOJWPPp4K9WBTVJk+qMFgc5/BpaHqTdOQ
        UIEagMbfD8O3I5ahVc7RY+SZeDCbPdw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-260-G_zt4uxnP0KURDdky-ajuA-1; Fri, 06 Aug 2021 07:55:18 -0400
X-MC-Unique: G_zt4uxnP0KURDdky-ajuA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 658E5802CB4;
        Fri,  6 Aug 2021 11:55:17 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.192.148])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 7AAD119D9D;
        Fri,  6 Aug 2021 11:55:16 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH] platform/x86: pcengines-apuv2: Add missing terminating entries to gpio-lookup tables
Date:   Fri,  6 Aug 2021 13:55:15 +0200
Message-Id: <20210806115515.12184-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The gpiod_lookup_table.table passed to gpiod_add_lookup_table() must
be terminated with an empty entry, add this.

Note we have likely been getting away with this not being present because
the GPIO lookup code first matches on the dev_id, causing most lookups to
skip checking the table and the lookups which do check the table will
find a matching entry before reaching the end. With that said, terminating
these tables properly still is obviously the correct thing to do.

Fixes: f8eb0235f659 ("x86: pcengines apuv2 gpio/leds/keys platform driver")
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/pcengines-apuv2.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/platform/x86/pcengines-apuv2.c b/drivers/platform/x86/pcengines-apuv2.c
index c37349f97bb8..d063d91db9bc 100644
--- a/drivers/platform/x86/pcengines-apuv2.c
+++ b/drivers/platform/x86/pcengines-apuv2.c
@@ -94,6 +94,7 @@ static struct gpiod_lookup_table gpios_led_table = {
 				NULL, 1, GPIO_ACTIVE_LOW),
 		GPIO_LOOKUP_IDX(AMD_FCH_GPIO_DRIVER_NAME, APU2_GPIO_LINE_LED3,
 				NULL, 2, GPIO_ACTIVE_LOW),
+		{} /* Terminating entry */
 	}
 };
 
@@ -123,6 +124,7 @@ static struct gpiod_lookup_table gpios_key_table = {
 	.table = {
 		GPIO_LOOKUP_IDX(AMD_FCH_GPIO_DRIVER_NAME, APU2_GPIO_LINE_MODESW,
 				NULL, 0, GPIO_ACTIVE_LOW),
+		{} /* Terminating entry */
 	}
 };
 
-- 
2.31.1

