Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F441C433E1
	for <platform-driver-x86@archiver.kernel.org>; Sun, 21 Mar 2021 12:00:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 372E56193D
	for <platform-driver-x86@archiver.kernel.org>; Sun, 21 Mar 2021 12:00:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229893AbhCUL7g (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 21 Mar 2021 07:59:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42895 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229886AbhCUL7X (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 21 Mar 2021 07:59:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1616327963;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ypqalW64iWbkWc6cuOrbDZ2wKHq1peHYXNDq280eQEE=;
        b=LXF8xdCFQtnPnYxKVLZHSygqAs1Enc/XJm8Id+R06D4gZqkAXn9/DoI6Fd3SqaS0cLzTU4
        Ag/8MGNf3//bq+rQ9eBW+CNkxOGIwqkG3wb4/Tr3cwjt5effYUk0eufRMCamRy3Rgf4Bfc
        m5nO/T1fN4/F8jDPf2XOi5tzyQB/hdM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-424-odk6A9u0OqWdEcBtAAVjjg-1; Sun, 21 Mar 2021 07:59:21 -0400
X-MC-Unique: odk6A9u0OqWdEcBtAAVjjg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 51301593A4;
        Sun, 21 Mar 2021 11:59:20 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-68.ams2.redhat.com [10.36.112.68])
        by smtp.corp.redhat.com (Postfix) with ESMTP id D5EDE1F7;
        Sun, 21 Mar 2021 11:59:18 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mario Limonciello <mario.limonciello@dell.com>,
        Divya Bharathi <Divya_Bharathi@dell.com>,
        Alexander Naumann <alexandernaumann@gmx.de>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH v2 6/7] platform/x86: dell-wmi-sysman: Make sysman_init() return -ENODEV of the interfaces are not found
Date:   Sun, 21 Mar 2021 12:59:00 +0100
Message-Id: <20210321115901.35072-7-hdegoede@redhat.com>
In-Reply-To: <20210321115901.35072-1-hdegoede@redhat.com>
References: <20210321115901.35072-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

When either the attributes or the password interface is not found, then
unregister the 2 wmi drivers again and return -ENODEV from sysman_init().

Fixes: e8a60aa7404b ("platform/x86: Introduce support for Systems Management Driver over WMI for Dell Systems")
Cc: Divya Bharathi <Divya_Bharathi@dell.com>
Cc: Mario Limonciello <mario.limonciello@dell.com>
Reported-by: Alexander Naumann <alexandernaumann@gmx.de>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/dell/dell-wmi-sysman/sysman.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c b/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
index 99dc2f3bdf49..5dd9b29d939c 100644
--- a/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
+++ b/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
@@ -506,15 +506,17 @@ static int __init sysman_init(void)
 	}
 
 	ret = init_bios_attr_set_interface();
-	if (ret || !wmi_priv.bios_attr_wdev) {
-		pr_debug("failed to initialize set interface\n");
+	if (ret)
 		return ret;
-	}
 
 	ret = init_bios_attr_pass_interface();
-	if (ret || !wmi_priv.password_attr_wdev) {
-		pr_debug("failed to initialize pass interface\n");
+	if (ret)
 		goto err_exit_bios_attr_set_interface;
+
+	if (!wmi_priv.bios_attr_wdev || !wmi_priv.password_attr_wdev) {
+		pr_debug("failed to find set or pass interface\n");
+		ret = -ENODEV;
+		goto err_exit_bios_attr_pass_interface;
 	}
 
 	ret = class_register(&firmware_attributes_class);
-- 
2.30.2

