Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF21CC47091
	for <platform-driver-x86@archiver.kernel.org>; Sun, 30 May 2021 22:31:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BDDE2611EE
	for <platform-driver-x86@archiver.kernel.org>; Sun, 30 May 2021 22:31:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229887AbhE3Wd2 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 30 May 2021 18:33:28 -0400
Received: from mail1.bemta23.messagelabs.com ([67.219.246.3]:61875 "EHLO
        mail1.bemta23.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229897AbhE3Wd2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 30 May 2021 18:33:28 -0400
Received: from [100.112.2.115] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-3.bemta.az-b.us-east-1.aws.symcld.net id 20/63-59816-55214B06; Sun, 30 May 2021 22:31:49 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrPIsWRWlGSWpSXmKPExsWS8eIhj26I0JY
  Eg0v7jSxeTjjMaHFowwEmizfHpzNZrN7zgtmBxWPSzBnMHjtn3WX3eL/vKpvH501yASxRrJl5
  SfkVCawZFyf6F0yXrji27AtjA+Ne8S5GLg4hgf+MEl2/F7FCOK8ZJWZN7GDuYuTkYBPQltiy5
  RdbFyMHh4iAjMSHtZ4gJrNArcTnmVwgFcIC0RLX/38Dq2YRUJVo/naNHcTmFbCWeDl9PlhcQk
  Be4vSJa4wgNqeAjUTrg+1MILaQQKjEjiWTmCHqBSVOznzCAmIzA9U3b53NDGFLSBx88QJuTtv
  5NiYIO0Gi598jtgmMArOQtM9C0j4LSfsCRuZVjKZJRZnpGSW5iZk5uoYGBrqGhka6RrpmlnqJ
  VbpJeqXFuqmJxSW6hnqJ5cV6xZW5yTkpenmpJZsYgeGeUsDkuoPx9+sPeocYJTmYlER5xRU3J
  wjxJeWnVGYkFmfEF5XmpBYfYpTh4FCS4K0S2JIgJFiUmp5akZaZA4w9mLQEB4+SCC+fIFCat7
  ggMbc4Mx0idYpRUUqcNxkkIQCSyCjNg2uDxfslRlkpYV5GBgYGIZ6C1KLczBJU+VeM4hyMSsK
  8FiBTeDLzSuCmvwJazAS0+HPoJpDFJYkIKakGJpbDk3aIaqZdTI28XfSZo/Vq9c8b7Gavtj/V
  W8xmGqvq/edwkZtBD3O35/GebWdOJmbULM/VDPv3KLRLVX+Gv0fZEecI4/dMio0b/2XXvl709
  gmzxNWWVRWvDuS8/7fAxt1u/7WO859uciQyLp0XcNbn9IOSXknfyv1rXjKv05R+Mf398Zt7sy
  8qiV2LsE1Q2D1H7NaR8ocPptg+r/luPs8sLnZGxN7LwQ/uZR/5/zX30uRf8Zr329bGve354HW
  frctZVPdqPKNTrFJawsX/nGen57Mc3G222cj1f4+x6Ns74ULFMWXyLA0itz7d0w87bV0esmn+
  k7mT1oWeK89sPji9k2FaeXVfaH0Iz778HiWW4oxEQy3mouJEAI21jSFyAwAA
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-16.tower-396.messagelabs.com!1622413908!41630!1
X-Originating-IP: [104.232.225.12]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 32476 invoked from network); 30 May 2021 22:31:48 -0000
Received: from unknown (HELO lenovo.com) (104.232.225.12)
  by server-16.tower-396.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 30 May 2021 22:31:48 -0000
Received: from reswpmail01.lenovo.com (unknown [10.62.32.20])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by Forcepoint Email with ESMTPS id 9FB5E557249CB078DF0A;
        Sun, 30 May 2021 18:31:48 -0400 (EDT)
Received: from localhost.localdomain.com (10.38.59.12) by
 reswpmail01.lenovo.com (10.62.32.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2176.2; Sun, 30 May 2021 18:31:47 -0400
From:   Mark Pearson <markpearson@lenovo.com>
To:     <markpearson@lenovo.com>
CC:     <hdegoede@redhat.com>, <andy.shevchenko@gmail.com>,
        <Dell.Client.Kernel@dell.com>,
        <platform-driver-x86@vger.kernel.org>
Subject: [PATCH v5 2/3] platform/x86: dell-wmi-sysman: Use firmware_attributes_class helper
Date:   Sun, 30 May 2021 18:31:10 -0400
Message-ID: <20210530223111.25929-2-markpearson@lenovo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210530223111.25929-1-markpearson@lenovo.com>
References: <markpearson@lenovo.com>
 <20210530223111.25929-1-markpearson@lenovo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.38.59.12]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail01.lenovo.com (10.62.32.20)
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Update Dell WMI sysman driver to use newly implemented helper module.

Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Mark Pearson <markpearson@lenovo.com>
---
Changes in v2:
 - firmare_attributes_class.c added as reqested during review of the
   proposed think_lmi.c driver. Labeling as V2 to keep series
   consistent
 - Note, compile tested only due to lack of HW to test on. Matching
   changes were made in the think-lmi.c driver and worked. Please let me
   know if any problems!

Changes in v3:
 - Updated to use new firmware attribute class API names

Changes in v4, v5:
 - version bump for consistency in series

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
index c8d276d78..06b3fe7da 100644
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
+	ret = fw_attributes_class_get(&fw_attr_class);
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
+	fw_attributes_class_put();
 
 err_exit_bios_attr_pass_interface:
 	exit_bios_attr_pass_interface();
@@ -619,8 +617,8 @@ static int __init sysman_init(void)
 static void __exit sysman_exit(void)
 {
 	release_attributes_data();
-	device_destroy(&firmware_attributes_class, MKDEV(0, 0));
-	class_unregister(&firmware_attributes_class);
+	device_destroy(fw_attr_class, MKDEV(0, 0));
+	fw_attributes_class_put();
 	exit_bios_attr_set_interface();
 	exit_bios_attr_pass_interface();
 }
-- 
2.31.1

