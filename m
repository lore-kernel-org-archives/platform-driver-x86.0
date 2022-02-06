Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CE24C433F5
	for <platform-driver-x86@archiver.kernel.org>; Sun,  6 Feb 2022 22:02:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236378AbiBFWCk (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 6 Feb 2022 17:02:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233328AbiBFWCj (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 6 Feb 2022 17:02:39 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2A488C06173B
        for <platform-driver-x86@vger.kernel.org>; Sun,  6 Feb 2022 14:02:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1644184958;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=nUtG1ryiKujba5wGdzEzaUdEMKZS356c89yxojpVMnE=;
        b=Awmd3RNBfp+33ujEYDysamJ2hPCiHId/HLGjccTybR1LU2gqMwrL4jJut0pCQE/jyip9n7
        Q4KDC6SQMnN94OAp0D5Kjq79MItzCC0daLMarGHIGuj0TrM/JF372rzq+Z0HCC3KCGyJsd
        pVCgcXL9PhJ5nzdHUNoQ7kBNc2bkQnw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-541-1K807wCvNsajXOZai6usfQ-1; Sun, 06 Feb 2022 17:02:35 -0500
X-MC-Unique: 1K807wCvNsajXOZai6usfQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E58481091DA1;
        Sun,  6 Feb 2022 22:02:33 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.35])
        by smtp.corp.redhat.com (Postfix) with ESMTP id F3BFC1037F5B;
        Sun,  6 Feb 2022 22:02:32 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 4/4] platform/x86: intel_cht_int33fe: Move to intel directory
Date:   Sun,  6 Feb 2022 23:02:20 +0100
Message-Id: <20220206220220.88491-4-hdegoede@redhat.com>
In-Reply-To: <20220206220220.88491-1-hdegoede@redhat.com>
References: <20220206220220.88491-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Now that there is only 1 c-file left of the intel_cht_int33fe code,
move it to the intel directory instead of it having its own int33fe
sub-directory.

Note this also renames the module from intel_cht_int33fe_typec to
intel_chtwc_int33fe, to better match the names of other PMIC related
modules like the intel_chtdc_ti_pwrbtn module.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/intel/Kconfig            | 21 ++++++++++++++++++-
 drivers/platform/x86/intel/Makefile           |  3 ++-
 ...el_cht_int33fe_typec.c => chtwc_int33fe.c} |  0
 drivers/platform/x86/intel/int33fe/Kconfig    | 20 ------------------
 drivers/platform/x86/intel/int33fe/Makefile   |  2 --
 5 files changed, 22 insertions(+), 24 deletions(-)
 rename drivers/platform/x86/intel/{int33fe/intel_cht_int33fe_typec.c => chtwc_int33fe.c} (100%)
 delete mode 100644 drivers/platform/x86/intel/int33fe/Kconfig
 delete mode 100644 drivers/platform/x86/intel/int33fe/Makefile

diff --git a/drivers/platform/x86/intel/Kconfig b/drivers/platform/x86/intel/Kconfig
index 8e65086bb6c8..2d9b49eed33d 100644
--- a/drivers/platform/x86/intel/Kconfig
+++ b/drivers/platform/x86/intel/Kconfig
@@ -5,7 +5,6 @@
 
 source "drivers/platform/x86/intel/atomisp2/Kconfig"
 source "drivers/platform/x86/intel/int1092/Kconfig"
-source "drivers/platform/x86/intel/int33fe/Kconfig"
 source "drivers/platform/x86/intel/int3472/Kconfig"
 source "drivers/platform/x86/intel/pmc/Kconfig"
 source "drivers/platform/x86/intel/pmt/Kconfig"
@@ -89,6 +88,26 @@ config INTEL_CHTDC_TI_PWRBTN
 	  To compile this driver as a module, choose M here: the module
 	  will be called intel_chtdc_ti_pwrbtn.
 
+config INTEL_CHTWC_INT33FE
+	tristate "Intel Cherry Trail Whiskey Cove ACPI INT33FE Driver"
+	depends on X86 && ACPI && I2C && REGULATOR
+	depends on CHARGER_BQ24190=y || (CHARGER_BQ24190=m && m)
+	depends on USB_ROLES_INTEL_XHCI=y || (USB_ROLES_INTEL_XHCI=m && m)
+	depends on TYPEC_MUX_PI3USB30532=y || (TYPEC_MUX_PI3USB30532=m && m)
+	help
+	  This driver add support for the Intel Cherry Trail Whiskey Cove
+	  INT33FE ACPI device found on the GPD win and the GPD pocket.
+
+	  The INT33FE ACPI device on these mini laptops contains I2cSerialBusV2
+	  resources for a MAX17042 Fuel Gauge, FUSB302 USB Type-C Controller
+	  and PI3USB30532 USB switch.
+	  This driver instantiates i2c-clients for these, so that standard
+	  i2c drivers for these chips can bind to the them.
+
+	  If you enable this driver it is advised to also select
+	  CONFIG_TYPEC_FUSB302=m, CONFIG_TYPEC_MUX_PI3USB30532=m and
+	  CONFIG_BATTERY_MAX17042=m.
+
 config INTEL_ISHTP_ECLITE
 	tristate "Intel ISHTP eclite controller Driver"
 	depends on INTEL_ISH_HID
