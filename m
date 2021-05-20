Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56512C43461
	for <platform-driver-x86@archiver.kernel.org>; Thu, 20 May 2021 09:34:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3B213614A7
	for <platform-driver-x86@archiver.kernel.org>; Thu, 20 May 2021 09:34:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232702AbhETJfz (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 20 May 2021 05:35:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41635 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232577AbhETJdz (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 20 May 2021 05:33:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1621503153;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=FFBrQJVFoqMobdQfREiJsi5dI5NFitzikQ8K6pjpVtg=;
        b=GFSgx98aYSoSW0VyX9J++uyYq1PTjTv4HVXJZJm6xx9Smd7xriNG4ZuZLN7PTypgDugxSK
        V4OizVgpNpxaU7osqfvTLxl286GIL1d4N5imZIF0mfbrakZsXTGOai4YazqMb3xF5+Ci2Q
        gvNSVG/Ilw6sWbmBbZm8DtiWNInMxvU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-207-4z55S_ayP4Oq1mxBEGPgsg-1; Thu, 20 May 2021 05:32:31 -0400
X-MC-Unique: 4z55S_ayP4Oq1mxBEGPgsg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D27D380006E;
        Thu, 20 May 2021 09:32:30 +0000 (UTC)
Received: from x1.localdomain (ovpn-114-201.ams2.redhat.com [10.36.114.201])
        by smtp.corp.redhat.com (Postfix) with ESMTP id E2F70100AE4E;
        Thu, 20 May 2021 09:32:29 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH] platform/x86: touchscreen_dmi: Add info for the Chuwi Hi10 Pro (CWI529) tablet
Date:   Thu, 20 May 2021 11:32:28 +0200
Message-Id: <20210520093228.7439-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add touchscreen info for the Chuwi Hi10 Pro (CWI529) tablet. This includes
info for getting the firmware directly from the UEFI, so that the user does
not need to manually install the firmware in /lib/firmware/silead.

This change will make the touchscreen on these devices work OOTB,
without requiring any manual setup.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/touchscreen_dmi.c | 35 ++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
index 40c970908a99..a626891f3ec8 100644
--- a/drivers/platform/x86/touchscreen_dmi.c
+++ b/drivers/platform/x86/touchscreen_dmi.c
@@ -115,6 +115,32 @@ static const struct ts_dmi_data chuwi_hi10_plus_data = {
 	.properties     = chuwi_hi10_plus_props,
 };
 
+static const struct property_entry chuwi_hi10_pro_props[] = {
+	PROPERTY_ENTRY_U32("touchscreen-min-x", 8),
+	PROPERTY_ENTRY_U32("touchscreen-min-y", 8),
+	PROPERTY_ENTRY_U32("touchscreen-size-x", 1912),
+	PROPERTY_ENTRY_U32("touchscreen-size-y", 1272),
+	PROPERTY_ENTRY_BOOL("touchscreen-swapped-x-y"),
+	PROPERTY_ENTRY_STRING("firmware-name", "gsl1680-chuwi-hi10-pro.fw"),
+	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
+	PROPERTY_ENTRY_BOOL("silead,home-button"),
+	{ }
+};
+
+static const struct ts_dmi_data chuwi_hi10_pro_data = {
+	.embedded_fw = {
+		.name	= "silead/gsl1680-chuwi-hi10-pro.fw",
+		.prefix = { 0xf0, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00 },
+		.length	= 42504,
+		.sha256	= { 0xdb, 0x92, 0x68, 0xa8, 0xdb, 0x81, 0x31, 0x00,
+			    0x1f, 0x58, 0x89, 0xdb, 0x19, 0x1b, 0x15, 0x8c,
+			    0x05, 0x14, 0xf4, 0x95, 0xba, 0x15, 0x45, 0x98,
+			    0x42, 0xa3, 0xbb, 0x65, 0xe3, 0x30, 0xa5, 0x93 },
+	},
+	.acpi_name      = "MSSL1680:00",
+	.properties     = chuwi_hi10_pro_props,
+};
+
 static const struct property_entry chuwi_vi8_props[] = {
 	PROPERTY_ENTRY_U32("touchscreen-min-x", 4),
 	PROPERTY_ENTRY_U32("touchscreen-min-y", 6),
@@ -955,6 +981,15 @@ const struct dmi_system_id touchscreen_dmi_table[] = {
 			DMI_MATCH(DMI_BOARD_NAME, "Cherry Trail CR"),
 		},
 	},
+	{
+		/* Chuwi Hi10 Prus (CWI597) */
+		.driver_data = (void *)&chuwi_hi10_pro_data,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Hampoo"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Hi10 pro tablet"),
+			DMI_MATCH(DMI_BOARD_NAME, "Cherry Trail CR"),
+		},
+	},
 	{
 		/* Chuwi Vi8 (CWI506) */
 		.driver_data = (void *)&chuwi_vi8_data,
-- 
2.31.1

