Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48A45C47088
	for <platform-driver-x86@archiver.kernel.org>; Wed, 26 May 2021 20:15:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 258B4613BF
	for <platform-driver-x86@archiver.kernel.org>; Wed, 26 May 2021 20:15:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234832AbhEZURK (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 26 May 2021 16:17:10 -0400
Received: from mail1.bemta23.messagelabs.com ([67.219.246.1]:60183 "EHLO
        mail1.bemta23.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234847AbhEZURG (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 26 May 2021 16:17:06 -0400
Received: from [100.112.3.19] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-1.bemta.az-b.us-east-1.aws.symcld.net id 1E/91-25091-56CAEA06; Wed, 26 May 2021 20:15:33 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrDIsWRWlGSWpSXmKPExsWSLveKXTd1zbo
  Eg62XxCxeTjjMaHFowwEmi+7uuUwWb45PZ7JYvecFs8Wij0/YHNg8Js2cweyxc9Zddo/3+66y
  eXzeJBfAEsWamZeUX5HAmtFxo4+54Kp8xYkty9gbGE9KdzFycQgJ/GeUmP3jElsXIyeQ84ZRo
  mW7FIjNJqAtsWXLL6A4B4eIgIzEh7WeIPXMApsYJe4s2MgE4ggL9DFK/H73kBWkgUVAVWLFq5
  Vgg3gFrCSaVt1kArElBOQlTp+4xghicwLVnOl6zAKxTEXi/oMlUPWCEidnPgGLMwPVN2+dzQx
  hS0gcfPGCGWKOgsTNF+tYIOwEiZ5/j9gmMArMQtI+C0n7LCTtCxiZVzGaJhVlpmeU5CZm5uga
  GhjoGhoa6RrrmlvoJVbpJumVFuumJhaX6BrqJZYX6xVX5ibnpOjlpZZsYgRGQkoBs98OxkVvP
  ugdYpTkYFIS5ZXyX50gxJeUn1KZkVicEV9UmpNafIhRhoNDSYJ34sp1CUKCRanpqRVpmTnAqI
  RJS3DwKInwXlgKlOYtLkjMLc5Mh0idYlSUEudVWw2UEABJZJTmwbXBEsElRlkpYV5GBgYGIZ6
  C1KLczBJU+VeM4hyMSsK8P0G282TmlcBNfwW0mAlosVAi2OKSRISUVAOT7Qnr7lpJ/plcAotn
  fPrn+fjaSo+DviHBdg/ehs87+Gu19Z5d92W1u2bO8qm3ODDRevFvZ20dvwnWHuwJmyR1XQ2E6
  ibX3flfEH4gRizUxK9umY25/ta4RQ9ObWxXm9gwn8XbYl7ilVfZrgxtGXnt1h6eUYtDQoMert
  nyUd/HPni/oZGLseMjw25No6Si2HdTz658f9JT3udOiz3nx89L+FXDt4dkleclZR6xDI+z81z
  psep8z8d88XM9ew8fU/M8tFNtc+XDegW3DH+urg0vmQK2ru1Z9H7x6SqGeb0qp1s3vjz8grVY
  5NqMlIqOkzz2Ezw0I7nWvajv7tqxIPr4ushXi3YKZP28lr6r0k2JpTgj0VCLuag4EQBRt4mjf
  wMAAA==
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-3.tower-396.messagelabs.com!1622060131!167223!1
X-Originating-IP: [103.30.234.7]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 16965 invoked from network); 26 May 2021 20:15:33 -0000
Received: from unknown (HELO lenovo.com) (103.30.234.7)
  by server-3.tower-396.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 26 May 2021 20:15:33 -0000
Received: from reswpmail01.lenovo.com (unknown [10.62.32.20])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by Forcepoint Email with ESMTPS id DA3CD924F9A3AA6D2CB5;
        Thu, 27 May 2021 04:15:29 +0800 (CST)
Received: from localhost.localdomain.com (10.64.87.238) by
 reswpmail01.lenovo.com (10.62.32.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2176.2; Wed, 26 May 2021 16:15:26 -0400
From:   Mark Pearson <markpearson@lenovo.com>
To:     <markpearson@lenovo.com>
CC:     <hdegoede@redhat.com>, <andy.shevchenko@gmail.com>,
        <prasanth.ksr@dell.com>, <divya.bharathi@dell.com>,
        <Dell.Client.Kernel@dell.com>,
        <platform-driver-x86@vger.kernel.org>
Subject: [PATCH v4 1/3] platform/x86: firmware_attributes_class: Create helper file for handling firmware-attributes class registration events
Date:   Wed, 26 May 2021 16:14:45 -0400
Message-ID: <20210526201447.3686-1-markpearson@lenovo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <markpearson@lenovo.com>
References: <markpearson@lenovo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.64.87.238]
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
 - This is a new file requested as part of the review of the proposed
think_lmi.c driver. Labeling as V2 to keep series consistent

Changes in v3:
 - Set default in Kconfig, and removed help text
 - Allow multiple modules to register with module. Change API names to
    better reflect this.

Changes in v4:
 - version bump for consistency in series

 drivers/platform/x86/Kconfig                  |  4 ++
 drivers/platform/x86/Makefile                 |  1 +
 .../platform/x86/firmware_attributes_class.c  | 53 +++++++++++++++++++
 .../platform/x86/firmware_attributes_class.h  | 13 +++++
 4 files changed, 71 insertions(+)
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
index 000000000..31393ce4d
--- /dev/null
+++ b/drivers/platform/x86/firmware_attributes_class.c
@@ -0,0 +1,53 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+/* Firmware attributes class helper module */
+
+#include <linux/mutex.h>
+#include <linux/device/class.h>
+#include <linux/module.h>
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

