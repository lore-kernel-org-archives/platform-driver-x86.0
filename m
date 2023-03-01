Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2658C7EE3A
	for <platform-driver-x86@archiver.kernel.org>; Wed,  1 Mar 2023 09:26:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229677AbjCAJZn (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 1 Mar 2023 04:25:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229754AbjCAJZT (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 1 Mar 2023 04:25:19 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 376CD35253
        for <platform-driver-x86@vger.kernel.org>; Wed,  1 Mar 2023 01:23:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1677662633;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=wL54WaJFFRLGv1xQlO7sUrxrPN3M3bPDcR9RWOJFVWM=;
        b=elfQ+CsLHrsFtO7O7O7AeLO2tuvWtH5wycjBcPzXk7dlU4hDjj8nZ4u2tCqwskOuiwX7n2
        GHo+LKvbFbFGBdk4fZ/soNliD2WGsicxoBHvdaB75vj0jFKtmrOFb0rCo/a81PuDn6RB7d
        U8V2hFKqlOfll5yDN1G7kcPSyYW4yHM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-50-xFiMysWkNTuqMqKdCV7JPA-1; Wed, 01 Mar 2023 04:23:50 -0500
X-MC-Unique: xFiMysWkNTuqMqKdCV7JPA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0403B85A5A3;
        Wed,  1 Mar 2023 09:23:50 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.194.30])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 53AE24010E7B;
        Wed,  1 Mar 2023 09:23:49 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH v2 13/14] platform/x86: x86-android-tablets: Add LID switch support for Yoga Tablet 2 1050/830 series
Date:   Wed,  1 Mar 2023 10:23:30 +0100
Message-Id: <20230301092331.7038-14-hdegoede@redhat.com>
In-Reply-To: <20230301092331.7038-1-hdegoede@redhat.com>
References: <20230301092331.7038-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The Yoga Tablet 2 1050/830 series have a HALL sensor for detecting
when their (optional) case/cover is closed over the screen.

Their Windows counterparts (alsmost the same HW, different BIOS)
model this as a LID switch. Add support for reporting this as
a LID switch on the Android models too.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/x86-android-tablets/lenovo.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/platform/x86/x86-android-tablets/lenovo.c b/drivers/platform/x86/x86-android-tablets/lenovo.c
index f8544a4e807d..e140fa401301 100644
--- a/drivers/platform/x86/x86-android-tablets/lenovo.c
+++ b/drivers/platform/x86/x86-android-tablets/lenovo.c
@@ -56,6 +56,19 @@ static const struct software_node lenovo_yoga_tab2_830_1050_bq24190_node = {
 	.properties = lenovo_yoga_tab2_830_1050_bq24190_props,
 };
 
+static struct x86_gpio_button lenovo_yoga_tab2_830_1050_lid = {
+	.button = {
+		.code = SW_LID,
+		.active_low = true,
+		.desc = "lid_sw",
+		.type = EV_SW,
+		.wakeup = true,
+		.debounce_interval = 50,
+	},
+	.chip = "INT33FC:02",
+	.pin = 26,
+};
+
 /* This gets filled by lenovo_yoga_tab2_830_1050_init() */
 static struct rmi_device_platform_data lenovo_yoga_tab2_830_1050_rmi_pdata = { };
 
@@ -154,6 +167,7 @@ struct x86_dev_info lenovo_yoga_tab2_830_1050_info __initdata = {
 	/* i2c_client_count gets set by lenovo_yoga_tab2_830_1050_init() */
 	.pdev_info = int3496_pdevs,
 	.pdev_count = 1,
+	.gpio_button = &lenovo_yoga_tab2_830_1050_lid,
 	.gpiod_lookup_tables = lenovo_yoga_tab2_830_1050_gpios,
 	.bat_swnode = &generic_lipo_hv_4v35_battery_node,
 	.modules = bq24190_modules,
-- 
2.39.1

