Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9492C433B4
	for <platform-driver-x86@archiver.kernel.org>; Sun,  9 May 2021 01:57:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ABB35613D8
	for <platform-driver-x86@archiver.kernel.org>; Sun,  9 May 2021 01:57:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229609AbhEIB6s (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 8 May 2021 21:58:48 -0400
Received: from mail1.bemta23.messagelabs.com ([67.219.246.4]:45727 "EHLO
        mail1.bemta23.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229767AbhEIB6s (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 8 May 2021 21:58:48 -0400
Received: from [100.112.1.13] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-4.bemta.az-b.us-east-1.aws.symcld.net id 9B/A2-49156-99147906; Sun, 09 May 2021 01:57:45 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrNIsWRWlGSWpSXmKPExsWSLveKTXeG4/Q
  Eg/szjSy6u+cyWbw5Pp3Joqmzic3ic8dkFovVe14wWyz6+ITNgc1j0swZzB7zTgZ6vN93lc3j
  8ya5AJYo1sy8pPyKBNaMt5MPMhc0SlUsOjOfpYHxqFgXIxeHkMB/Rombk7rZuxg5gZzXjBInd
  nuB2GwC2hJbtvxi62Lk4BARkJH4sNYTpJ5ZYB2jxJybB8DqhQWiJc4f72EBsVkEVCR+fHoAFu
  cVsJFofX2NDcSWEJCXOH3iGiOIzSlgK7F2zxQWiF1hEl93zmaFqBeUODnzCVicGai+eetsZgh
  bQuLgixfMEHMUJJYtWcgOYSdI9Px7xDaBUWAWkvZZSNpnIWlfwMi8itEsqSgzPaMkNzEzR9fQ
  wEDX0NBI11jXyNRQL7FKN0mvtFg3NbG4RBfILS/WK67MTc5J0ctLLdnECIyDlALm3zsYu9580
  DvEKMnBpCTKW5QzNUGILyk/pTIjsTgjvqg0J7X4EKMMB4eSBO9yh+kJQoJFqempFWmZOcCYhE
  lLcPAoifD6gaR5iwsSc4sz0yFSpxgVpcR5FUASAiCJjNI8uDZYGrjEKCslzMvIwMAgxFOQWpS
  bWYIq/4pRnINRSZg3wA5oCk9mXgnc9FdAi5mAFj9YNA1kcUkiQkqqgclMNSlC+OJno3W74pKS
  gxoSHlre+nt5Ycb3QKvnbpVSPZL1+2fc+LiybGnGoZxv3de5LQssAqN/vS3Y77mtIanrwdFNN
  ifm+bRvE50zK89Xqe2KaI6X1tewlPylEtw2u658NbGaal9vys+89uaZCdHNd+J9HQMyBJgPn5
  1w+K2sBHe/+iSneVMj1Gu36z0XnCfkfOL66lqpvZwx/GIbFoXsz3h1l63nd94XufsvJj6tvff
  FzFZ1/s82q1s/r7r5v575XSBV6+WHFTPLp13RZ2DZFTwpUVklfuk8zaV+FgJHHj7TrjoQ7xXv
  a3j1hOOWT3Fc0ZZPTP/d8Chep31mEaNfiYLFtKI9tiLzGyof8SqxFGckGmoxFxUnAgDVEvRIf
  gMAAA==
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-9.tower-395.messagelabs.com!1620525463!29847!1
X-Originating-IP: [103.30.234.6]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13677 invoked from network); 9 May 2021 01:57:44 -0000
Received: from unknown (HELO lenovo.com) (103.30.234.6)
  by server-9.tower-395.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 9 May 2021 01:57:44 -0000
Received: from reswpmail01.lenovo.com (unknown [10.62.32.20])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by Forcepoint Email with ESMTPS id 5364834F7754534C52B2;
        Sun,  9 May 2021 09:57:41 +0800 (CST)
Received: from localhost.localdomain.com (10.46.208.93) by
 reswpmail01.lenovo.com (10.62.32.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2176.2; Sat, 8 May 2021 21:57:37 -0400
From:   Mark Pearson <markpearson@lenovo.com>
To:     <markpearson@lenovo.com>
CC:     <hdegoede@redhat.com>, <mgross@linux.intel.com>,
        <platform-driver-x86@vger.kernel.org>, <divya.bharathi@dell.com>,
        <prasanth.ksr@dell.com>, <mario.limonciello@dell.com>
Subject: [PATCH v2 2/3] platform/x86: dell-wmi-sysman: Use firmware_attributes_class helper
Date:   Sat, 8 May 2021 21:57:07 -0400
Message-ID: <20210509015708.112766-2-markpearson@lenovo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210509015708.112766-1-markpearson@lenovo.com>
References: <markpearson@lenovo.com>
 <20210509015708.112766-1-markpearson@lenovo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.46.208.93]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail01.lenovo.com (10.62.32.20)
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Update Dell WMI sysman driver to use newly implemented helper module.

Signed-off-by: Mark Pearson <markpearson@lenovo.com>
---
Changes in v2:
 - firmare_attributes_class.c added as reqested during review of the
   proposed think_lmi.c driver. Labeling as V2 to keep series
   consistent (hope that's correct).
 - Note, compile tested only due to lack of HW to test on. Matching
   changes were made in the think-lmi.c driver and worked. Please let me
   know if any problems!

 drivers/platform/x86/dell/Kconfig              |  1 +
 .../platform/x86/dell/dell-wmi-sysman/sysman.c | 18 ++++++++----------
 2 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/platform/x86/dell/Kconfig b/drivers/platform/x86/dell/Kconfig
index e0a55337f..931f616ff 100644
--- a/drivers/platform/x86/dell/Kconfig
+++ b/drivers/platform/x86/dell/Kconfig
@@ -197,6 +197,7 @@ config DELL_WMI_SYSMAN
 	depends on ACPI_WMI
 	depends on DMI
 	select NLS
+	select FW_ATTR_CLASS
 	help
 	  This driver allows changing BIOS settings on many Dell machines from
 	  2018 and newer without the use of any additional software.
diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c b/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
index c8d276d78..91ecf49ab 100644
--- a/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
+++ b/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
@@ -13,14 +13,11 @@
 #include <linux/kernel.h>
 #include <linux/wmi.h>
 #include "dell-wmi-sysman.h"
+#include "../../firmware_attributes_class.h"
 
 #define MAX_TYPES  4
 #include <linux/nls.h>
 
-static struct class firmware_attributes_class = {
-	.name = "firmware-attributes",
-};
-
 struct wmi_sysman_priv wmi_priv = {
 	.mutex = __MUTEX_INITIALIZER(wmi_priv.mutex),
 };
@@ -28,6 +25,7 @@ struct wmi_sysman_priv wmi_priv = {
 /* reset bios to defaults */
 static const char * const reset_types[] = {"builtinsafe", "lastknowngood", "factory", "custom"};
 static int reset_option = -1;
+struct class *fw_attr_class;
 
 
 /**
@@ -541,11 +539,11 @@ static int __init sysman_init(void)
 		goto err_exit_bios_attr_pass_interface;
 	}
 
-	ret = class_register(&firmware_attributes_class);
+	ret = fw_attributes_class_register(&fw_attr_class);
 	if (ret)
 		goto err_exit_bios_attr_pass_interface;
 
-	wmi_priv.class_dev = device_create(&firmware_attributes_class, NULL, MKDEV(0, 0),
+	wmi_priv.class_dev = device_create(fw_attr_class, NULL, MKDEV(0, 0),
 				  NULL, "%s", DRIVER_NAME);
 	if (IS_ERR(wmi_priv.class_dev)) {
 		ret = PTR_ERR(wmi_priv.class_dev);
@@ -602,10 +600,10 @@ static int __init sysman_init(void)
 	release_attributes_data();
 
 err_destroy_classdev:
-	device_destroy(&firmware_attributes_class, MKDEV(0, 0));
+	device_destroy(fw_attr_class, MKDEV(0, 0));
 
 err_unregister_class:
-	class_unregister(&firmware_attributes_class);
+	fw_attributes_class_remove();
 
 err_exit_bios_attr_pass_interface:
 	exit_bios_attr_pass_interface();
@@ -619,8 +617,8 @@ static int __init sysman_init(void)
 static void __exit sysman_exit(void)
 {
 	release_attributes_data();
-	device_destroy(&firmware_attributes_class, MKDEV(0, 0));
-	class_unregister(&firmware_attributes_class);
+	device_destroy(fw_attr_class, MKDEV(0, 0));
+	fw_attributes_class_remove();
 	exit_bios_attr_set_interface();
 	exit_bios_attr_pass_interface();
 }
-- 
2.31.1

