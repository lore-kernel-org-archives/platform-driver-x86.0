Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA0F4C4338F
	for <platform-driver-x86@archiver.kernel.org>; Mon, 16 Aug 2021 10:55:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9ED2D61BE1
	for <platform-driver-x86@archiver.kernel.org>; Mon, 16 Aug 2021 10:55:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235984AbhHPKzu (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 16 Aug 2021 06:55:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60600 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236435AbhHPKzb (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 16 Aug 2021 06:55:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1629111299;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ABi+oTOABaL5JLiG/789EHmf2HXyVbTKWcT8RvKhKKE=;
        b=Dr6p6R1Rtw+ErfRTyfx5zfrppuYRmEv/E+XA7pFXnssliiAq1Tpqmj8gSdzhOyEXiX24tJ
        c0QTYHT9AlTIS5RZenQiQWXxduCZz2LDW7/Y4GLyxBqcD4MWOa15AwXn7QPmUlQSXQC5DN
        Cjgb4FluCfD4rteLlGAIFKHQeaa0ntk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-241-UZDzudYaMwWSRskfmWAbEw-1; Mon, 16 Aug 2021 06:54:56 -0400
X-MC-Unique: UZDzudYaMwWSRskfmWAbEw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2E5C81008060;
        Mon, 16 Aug 2021 10:54:54 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.64.242.39])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 8404D5C23A;
        Mon, 16 Aug 2021 10:54:47 +0000 (UTC)
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
Subject: [PATCH v2 18/20] platform/x86: intel-vbtn: Move to intel sub-directory
Date:   Mon, 16 Aug 2021 18:51:17 +0800
Message-Id: <20210816105119.704302-19-hpa@redhat.com>
In-Reply-To: <20210816105119.704302-1-hpa@redhat.com>
References: <20210816105119.704302-1-hpa@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Move intel-vbtn to intel sub-directory to improve
readability.

Signed-off-by: Kate Hsuan <hpa@redhat.com>
---
 drivers/platform/x86/Kconfig                        | 13 -------------
 drivers/platform/x86/Makefile                       |  2 --
 drivers/platform/x86/intel/Kconfig                  | 13 +++++++++++++
 drivers/platform/x86/intel/Makefile                 |  3 +++
 drivers/platform/x86/{intel-vbtn.c => intel/vbtn.c} |  0
 5 files changed, 16 insertions(+), 15 deletions(-)
 rename drivers/platform/x86/{intel-vbtn.c => intel/vbtn.c} (100%)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 3d1cb7f03309..3a087cb140cb 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -677,19 +677,6 @@ config INTEL_MENLOW
 
 	  If unsure, say N.
 
-config INTEL_VBTN
-	tristate "INTEL VIRTUAL BUTTON"
-	depends on ACPI
-	depends on INPUT
-	depends on I2C
-	select INPUT_SPARSEKMAP
-	help
-	  This driver provides support for the Intel Virtual Button interface.
-	  Some laptops require this driver for power button support.
-
-	  To compile this driver as a module, choose M here: the module will
-	  be called intel_vbtn.
-
 config MSI_LAPTOP
 	tristate "MSI Laptop Extras"
 	depends on ACPI
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index 63e78ed69fb2..a6d90dc56d62 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -70,9 +70,7 @@ obj-$(CONFIG_THINKPAD_LMI)	+= think-lmi.o
 
 # Intel
 obj-$(CONFIG_X86_PLATFORM_DRIVERS_INTEL)		+= intel/
-
 obj-$(CONFIG_INTEL_MENLOW)		+= intel_menlow.o
-obj-$(CONFIG_INTEL_VBTN)		+= intel-vbtn.o
 
 # MSI
 obj-$(CONFIG_MSI_LAPTOP)	+= msi-laptop.o
diff --git a/drivers/platform/x86/intel/Kconfig b/drivers/platform/x86/intel/Kconfig
index 6df6e43d1061..f69fc6b004cf 100644
--- a/drivers/platform/x86/intel/Kconfig
+++ b/drivers/platform/x86/intel/Kconfig
@@ -53,6 +53,19 @@ config INTEL_INT0002_VGPIO
 	  To compile this driver as a module, choose M here: the module will
 	  be called intel_int0002_vgpio.
 
+config INTEL_VBTN
+	tristate "INTEL VIRTUAL BUTTON"
+	depends on ACPI
+	depends on INPUT
+	depends on I2C
+	select INPUT_SPARSEKMAP
+	help
+	  This driver provides support for the Intel Virtual Button interface.
+	  Some laptops require this driver for power button support.
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called intel_vbtn.
+
 config INTEL_OAKTRAIL
 	tristate "Intel Oaktrail Platform Extras"
 	depends on ACPI
diff --git a/drivers/platform/x86/intel/Makefile b/drivers/platform/x86/intel/Makefile
index 291219f63b04..58d4ff0502b0 100644
--- a/drivers/platform/x86/intel/Makefile
+++ b/drivers/platform/x86/intel/Makefile
@@ -16,6 +16,9 @@ intel_int0002_vgpio-y				:= int0002_vgpio.o
 obj-$(CONFIG_INTEL_INT0002_VGPIO)	+= intel_int0002_vgpio.o
 intel_oaktrail-y					:= oaktrail.o
 obj-$(CONFIG_INTEL_OAKTRAIL)		+= intel_oaktrail.o
+CFLAGS_vbtn.o						:= -I./drivers/platform/x86
+intel-vbtn-y						:= vbtn.o
+obj-$(CONFIG_INTEL_VBTN)		+= intel-vbtn.o
 
 # Intel PMIC / PMC / P-Unit devices
 intel_bxtwc_tmu-y 					:= bxtwc_tmu.o
diff --git a/drivers/platform/x86/intel-vbtn.c b/drivers/platform/x86/intel/vbtn.c
similarity index 100%
rename from drivers/platform/x86/intel-vbtn.c
rename to drivers/platform/x86/intel/vbtn.c
-- 
2.31.1

