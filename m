Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB3C9C47092
	for <platform-driver-x86@archiver.kernel.org>; Sun, 30 May 2021 22:31:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8405C611EE
	for <platform-driver-x86@archiver.kernel.org>; Sun, 30 May 2021 22:31:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229901AbhE3Wd2 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 30 May 2021 18:33:28 -0400
Received: from mail1.bemta23.messagelabs.com ([67.219.246.4]:40177 "EHLO
        mail1.bemta23.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229887AbhE3Wd2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 30 May 2021 18:33:28 -0400
Received: from [100.112.2.115] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-4.bemta.az-b.us-east-1.aws.symcld.net id 41/C3-44175-45214B06; Sun, 30 May 2021 22:31:48 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrNIsWRWlGSWpSXmKPExsWS8eIhr26I0JY
  Eg6s9XBYvJxxmtDi04QCTxZvj05ksXjU/YrNYvecFswOrx6SZM5g9ds66y+6xeM9LJo/3+66y
  eXzeJBfAGsWamZeUX5HAmvH971WWghbFivf33zA3MN6X6WLk5BAS+M8ocXSGSRcjF5D9mlFi1
  sQOZpAEm4C2xJYtv9i6GDk4RARkJD6s9QSpYRZYyCixe985NhBHWKCLUWLHrSnsIA0sAqoSZ2
  e+YQGxeQWsJZ41f2EFsSUE5CVOn7jGCGJzAtWc6XrMArFZReL+gyVsEPWCEidnPgGLMwPVN2+
  dzQxhS0gcfPGCGWZO2/k2Jgg7QaLn3yO2CYwCs5C0z0LSPgtJ+wJG5lWMJklFmekZJbmJmTm6
  hgYGuoaGRrpGuhZ6iVW6SXqlxbqpicUluoZ6ieXFesWVuck5KXp5qSWbGIFxkFLAxLGD8c7rD
  3qHGCU5mJREecUVNycI8SXlp1RmJBZnxBeV5qQWH2KU4eBQkuCtEtiSICRYlJqeWpGWmQOMSZ
  i0BAePkggvnyBQmre4IDG3ODMdInWKUVFKnDcZJCEAksgozYNrg6WBS4yyUsK8jAwMDEI8Bal
  FuZklqPKvGMU5GJWEeS1ApvBk5pXATX8FtJgJaPHn0E0gi0sSEVJSDUzVFfuuXp3zddfy0q26
  q/rPzTjBdHZ647Q2jQ5Pp9/W+hfdhP/M1357+40oe/ea8C+FqbmH/7/I6zqq/Ngy68TtC7fXH
  d6fH7Ewd9XZGCW14jcBZeuNa6c/aRGab7F0tYiIbk9a7w3/qme7s1cdryiLKTs5e8W92e+Of3
  d8ZLLJx06iQnjy/gLvpIWfqkIOzevmfl6YFfxuZc3dWt3FNzevTnnCGmowdf91lnSLXRddnpr
  Za4knJK3YezL2+vuF/6v2V72pcMxr+piX5XhHZceHj+GrfhRuUUxt+3FPaL92V9q7m7/+/O5u
  n9L9saUoTequbNzBt+JbNm29N/vx5saacMktfNH/lpxLdrx7+q+CrRJLcUaioRZzUXEiADpSe
  bh+AwAA
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-7.tower-395.messagelabs.com!1622413908!61462!1
X-Originating-IP: [104.232.225.13]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20650 invoked from network); 30 May 2021 22:31:48 -0000
Received: from unknown (HELO lenovo.com) (104.232.225.13)
  by server-7.tower-395.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 30 May 2021 22:31:48 -0000
Received: from reswpmail01.lenovo.com (unknown [10.62.32.20])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by Forcepoint Email with ESMTPS id F09C87A56A6AD72C7FDB;
        Sun, 30 May 2021 18:31:47 -0400 (EDT)
Received: from localhost.localdomain.com (10.38.59.12) by
 reswpmail01.lenovo.com (10.62.32.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2176.2; Sun, 30 May 2021 18:31:47 -0400
From:   Mark Pearson <markpearson@lenovo.com>
To:     <markpearson@lenovo.com>
CC:     <hdegoede@redhat.com>, <andy.shevchenko@gmail.com>,
        <Dell.Client.Kernel@dell.com>,
        <platform-driver-x86@vger.kernel.org>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH v5] platform/x86: firmware_attributes_class: Create helper file for handling firmware-attributes class registration events
Date:   Sun, 30 May 2021 18:31:09 -0400
Message-ID: <20210530223111.25929-1-markpearson@lenovo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <markpearson@lenovo.com>
References: <markpearson@lenovo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.38.59.12]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail01.lenovo.com (10.62.32.20)
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

