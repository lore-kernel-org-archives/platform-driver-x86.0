Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E771C76196
	for <platform-driver-x86@archiver.kernel.org>; Mon, 10 Apr 2023 19:36:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229605AbjDJTgD (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 10 Apr 2023 15:36:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229523AbjDJTgC (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 10 Apr 2023 15:36:02 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B8D11BD8
        for <platform-driver-x86@vger.kernel.org>; Mon, 10 Apr 2023 12:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681155316;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=aVno4knjdXX5A5qfyB0aXjvKMalS10Qufg6rkywAKIM=;
        b=Qva7Hvt/u/HIFTMklFeoILTTPG7U7wpwplX4qFP7JRYPOB+h8HyfkqerpCOzmQ9W4PtOwc
        l/pGIMwoJUzz1FWt06UsVXoJ+5UO7oyqRGz8TfJMsevq8tlmPb6ywOcyiJb71hjFNZOpHK
        QC4yoTNPAnoPLBlutO5WU1enjvpJ3Hw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-532-M4qVUSBtNHydUQGl6fXjeA-1; Mon, 10 Apr 2023 15:35:14 -0400
X-MC-Unique: M4qVUSBtNHydUQGl6fXjeA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D338A2A5957F;
        Mon, 10 Apr 2023 19:35:13 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.46])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 026A01121320;
        Mon, 10 Apr 2023 19:35:12 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mario Limonciello <mario.limonciello@outlook.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH] platform/x86: amd: pmc: Remove __maybe_unused from amd_pmc_suspend_handler()
Date:   Mon, 10 Apr 2023 21:35:12 +0200
Message-Id: <20230410193512.64232-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Now that the pmc code has switched to DEFINE_SIMPLE_DEV_PM_OPS()
the __maybe_unused is no longer necessary, drop it.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/amd/pmc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/amd/pmc.c b/drivers/platform/x86/amd/pmc.c
index 2761e9b76e95..2e2b99b93df7 100644
--- a/drivers/platform/x86/amd/pmc.c
+++ b/drivers/platform/x86/amd/pmc.c
@@ -840,7 +840,7 @@ static struct acpi_s2idle_dev_ops amd_pmc_s2idle_dev_ops = {
 	.restore = amd_pmc_s2idle_restore,
 };
 
-static int __maybe_unused amd_pmc_suspend_handler(struct device *dev)
+static int amd_pmc_suspend_handler(struct device *dev)
 {
 	struct amd_pmc_dev *pdev = dev_get_drvdata(dev);
 
-- 
2.39.1

