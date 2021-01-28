Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D1C5C433E6
	for <platform-driver-x86@archiver.kernel.org>; Thu, 28 Jan 2021 11:38:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3068064D9A
	for <platform-driver-x86@archiver.kernel.org>; Thu, 28 Jan 2021 11:38:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229640AbhA1Li2 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 28 Jan 2021 06:38:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54576 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229551AbhA1Li0 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 28 Jan 2021 06:38:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1611833818;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=m+AKwvzs7nJ3kXoQu6OIG1Oc6mIPSmzwYlHWvIofE00=;
        b=XEvQqwRKzKRfcvdGCyjQsnCJQkQ8K7j29nOKXwgykrQa9c1SOlMTN+HkJOYGhiwfYRtpJA
        /heMrkkwIFhRVqlKcF1mGPy3kQ+5ve9+qZHV6XXIStgRomHFmv4nPmZ9h6QHVqCLAlJuwA
        J4qziTzqGx8CCKNWHrfNZ8OkzEOgDYE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-203-DhYatYl4NQeD5x05kcMNPQ-1; Thu, 28 Jan 2021 06:36:57 -0500
X-MC-Unique: DhYatYl4NQeD5x05kcMNPQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1CE6C1005513;
        Thu, 28 Jan 2021 11:36:55 +0000 (UTC)
Received: from x1.localdomain (ovpn-114-250.ams2.redhat.com [10.36.114.250])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 281DC5D720;
        Thu, 28 Jan 2021 11:36:53 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <mgross@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andy@infradead.org>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH] platform/x86: touchscreen_dmi: Add info for the Jumper EZpad 7 tablet
Date:   Thu, 28 Jan 2021 12:36:53 +0100
Message-Id: <20210128113653.5442-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add touchscreen info for the Jumper EZpad 7 tablet.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/touchscreen_dmi.c | 27 ++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
index c4de932302d6..c44a6e8dceb8 100644
--- a/drivers/platform/x86/touchscreen_dmi.c
+++ b/drivers/platform/x86/touchscreen_dmi.c
@@ -382,6 +382,23 @@ static const struct ts_dmi_data jumper_ezpad_6_m4_data = {
 	.properties	= jumper_ezpad_6_m4_props,
 };
 
+static const struct property_entry jumper_ezpad_7_props[] = {
+	PROPERTY_ENTRY_U32("touchscreen-min-x", 4),
+	PROPERTY_ENTRY_U32("touchscreen-min-y", 10),
+	PROPERTY_ENTRY_U32("touchscreen-size-x", 2044),
+	PROPERTY_ENTRY_U32("touchscreen-size-y", 1526),
+	PROPERTY_ENTRY_BOOL("touchscreen-swapped-x-y"),
+	PROPERTY_ENTRY_STRING("firmware-name", "gsl3680-jumper-ezpad-7.fw"),
+	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
+	PROPERTY_ENTRY_BOOL("silead,stuck-controller-bug"),
+	{ }
+};
+
+static const struct ts_dmi_data jumper_ezpad_7_data = {
+	.acpi_name	= "MSSL1680:00",
+	.properties	= jumper_ezpad_7_props,
+};
+
 static const struct property_entry jumper_ezpad_mini3_props[] = {
 	PROPERTY_ENTRY_U32("touchscreen-min-x", 23),
 	PROPERTY_ENTRY_U32("touchscreen-min-y", 16),
@@ -1034,6 +1051,16 @@ const struct dmi_system_id touchscreen_dmi_table[] = {
 			DMI_MATCH(DMI_BIOS_VERSION, "Jumper8.S106x"),
 		},
 	},
+	{
+		/* Jumper EZpad 7 */
+		.driver_data = (void *)&jumper_ezpad_7_data,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Jumper"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "EZpad"),
+			/* Jumper12x.WJ2012.bsBKRCP05 with the version dropped */
+			DMI_MATCH(DMI_BIOS_VERSION, "Jumper12x.WJ2012.bsBKRCP"),
+		},
+	},
 	{
 		/* Jumper EZpad mini3 */
 		.driver_data = (void *)&jumper_ezpad_mini3_data,
-- 
2.29.2

