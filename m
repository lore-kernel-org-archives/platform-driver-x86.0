Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49482ECAAD4
	for <platform-driver-x86@archiver.kernel.org>; Fri, 26 Aug 2022 11:15:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243481AbiHZLPR (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 26 Aug 2022 07:15:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233141AbiHZLPJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 26 Aug 2022 07:15:09 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B3A36F24F
        for <platform-driver-x86@vger.kernel.org>; Fri, 26 Aug 2022 04:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1661512506;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=5t+6ZxbwNwNB3BvmBeMrLqXdRXijdbjFJ/Wc0mpaad8=;
        b=ExPZHtGfCNn3sqrj4anpLJRkr4C17eqQt8Ru2Qr2ROi1d6R6IoG0DoKkdGxFeRzNCfkbVh
        TNBzQIEqZ1Yx0zYi9hL+maQHTHalSRlS7iwk0C1e5thEZquB+M3Na7z0bVRep2nZCj1GUv
        U35wd9qtLZVss/J4ehErcjTIwAIYIVQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-313-XXqoct_COZ6oWhAdlil88w-1; Fri, 26 Aug 2022 07:14:55 -0400
X-MC-Unique: XXqoct_COZ6oWhAdlil88w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 56C0F3C11726;
        Fri, 26 Aug 2022 11:14:55 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.144])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 9FEC54010FA1;
        Fri, 26 Aug 2022 11:14:54 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 1/2] platform/x86: msi-laptop: Add msi_scm_model_exit() helper
Date:   Fri, 26 Aug 2022 13:14:52 +0200
Message-Id: <20220826111453.178962-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The probe-error-exit and remove paths both duplicate the exact same code
to undo load_scm_model_init(). Add a helper for this.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/msi-laptop.c | 29 +++++++++++++----------------
 1 file changed, 13 insertions(+), 16 deletions(-)

diff --git a/drivers/platform/x86/msi-laptop.c b/drivers/platform/x86/msi-laptop.c
index 5d4b10b8d771..74829f766b88 100644
--- a/drivers/platform/x86/msi-laptop.c
+++ b/drivers/platform/x86/msi-laptop.c
@@ -1014,9 +1014,19 @@ static int __init load_scm_model_init(struct platform_device *sdev)
 	rfkill_cleanup();
 
 fail_rfkill:
-
 	return result;
+}
+
+static void msi_scm_model_exit(void)
+{
+	if (!quirks->load_scm_model)
+		return;
 
+	i8042_remove_filter(msi_laptop_i8042_filter);
+	cancel_delayed_work_sync(&msi_touchpad_dwork);
+	input_unregister_device(msi_laptop_input_dev);
+	cancel_delayed_work_sync(&msi_rfkill_dwork);
+	rfkill_cleanup();
 }
 
 static int __init msi_init(void)
@@ -1104,13 +1114,7 @@ static int __init msi_init(void)
 fail_create_attr:
 	sysfs_remove_group(&msipf_device->dev.kobj, &msipf_attribute_group);
 fail_create_group:
-	if (quirks->load_scm_model) {
-		i8042_remove_filter(msi_laptop_i8042_filter);
-		cancel_delayed_work_sync(&msi_touchpad_dwork);
-		input_unregister_device(msi_laptop_input_dev);
-		cancel_delayed_work_sync(&msi_rfkill_dwork);
-		rfkill_cleanup();
-	}
+	msi_scm_model_exit();
 fail_scm_model_init:
 	platform_device_del(msipf_device);
 fail_device_add:
@@ -1125,14 +1129,7 @@ static int __init msi_init(void)
 
 static void __exit msi_cleanup(void)
 {
-	if (quirks->load_scm_model) {
-		i8042_remove_filter(msi_laptop_i8042_filter);
-		cancel_delayed_work_sync(&msi_touchpad_dwork);
-		input_unregister_device(msi_laptop_input_dev);
-		cancel_delayed_work_sync(&msi_rfkill_dwork);
-		rfkill_cleanup();
-	}
-
+	msi_scm_model_exit();
 	sysfs_remove_group(&msipf_device->dev.kobj, &msipf_attribute_group);
 	if (!quirks->old_ec_model && threeg_exists)
 		device_remove_file(&msipf_device->dev, &dev_attr_threeg);
-- 
2.37.2

