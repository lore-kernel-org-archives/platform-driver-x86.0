Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CDA6C61DA3
	for <platform-driver-x86@archiver.kernel.org>; Mon, 20 Feb 2023 22:13:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231806AbjBTWNK (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 20 Feb 2023 17:13:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232615AbjBTWNI (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 20 Feb 2023 17:13:08 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E378BDEF
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Feb 2023 14:12:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1676931143;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=sbV+1dqv46AkMCmBuYC+I1uqY+gWC+dQhqqBUcNEsDQ=;
        b=MVYOOXVBq0hORInZuY4AhaGwCc6Fpf+3qJCzzw+nDattC3GZjcV2gei7twXwA+CUcDUdti
        eORn5jf6KiIlQxCoptTD/NQ+4AKg0ghlQmE3wLSU9cN5Oydygp1XT2pybAue+iet2ICIzZ
        eHdvHjtpGR/pXnYKuYD7xWsNXTJ/E78=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-674-1rrOExrEOJ-M9wdpSiokNg-1; Mon, 20 Feb 2023 17:12:22 -0500
X-MC-Unique: 1rrOExrEOJ-M9wdpSiokNg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 474B129AA2EA;
        Mon, 20 Feb 2023 22:12:22 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.43])
        by smtp.corp.redhat.com (Postfix) with ESMTP id A2531140EBF6;
        Mon, 20 Feb 2023 22:12:21 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 1/9] platform/x86: x86-android-tablets: Move into its own subdir
