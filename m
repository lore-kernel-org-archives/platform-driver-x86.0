Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A163C32772
	for <platform-driver-x86@archiver.kernel.org>; Mon, 22 Aug 2022 15:14:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236501AbiHVPOY (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 22 Aug 2022 11:14:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236453AbiHVPNv (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 22 Aug 2022 11:13:51 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1D163DBEC
        for <platform-driver-x86@vger.kernel.org>; Mon, 22 Aug 2022 08:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1661180902;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=gGKg7CWYTZxWIo9iN5v9VFYPixwwvQphx61QShSlS4g=;
        b=iI5c936Qejgbjrtn35+qumSeNugOOzdtaNa6DBd+DDrJtR98NWoF6kC4tI/uKAhq7OkhWI
        2zUGEFi2ZCasvk9gbJlUd+xeQmIsVXIPLS+Ax3/+gBT1h9BnLyUONjv4NFUQK8rGdranVf
        xeU6RiabPLKT2c3rQf6zNg66Z8qWu7E=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-617-wEnm0zYxP_2FBh6MJBrMTw-1; Mon, 22 Aug 2022 11:08:20 -0400
X-MC-Unique: wEnm0zYxP_2FBh6MJBrMTw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 663E93C10159;
        Mon, 22 Aug 2022 15:08:20 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.193.25])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 8F53B40CF8E8;
        Mon, 22 Aug 2022 15:08:19 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <mgross@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andy@infradead.org>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 1/2] platform/x86: msi-laptop: Use MODULE_DEVICE_TABLE()
Date:   Mon, 22 Aug 2022 17:08:17 +0200
Message-Id: <20220822150818.45765-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Use MODULE_DEVICE_TABLE() instead of manually adding a bunch of
MODULE_ALIAS() statements.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/msi-laptop.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/platform/x86/msi-laptop.c b/drivers/platform/x86/msi-laptop.c
index 24ffc8e2d2d1..843f72200cfc 100644
--- a/drivers/platform/x86/msi-laptop.c
+++ b/drivers/platform/x86/msi-laptop.c
@@ -705,6 +705,7 @@ static const struct dmi_system_id msi_dmi_table[] __initconst = {
 	},
 	{ }
 };
+MODULE_DEVICE_TABLE(dmi, msi_dmi_table);
 
 static int rfkill_bluetooth_set(void *data, bool blocked)
 {
@@ -1166,14 +1167,3 @@ MODULE_AUTHOR("Lennart Poettering");
 MODULE_DESCRIPTION("MSI Laptop Support");
 MODULE_VERSION(MSI_DRIVER_VERSION);
 MODULE_LICENSE("GPL");
-
-MODULE_ALIAS("dmi:*:svnMICRO-STARINT'LCO.,LTD:pnMS-1013:pvr0131*:cvnMICRO-STARINT'LCO.,LTD:ct10:*");
-MODULE_ALIAS("dmi:*:svnMicro-StarInternational:pnMS-1058:pvr0581:rvnMSI:rnMS-1058:*:ct10:*");
-MODULE_ALIAS("dmi:*:svnMicro-StarInternational:pnMS-1412:*:rvnMSI:rnMS-1412:*:cvnMICRO-STARINT'LCO.,LTD:ct10:*");
-MODULE_ALIAS("dmi:*:svnNOTEBOOK:pnSAM2000:pvr0131*:cvnMICRO-STARINT'LCO.,LTD:ct10:*");
-MODULE_ALIAS("dmi:*:svnMICRO-STARINTERNATIONAL*:pnMS-N034:*");
-MODULE_ALIAS("dmi:*:svnMICRO-STARINTERNATIONAL*:pnMS-N051:*");
-MODULE_ALIAS("dmi:*:svnMICRO-STARINTERNATIONAL*:pnMS-N014:*");
-MODULE_ALIAS("dmi:*:svnMicro-StarInternational*:pnCR620:*");
-MODULE_ALIAS("dmi:*:svnMicro-StarInternational*:pnU270series:*");
-MODULE_ALIAS("dmi:*:svnMICRO-STARINTERNATIONAL*:pnU90/U100:*");
-- 
2.36.1