diff --git a/drivers/platform/x86/intel/Makefile b/drivers/platform/x86/intel/Makefile
index 35f2066578b2..053edc457ccb 100644
--- a/drivers/platform/x86/intel/Makefile
+++ b/drivers/platform/x86/intel/Makefile
@@ -6,7 +6,6 @@
 
 obj-$(CONFIG_INTEL_ATOMISP2_PDX86)	+= atomisp2/
 obj-$(CONFIG_INTEL_SAR_INT1092)		+= int1092/
-obj-$(CONFIG_INTEL_CHT_INT33FE)		+= int33fe/
 obj-$(CONFIG_INTEL_SKL_INT3472)		+= int3472/
 obj-$(CONFIG_INTEL_PMC_CORE)		+= pmc/
 obj-$(CONFIG_INTEL_PMT_CLASS)		+= pmt/
@@ -36,6 +35,8 @@ intel_crystal_cove_charger-y		:= crystal_cove_charger.o
 obj-$(CONFIG_X86_ANDROID_TABLETS)	+= intel_crystal_cove_charger.o
 intel_chtdc_ti_pwrbtn-y			:= chtdc_ti_pwrbtn.o
 obj-$(CONFIG_INTEL_CHTDC_TI_PWRBTN)	+= intel_chtdc_ti_pwrbtn.o
+intel_chtwc_int33fe-y			:= chtwc_int33fe.o
+obj-$(CONFIG_INTEL_CHTWC_INT33FE)	+= intel_chtwc_int33fe.o
 intel_mrfld_pwrbtn-y			:= mrfld_pwrbtn.o
 obj-$(CONFIG_INTEL_MRFLD_PWRBTN)	+= intel_mrfld_pwrbtn.o
 intel_punit_ipc-y			:= punit_ipc.o
diff --git a/drivers/platform/x86/intel/int33fe/intel_cht_int33fe_typec.c b/drivers/platform/x86/intel/chtwc_int33fe.c
similarity index 100%
rename from drivers/platform/x86/intel/int33fe/intel_cht_int33fe_typec.c
rename to drivers/platform/x86/intel/chtwc_int33fe.c
diff --git a/drivers/platform/x86/intel/int33fe/Kconfig b/drivers/platform/x86/intel/int33fe/Kconfig
deleted file mode 100644
index 60a6cb689299..000000000000
--- a/drivers/platform/x86/intel/int33fe/Kconfig
+++ /dev/null
@@ -1,20 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-only
-config INTEL_CHT_INT33FE
-	tristate "Intel Cherry Trail ACPI INT33FE Driver"
-	depends on X86 && ACPI && I2C && REGULATOR
-	depends on CHARGER_BQ24190=y || (CHARGER_BQ24190=m && m)
-	depends on USB_ROLES_INTEL_XHCI=y || (USB_ROLES_INTEL_XHCI=m && m)
-	depends on TYPEC_MUX_PI3USB30532=y || (TYPEC_MUX_PI3USB30532=m && m)
-	help
-	  This driver add support for the INT33FE ACPI device found on the
-	  GPD win and the GPD pocket.
-
-	  The INT33FE ACPI device on these mini laptops contains I2cSerialBusV2
-	  resources for a MAX17042 Fuel Gauge, FUSB302 USB Type-C Controller
-	  and PI3USB30532 USB switch.
-	  This driver instantiates i2c-clients for these, so that standard
-	  i2c drivers for these chips can bind to the them.
-
-	  If you enable this driver it is advised to also select
-	  CONFIG_TYPEC_FUSB302=m, CONFIG_TYPEC_MUX_PI3USB30532=m and
-	  CONFIG_BATTERY_MAX17042=m.
diff --git a/drivers/platform/x86/intel/int33fe/Makefile b/drivers/platform/x86/intel/int33fe/Makefile
deleted file mode 100644
index 582aa7808c7a..000000000000
--- a/drivers/platform/x86/intel/int33fe/Makefile
+++ /dev/null
@@ -1,2 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-only
-obj-$(CONFIG_INTEL_CHT_INT33FE) += intel_cht_int33fe_typec.o
-- 
2.33.1