Date:   Mon, 20 Feb 2023 23:12:04 +0100
Message-Id: <20230220221212.196009-2-hdegoede@redhat.com>
In-Reply-To: <20230220221212.196009-1-hdegoede@redhat.com>
References: <20230220221212.196009-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Move the x86-android-tablets code into its own subdir, this is
a preparation patch for splitting the somewhat large file into
multiple smaller files.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 MAINTAINERS                                   |  2 +-
 drivers/platform/x86/Kconfig                  | 17 +--------------
 drivers/platform/x86/Makefile                 |  2 +-
 .../platform/x86/x86-android-tablets/Kconfig  | 21 +++++++++++++++++++
 .../platform/x86/x86-android-tablets/Makefile |  8 +++++++
 .../x86-android-tablets-main.c}               |  4 ++--
 6 files changed, 34 insertions(+), 20 deletions(-)
 create mode 100644 drivers/platform/x86/x86-android-tablets/Kconfig
 create mode 100644 drivers/platform/x86/x86-android-tablets/Makefile
 rename drivers/platform/x86/{x86-android-tablets.c => x86-android-tablets/x86-android-tablets-main.c} (99%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0c051a973e6b..87cc1e6b37c0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22634,7 +22634,7 @@ M:	Hans de Goede <hdegoede@redhat.com>
 L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git
-F:	drivers/platform/x86/x86-android-tablets.c
+F:	drivers/platform/x86/x86-android-tablets/
 
 X86 PLATFORM DRIVERS
 M:	Hans de Goede <hdegoede@redhat.com>
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index ec7c2b4e1721..8b4e03fe5bff 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -977,22 +977,7 @@ config TOUCHSCREEN_DMI
 	  the OS-image for the device. This option supplies the missing info.
 	  Enable this for x86 tablets with Silead or Chipone touchscreens.
 
-config X86_ANDROID_TABLETS
-	tristate "X86 Android tablet support"
-	depends on I2C && SPI && SERIAL_DEV_BUS && ACPI && EFI && GPIOLIB
-	help
-	  X86 tablets which ship with Android as (part of) the factory image
-	  typically have various problems with their DSDTs. The factory kernels
-	  shipped on these devices typically have device addresses and GPIOs
-	  hardcoded in the kernel, rather than specified in their DSDT.
-
-	  With the DSDT containing a random collection of devices which may or
-	  may not actually be present. This driver contains various fixes for
-	  such tablets, including instantiating kernel devices for devices which
-	  are missing from the DSDT.
-
-	  If you have a x86 Android tablet say Y or M here, for a generic x86
-	  distro config say M here.
+source "drivers/platform/x86/x86-android-tablets/Kconfig"
 
 config FW_ATTR_CLASS
 	tristate
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index 1d3d1b02541b..0d9cc9af6ba7 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -112,7 +112,7 @@ obj-$(CONFIG_SERIAL_MULTI_INSTANTIATE)	+= serial-multi-instantiate.o
 obj-$(CONFIG_MLX_PLATFORM)		+= mlx-platform.o
 obj-$(CONFIG_TOUCHSCREEN_DMI)		+= touchscreen_dmi.o
 obj-$(CONFIG_WIRELESS_HOTKEY)		+= wireless-hotkey.o
-obj-$(CONFIG_X86_ANDROID_TABLETS)	+= x86-android-tablets.o
+obj-$(CONFIG_X86_ANDROID_TABLETS)	+= x86-android-tablets/
 
 # Intel uncore drivers
 obj-$(CONFIG_INTEL_IPS)				+= intel_ips.o
diff --git a/drivers/platform/x86/x86-android-tablets/Kconfig b/drivers/platform/x86/x86-android-tablets/Kconfig
new file mode 100644
index 000000000000..8a0a0242ed92
--- /dev/null
+++ b/drivers/platform/x86/x86-android-tablets/Kconfig
@@ -0,0 +1,21 @@
+# SPDX-License-Identifier: GPL-2.0+
+#
+# X86 Android tablet support Kconfig
+#
+
+config X86_ANDROID_TABLETS
+	tristate "X86 Android tablet support"
+	depends on I2C && SPI && SERIAL_DEV_BUS && ACPI && EFI && GPIOLIB
+	help
+	  X86 tablets which ship with Android as (part of) the factory image
+	  typically have various problems with their DSDTs. The factory kernels
+	  shipped on these devices typically have device addresses and GPIOs
+	  hardcoded in the kernel, rather than specified in their DSDT.
+
+	  With the DSDT containing a random collection of devices which may or
+	  may not actually be present. This driver contains various fixes for
+	  such tablets, including instantiating kernel devices for devices which
+	  are missing from the DSDT.
+
+	  If you have a x86 Android tablet say Y or M here, for a generic x86
+	  distro config say M here.
diff --git a/drivers/platform/x86/x86-android-tablets/Makefile b/drivers/platform/x86/x86-android-tablets/Makefile
new file mode 100644
index 000000000000..b4d789ff6e70
--- /dev/null
+++ b/drivers/platform/x86/x86-android-tablets/Makefile
@@ -0,0 +1,8 @@
+# SPDX-License-Identifier: GPL-2.0+
+#
+# X86 Android tablet support Makefile
+#
+
+obj-$(CONFIG_X86_ANDROID_TABLETS) += x86-android-tablets.o
+
+x86-android-tablets-y := x86-android-tablets-main.o
diff --git a/drivers/platform/x86/x86-android-tablets.c b/drivers/platform/x86/x86-android-tablets/x86-android-tablets-main.c
similarity index 99%
rename from drivers/platform/x86/x86-android-tablets.c
rename to drivers/platform/x86/x86-android-tablets/x86-android-tablets-main.c
index 8405e1c58d52..08cc5e158460 100644
--- a/drivers/platform/x86/x86-android-tablets.c
+++ b/drivers/platform/x86/x86-android-tablets/x86-android-tablets-main.c
@@ -34,8 +34,8 @@
 #include <linux/spi/spi.h>
 #include <linux/string.h>
 /* For gpio_get_desc() which is EXPORT_SYMBOL_GPL() */
-#include "../../gpio/gpiolib.h"
-#include "../../gpio/gpiolib-acpi.h"
+#include "../../../gpio/gpiolib.h"
+#include "../../../gpio/gpiolib-acpi.h"
 
 /*
  * Helper code to get Linux IRQ numbers given a description of the IRQ source
-- 
2.39.1

