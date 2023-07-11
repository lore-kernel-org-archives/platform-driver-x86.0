Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9FE3EB64DC
	for <platform-driver-x86@archiver.kernel.org>; Tue, 11 Jul 2023 10:00:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229491AbjGKKAo (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 11 Jul 2023 06:00:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229503AbjGKKAm (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 11 Jul 2023 06:00:42 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29F9D170F
        for <platform-driver-x86@vger.kernel.org>; Tue, 11 Jul 2023 02:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1689069567;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=AQCWcJgO+RKGt+vFczTs2LPbw5cRHdoMjztQtecMY5M=;
        b=YyRWBlTj6J9Aie9ZCcr4VHqJs5DJVK9q6jFNlbVth5lZwXEbKH2/0UE9Z9CpOBly35ny3o
        d/6JHfK8GpUYvpGyfHyk/2kfrlxkyYBjWC/XVjLlaf2m83iJ3ryW9IVn7OE3HpbI/13qqU
        QafrWGTRQoLeznv1ZbshHArW3AtuYvQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-227-hSs_72dOMgqjEnkoTyI_vA-1; Tue, 11 Jul 2023 05:59:23 -0400
X-MC-Unique: hSs_72dOMgqjEnkoTyI_vA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 820571044592;
        Tue, 11 Jul 2023 09:59:23 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.224])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 998C74CD0C1;
        Tue, 11 Jul 2023 09:59:22 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org,
        Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH] platform/x86/amd: pmc: Use release_mem_region() to undo request_mem_region_muxed()
Date:   Tue, 11 Jul 2023 11:59:20 +0200
Message-ID: <20230711095920.264308-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Muxed (mem) regions will wait in request_mem_region_muxed() if the region
is busy (in use by another consumer) during the call.

In order to wake-up possibly waiting other consumers of the region,
it must be released by a release_mem_region() call, which will actually
wake up any waiters.

release_mem_region() also frees the resource created by
request_mem_region_muxed(), avoiding the need for the unmatched kfree().

Cc: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Mario, can you ask one of the reporters with a machine which needs the quirk
to test this ?
---
 drivers/platform/x86/amd/pmc-quirks.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/amd/pmc-quirks.c b/drivers/platform/x86/amd/pmc-quirks.c
index 362e7c0097d7..ad702463a65d 100644
--- a/drivers/platform/x86/amd/pmc-quirks.c
+++ b/drivers/platform/x86/amd/pmc-quirks.c
@@ -11,7 +11,6 @@
 #include <linux/dmi.h>
 #include <linux/io.h>
 #include <linux/ioport.h>
-#include <linux/slab.h>
 
 #include "pmc.h"
 
@@ -135,12 +134,10 @@ static const struct dmi_system_id fwbug_list[] = {
  */
 static void amd_pmc_skip_nvme_smi_handler(u32 s2idle_bug_mmio)
 {
-	struct resource *res;
 	void __iomem *addr;
 	u8 val;
 
-	res = request_mem_region_muxed(s2idle_bug_mmio, 1, "amd_pmc_pm80");
-	if (!res)
+	if (!request_mem_region_muxed(s2idle_bug_mmio, 1, "amd_pmc_pm80"))
 		return;
 
 	addr = ioremap(s2idle_bug_mmio, 1);
@@ -152,8 +149,7 @@ static void amd_pmc_skip_nvme_smi_handler(u32 s2idle_bug_mmio)
 
 	iounmap(addr);
 cleanup_resource:
-	release_resource(res);
-	kfree(res);
+	release_mem_region(s2idle_bug_mmio, 1);
 }
 
 void amd_pmc_process_restore_quirks(struct amd_pmc_dev *dev)
-- 
2.41.0

