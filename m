Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C92CBC4320E
	for <platform-driver-x86@archiver.kernel.org>; Tue, 10 Aug 2021 10:01:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ABBD76056C
	for <platform-driver-x86@archiver.kernel.org>; Tue, 10 Aug 2021 10:01:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239578AbhHJKBq (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 10 Aug 2021 06:01:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41315 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237339AbhHJKBm (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 10 Aug 2021 06:01:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1628589677;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Q2bO85DnkavYMnz1uCIxRVuphnYKv0bSlUDaFLxQXPI=;
        b=O46ss8CvquZVGS5nRQaNLHKU4jMPJlCUySJDav6bFR1wptkujeoyldFhKYA5rLcYF4WEWI
        dnx5PNpCXWA+7CEoY8YY+ZMjjHjQ0OyklYxfg0jeQbXNPHSvPyrob2rrEh6yxocukB97M4
        gxAfBoLqKoRpPh/zqGnZHES7WLkwNyI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-87-6CVLsDqMM4uNOr_SN3i9Fw-1; Tue, 10 Aug 2021 06:01:14 -0400
X-MC-Unique: 6CVLsDqMM4uNOr_SN3i9Fw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 39C188799E0;
        Tue, 10 Aug 2021 10:01:12 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.64.242.37])
        by smtp.corp.redhat.com (Postfix) with ESMTP id CE14460BF1;
        Tue, 10 Aug 2021 10:01:06 +0000 (UTC)
From:   Kate Hsuan <hpa@redhat.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Alex Hung <alex.hung@canonical.com>,
        Sujith Thomas <sujith.thomas@intel.com>,
        Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
        David E Box <david.e.box@intel.com>,
        Zha Qipeng <qipeng.zha@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        AceLan Kao <acelan.kao@canonical.com>,
        Jithu Joseph <jithu.joseph@intel.com>,
        Maurice Ma <maurice.ma@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Daniel Scally <djrscally@gmail.com>,
        linux-kernel@vger.kernel.org, Dell.Client.Kernel@dell.com
Cc:     platform-driver-x86@vger.kernel.org, Kate Hsuan <hpa@redhat.com>
Subject: [PATCH 16/20] Move Intel uncore freq driver to intel/ directory to improve readability.
Date:   Tue, 10 Aug 2021 17:58:28 +0800
Message-Id: <20210810095832.4234-17-hpa@redhat.com>
In-Reply-To: <20210810095832.4234-1-hpa@redhat.com>
References: <20210810095832.4234-1-hpa@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Signed-off-by: Kate Hsuan <hpa@redhat.com>
---
 drivers/platform/x86/Kconfig                      | 13 -------------
 drivers/platform/x86/Makefile                     |  5 -----
 drivers/platform/x86/intel/Kconfig                |  1 +
 drivers/platform/x86/intel/Makefile               |  1 +
 drivers/platform/x86/intel/uncore_freq/Kconfig    | 15 +++++++++++++++
 drivers/platform/x86/intel/uncore_freq/Makefile   |  6 ++++++
 .../uncore_freq}/intel-uncore-frequency.c         |  0
 7 files changed, 23 insertions(+), 18 deletions(-)
 create mode 100644 drivers/platform/x86/intel/uncore_freq/Kconfig
 create mode 100644 drivers/platform/x86/intel/uncore_freq/Makefile
 rename drivers/platform/x86/{ => intel/uncore_freq}/intel-uncore-frequency.c (100%)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 735949c406d3..ba760d1cb873 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -1026,19 +1026,6 @@ config INTEL_IMR
 
 	  If you are running on a Galileo/Quark say Y here.
 