This will be used by the Dell and Lenovo WMI management drivers to
prevent both drivers being active.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Mark Pearson <markpearson@lenovo.com>
---
Changes in v2:
 - This is a new file requested as part of the review of the proposed
think_lmi.c driver. Labeling as V2 to keep series consistent

Changes in v3:
 - Set default in Kconfig, and removed help text
 - Allow multiple modules to register with module. Change API names to
    better reflect this.

Changes in v4:
 - version bump for consistency in series

Changes in v5:
 - Fix issue reported by kernel test robot. Add header file to includes

 drivers/platform/x86/Kconfig                  |  4 ++
 drivers/platform/x86/Makefile                 |  1 +
 .../platform/x86/firmware_attributes_class.c  | 54 +++++++++++++++++++
 .../platform/x86/firmware_attributes_class.h  | 13 +++++
 4 files changed, 72 insertions(+)
 create mode 100644 drivers/platform/x86/firmware_attributes_class.c
 create mode 100644 drivers/platform/x86/firmware_attributes_class.h

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 2714f7c38..57da8352d 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -1076,6 +1076,10 @@ config TOUCHSCREEN_DMI
 	  the OS-image for the device. This option supplies the missing info.
 	  Enable this for x86 tablets with Silead or Chipone touchscreens.
 
+config FW_ATTR_CLASS
+	tristate "Firmware attributes class helper module"
+	default n
+
 config INTEL_IMR
 	bool "Intel Isolated Memory Region support"
 	depends on X86_INTEL_QUARK && IOSF_MBI
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index dcc8cdb95..147573f69 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -115,6 +115,7 @@ obj-$(CONFIG_TOPSTAR_LAPTOP)	+= topstar-laptop.o
 obj-$(CONFIG_I2C_MULTI_INSTANTIATE)	+= i2c-multi-instantiate.o
 obj-$(CONFIG_MLX_PLATFORM)		+= mlx-platform.o
 obj-$(CONFIG_TOUCHSCREEN_DMI)		+= touchscreen_dmi.o
+obj-$(CONFIG_FW_ATTR_CLASS)             += firmware_attributes_class.o
 
 # Intel uncore drivers
 obj-$(CONFIG_INTEL_IPS)				+= intel_ips.o
diff --git a/drivers/platform/x86/firmware_attributes_class.c b/drivers/platform/x86/firmware_attributes_class.c
new file mode 100644
index 000000000..b407880f0
--- /dev/null
+++ b/drivers/platform/x86/firmware_attributes_class.c
@@ -0,0 +1,54 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+/* Firmware attributes class helper module */
+
+#include <linux/mutex.h>
+#include <linux/device/class.h>
+#include <linux/module.h>
+#include "firmware_attributes_class.h"
+
+static DEFINE_MUTEX(fw_attr_lock);
+int fw_attr_inuse;
+
+static struct class firmware_attributes_class = {
+	.name = "firmware-attributes",
+};
+
+int fw_attributes_class_get(struct class **fw_attr_class)
+{
+	int err;
+
+	mutex_lock(&fw_attr_lock);
+	if (!fw_attr_inuse) { /*first time class is being used*/
+		err = class_register(&firmware_attributes_class);
+		if (err) {
+			mutex_unlock(&fw_attr_lock);
+			return err;
+		}
+	}
+	fw_attr_inuse++;
+	*fw_attr_class = &firmware_attributes_class;
+	mutex_unlock(&fw_attr_lock);
+	return 0;
+}
+EXPORT_SYMBOL_GPL(fw_attributes_class_get);
+
+int fw_attributes_class_put(void)
+{
+	mutex_lock(&fw_attr_lock);
+	if (!fw_attr_inuse) {
+		mutex_unlock(&fw_attr_lock);
+		return -EINVAL;
+	}
+	fw_attr_inuse--;
+	if (!fw_attr_inuse) /* No more consumers */
+		class_unregister(&firmware_attributes_class);
+	mutex_unlock(&fw_attr_lock);
+	return 0;
+}
+EXPORT_SYMBOL_GPL(fw_attributes_class_put);
+
+MODULE_AUTHOR("Mark Pearson <markpearson@lenovo.com>");
+MODULE_LICENSE("GPL");
+
+
diff --git a/drivers/platform/x86/firmware_attributes_class.h b/drivers/platform/x86/firmware_attributes_class.h
new file mode 100644
index 000000000..802f12b45
--- /dev/null
+++ b/drivers/platform/x86/firmware_attributes_class.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+/* Firmware attributes class helper module */
+
+#ifndef FW_ATTR_CLASS_H
+#define FW_ATTR_CLASS_H
+
+int fw_attributes_class_get(struct class **fw_attr_class);
+int fw_attributes_class_put(void);
+
+#endif /* FW_ATTR_CLASS_H */
+
+
-- 
2.31.1

