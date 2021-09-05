Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C33EC433EF
	for <platform-driver-x86@archiver.kernel.org>; Sun,  5 Sep 2021 13:02:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7748E60F4A
	for <platform-driver-x86@archiver.kernel.org>; Sun,  5 Sep 2021 13:02:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237736AbhIENDS (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 5 Sep 2021 09:03:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49355 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229566AbhIENDR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 5 Sep 2021 09:03:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1630846934;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=Gl4LFTDbxqEE8YQRWnC348Gzo/nBVajKNsFkJf6Bjps=;
        b=M/EqgSizVmZeAEV02CyJSZgZNkxFprxpMBpJrX4RLNopYBNK2VElRAgpp0Ipln68tiogkZ
        jw888/Y9OlPLFK3crcYQTZAN+9qOSYqrlF8DLqtmeEsGHANxpXNu63ychQBXLoFPVDJjXg
        cNi360e5SK8EV2mOvFraHB9yHb6/yFc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-101-Sv1EvtLnN6S6D8YxfOoD4A-1; Sun, 05 Sep 2021 09:02:13 -0400
X-MC-Unique: Sv1EvtLnN6S6D8YxfOoD4A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 112F95180;
        Sun,  5 Sep 2021 13:02:12 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.192.34])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 27E4C5D6B1;
        Sun,  5 Sep 2021 13:02:10 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 1/2] platform/x86: touchscreen_dmi: Add info for the Chuwi HiBook (CWI514) tablet
Date:   Sun,  5 Sep 2021 15:02:09 +0200
Message-Id: <20210905130210.32810-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add touchscreen info for the Chuwi HiBook (CWI514) tablet. This includes
info for getting the firmware directly from the UEFI, so that the user does
not need to manually install the firmware in /lib/firmware/silead.

This change will make the touchscreen on these devices work OOTB,
without requiring any manual setup.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/touchscreen_dmi.c | 37 ++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
index 0e1451b1d9c6..1f9cb756b103 100644
--- a/drivers/platform/x86/touchscreen_dmi.c
+++ b/drivers/platform/x86/touchscreen_dmi.c
@@ -141,6 +141,33 @@ static const struct ts_dmi_data chuwi_hi10_pro_data = {
 	.properties     = chuwi_hi10_pro_props,
 };
 
+static const struct property_entry chuwi_hibook_props[] = {
+	PROPERTY_ENTRY_U32("touchscreen-min-x", 30),
+	PROPERTY_ENTRY_U32("touchscreen-min-y", 4),
+	PROPERTY_ENTRY_U32("touchscreen-size-x", 1892),
+	PROPERTY_ENTRY_U32("touchscreen-size-y", 1276),
+	PROPERTY_ENTRY_BOOL("touchscreen-inverted-y"),
+	PROPERTY_ENTRY_BOOL("touchscreen-swapped-x-y"),
+	PROPERTY_ENTRY_STRING("firmware-name", "gsl1680-chuwi-hibook.fw"),
+	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
+	PROPERTY_ENTRY_BOOL("silead,home-button"),
+	{ }
+};
+
+static const struct ts_dmi_data chuwi_hibook_data = {
+	.embedded_fw = {
+		.name	= "silead/gsl1680-chuwi-hibook.fw",
+		.prefix = { 0xf0, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00 },
+		.length	= 40392,
+		.sha256	= { 0xf7, 0xc0, 0xe8, 0x5a, 0x6c, 0xf2, 0xeb, 0x8d,
+			    0x12, 0xc4, 0x45, 0xbf, 0x55, 0x13, 0x4c, 0x1a,
+			    0x13, 0x04, 0x31, 0x08, 0x65, 0x73, 0xf7, 0xa8,
+			    0x1b, 0x7d, 0x59, 0xc9, 0xe6, 0x97, 0xf7, 0x38 },
+	},
+	.acpi_name      = "MSSL0017:00",
+	.properties     = chuwi_hibook_props,
+};
+
 static const struct property_entry chuwi_vi8_props[] = {
 	PROPERTY_ENTRY_U32("touchscreen-min-x", 4),
 	PROPERTY_ENTRY_U32("touchscreen-min-y", 6),
@@ -979,6 +1006,16 @@ const struct dmi_system_id touchscreen_dmi_table[] = {
 			DMI_MATCH(DMI_BOARD_NAME, "Cherry Trail CR"),
 		},
 	},
+	{
+		/* Chuwi HiBook (CWI514) */
+		.driver_data = (void *)&chuwi_hibook_data,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Hampoo"),
+			DMI_MATCH(DMI_BOARD_NAME, "Cherry Trail CR"),
+			/* Above matches are too generic, add bios-date match */
+			DMI_MATCH(DMI_BIOS_DATE, "05/07/2016"),
+		},
+	},
 	{
 		/* Chuwi Vi8 (CWI506) */
 		.driver_data = (void *)&chuwi_vi8_data,
-- 
2.31.1

