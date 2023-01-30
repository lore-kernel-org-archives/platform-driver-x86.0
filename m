Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDB04C54EED
	for <platform-driver-x86@archiver.kernel.org>; Mon, 30 Jan 2023 13:26:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236030AbjA3N0y (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 30 Jan 2023 08:26:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229728AbjA3N0w (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 30 Jan 2023 08:26:52 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E569834004
        for <platform-driver-x86@vger.kernel.org>; Mon, 30 Jan 2023 05:26:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1675085161;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=KX4ERg9e3UTIrc8HjrtMGf7HwsYfE+bIvLnP+lUTxPU=;
        b=WLkPGmM7PO9oSgO2ev7YfHSnCxrsz6bNY5pN9rAqW4+XwZ+Rj3w+qJFzIZyOqeJ18dxACp
        Ay+6oBPwOup6bW0iakHPxVMj7hYuyAAtlSO8W4En4PW5PLJK3SePZWDesvSlmOOa13zw/k
        d9eeMpNrLWCiDhu36VGOH9fldeuzhcY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-215-KEXICpUQNKSardjIFrmEPw-1; Mon, 30 Jan 2023 08:25:58 -0500
X-MC-Unique: KEXICpUQNKSardjIFrmEPw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5AA0229DD988;
        Mon, 30 Jan 2023 13:25:57 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.195.72])
        by smtp.corp.redhat.com (Postfix) with ESMTP id F09A4175AD;
        Mon, 30 Jan 2023 13:25:55 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 6/6] platform/x86/amd/pmf: Ensure mutexes are initialized before use
Date:   Mon, 30 Jan 2023 14:25:54 +0100
Message-Id: <20230130132554.696025-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

As soon as the first handler or sysfs file is registered
the mutex may get used.

Move the initialization to before any handler registration /
sysfs file creation.

Likewise move the destruction of the mutex to after all
the de-initialization is done.

Fixes: da5ce22df5fe ("platform/x86/amd/pmf: Add support for PMF core layer")
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/amd/pmf/core.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
index c9f7bcef4ac8..da23639071d7 100644
--- a/drivers/platform/x86/amd/pmf/core.c
+++ b/drivers/platform/x86/amd/pmf/core.c
@@ -385,6 +385,9 @@ static int amd_pmf_probe(struct platform_device *pdev)
 	if (!dev->regbase)
 		return -ENOMEM;
 
+	mutex_init(&dev->lock);
+	mutex_init(&dev->update_mutex);
+
 	apmf_acpi_init(dev);
 	platform_set_drvdata(pdev, dev);
 	amd_pmf_init_features(dev);
@@ -394,8 +397,6 @@ static int amd_pmf_probe(struct platform_device *pdev)
 	dev->pwr_src_notifier.notifier_call = amd_pmf_pwr_src_notify_call;
 	power_supply_reg_notifier(&dev->pwr_src_notifier);
 
-	mutex_init(&dev->lock);
-	mutex_init(&dev->update_mutex);
 	dev_info(dev->dev, "registered PMF device successfully\n");
 
 	return 0;
@@ -406,11 +407,11 @@ static int amd_pmf_remove(struct platform_device *pdev)
 	struct amd_pmf_dev *dev = platform_get_drvdata(pdev);
 
 	power_supply_unreg_notifier(&dev->pwr_src_notifier);
-	mutex_destroy(&dev->lock);
-	mutex_destroy(&dev->update_mutex);
 	amd_pmf_deinit_features(dev);
 	apmf_acpi_deinit(dev);
 	amd_pmf_dbgfs_unregister(dev);
+	mutex_destroy(&dev->lock);
+	mutex_destroy(&dev->update_mutex);
 	kfree(dev->buf);
 	return 0;
 }
-- 
2.39.1

