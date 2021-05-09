Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D25CC433ED
	for <platform-driver-x86@archiver.kernel.org>; Sun,  9 May 2021 01:57:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5E9A6613D8
	for <platform-driver-x86@archiver.kernel.org>; Sun,  9 May 2021 01:57:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229765AbhEIB6r (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 8 May 2021 21:58:47 -0400
Received: from mail1.bemta23.messagelabs.com ([67.219.246.4]:45727 "EHLO
        mail1.bemta23.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229609AbhEIB6r (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 8 May 2021 21:58:47 -0400
Received: from [100.112.1.13] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-4.bemta.az-b.us-east-1.aws.symcld.net id 63/A2-49156-79147906; Sun, 09 May 2021 01:57:43 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrFIsWRWlGSWpSXmKPExsWSLveKTXe64/Q
  EgwOPmC26u+cyWbw5Pp3Joqmzic3ic8dkFovVe14wWyz6+ITNgc1j0swZzB7zTgZ6vN93lc3j
  8ya5AJYo1sy8pPyKBNaMt/vOMxYckavoO3eKtYHxnlQXIxeHkMB/Rol/Vw+wdzFyAjmvGSVO7
  PYCsdkEtCW2bPnF1sXIwSEiICPxYa0nSD2zwDpGiTk3Qeq5OIQF+hgljnbtYAVpYBFQkfh9q5
  sFxOYVsJG4POE1E4gtISAvcfrENUYQm1NAVeJM12MWiGUqEvcfLGGDqBeUODnzCVicGai+eet
  sZghbQuLgixfMEHMUJJYtWcgOYSdI9Px7xDaBUWAWkvZZSNpnIWlfwMi8itEkqSgzPaMkNzEz
  R9fQwEDX0NBI10jXQi+xSjdJr7RYNzWxuETXUC+xvFivuDI3OSdFLy+1ZBMjMApSCpg4djDee
  f1B7xCjJAeTkihvUc7UBCG+pPyUyozE4oz4otKc1OJDjDIcHEoSvMsdpicICRalpqdWpGXmAC
  MSJi3BwaMkwusHkuYtLkjMLc5Mh0idYlSUEudVAEkIgCQySvPg2mBJ4BKjrJQwLyMDA4MQT0F
  qUW5mCar8K0ZxDkYlYd4AO6ApPJl5JXDTXwEtZgJa/GDRNJDFJYkIKakGJsXumtjYdH5NbaGA
  zDcNoXqGglX+covWnHwU8jVdsvHcudOv9uStV0xierOp9lTyqS+FKUHZFudO3O3TPV2yO2ETu
  1OhXVC1bpBV0LVsibUiLxLUOvr/JLzYoHXB4rKbYsuuv5LTFh2dmXTUb8qhs+8cFf7sr7kSs/
  v3le8OM45/f+setCClxfQPt+VVnotBbHvtpzAePabg+21xdo+S8UNuln4jB/HF4ieVnnGdKSp
  74ncu6Zqc660jEQpnMrvu7xKq79g6/xS/9sQjCxvvGRunf1c+c+bptaNbLP448O41ybh2wC9U
  +8S51au2iZgGfqj/1BCfninyNuj+65OHnQXPSjtMvxRcWHFi9Zy4FUosxRmJhlrMRcWJALpdY
  y19AwAA
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-4.tower-395.messagelabs.com!1620525461!253099!1
X-Originating-IP: [103.30.234.6]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7917 invoked from network); 9 May 2021 01:57:42 -0000
Received: from unknown (HELO lenovo.com) (103.30.234.6)
  by server-4.tower-395.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 9 May 2021 01:57:42 -0000
Received: from reswpmail01.lenovo.com (unknown [10.62.32.20])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by Forcepoint Email with ESMTPS id 9E75CCFB59077F2EAE66;
        Sun,  9 May 2021 09:57:39 +0800 (CST)
Received: from localhost.localdomain.com (10.46.208.93) by
 reswpmail01.lenovo.com (10.62.32.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2176.2; Sat, 8 May 2021 21:57:37 -0400
From:   Mark Pearson <markpearson@lenovo.com>
To:     <markpearson@lenovo.com>
CC:     <hdegoede@redhat.com>, <mgross@linux.intel.com>,
        <platform-driver-x86@vger.kernel.org>, <divya.bharathi@dell.com>,
        <prasanth.ksr@dell.com>, <mario.limonciello@dell.com>
Subject: [PATCH v2 1/3] platform/x86: firmware_attributes_class: Create helper file for handling firmware-attributes class registration events
Date:   Sat, 8 May 2021 21:57:06 -0400
Message-ID: <20210509015708.112766-1-markpearson@lenovo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <markpearson@lenovo.com>
References: <markpearson@lenovo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.46.208.93]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail01.lenovo.com (10.62.32.20)
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

This will be used by the Dell and Lenovo WMI management drivers to
prevent both drivers being active.

Signed-off-by: Mark Pearson <markpearson@lenovo.com>
---
Changes in v2:
 This is a new file requested as part of the review of the proposed
think_lmi.c driver. Labeling as V2 to keep series consistent (hope
that's correct).

 drivers/platform/x86/Kconfig                  |  6 +++
 drivers/platform/x86/Makefile                 |  1 +
 .../platform/x86/firmware_attributes_class.c  | 51 +++++++++++++++++++
 .../platform/x86/firmware_attributes_class.h  | 13 +++++
 4 files changed, 71 insertions(+)
 create mode 100644 drivers/platform/x86/firmware_attributes_class.c
 create mode 100644 drivers/platform/x86/firmware_attributes_class.h

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 2714f7c38..b0e1e5f65 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -1076,6 +1076,12 @@ config TOUCHSCREEN_DMI
 	  the OS-image for the device. This option supplies the missing info.
 	  Enable this for x86 tablets with Silead or Chipone touchscreens.
 
+config FW_ATTR_CLASS
+	tristate "Firmware attributes class helper module"
+	help
+	  This option should be enabled by any modules using the firmware
+	  attributes class.
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
index 000000000..4ed959d6c
--- /dev/null
+++ b/drivers/platform/x86/firmware_attributes_class.c
@@ -0,0 +1,51 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+/* Firmware attributes class helper module */
+
+#include <linux/mutex.h>
+#include <linux/device/class.h>
+#include <linux/module.h>
+
+static DEFINE_MUTEX(fw_attr_lock);
+bool fw_attr_inuse;
+
+static struct class firmware_attributes_class = {
+	.name = "firmware-attributes",
+};
+
+int fw_attributes_class_register(struct class **fw_attr_class)
+{
+	int err;
+
+	mutex_lock(&fw_attr_lock);
+	/* We can only have one active FW attribute class */
+	if (fw_attr_inuse) {
+		mutex_unlock(&fw_attr_lock);
+		return -EEXIST;
+	}
+
+	err = class_register(&firmware_attributes_class);
+	if (err) {
+		mutex_unlock(&fw_attr_lock);
+		return err;
+	}
+	fw_attr_inuse = true;
+	*fw_attr_class = &firmware_attributes_class;
+	mutex_unlock(&fw_attr_lock);
+	return 0;
+}
+EXPORT_SYMBOL_GPL(fw_attributes_class_register);
+
+void fw_attributes_class_remove(void)
+{
+	mutex_lock(&fw_attr_lock);
+	fw_attr_inuse = false;
+	class_unregister(&firmware_attributes_class);
+	mutex_unlock(&fw_attr_lock);
+}
+EXPORT_SYMBOL_GPL(fw_attributes_class_remove);
+
+MODULE_AUTHOR("Mark Pearson <markpearson@lenovo.com>");
+MODULE_LICENSE("GPL");
+
+
diff --git a/drivers/platform/x86/firmware_attributes_class.h b/drivers/platform/x86/firmware_attributes_class.h
new file mode 100644
index 000000000..e479a5720
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
+int fw_attributes_class_register(struct class **fw_attr_class);
+void fw_attributes_class_remove(void);
+
+#endif /* FW_ATTR_CLASS_H */
+
+
-- 
2.31.1

