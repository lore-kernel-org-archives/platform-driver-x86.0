Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0402FC433F5
	for <platform-driver-x86@archiver.kernel.org>; Sat,  5 Feb 2022 19:14:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243624AbiBETOE (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 5 Feb 2022 14:14:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51549 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238602AbiBETOE (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 5 Feb 2022 14:14:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1644088443;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=pwxuq8Bo6k76sTJAj+lrh1y1HMoDHujV39vpjy6HkPY=;
        b=e3LbpFtOfSWtYAj6Iz8nIC9Vu2PA/UVLWhwryVyqrdABT9NRZCNMGmd9Ubn15xbr+mzLtH
        8dSUGT1FHnh+m+lelI4niQeiGE0pwTbiv58jhPoHNFjD+Ai9J+o+ukORixVVZU/X33n0LN
        JMXZQpcC2wM4Xe2ZMM1oC6RhjLQxilA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-295-k0J2nbk8Pjq20gGTa6qIqw-1; Sat, 05 Feb 2022 14:14:00 -0500
X-MC-Unique: k0J2nbk8Pjq20gGTa6qIqw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1AAC72F25;
        Sat,  5 Feb 2022 19:13:59 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.37])
        by smtp.corp.redhat.com (Postfix) with ESMTP id B0AE95C23A;
        Sat,  5 Feb 2022 19:13:57 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Stephan Gerhold <stephan@gerhold.net>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 1/6] platform/x86: x86-android-tablets: Add battery swnode support
Date:   Sat,  5 Feb 2022 20:13:51 +0100
Message-Id: <20220205191356.225505-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

power_supply_get_battery_info() which is used by charger and fuel-gauge
drivers on x86-android-tablets, expects the battery properties to be
described in a stand-alone battery fwnode which is then referenced
from both the charger and fuel-gauge device's fwnodes.

Add support for registering + unregistering a swnode for this.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/x86-android-tablets.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/platform/x86/x86-android-tablets.c b/drivers/platform/x86/x86-android-tablets.c
index 3120acf9837c..80d113c41623 100644
--- a/drivers/platform/x86/x86-android-tablets.c
+++ b/drivers/platform/x86/x86-android-tablets.c
@@ -146,6 +146,7 @@ struct x86_serdev_info {
 struct x86_dev_info {
 	char *invalid_aei_gpiochip;
 	const char * const *modules;
+	const struct software_node *bat_swnode;
 	struct gpiod_lookup_table * const *gpiod_lookup_tables;
 	const struct x86_i2c_client_info *i2c_client_info;
 	const struct platform_device_info *pdev_info;
@@ -727,6 +728,7 @@ static struct i2c_client **i2c_clients;
 static struct platform_device **pdevs;
 static struct serdev_device **serdevs;
 static struct gpiod_lookup_table * const *gpiod_lookup_tables;
+static const struct software_node *bat_swnode;
 static void (*exit_handler)(void);
 
 static __init int x86_instantiate_i2c_client(const struct x86_dev_info *dev_info,
@@ -850,6 +852,8 @@ static void x86_android_tablet_cleanup(void)
 
 	for (i = 0; gpiod_lookup_tables && gpiod_lookup_tables[i]; i++)
 		gpiod_remove_lookup_table(gpiod_lookup_tables[i]);
+
+	software_node_unregister(bat_swnode);
 }
 
 static __init int x86_android_tablet_init(void)
@@ -886,6 +890,13 @@ static __init int x86_android_tablet_init(void)
 	for (i = 0; dev_info->modules && dev_info->modules[i]; i++)
 		request_module(dev_info->modules[i]);
 
+	bat_swnode = dev_info->bat_swnode;
+	if (bat_swnode) {
+		ret = software_node_register(bat_swnode);
+		if (ret)
+			return ret;
+	}
+
 	gpiod_lookup_tables = dev_info->gpiod_lookup_tables;
 	for (i = 0; gpiod_lookup_tables && gpiod_lookup_tables[i]; i++)
 		gpiod_add_lookup_table(gpiod_lookup_tables[i]);
-- 
2.33.1

