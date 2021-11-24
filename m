Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4CB0C433EF
	for <platform-driver-x86@archiver.kernel.org>; Wed, 24 Nov 2021 17:51:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349863AbhKXRyn (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 24 Nov 2021 12:54:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29489 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237134AbhKXRym (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 24 Nov 2021 12:54:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1637776292;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=384besRMYCm2nDLvI7Mmr0SZ2lPVkuqwNWu3Zdqeyvg=;
        b=hjZEpMtTBh+ek2DJfWm6t7AgzaobIhvlJZ1+m0fMFIBuxhxSw/SMFOWXUhQMKiysG5MvFh
        Ue/GbH/r0/uHivDgK3QwPO6gjRVqi5Z/hCkaTVNrmRP2vY0zQMfUFFDgOKvr7DqQmCl0eK
        jZKTqQUrsU65inE4UJOaGj8Po/XsHqA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-192-FYOX_mRoNoSlPCT05rTWwQ-1; Wed, 24 Nov 2021 12:51:28 -0500
X-MC-Unique: FYOX_mRoNoSlPCT05rTWwQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 526A61023F4F;
        Wed, 24 Nov 2021 17:51:27 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.192.246])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 6086D2B1A3;
        Wed, 24 Nov 2021 17:51:26 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH] platform/x86: touchscreen_dmi: Add TrekStor SurfTab duo W1 touchscreen info
Date:   Wed, 24 Nov 2021 18:51:25 +0100
Message-Id: <20211124175125.250329-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The TrekStor SurfTab duo W1 (ST10432-10b) has a Goodix touchscreen which
has its x-axis mirrored.

Add a quirk to fix this.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/touchscreen_dmi.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
index 8e7d42df02da..1c3d2dca420d 100644
--- a/drivers/platform/x86/touchscreen_dmi.c
+++ b/drivers/platform/x86/touchscreen_dmi.c
@@ -914,6 +914,16 @@ static const struct ts_dmi_data trekstor_primetab_t13b_data = {
 	.properties = trekstor_primetab_t13b_props,
 };
 
+static const struct property_entry trekstor_surftab_duo_w1_props[] = {
+	PROPERTY_ENTRY_BOOL("touchscreen-inverted-x"),
+	{ }
+};
+
+static const struct ts_dmi_data trekstor_surftab_duo_w1_data = {
+	.acpi_name	= "GDIX1001:00",
+	.properties	= trekstor_surftab_duo_w1_props,
+};
+
 static const struct property_entry trekstor_surftab_twin_10_1_props[] = {
 	PROPERTY_ENTRY_U32("touchscreen-min-x", 20),
 	PROPERTY_ENTRY_U32("touchscreen-min-y", 0),
@@ -1511,6 +1521,14 @@ const struct dmi_system_id touchscreen_dmi_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "Primetab T13B"),
 		},
 	},
+	{
+		/* TrekStor SurfTab duo W1 10.1 ST10432-10b */
+		.driver_data = (void *)&trekstor_surftab_duo_w1_data,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TrekStor"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "SurfTab duo W1 10.1 (VT4)"),
+		},
+	},
 	{
 		/* TrekStor SurfTab twin 10.1 ST10432-8 */
 		.driver_data = (void *)&trekstor_surftab_twin_10_1_data,
-- 
2.33.1

