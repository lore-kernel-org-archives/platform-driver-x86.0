Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B48FDC433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon,  3 Jan 2022 11:27:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232939AbiACL1G (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 3 Jan 2022 06:27:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31651 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231570AbiACL1F (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 3 Jan 2022 06:27:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1641209224;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=LWXFx0aXP+i4JXkm2nJBQVMOaUZZqKglUKOn9nzTOK4=;
        b=YamGM8tEFWbFSGjm6afqWcHRowUKDoanj3HpJdnQQkj+nHpFgrkis0iyt9jFf6HHOhrlD5
        qIn5GPU24gT9fzQDfjn4bknVFStg7q87W8R9IVvMjrzwGtVUQsZRjgDndAVxeaSXh4eC5C
        57R2D5F05sbiUUkZsjjCs26qxQds9/Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-604-6V2XZdzUO_6AeKK9WH9bdg-1; Mon, 03 Jan 2022 06:27:03 -0500
X-MC-Unique: 6V2XZdzUO_6AeKK9WH9bdg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CD0923E753;
        Mon,  3 Jan 2022 11:27:02 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.193.115])
        by smtp.corp.redhat.com (Postfix) with ESMTP id D345A78353;
        Mon,  3 Jan 2022 11:27:01 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH] platform/x86: touchscreen_dmi: Remove the Glavey TM800A550L entry
Date:   Mon,  3 Jan 2022 12:27:00 +0100
Message-Id: <20220103112700.111414-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The Glavey TM800A550L tablet is a tablet which ships with Android as
factory OS. As such it has the typical broken DSDT which x86 Android
tablets tend to have.

Specifically the touchscreen ACPI device node is missing the IRQ for
the touchscreen. So far users were expected to fix this with a DSDT
overlay, but support for the TM800A550L has been added to the new
x86-android-modules kernel-module and that will now automatically
instantiate a proper i2c-client with the IRQ set for the touchscreen,
including the necessary device-properties for the firmware loading.

This means that the touchscreen_dmi entry for the TM800A550L is
no longer necessary (and it no longer matches either since the
touchcscreen is no longer enumerated through ACPI), remove it.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/touchscreen_dmi.c | 21 ---------------------
 1 file changed, 21 deletions(-)

diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
index 7acec7eaf4cb..494f23052678 100644
--- a/drivers/platform/x86/touchscreen_dmi.c
+++ b/drivers/platform/x86/touchscreen_dmi.c
@@ -361,18 +361,6 @@ static const struct ts_dmi_data gdix1001_01_upside_down_data = {
 	.properties	= gdix1001_upside_down_props,
 };
 
-static const struct property_entry glavey_tm800a550l_props[] = {
-	PROPERTY_ENTRY_STRING("firmware-name", "gt912-glavey-tm800a550l.fw"),
-	PROPERTY_ENTRY_STRING("goodix,config-name", "gt912-glavey-tm800a550l.cfg"),
-	PROPERTY_ENTRY_U32("goodix,main-clk", 54),
-	{ }
-};
-
-static const struct ts_dmi_data glavey_tm800a550l_data = {
-	.acpi_name	= "GDIX1001:00",
-	.properties	= glavey_tm800a550l_props,
-};
-
 static const struct property_entry gp_electronic_t701_props[] = {
 	PROPERTY_ENTRY_U32("touchscreen-size-x", 960),
 	PROPERTY_ENTRY_U32("touchscreen-size-y", 640),
@@ -1149,15 +1137,6 @@ const struct dmi_system_id touchscreen_dmi_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "eSTAR BEAUTY HD Intel Quad core"),
 		},
 	},
-	{	/* Glavey TM800A550L */
-		.driver_data = (void *)&glavey_tm800a550l_data,
-		.matches = {
-			DMI_MATCH(DMI_BOARD_VENDOR, "AMI Corporation"),
-			DMI_MATCH(DMI_BOARD_NAME, "Aptio CRB"),
-			/* Above strings are too generic, also match on BIOS version */
-			DMI_MATCH(DMI_BIOS_VERSION, "ZY-8-BI-PX4S70VTR400-X423B-005-D"),
-		},
-	},
 	{
 		/* GP-electronic T701 */
 		.driver_data = (void *)&gp_electronic_t701_data,
-- 
2.33.1

