Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AFC6C83004
	for <platform-driver-x86@archiver.kernel.org>; Wed,  1 Mar 2023 09:26:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229744AbjCAJZp (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 1 Mar 2023 04:25:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229748AbjCAJZT (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 1 Mar 2023 04:25:19 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7405E35266
        for <platform-driver-x86@vger.kernel.org>; Wed,  1 Mar 2023 01:23:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1677662634;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=KgXYnGliy5FcewP6XJ+y5JIv7ybv89MybbIeQb/7XCc=;
        b=WjJTvJ4Y4UMaVRotxHpJr8N13W8KVXuT+U6DjdJip5qEKbdSDUaTx4u1V56SycZZWOiwe6
        k5A/Nr9Jxc524ijTPpXbyunQDPasgOuFySjJye2CS5S6nG4TMOdtjyuRUDhUyU4wm4mo3n
        Urc9enjUou9JLZEI18ve8KhM7BXeQac=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-505-LGSIydm2OU-GnWZHFjY-gg-1; Wed, 01 Mar 2023 04:23:51 -0500
X-MC-Unique: LGSIydm2OU-GnWZHFjY-gg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F288E811E6E;
        Wed,  1 Mar 2023 09:23:50 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.194.30])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 3729D40CF8EC;
        Wed,  1 Mar 2023 09:23:50 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org,
        Yauhen Kharuzhy <jekhor@gmail.com>
Subject: [PATCH v2 14/14] platform/x86: x86-android-tablets: Lenovo Yoga Book match is for YB1-X91 models only
Date:   Wed,  1 Mar 2023 10:23:31 +0100
Message-Id: <20230301092331.7038-15-hdegoede@redhat.com>
In-Reply-To: <20230301092331.7038-1-hdegoede@redhat.com>
References: <20230301092331.7038-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

When support for instantiating an i2c-client for the fuel-gauge was
added for the Windows based Yoga Book YB1-X91F/L models, the assumption
was made that this would apply to the Android based YB1-X90F/L models too.

But these have a completely different BIOS with completely different DMI
strings. Update the existing YB1-X91 support to reflect that it only
applies to the YB1-X91F/L models.

Cc: Yauhen Kharuzhy <jekhor@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/x86-android-tablets/dmi.c         |  8 ++++----
 drivers/platform/x86/x86-android-tablets/lenovo.c      | 10 +++++-----
 .../x86/x86-android-tablets/x86-android-tablets.h      |  2 +-
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/platform/x86/x86-android-tablets/dmi.c b/drivers/platform/x86/x86-android-tablets/dmi.c
index 1e9ad22b259c..332a65685458 100644
--- a/drivers/platform/x86/x86-android-tablets/dmi.c
+++ b/drivers/platform/x86/x86-android-tablets/dmi.c
@@ -75,12 +75,12 @@ const struct dmi_system_id x86_android_tablet_ids[] __initconst = {
 		.driver_data = (void *)&czc_p10t,
 	},
 	{
-		/* Lenovo Yoga Book X90F / X91F / X91L */
+		/* Lenovo Yoga Book X91F / X91L */
 		.matches = {
-			/* Non exact match to match all versions */
-			DMI_MATCH(DMI_PRODUCT_NAME, "Lenovo YB1-X9"),
+			/* Non exact match to match F + L versions */
+			DMI_MATCH(DMI_PRODUCT_NAME, "Lenovo YB1-X91"),
 		},
-		.driver_data = (void *)&lenovo_yogabook_x9x_info,
+		.driver_data = (void *)&lenovo_yogabook_x91_info,
 	},
 	{
 		/*
diff --git a/drivers/platform/x86/x86-android-tablets/lenovo.c b/drivers/platform/x86/x86-android-tablets/lenovo.c
index e140fa401301..da73e634fe9f 100644
--- a/drivers/platform/x86/x86-android-tablets/lenovo.c
+++ b/drivers/platform/x86/x86-android-tablets/lenovo.c
@@ -24,8 +24,8 @@
 #include "shared-psy-info.h"
 #include "x86-android-tablets.h"
 
-/* Lenovo Yoga Book X90F / X91F / X91L need manual instantiation of the fg client */
-static const struct x86_i2c_client_info lenovo_yogabook_x9x_i2c_clients[] __initconst = {
+/* Lenovo Yoga Book X91F/L Windows tablet needs manual instantiation of the fg client */
+static const struct x86_i2c_client_info lenovo_yogabook_x91_i2c_clients[] __initconst = {
 	{
 		/* BQ27542 fuel-gauge */
 		.board_info = {
@@ -38,9 +38,9 @@ static const struct x86_i2c_client_info lenovo_yogabook_x9x_i2c_clients[] __init
 	},
 };
 
-const struct x86_dev_info lenovo_yogabook_x9x_info __initconst = {
-	.i2c_client_info = lenovo_yogabook_x9x_i2c_clients,
-	.i2c_client_count = ARRAY_SIZE(lenovo_yogabook_x9x_i2c_clients),
+const struct x86_dev_info lenovo_yogabook_x91_info __initconst = {
+	.i2c_client_info = lenovo_yogabook_x91_i2c_clients,
+	.i2c_client_count = ARRAY_SIZE(lenovo_yogabook_x91_i2c_clients),
 };
 
 /* Lenovo Yoga Tablet 2 1050F/L's Android factory img has everything hardcoded */
diff --git a/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h b/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
index f7ee36a30a91..cf8566b3fd9c 100644
--- a/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
+++ b/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
@@ -94,7 +94,7 @@ extern const struct x86_dev_info asus_me176c_info;
 extern const struct x86_dev_info asus_tf103c_info;
 extern const struct x86_dev_info chuwi_hi8_info;
 extern const struct x86_dev_info czc_p10t;
-extern const struct x86_dev_info lenovo_yogabook_x9x_info;
+extern const struct x86_dev_info lenovo_yogabook_x91_info;
 /* Not const as this gets modified by its init callback */
 extern struct x86_dev_info lenovo_yoga_tab2_830_1050_info;
 extern const struct x86_dev_info lenovo_yt3_info;
-- 
2.39.1

