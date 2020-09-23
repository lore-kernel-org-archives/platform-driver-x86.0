Return-Path: <SRS0=GDfv=DA=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DDE6C2D0A8
	for <platform-driver-x86@archiver.kernel.org>; Wed, 23 Sep 2020 18:47:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 37432235FD
	for <platform-driver-x86@archiver.kernel.org>; Wed, 23 Sep 2020 18:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600886872;
	bh=lITuSNDF8g6ohhE2JO6SxXuIW45a/6sOfc0+p3we/Z0=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=zqqk1mMlcnM8R8Cxzhvuhq2Dct4F4H+QqoA3Jf9L3E4CGy3sdy4NHXXGCISn6WU+V
	 zUfv31x76e62Lz++867Pbyib7Pcl6bbidqbbV4VFb4/GZw8nkimFxf+ZJPe9pv5x+0
	 iwPUpFxUW0mXaq7gkrGF4EmuFtDHFC+NtfVfNsf8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726572AbgIWSrv (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 23 Sep 2020 14:47:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:40844 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726422AbgIWSrv (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 23 Sep 2020 14:47:51 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 36E7C20637;
        Wed, 23 Sep 2020 18:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600886870;
        bh=lITuSNDF8g6ohhE2JO6SxXuIW45a/6sOfc0+p3we/Z0=;
        h=From:To:Cc:Subject:Date:From;
        b=m0VyAyBwqMaGh00o9GFG69Lur1gU7A7ZaVQvrVeKa3mAJgCwhOB6x2OvByUm5IVu4
         ioMv2LRn6+NRMz+4WpqRAEAAg+uhiPhlBjs9gKjEQMnUerWBSvVQp0svk6subYgGwE
         ixZ/+t1ongVuuzNsJDpJUaeTlDtcel0GEm9PFvMI=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     rajneesh.bhardwaj@intel.com, vishwanath.somayaji@intel.com
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Rajat Jain <rajatja@google.com>,
        Maximilian Luz <luzmaximilian@gmail.com>
Subject: [PATCH] platform/x86: intel_pmc_core: do not create a static struct device
Date:   Wed, 23 Sep 2020 20:48:03 +0200
Message-Id: <20200923184803.192265-1-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

A struct device is a dynamic structure, with reference counting.
"Tricking" the kernel to make a dynamic structure static, by working
around the driver core release detection logic, is not nice.

Because of this, this code has been used as an example for others on
"how to do things", which is just about the worst thing possible to have
happen.

Fix this all up by making the platform device dynamic and providing a
real release function.

Cc: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
Cc: Vishwanath Somayaji <vishwanath.somayaji@intel.com>
Cc: Darren Hart <dvhart@infradead.org>
Cc: Andy Shevchenko <andy@infradead.org>
Cc: Rajat Jain <rajatja@google.com>
Cc: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Reported-by: Maximilian Luz <luzmaximilian@gmail.com>
Fixes: b02f6a2ef0a1 ("platform/x86: intel_pmc_core: Attach using APCI HID "INT33A1"")
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/platform/x86/intel_pmc_core_pltdrv.c | 26 +++++++++++++-------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/x86/intel_pmc_core_pltdrv.c b/drivers/platform/x86/intel_pmc_core_pltdrv.c
index 731281855cc8..73797680b895 100644
--- a/drivers/platform/x86/intel_pmc_core_pltdrv.c
+++ b/drivers/platform/x86/intel_pmc_core_pltdrv.c
@@ -20,15 +20,10 @@
 
 static void intel_pmc_core_release(struct device *dev)
 {
-	/* Nothing to do. */
+	kfree(dev);
 }
 
-static struct platform_device pmc_core_device = {
-	.name = "intel_pmc_core",
-	.dev  = {
-		.release = intel_pmc_core_release,
-	},
-};
+static struct platform_device *pmc_core_device;
 
 /*
  * intel_pmc_core_platform_ids is the list of platforms where we want to
@@ -52,6 +47,8 @@ MODULE_DEVICE_TABLE(x86cpu, intel_pmc_core_platform_ids);
 
 static int __init pmc_core_platform_init(void)
 {
+	int retval;
+
 	/* Skip creating the platform device if ACPI already has a device */
 	if (acpi_dev_present("INT33A1", NULL, -1))
 		return -ENODEV;
@@ -59,12 +56,23 @@ static int __init pmc_core_platform_init(void)
 	if (!x86_match_cpu(intel_pmc_core_platform_ids))
 		return -ENODEV;
 
-	return platform_device_register(&pmc_core_device);
+	pmc_core_device = kzalloc(sizeof(*pmc_core_device), GFP_KERNEL);
+	if (!pmc_core_device)
+		return -ENOMEM;
+
+	pmc_core_device->name = "intel_pmc_core";
+	pmc_core_device->dev.release = intel_pmc_core_release;
+
+	retval = platform_device_register(pmc_core_device);
+	if (retval)
+		kfree(pmc_core_device);
+
+	return retval;
 }
 
 static void __exit pmc_core_platform_exit(void)
 {
-	platform_device_unregister(&pmc_core_device);
+	platform_device_unregister(pmc_core_device);
 }
 
 module_init(pmc_core_platform_init);
-- 
2.28.0

