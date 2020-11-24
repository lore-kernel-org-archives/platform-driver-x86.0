Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C9EBC56201
	for <platform-driver-x86@archiver.kernel.org>; Tue, 24 Nov 2020 11:05:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AC4DF2076B
	for <platform-driver-x86@archiver.kernel.org>; Tue, 24 Nov 2020 11:05:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Gy/QDYx7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732277AbgKXLFB (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 24 Nov 2020 06:05:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49024 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731810AbgKXLFB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 24 Nov 2020 06:05:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1606215900;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=FrQqxrPtgBIK2bE5v01z0bKgWYbtih3qYfbey435iq0=;
        b=Gy/QDYx7NEgvQ3QWpLa1JTS2lr9Fg5z33/IiiPk5zJ69Co9SM2NV8l9sqgY2+g9UI91Keu
        GgbYQm4XiABIFwfailInYTapxHi/pywxJFJy3mNi9xrX0l0s/Ll1Ovem3wYN5ADnGDGIz4
        2gklL9uzfrkDbZcEElU0Tk6SzMywIlA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-482-iV6q1_4UMBeW9j3Vh7YVvA-1; Tue, 24 Nov 2020 06:04:57 -0500
X-MC-Unique: iV6q1_4UMBeW9j3Vh7YVvA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 507761009B85;
        Tue, 24 Nov 2020 11:04:56 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-45.ams2.redhat.com [10.36.112.45])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 295A110016FE;
        Tue, 24 Nov 2020 11:04:55 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <mgross@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andy@infradead.org>,
        platform-driver-x86@vger.kernel.org,
        russianneuromancer <russianneuromancer@ya.ru>
Subject: [PATCH] platform/x86: touchscreen_dmi: Add info for the Irbis TW118 tablet
Date:   Tue, 24 Nov 2020 12:04:54 +0100
Message-Id: <20201124110454.114286-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add touchscreen info for the Irbis TW118 tablet.

Reported-and-tested-by: russianneuromancer <russianneuromancer@ya.ru>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/touchscreen_dmi.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
index 26cbf7cc8129..5783139d0a11 100644
--- a/drivers/platform/x86/touchscreen_dmi.c
+++ b/drivers/platform/x86/touchscreen_dmi.c
@@ -295,6 +295,21 @@ static const struct ts_dmi_data irbis_tw90_data = {
 	.properties	= irbis_tw90_props,
 };
 
+static const struct property_entry irbis_tw118_props[] = {
+	PROPERTY_ENTRY_U32("touchscreen-min-x", 20),
+	PROPERTY_ENTRY_U32("touchscreen-min-y", 30),
+	PROPERTY_ENTRY_U32("touchscreen-size-x", 1960),
+	PROPERTY_ENTRY_U32("touchscreen-size-y", 1510),
+	PROPERTY_ENTRY_STRING("firmware-name", "gsl1680-irbis-tw118.fw"),
+	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
+	{ }
+};
+
+static const struct ts_dmi_data irbis_tw118_data = {
+	.acpi_name	= "MSSL1680:00",
+	.properties	= irbis_tw118_props,
+};
+
 static const struct property_entry itworks_tw891_props[] = {
 	PROPERTY_ENTRY_U32("touchscreen-min-x", 1),
 	PROPERTY_ENTRY_U32("touchscreen-min-y", 5),
@@ -953,6 +968,14 @@ const struct dmi_system_id touchscreen_dmi_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "TW90"),
 		},
 	},
+	{
+		/* Irbis TW118 */
+		.driver_data = (void *)&irbis_tw118_data,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "IRBIS"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "TW118"),
+		},
+	},
 	{
 		/* I.T.Works TW891 */
 		.driver_data = (void *)&itworks_tw891_data,
-- 
2.28.0

