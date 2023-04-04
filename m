Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8635C761A6
	for <platform-driver-x86@archiver.kernel.org>; Tue,  4 Apr 2023 11:20:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234152AbjDDLUx (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 4 Apr 2023 07:20:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234165AbjDDLUw (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 4 Apr 2023 07:20:52 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 924AE1FDB
        for <platform-driver-x86@vger.kernel.org>; Tue,  4 Apr 2023 04:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1680607210;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=mLgE+STgOVeC5dpl4XuABTQIUZvJwfvdIro8s3bLMCw=;
        b=Bkdm+yFh3d9y2hLnYFuLYmva2/1jShsx88HCmR+D5AYlZbIWCX7hqlCgXVWa+mJ9xZfGMJ
        rvOYymVjSRIsRdgFSZugaJAZiLvTUtDZZA0Sr+fKoZVAroik+9x5g2OPsKlGYaDCuH/jeU
        mqZ2nXGIZyMo1gWWDXBL5SdlA2qxMuQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-569-hP4H8IUJNHyWl18_DstKKw-1; Tue, 04 Apr 2023 07:20:05 -0400
X-MC-Unique: hP4H8IUJNHyWl18_DstKKw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ECC90801210;
        Tue,  4 Apr 2023 11:20:04 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.74])
        by smtp.corp.redhat.com (Postfix) with ESMTP id F15B9FD6E;
        Tue,  4 Apr 2023 11:20:03 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Orlando Chamberlain <orlandoch.dev@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org,
        kernel test robot <lkp@intel.com>,
        Dan Carpenter <error27@gmail.com>
Subject: [PATCH] platform/x86: apple-gmux: Fix iomem_base __iomem annotation
Date:   Tue,  4 Apr 2023 13:19:55 +0200
Message-Id: <20230404111955.43266-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Fix the __iomem annotation of the iomem_base pointers in the apple-gmux
code. The __iomem should go before the *.

This fixes a bunch of sparse warnings like this one:

drivers/platform/x86/apple-gmux.c:224:48: sparse:
 expected void const [noderef] __iomem *
 got unsigned char [usertype] *

Fixes: 0c18184de990 ("platform/x86: apple-gmux: support MMIO gmux on T2 Macs")
Reported-by: kernel test robot <lkp@intel.com>
Link: https://lore.kernel.org/oe-kbuild-all/202304040401.IMxt7Ubi-lkp@intel.com/
Suggested-by: Dan Carpenter <error27@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/apple-gmux.c | 2 +-
 include/linux/apple-gmux.h        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/apple-gmux.c b/drivers/platform/x86/apple-gmux.c
index 4c311e1dedad..e02b4aea4f1e 100644
--- a/drivers/platform/x86/apple-gmux.c
+++ b/drivers/platform/x86/apple-gmux.c
@@ -57,7 +57,7 @@
 struct apple_gmux_config;
 
 struct apple_gmux_data {
-	u8 *__iomem iomem_base;
+	u8 __iomem *iomem_base;
 	unsigned long iostart;
 	unsigned long iolen;
 	const struct apple_gmux_config *config;
diff --git a/include/linux/apple-gmux.h b/include/linux/apple-gmux.h
index a7a7d430024b..206d97ffda79 100644
--- a/include/linux/apple-gmux.h
+++ b/include/linux/apple-gmux.h
@@ -66,7 +66,7 @@ static inline bool apple_gmux_is_indexed(unsigned long iostart)
 
 static inline bool apple_gmux_is_mmio(unsigned long iostart)
 {
-	u8 *__iomem iomem_base = ioremap(iostart, 16);
+	u8 __iomem *iomem_base = ioremap(iostart, 16);
 	u8 val;
 
 	if (!iomem_base)
-- 
2.39.1

