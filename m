Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DF8FECAAA3
	for <platform-driver-x86@archiver.kernel.org>; Fri, 26 Aug 2022 11:15:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231167AbiHZLPF (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 26 Aug 2022 07:15:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240884AbiHZLPA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 26 Aug 2022 07:15:00 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16325402E1
        for <platform-driver-x86@vger.kernel.org>; Fri, 26 Aug 2022 04:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1661512497;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=5/A6lSJ+udmpvnHvKt5J7SWFqrlXYluDM++LtYXt3j4=;
        b=a0HAT+YePNiRgYIqHUqyaBxQHSdODSxP2XDtHcyAFCRDA7Zi6wveVmP2IjAZqndZUUzwtC
        zRZeZXDno8U8ttW9I967UBEEIPMjbkBLjVRxbC2fgaaJaFHoC0aQDdkLDxjyiZNmjt7CO8
        ZYpSiIs1a1yQv8M7wOAm1sU9XPn8djQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-459-lKaPfcHZMVKExjYjqZWdHw-1; Fri, 26 Aug 2022 07:14:56 -0400
X-MC-Unique: lKaPfcHZMVKExjYjqZWdHw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4058A81F46A;
        Fri, 26 Aug 2022 11:14:56 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.144])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 8B3A54010FA1;
        Fri, 26 Aug 2022 11:14:55 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 2/2] platform/x86: msi-laptop: Add msi_scm_disable_hw_fn_handling() helper
Date:   Fri, 26 Aug 2022 13:14:53 +0200
Message-Id: <20220826111453.178962-2-hdegoede@redhat.com>
In-Reply-To: <20220826111453.178962-1-hdegoede@redhat.com>
References: <20220826111453.178962-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add a msi_scm_disable_hw_fn_handling() to remove the duplicate code
for this in the resume and init paths.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/msi-laptop.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/x86/msi-laptop.c b/drivers/platform/x86/msi-laptop.c
index 74829f766b88..1c29678e5727 100644
--- a/drivers/platform/x86/msi-laptop.c
+++ b/drivers/platform/x86/msi-laptop.c
@@ -913,8 +913,7 @@ static int rfkill_init(struct platform_device *sdev)
 	return retval;
 }
 
-#ifdef CONFIG_PM_SLEEP
-static int msi_laptop_resume(struct device *device)
+static int msi_scm_disable_hw_fn_handling(void)
 {
 	u8 data;
 	int result;
@@ -934,6 +933,12 @@ static int msi_laptop_resume(struct device *device)
 
 	return 0;
 }
+
+#ifdef CONFIG_PM_SLEEP
+static int msi_laptop_resume(struct device *device)
+{
+	return msi_scm_disable_hw_fn_handling();
+}
 #endif
 
 static int __init msi_laptop_input_setup(void)
@@ -966,7 +971,6 @@ static int __init msi_laptop_input_setup(void)
 
 static int __init load_scm_model_init(struct platform_device *sdev)
 {
-	u8 data;
 	int result;
 
 	if (!quirks->ec_read_only) {
@@ -980,12 +984,7 @@ static int __init load_scm_model_init(struct platform_device *sdev)
 	}
 
 	/* disable hardware control by fn key */
-	result = ec_read(MSI_STANDARD_EC_SCM_LOAD_ADDRESS, &data);
-	if (result < 0)
-		return result;
-
-	result = ec_write(MSI_STANDARD_EC_SCM_LOAD_ADDRESS,
-		data | MSI_STANDARD_EC_SCM_LOAD_MASK);
+	result = msi_scm_disable_hw_fn_handling();
 	if (result < 0)
 		return result;
 
-- 
2.37.2

