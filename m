Return-Path: <SRS0=x/JX=DW=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84943C433DF
	for <platform-driver-x86@archiver.kernel.org>; Thu, 15 Oct 2020 19:49:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 25914206DD
	for <platform-driver-x86@archiver.kernel.org>; Thu, 15 Oct 2020 19:49:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WWsN7z+Y"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730621AbgJOTtz (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 15 Oct 2020 15:49:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60883 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727865AbgJOTtz (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 15 Oct 2020 15:49:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1602791394;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=tcZdT8IOATsQ7N3p+AN/gNAmf+a8lRkv1vF0EhdKOTY=;
        b=WWsN7z+YHdAlb3A2MWI+JTvQ5vd0s/q5E1cXX8YxPAHRr0Bkb0KxybN2zmJy6PjO9DROyY
        wRkTfGMfKYVmsn1hhhIbHjQaVIFsFRFRT7aoOEBdCPGkaVLvHk1H9YlHDs3RJrmlVFhcfA
        /A/oPC40JGtVGJ/WKSTzCieFZeDnOTA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-206-BR_Ys24xN8Onw3mZofgNFg-1; Thu, 15 Oct 2020 15:49:52 -0400
X-MC-Unique: BR_Ys24xN8Onw3mZofgNFg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 61834107ACF7;
        Thu, 15 Oct 2020 19:49:51 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-150.ams2.redhat.com [10.36.112.150])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 633805C1BB;
        Thu, 15 Oct 2020 19:49:50 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <mgross@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andy@infradead.org>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH] platform/x86: touchscreen_dmi: Add info for the Predia Basic tablet
Date:   Thu, 15 Oct 2020 21:49:49 +0200
Message-Id: <20201015194949.50566-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add touchscreen info for the Predia Basic tablet.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/touchscreen_dmi.c | 27 ++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
index dda60f89c951..26cbf7cc8129 100644
--- a/drivers/platform/x86/touchscreen_dmi.c
+++ b/drivers/platform/x86/touchscreen_dmi.c
@@ -623,6 +623,23 @@ static const struct ts_dmi_data pov_mobii_wintab_p1006w_v10_data = {
 	.properties	= pov_mobii_wintab_p1006w_v10_props,
 };
 
+static const struct property_entry predia_basic_props[] = {
+	PROPERTY_ENTRY_U32("touchscreen-min-x", 3),
+	PROPERTY_ENTRY_U32("touchscreen-min-y", 10),
+	PROPERTY_ENTRY_U32("touchscreen-size-x", 1728),
+	PROPERTY_ENTRY_U32("touchscreen-size-y", 1144),
+	PROPERTY_ENTRY_BOOL("touchscreen-swapped-x-y"),
+	PROPERTY_ENTRY_STRING("firmware-name", "gsl3680-predia-basic.fw"),
+	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
+	PROPERTY_ENTRY_BOOL("silead,home-button"),
+	{ }
+};
+
+static const struct ts_dmi_data predia_basic_data = {
+	.acpi_name	= "MSSL1680:00",
+	.properties	= predia_basic_props,
+};
+
 static const struct property_entry schneider_sct101ctm_props[] = {
 	PROPERTY_ENTRY_U32("touchscreen-size-x", 1715),
 	PROPERTY_ENTRY_U32("touchscreen-size-y", 1140),
@@ -1109,6 +1126,16 @@ const struct dmi_system_id touchscreen_dmi_table[] = {
 			DMI_MATCH(DMI_BIOS_DATE, "10/24/2014"),
 		},
 	},
+	{
+		/* Predia Basic tablet) */
+		.driver_data = (void *)&predia_basic_data,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Insyde"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "CherryTrail"),
+			/* Above matches are too generic, add bios-version match */
+			DMI_MATCH(DMI_BIOS_VERSION, "Mx.WT107.KUBNGEA"),
+		},
+	},
 	{
 		/* Point of View mobii wintab p800w (v2.1) */
 		.driver_data = (void *)&pov_mobii_wintab_p800w_v21_data,
-- 
2.28.0

