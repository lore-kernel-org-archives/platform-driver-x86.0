Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75574C433E6
	for <platform-driver-x86@archiver.kernel.org>; Sat, 20 Mar 2021 14:35:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 507A861961
	for <platform-driver-x86@archiver.kernel.org>; Sat, 20 Mar 2021 14:35:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229835AbhCTOfK (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 20 Mar 2021 10:35:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51680 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229854AbhCTOew (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 20 Mar 2021 10:34:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1616250892;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9y3M3dLDcQu5yfKgi2cTAvSv+PXcKEJKvJEOznKJdwM=;
        b=KinKqLd2cYmp6yqqzcZaCfa+KZhqJexxPk5m9tQ4VbBS0NVfG46NV/3G/AAfUGNIzvTebq
        BWm+a3W1IeUXe7XO4HP6b9rMHrL3HKDJ+A3SEsUoV8eNeD8am4bob4IvJTAUVtfIm7HloQ
        3ULHaI/hZZ2TlFpapvlfN3J9IBjH4xY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-31-0o6SzWRNPxm1M-w0QVgk7w-1; Sat, 20 Mar 2021 10:34:48 -0400
X-MC-Unique: 0o6SzWRNPxm1M-w0QVgk7w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B575981744F;
        Sat, 20 Mar 2021 14:34:46 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-22.ams2.redhat.com [10.36.112.22])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 5811960C04;
        Sat, 20 Mar 2021 14:34:42 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mario Limonciello <mario.limonciello@dell.com>,
        Divya Bharathi <Divya_Bharathi@dell.com>,
        Alexander Naumann <alexandernaumann@gmx.de>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 5/7] platform/x86: dell-wmi-sysman: Make sysman_init() return -ENODEV of the interfaces are not found
Date:   Sat, 20 Mar 2021 15:34:27 +0100
Message-Id: <20210320143429.76047-6-hdegoede@redhat.com>
In-Reply-To: <20210320143429.76047-1-hdegoede@redhat.com>
References: <20210320143429.76047-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

When either the attributes or the password interface is not found, then
unregister the 2 wmi drivers again and return -ENODEV from sysman_init().

Cc: Divya Bharathi <Divya_Bharathi@dell.com>
Cc: Mario Limonciello <mario.limonciello@dell.com>
Reported-by: Alexander Naumann <alexandernaumann@gmx.de>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/dell/dell-wmi-sysman/sysman.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c b/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
index 94cdfafad3f8..6ed3cee2208b 100644
--- a/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
+++ b/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
@@ -505,15 +505,17 @@ static int __init sysman_init(void)
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