-
-
-config INTEL_UNCORE_FREQ_CONTROL
-	tristate "Intel Uncore frequency control driver"
-	depends on X86_64
-	help
-	  This driver allows control of uncore frequency limits on
-	  supported server platforms.
-	  Uncore frequency controls RING/LLC (last-level cache) clocks.
-
-	  To compile this driver as a module, choose M here: the module
-	  will be called intel-uncore-frequency.
-
 endif # X86_PLATFORM_DEVICES
 
 config PMC_ATOM
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index e3ea8bf3647b..a657eef9e10f 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -112,10 +112,5 @@ obj-$(CONFIG_MLX_PLATFORM)		+= mlx-platform.o
 obj-$(CONFIG_TOUCHSCREEN_DMI)		+= touchscreen_dmi.o
 obj-$(CONFIG_WIRELESS_HOTKEY)		+= wireless-hotkey.o
 
-# Intel uncore drivers
-
-
-obj-$(CONFIG_INTEL_UNCORE_FREQ_CONTROL)		+= intel-uncore-frequency.o
-
 
 obj-$(CONFIG_PMC_ATOM)			+= pmc_atom.o
diff --git a/drivers/platform/x86/intel/Kconfig b/drivers/platform/x86/intel/Kconfig
index d3f1be45a25f..f1f09c7bd992 100644
--- a/drivers/platform/x86/intel/Kconfig
+++ b/drivers/platform/x86/intel/Kconfig
@@ -34,6 +34,7 @@ source "drivers/platform/x86/intel/rst/Kconfig"
 source "drivers/platform/x86/intel/smartconnect/Kconfig"
 source "drivers/platform/x86/intel/intel_speed_select_if/Kconfig"
 source "drivers/platform/x86/intel/turbo_max_3/Kconfig"
+source "drivers/platform/x86/intel/uncore_freq/Kconfig"
 
 
 endif # X86_PLATFORM_DRIVERS_INTEL
diff --git a/drivers/platform/x86/intel/Makefile b/drivers/platform/x86/intel/Makefile
index 040109e2908a..a4993248cfde 100644
--- a/drivers/platform/x86/intel/Makefile
+++ b/drivers/platform/x86/intel/Makefile
@@ -35,3 +35,4 @@ obj-$(CONFIG_INTEL_RST)				+= rst/
 obj-$(CONFIG_INTEL_SMARTCONNECT)		+= smartconnect/
 obj-$(CONFIG_INTEL_SPEED_SELECT_INTERFACE)	+= intel_speed_select_if/
 obj-$(CONFIG_INTEL_TURBO_MAX_3)			+= turbo_max_3/
+obj-$(CONFIG_INTEL_UNCORE_FREQ_CONTROL)		+= uncore_freq/
diff --git a/drivers/platform/x86/intel/uncore_freq/Kconfig b/drivers/platform/x86/intel/uncore_freq/Kconfig
new file mode 100644
index 000000000000..dd237195fb81
--- /dev/null
+++ b/drivers/platform/x86/intel/uncore_freq/Kconfig
@@ -0,0 +1,15 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Intel x86 Platform Specific Drivers
+#
+
+config INTEL_UNCORE_FREQ_CONTROL
+	tristate "Intel Uncore frequency control driver"
+	depends on X86_64
+	help
+	  This driver allows control of uncore frequency limits on
+	  supported server platforms.
+	  Uncore frequency controls RING/LLC (last-level cache) clocks.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called intel-uncore-frequency.
diff --git a/drivers/platform/x86/intel/uncore_freq/Makefile b/drivers/platform/x86/intel/uncore_freq/Makefile
new file mode 100644
index 000000000000..c1516bed69e5
--- /dev/null
+++ b/drivers/platform/x86/intel/uncore_freq/Makefile
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Intel x86 Platform Specific Drivers
+#
+
+obj-$(CONFIG_INTEL_UNCORE_FREQ_CONTROL)		+= intel-uncore-frequency.o
diff --git a/drivers/platform/x86/intel-uncore-frequency.c b/drivers/platform/x86/intel/uncore_freq/intel-uncore-frequency.c
similarity index 100%
rename from drivers/platform/x86/intel-uncore-frequency.c
rename to drivers/platform/x86/intel/uncore_freq/intel-uncore-frequency.c
-- 
2.31.1

