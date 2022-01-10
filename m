Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8D0EC433F5
	for <platform-driver-x86@archiver.kernel.org>; Mon, 10 Jan 2022 10:40:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244041AbiAJKkF (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 10 Jan 2022 05:40:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60619 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S244040AbiAJKkE (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 10 Jan 2022 05:40:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1641811202;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4uLkUzJ8SYGZskqyrmMVUSeUJsxxvJ4DAhc4htpDPPo=;
        b=Q2gIerHlF2ZwrV/cPN+Mjae7PcZS1o3ljGlrDaJ/Pjc5gStO+PD04kItPVaDHaqlp2/N60
        DXlMc75rpc+o6CEHXjFIFRrTzjRYR+EZLgHRdBwF6SEim8r3NYtMGL/haqGHLQIdqm7pxH
        9mUVvS0h24eYEmXHOdPb7k19U2J1lnQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-126-Th0kFtaqNlO1bngNqybOiQ-1; Mon, 10 Jan 2022 05:39:59 -0500
X-MC-Unique: Th0kFtaqNlO1bngNqybOiQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 78818193F569;
        Mon, 10 Jan 2022 10:39:58 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.195.64])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 3946E7AB6B;
        Mon, 10 Jan 2022 10:39:57 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Lubomir Rintel <lkundrak@v3.sk>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 2/3] platform/x86: x86-android-tablets: Add an init() callback to struct x86_dev_info
Date:   Mon, 10 Jan 2022 11:39:51 +0100
Message-Id: <20220110103952.48760-2-hdegoede@redhat.com>
In-Reply-To: <20220110103952.48760-1-hdegoede@redhat.com>
References: <20220110103952.48760-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add an init() callback to struct x86_dev_info, board descriptions can use
this to do some custom setup before registering the i2c_clients, platform-
devices and servdevs.

Also add an exit() callback to also allow for cleanup of the custom setup.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/x86-android-tablets.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/platform/x86/x86-android-tablets.c b/drivers/platform/x86/x86-android-tablets.c
index d125d7a5189a..2329a5a6c182 100644
--- a/drivers/platform/x86/x86-android-tablets.c
+++ b/drivers/platform/x86/x86-android-tablets.c
@@ -153,6 +153,8 @@ struct x86_dev_info {
 	int i2c_client_count;
 	int pdev_count;
 	int serdev_count;
+	int (*init)(void);
+	void (*exit)(void);
 };
 
 /* Generic / shared bq24190 settings */
@@ -674,6 +676,7 @@ static struct i2c_client **i2c_clients;
 static struct platform_device **pdevs;
 static struct serdev_device **serdevs;
 static struct gpiod_lookup_table **gpiod_lookup_tables;
+static void (*exit_handler)(void);
 
 static __init int x86_instantiate_i2c_client(const struct x86_dev_info *dev_info,
 					     int idx)
@@ -791,6 +794,9 @@ static void x86_android_tablet_cleanup(void)
 
 	kfree(i2c_clients);
 
+	if (exit_handler)
+		exit_handler();
+
 	for (i = 0; gpiod_lookup_tables && gpiod_lookup_tables[i]; i++)
 		gpiod_remove_lookup_table(gpiod_lookup_tables[i]);
 }
@@ -833,6 +839,15 @@ static __init int x86_android_tablet_init(void)
 	for (i = 0; gpiod_lookup_tables && gpiod_lookup_tables[i]; i++)
 		gpiod_add_lookup_table(gpiod_lookup_tables[i]);
 
+	if (dev_info->init) {
+		ret = dev_info->init();
+		if (ret < 0) {
+			x86_android_tablet_cleanup();
+			return ret;
+		}
+		exit_handler = dev_info->exit;
+	}
+
 	i2c_clients = kcalloc(dev_info->i2c_client_count, sizeof(*i2c_clients), GFP_KERNEL);
 	if (!i2c_clients) {
 		x86_android_tablet_cleanup();
-- 
2.33.1

