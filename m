Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01165C433F5
	for <platform-driver-x86@archiver.kernel.org>; Sun,  5 Sep 2021 13:02:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DAE4F60F4A
	for <platform-driver-x86@archiver.kernel.org>; Sun,  5 Sep 2021 13:02:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229566AbhIENDT (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 5 Sep 2021 09:03:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28094 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229877AbhIENDS (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 5 Sep 2021 09:03:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1630846935;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=llLzgs9sx/jagmkfbTSa27pvKrhPEHHIN5OXDV+sOKk=;
        b=XCfiv2UZQnlQMZff99Co8H0jeY7yDwNozoxfLCWNSrido5KVuN4ZaYhORHD9bKiRvGmF8k
        RgLVLxbQOq8Cjyh+DIkh03LuUteBolnz2OzY7uRc5aSSNr5SZ9zWLpCr7DC82/TA8vJoJ4
        H55OcDXHGCM06WSKma5nmLeo2DPEzJE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-412-NC0IRhrSPUSV9GfBkeDV_Q-1; Sun, 05 Sep 2021 09:02:14 -0400
X-MC-Unique: NC0IRhrSPUSV9GfBkeDV_Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 40B0C814400;
        Sun,  5 Sep 2021 13:02:13 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.192.34])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 569725D6B1;
        Sun,  5 Sep 2021 13:02:12 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 2/2] platform/x86: touchscreen_dmi: Update info for the Chuwi Hi10 Plus (CWI527) tablet
Date:   Sun,  5 Sep 2021 15:02:10 +0200
Message-Id: <20210905130210.32810-2-hdegoede@redhat.com>
In-Reply-To: <20210905130210.32810-1-hdegoede@redhat.com>
References: <20210905130210.32810-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add info for getting the firmware directly from the UEFI for the Chuwi Hi10
Plus (CWI527), so that the user does not need to manually install the
firmware in /lib/firmware/silead.

This change will make the touchscreen on these devices work OOTB,
without requiring any manual setup.

Also tweak the min and width/height values a bit for more accurate position
reporting.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/touchscreen_dmi.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
index 1f9cb756b103..033f797861d8 100644
--- a/drivers/platform/x86/touchscreen_dmi.c
+++ b/drivers/platform/x86/touchscreen_dmi.c
@@ -100,10 +100,10 @@ static const struct ts_dmi_data chuwi_hi10_air_data = {
 };
 
 static const struct property_entry chuwi_hi10_plus_props[] = {
-	PROPERTY_ENTRY_U32("touchscreen-min-x", 0),
-	PROPERTY_ENTRY_U32("touchscreen-min-y", 5),
-	PROPERTY_ENTRY_U32("touchscreen-size-x", 1914),
-	PROPERTY_ENTRY_U32("touchscreen-size-y", 1283),
+	PROPERTY_ENTRY_U32("touchscreen-min-x", 12),
+	PROPERTY_ENTRY_U32("touchscreen-min-y", 10),
+	PROPERTY_ENTRY_U32("touchscreen-size-x", 1908),
+	PROPERTY_ENTRY_U32("touchscreen-size-y", 1270),
 	PROPERTY_ENTRY_STRING("firmware-name", "gsl1680-chuwi-hi10plus.fw"),
 	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
 	PROPERTY_ENTRY_BOOL("silead,home-button"),
@@ -111,6 +111,15 @@ static const struct property_entry chuwi_hi10_plus_props[] = {
 };
 
 static const struct ts_dmi_data chuwi_hi10_plus_data = {
+	.embedded_fw = {
+		.name	= "silead/gsl1680-chuwi-hi10plus.fw",
+		.prefix = { 0xf0, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00 },
+		.length	= 34056,
+		.sha256	= { 0xfd, 0x0a, 0x08, 0x08, 0x3c, 0xa6, 0x34, 0x4e,
+			    0x2c, 0x49, 0x9c, 0xcd, 0x7d, 0x44, 0x9d, 0x38,
+			    0x10, 0x68, 0xb5, 0xbd, 0xb7, 0x2a, 0x63, 0xb5,
+			    0x67, 0x0b, 0x96, 0xbd, 0x89, 0x67, 0x85, 0x09 },
+	},
 	.acpi_name      = "MSSL0017:00",
 	.properties     = chuwi_hi10_plus_props,
 };
-- 
2.31.1

