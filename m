Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8003BC432BE
	for <platform-driver-x86@archiver.kernel.org>; Tue, 10 Aug 2021 10:01:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 66A536056C
	for <platform-driver-x86@archiver.kernel.org>; Tue, 10 Aug 2021 10:01:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239651AbhHJKBt (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 10 Aug 2021 06:01:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60041 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239600AbhHJKBs (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 10 Aug 2021 06:01:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1628589685;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=5d+6XgOj4LD2qVdHtgUEpReX5vcnxWh9th3O6j9UtBA=;
        b=ESb5KiRvZf9gHAxcai/eW5GvtIRe13LkpTOpN+j6ZZg2Axcrm9toNb5q8UkIiMB+cWKveH
        xHPQwe/SLZvCmqv+nUv2hUQ8NbeMKIGYJHMyf8F2mhXQZE9uV5x8FXfX++jkjqhcCs/2Os
        qJShFD6Y1OgfzxTlXMfOkjRhyQ7wgos=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-553-bATr_xOSOuWXbcC54mZGkw-1; Tue, 10 Aug 2021 06:01:24 -0400
X-MC-Unique: bATr_xOSOuWXbcC54mZGkw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 375162E97;
        Tue, 10 Aug 2021 10:01:22 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.64.242.37])
        by smtp.corp.redhat.com (Postfix) with ESMTP id D7C3560BF1;
        Tue, 10 Aug 2021 10:01:14 +0000 (UTC)
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
Subject: [PATCH 17/20] Move Intel int0002 vgpio driver to intel/ directory to inprove readability.
Date:   Tue, 10 Aug 2021 17:58:29 +0800
Message-Id: <20210810095832.4234-18-hpa@redhat.com>
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
 drivers/platform/x86/Kconfig                  | 19 ---------------
 drivers/platform/x86/Makefile                 |  1 -
 drivers/platform/x86/intel/Kconfig            |  1 +
 drivers/platform/x86/intel/Makefile           |  2 ++
 drivers/platform/x86/intel/int0002/Kconfig    | 23 +++++++++++++++++++
 drivers/platform/x86/intel/int0002/Makefile   |  6 +++++
 .../{ => intel/int0002}/intel_int0002_vgpio.c |  0
 7 files changed, 32 insertions(+), 20 deletions(-)
 create mode 100644 drivers/platform/x86/intel/int0002/Kconfig
 create mode 100644 drivers/platform/x86/intel/int0002/Makefile
 rename drivers/platform/x86/{ => intel/int0002}/intel_int0002_vgpio.c (100%)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index ba760d1cb873..b9c0d2d97793 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -632,25 +632,6 @@ config THINKPAD_LMI
 
 source "drivers/platform/x86/intel/Kconfig"
 
-config INTEL_INT0002_VGPIO
-	tristate "Intel ACPI INT0002 Virtual GPIO driver"
-	depends on GPIOLIB && ACPI && PM_SLEEP
-	select GPIOLIB_IRQCHIP
-	help
-	  Some peripherals on Bay Trail and Cherry Trail platforms signal a
-	  Power Management Event (PME) to the Power Management Controller (PMC)
-	  to wakeup the system. When this happens software needs to explicitly
-	  clear the PME bus 0 status bit in the GPE0a_STS register to avoid an
-	  IRQ storm on IRQ 9.
-
-	  This is modelled in ACPI through the INT0002 ACPI device, which is
-	  called a "Virtual GPIO controller" in ACPI because it defines the
-	  event handler to call when the PME triggers through _AEI and _L02
-	  methods as would be done for a real GPIO interrupt in ACPI.
-
-	  To compile this driver as a module, choose M here: the module will
-	  be called intel_int0002_vgpio.
-
 config INTEL_MENLOW
 	tristate "Thermal Management driver for Intel menlow platform"
 	depends on ACPI_THERMAL
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index a657eef9e10f..f4c6ced59da1 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -67,7 +67,6 @@ obj-$(CONFIG_THINKPAD_LMI)	+= think-lmi.o
 obj-$(CONFIG_X86_PLATFORM_DRIVERS_INTEL)		+= intel/
 
 
-obj-$(CONFIG_INTEL_INT0002_VGPIO)	+= intel_int0002_vgpio.o
 obj-$(CONFIG_INTEL_MENLOW)		+= intel_menlow.o
 obj-$(CONFIG_INTEL_OAKTRAIL)		+= intel_oaktrail.o
 obj-$(CONFIG_INTEL_VBTN)		+= intel-vbtn.o
