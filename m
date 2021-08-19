Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4452C4338F
	for <platform-driver-x86@archiver.kernel.org>; Thu, 19 Aug 2021 03:32:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AD3C46103A
	for <platform-driver-x86@archiver.kernel.org>; Thu, 19 Aug 2021 03:32:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236797AbhHSDcs (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 18 Aug 2021 23:32:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22109 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236796AbhHSDco (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 18 Aug 2021 23:32:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1629343928;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=XBIEaEway9kTJ4RwRV1rdT73jhwAYB+6tkle26vierg=;
        b=ciC5LCm4EuoOziqgPp/P9tcCbt2V7B+nSDsx9rETMVFMWSKn+pw9JlwvTpRc7l51H4buQ4
        O9lB72/CiMh77QrTLQDuZDwlwBfuwQLm+stJplMPKAJuAwvLt4cy28K4j+i4FB6zN26p4c
        AXTZL/D36eduffGbPtJ2ZOYxu3o7WoY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-225-pfCBHivrNPqx79cM-o9gpA-1; Wed, 18 Aug 2021 23:32:04 -0400
X-MC-Unique: pfCBHivrNPqx79cM-o9gpA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E73F91008064;
        Thu, 19 Aug 2021 03:32:02 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.64.242.122])
        by smtp.corp.redhat.com (Postfix) with ESMTP id D444619C87;
        Thu, 19 Aug 2021 03:31:59 +0000 (UTC)
From:   Kate Hsuan <hpa@redhat.com>
To:     Alex Hung <alex.hung@canonical.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        AceLan Kao <acelan.kao@canonical.com>,
        Jithu Joseph <jithu.joseph@intel.com>,
        Maurice Ma <maurice.ma@intel.com>,
        Sujith Thomas <sujith.thomas@intel.com>,
        Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
        Zha Qipeng <qipeng.zha@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        "David E . Box" <david.e.box@linux.intel.com>,
        linux-kernel@vger.kernel.org, Dell.Client.Kernel@dell.com
Cc:     platform-driver-x86@vger.kernel.org, Kate Hsuan <hpa@redhat.com>
Subject: [PATCH v3 17/20] platform/x86: intel_oaktrail: Move to intel sub-directory
Date:   Thu, 19 Aug 2021 11:29:58 +0800
Message-Id: <20210819033001.20136-18-hpa@redhat.com>
In-Reply-To: <20210819033001.20136-1-hpa@redhat.com>
References: <20210819033001.20136-1-hpa@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Move intel_oaktrail to intel sub-directory to improve
readability.

Signed-off-by: Kate Hsuan <hpa@redhat.com>
---
 drivers/platform/x86/Kconfig                           | 10 ----------
 drivers/platform/x86/Makefile                          |  1 -
 drivers/platform/x86/intel/Kconfig                     | 10 ++++++++++
 drivers/platform/x86/intel/Makefile                    |  2 ++
 .../x86/{intel_oaktrail.c => intel/oaktrail.c}         |  0
 5 files changed, 12 insertions(+), 11 deletions(-)
 rename drivers/platform/x86/{intel_oaktrail.c => intel/oaktrail.c} (100%)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 90eb653131ab..6ed05e5faac1 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -667,16 +667,6 @@ config THINKPAD_LMI
 
 source "drivers/platform/x86/intel/Kconfig"
 
-config INTEL_OAKTRAIL
-	tristate "Intel Oaktrail Platform Extras"
-	depends on ACPI
-	depends on ACPI_VIDEO || ACPI_VIDEO = n
-	depends on RFKILL && BACKLIGHT_CLASS_DEVICE && ACPI
-	help
-	  Intel Oaktrail platform need this driver to provide interfaces to
-	  enable/disable the Camera, WiFi, BT etc. devices. If in doubt, say Y
-	  here; it will only load on supported platforms.
-
 config INTEL_VBTN
 	tristate "INTEL VIRTUAL BUTTON"
 	depends on ACPI
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index 1bbcc2900a84..afeea9ce34b8 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -72,7 +72,6 @@ obj-$(CONFIG_THINKPAD_LMI)	+= think-lmi.o
 # Intel
 obj-$(CONFIG_X86_PLATFORM_DRIVERS_INTEL)		+= intel/
 
-obj-$(CONFIG_INTEL_OAKTRAIL)		+= intel_oaktrail.o
 obj-$(CONFIG_INTEL_VBTN)		+= intel-vbtn.o
 
 # MSI
diff --git a/drivers/platform/x86/intel/Kconfig b/drivers/platform/x86/intel/Kconfig
index fe9f84357eaf..5ca3c36ac187 100644
--- a/drivers/platform/x86/intel/Kconfig
+++ b/drivers/platform/x86/intel/Kconfig
@@ -53,6 +53,16 @@ config INTEL_INT0002_VGPIO
          To compile this driver as a module, choose M here: the module will
          be called intel_int0002_vgpio.
 
+config INTEL_OAKTRAIL
+        tristate "Intel Oaktrail Platform Extras"
+        depends on ACPI
+        depends on ACPI_VIDEO || ACPI_VIDEO = n
+        depends on RFKILL && BACKLIGHT_CLASS_DEVICE && ACPI
+        help
+          Intel Oaktrail platform need this driver to provide interfaces to
+          enable/disable the Camera, WiFi, BT etc. devices. If in doubt, say Y
+          here; it will only load on supported platforms.
+
 config INTEL_BXTWC_PMIC_TMU
 	tristate "Intel BXT Whiskey Cove TMU Driver"
 	depends on REGMAP
diff --git a/drivers/platform/x86/intel/Makefile b/drivers/platform/x86/intel/Makefile
index f52288b3edc2..da238e2e352d 100644
--- a/drivers/platform/x86/intel/Makefile
+++ b/drivers/platform/x86/intel/Makefile
@@ -13,6 +13,8 @@ intel-hid-y				:= hid.o
 obj-$(CONFIG_INTEL_HID_EVENT)		+= intel-hid.o
 intel_int0002_vgpio-y			:= int0002_vgpio.o
 obj-$(CONFIG_INTEL_INT0002_VGPIO)	+= intel_int0002_vgpio.o
+intel_oaktrail-y			:= oaktrail.o
+obj-$(CONFIG_INTEL_OAKTRAIL)		+= intel_oaktrail.o
 
 # Intel PMIC / PMC / P-Unit devices
 intel_bxtwc_tmu-y			:= bxtwc_tmu.o
diff --git a/drivers/platform/x86/intel_oaktrail.c b/drivers/platform/x86/intel/oaktrail.c
similarity index 100%
rename from drivers/platform/x86/intel_oaktrail.c
rename to drivers/platform/x86/intel/oaktrail.c
-- 
2.31.1

