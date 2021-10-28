Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F84EC433EF
	for <platform-driver-x86@archiver.kernel.org>; Thu, 28 Oct 2021 09:48:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 08175610D2
	for <platform-driver-x86@archiver.kernel.org>; Thu, 28 Oct 2021 09:48:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230226AbhJ1JvA (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 28 Oct 2021 05:51:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45807 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230210AbhJ1Ju4 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 28 Oct 2021 05:50:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1635414509;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=nWiBYxcFaFXuaFEyBPCEAL5D0LET0SxpB1dWr9y5pGA=;
        b=bUJUcLqaFoECFE2aDpONN48WBWKJWAlUQueBWUM7nAKBhKTVH3/dKku9v5iLpJ4QqEAlaR
        I1sIet1Z0ehe5eHZovej3QED9tEvkg59wM5gHIwAyPxvl9VtiZaROeM3PKkoa5iXLxOJyZ
        5m70C8Ru/f0Hwy8YW+fa7K3wkI84n2M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-413-A6FRSY7QPxqVkJONySV7Xg-1; Thu, 28 Oct 2021 05:48:27 -0400
X-MC-Unique: A6FRSY7QPxqVkJONySV7Xg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A1E4180A5C1;
        Thu, 28 Oct 2021 09:48:26 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.192.150])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 7F48E70F5C;
        Thu, 28 Oct 2021 09:48:25 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org,
        Mark Stamp <stamp497@googlemail.com>
Subject: [PATCH] platform/x86: touchscreen_dmi: Add info for the Viglen Connect 10 tablet
Date:   Thu, 28 Oct 2021 11:48:24 +0200
Message-Id: <20211028094824.84292-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Mark Stamp <stamp497@googlemail.com>

Add touchscreen info for the Viglen Connect 10 tablet.

Signed-off-by: Mark Stamp <stamp497@googlemail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/touchscreen_dmi.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
index 033f797861d8..fa8812039b82 100644
--- a/drivers/platform/x86/touchscreen_dmi.c
+++ b/drivers/platform/x86/touchscreen_dmi.c
@@ -938,6 +938,23 @@ static const struct ts_dmi_data trekstor_surftab_wintron70_data = {
 	.properties	= trekstor_surftab_wintron70_props,
 };
 
+static const struct property_entry viglen_connect_10_props[] = {
+	PROPERTY_ENTRY_U32("touchscreen-size-x", 1890),
+	PROPERTY_ENTRY_U32("touchscreen-size-y", 1280),
+	PROPERTY_ENTRY_U32("touchscreen-fuzz-x", 6),
+	PROPERTY_ENTRY_U32("touchscreen-fuzz-y", 6),
+	PROPERTY_ENTRY_BOOL("touchscreen-swapped-x-y"),
+	PROPERTY_ENTRY_STRING("firmware-name", "gsl3680-viglen-connect-10.fw"),
+	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
+	PROPERTY_ENTRY_BOOL("silead,home-button"),
+	{ }
+};
+
+static const struct ts_dmi_data viglen_connect_10_data = {
+	.acpi_name	= "MSSL1680:00",
+	.properties	= viglen_connect_10_props,
+};
+
 static const struct property_entry vinga_twizzle_j116_props[] = {
 	PROPERTY_ENTRY_U32("touchscreen-size-x", 1920),
 	PROPERTY_ENTRY_U32("touchscreen-size-y", 1280),
@@ -1521,6 +1538,14 @@ const struct dmi_system_id touchscreen_dmi_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "YOURBOOK C11B"),
 		},
 	},
+	{
+		/* Viglen Connect 10 */
+		.driver_data = (void *)&viglen_connect_10_data,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Viglen Ltd."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Connect 10'' Tablet PC"),
+		},
+	},
 	{
 		/* Vinga Twizzle J116 */
 		.driver_data = (void *)&vinga_twizzle_j116_data,
-- 
2.31.1