diff --git a/drivers/platform/x86/intel/Kconfig b/drivers/platform/x86/intel/Kconfig
index f1f09c7bd992..4efb5ad3e3e1 100644
--- a/drivers/platform/x86/intel/Kconfig
+++ b/drivers/platform/x86/intel/Kconfig
@@ -35,6 +35,7 @@ source "drivers/platform/x86/intel/smartconnect/Kconfig"
 source "drivers/platform/x86/intel/intel_speed_select_if/Kconfig"
 source "drivers/platform/x86/intel/turbo_max_3/Kconfig"
 source "drivers/platform/x86/intel/uncore_freq/Kconfig"
+source "drivers/platform/x86/intel/int0002/Kconfig"
 
 
 endif # X86_PLATFORM_DRIVERS_INTEL
diff --git a/drivers/platform/x86/intel/Makefile b/drivers/platform/x86/intel/Makefile
index a4993248cfde..fe5058c3af18 100644
--- a/drivers/platform/x86/intel/Makefile
+++ b/drivers/platform/x86/intel/Makefile
@@ -11,6 +11,7 @@ obj-$(CONFIG_INTEL_ATOMISP2_PM)		+= atomisp2/
 obj-$(CONFIG_INTEL_HID_EVENT)		+= hid/
 obj-$(CONFIG_INTEL_WMI_SBL_FW_UPDATE)	+= wmi/
 obj-$(CONFIG_INTEL_WMI_THUNDERBOLT)	+= wmi/
+obj-$(CONFIG_INTEL_INT0002_VGPIO)	+= int0002/
 
 
 # Intel PMIC / PMC / P-Unit devices
@@ -36,3 +37,4 @@ obj-$(CONFIG_INTEL_SMARTCONNECT)		+= smartconnect/
 obj-$(CONFIG_INTEL_SPEED_SELECT_INTERFACE)	+= intel_speed_select_if/
 obj-$(CONFIG_INTEL_TURBO_MAX_3)			+= turbo_max_3/
 obj-$(CONFIG_INTEL_UNCORE_FREQ_CONTROL)		+= uncore_freq/
+
diff --git a/drivers/platform/x86/intel/int0002/Kconfig b/drivers/platform/x86/intel/int0002/Kconfig
new file mode 100644
index 000000000000..b1368f3c9f31
--- /dev/null
+++ b/drivers/platform/x86/intel/int0002/Kconfig
@@ -0,0 +1,23 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Intel x86 Platform Specific Drivers
+#
+
+config INTEL_INT0002_VGPIO
+	tristate "Intel ACPI INT0002 Virtual GPIO driver"
+	depends on GPIOLIB && ACPI && PM_SLEEP
+	select GPIOLIB_IRQCHIP
+	help
+	  Some peripherals on Bay Trail and Cherry Trail platforms signal a
+	  Power Management Event (PME) to the Power Management Controller (PMC)
+	  to wakeup the system. When this happens software needs to explicitly
+	  clear the PME bus 0 status bit in the GPE0a_STS register to avoid an
+	  IRQ storm on IRQ 9.
+
+	  This is modelled in ACPI through the INT0002 ACPI device, which is
+	  called a "Virtual GPIO controller" in ACPI because it defines the
+	  event handler to call when the PME triggers through _AEI and _L02
+	  methods as would be done for a real GPIO interrupt in ACPI.
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called intel_int0002_vgpio.
diff --git a/drivers/platform/x86/intel/int0002/Makefile b/drivers/platform/x86/intel/int0002/Makefile
new file mode 100644
index 000000000000..a4040416bcf6
--- /dev/null
+++ b/drivers/platform/x86/intel/int0002/Makefile
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Intel x86 Platform Specific Drivers
+#
+
+obj-$(CONFIG_INTEL_INT0002_VGPIO)	+= intel_int0002_vgpio.o
diff --git a/drivers/platform/x86/intel_int0002_vgpio.c b/drivers/platform/x86/intel/int0002/intel_int0002_vgpio.c
similarity index 100%
rename from drivers/platform/x86/intel_int0002_vgpio.c
rename to drivers/platform/x86/intel/int0002/intel_int0002_vgpio.c
-- 
2.31.1

