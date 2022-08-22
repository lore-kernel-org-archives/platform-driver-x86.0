Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3D78C32774
	for <platform-driver-x86@archiver.kernel.org>; Mon, 22 Aug 2022 15:14:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236432AbiHVPOX (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 22 Aug 2022 11:14:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236446AbiHVPNv (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 22 Aug 2022 11:13:51 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F08E3AE52
        for <platform-driver-x86@vger.kernel.org>; Mon, 22 Aug 2022 08:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1661180903;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=RZbQTBDDA3DjGDsInuMZxes2sYm7c2mI/0KNivK2+Ss=;
        b=BtBPz/ckf1KptHjB8lrpsTYpj+oM3/VOMOicw9bYM2WQplV2XVYd9D6u+0ELfYb2ZGXNlX
        lcJ7jR2QF5L7D+FAY/ib2vcqoztPwjGVq7YVl694L6/xtG/GFKtcnVCsuT12u75dKNhKML
        rZCv5XaAmJDl+81pOYQSkYcjqRVEX7o=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-361-K-YCskcfM3-PrRKEVGCK_Q-1; Mon, 22 Aug 2022 11:08:22 -0400
X-MC-Unique: K-YCskcfM3-PrRKEVGCK_Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A093D1019C95;
        Mon, 22 Aug 2022 15:08:21 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.193.25])
        by smtp.corp.redhat.com (Postfix) with ESMTP id ADF4240CFD0A;
        Mon, 22 Aug 2022 15:08:20 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <mgross@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andy@infradead.org>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 2/2] platform/x86: msi-laptop: Drop MSI_DRIVER_VERSION
Date:   Mon, 22 Aug 2022 17:08:18 +0200
Message-Id: <20220822150818.45765-2-hdegoede@redhat.com>
In-Reply-To: <20220822150818.45765-1-hdegoede@redhat.com>
References: <20220822150818.45765-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Modules carrying there own version is a practice which the kernel
has stopped doing for a long time now, drop it.

While dropping the version pr_info from msi_init() lets remove
the somewhat useless pr_info() from msi_cleanup() as well.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/msi-laptop.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/platform/x86/msi-laptop.c b/drivers/platform/x86/msi-laptop.c
index 843f72200cfc..93ef8851b93e 100644
--- a/drivers/platform/x86/msi-laptop.c
+++ b/drivers/platform/x86/msi-laptop.c
@@ -53,8 +53,6 @@
 #include <linux/input/sparse-keymap.h>
 #include <acpi/video.h>
 
-#define MSI_DRIVER_VERSION "0.5"
-
 #define MSI_LCD_LEVEL_MAX 9
 
 #define MSI_EC_COMMAND_WIRELESS 0x10
@@ -1109,8 +1107,6 @@ static int __init msi_init(void)
 			set_auto_brightness(auto_brightness);
 	}
 
-	pr_info("driver " MSI_DRIVER_VERSION " successfully loaded\n");
-
 	return 0;
 
 fail_create_attr:
@@ -1156,8 +1152,6 @@ static void __exit msi_cleanup(void)
 		if (auto_brightness != 2)
 			set_auto_brightness(1);
 	}
-
-	pr_info("driver unloaded\n");
 }
 
 module_init(msi_init);
@@ -1165,5 +1159,4 @@ module_exit(msi_cleanup);
 
 MODULE_AUTHOR("Lennart Poettering");
 MODULE_DESCRIPTION("MSI Laptop Support");
-MODULE_VERSION(MSI_DRIVER_VERSION);
 MODULE_LICENSE("GPL");
-- 
2.36.1

