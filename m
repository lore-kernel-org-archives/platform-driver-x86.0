Return-Path: <SRS0=1m0M=D2=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDBC3C433E7
	for <platform-driver-x86@archiver.kernel.org>; Mon, 19 Oct 2020 18:57:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 922BD223BF
	for <platform-driver-x86@archiver.kernel.org>; Mon, 19 Oct 2020 18:57:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="J0i5Id6s"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727681AbgJSS5S (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 19 Oct 2020 14:57:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37466 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730830AbgJSS5S (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 19 Oct 2020 14:57:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1603133837;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=D2aJa92rorA3S8kA0kbjkBURuLRVxUH7wiMyKvwfmLU=;
        b=J0i5Id6sos8yQH9KjagvunI1H7DaZGzhU9n6f/okmE3KKBhRoaDnIdJ0P31YMRcOlWXpLd
        zEOlHWJa6oJdMH+ZK4a5t/bS+h+wdZRicUMM3cR1asd2qDhn+oE8UfeftAhhF1Bf2sgb8u
        EJqGtu7j+E6YgFgtZJ4V7qjxox08z6k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-570-AHtUB8ViP6K2vipEwOC67Q-1; Mon, 19 Oct 2020 14:57:12 -0400
X-MC-Unique: AHtUB8ViP6K2vipEwOC67Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 17F891005E75;
        Mon, 19 Oct 2020 18:56:34 +0000 (UTC)
Received: from x1.localdomain (ovpn-114-62.ams2.redhat.com [10.36.114.62])
        by smtp.corp.redhat.com (Postfix) with ESMTP id F383060DA0;
        Mon, 19 Oct 2020 18:56:32 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <mgross@linux.intel.com>, Lee Chun-Yi <jlee@suse.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andy@infradead.org>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 2/6] platform/x86: acer-wmi: Cleanup ACER_CAP_FOO defines
Date:   Mon, 19 Oct 2020 20:56:24 +0200
Message-Id: <20201019185628.264473-2-hdegoede@redhat.com>
In-Reply-To: <20201019185628.264473-1-hdegoede@redhat.com>
References: <20201019185628.264473-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Cleanup the ACER_CAP_FOO defines:
-Switch to using BIT() macro.
-The ACER_CAP_RFBTN flag is set, but it is never checked anywhere, drop it.
-Drop the unused ACER_CAP_ANY define.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/acer-wmi.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index db6167a10981..2f69d418ed3b 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -205,14 +205,12 @@ struct hotkey_function_type_aa {
 /*
  * Interface capability flags
  */
-#define ACER_CAP_MAILLED		(1<<0)
-#define ACER_CAP_WIRELESS		(1<<1)
-#define ACER_CAP_BLUETOOTH		(1<<2)
-#define ACER_CAP_BRIGHTNESS		(1<<3)
-#define ACER_CAP_THREEG			(1<<4)
-#define ACER_CAP_ACCEL			(1<<5)
-#define ACER_CAP_RFBTN			(1<<6)
-#define ACER_CAP_ANY			(0xFFFFFFFF)
+#define ACER_CAP_MAILLED		BIT(0)
+#define ACER_CAP_WIRELESS		BIT(1)
+#define ACER_CAP_BLUETOOTH		BIT(2)
+#define ACER_CAP_BRIGHTNESS		BIT(3)
+#define ACER_CAP_THREEG			BIT(4)
+#define ACER_CAP_ACCEL			BIT(5)
 
 /*
  * Interface type flags
@@ -1247,10 +1245,8 @@ static void __init type_aa_dmi_decode(const struct dmi_header *header, void *d)
 		interface->capability |= ACER_CAP_THREEG;
 	if (type_aa->commun_func_bitmap & ACER_WMID3_GDS_BLUETOOTH)
 		interface->capability |= ACER_CAP_BLUETOOTH;
-	if (type_aa->commun_func_bitmap & ACER_WMID3_GDS_RFBTN) {
-		interface->capability |= ACER_CAP_RFBTN;
+	if (type_aa->commun_func_bitmap & ACER_WMID3_GDS_RFBTN)
 		commun_func_bitmap &= ~ACER_WMID3_GDS_RFBTN;
-	}
 
 	commun_fn_key_number = type_aa->commun_fn_key_number;
 }
-- 
2.28.0

