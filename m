Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0AA5C7EE30
	for <platform-driver-x86@archiver.kernel.org>; Wed,  1 Mar 2023 09:24:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229764AbjCAJYe (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 1 Mar 2023 04:24:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229693AbjCAJYc (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 1 Mar 2023 04:24:32 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F23432E5F
        for <platform-driver-x86@vger.kernel.org>; Wed,  1 Mar 2023 01:23:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1677662623;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=zpbHnpQhB7rZuT3g22SqhtoYsA3bRAPmE0jOjkFrWIk=;
        b=LyCGin3LRaPhYn9H7bp40+9IpJ3q5zU9L6poXUXLVcqVrWCYAlVeZ8xxFqFF7Xm2Wi54Wk
        /Ue9wCfdyEGnn/7f752kTbLPDBLVktb/JgRC16ZohZ1hafSakbrEchJXphUTTMsNYhAgcn
        MlAVoQ4LhgSFZL4bggkgJqc+7fJVqGo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-83-WqUlzB1MMPmg-4HnDsMR3g-1; Wed, 01 Mar 2023 04:23:40 -0500
X-MC-Unique: WqUlzB1MMPmg-4HnDsMR3g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 11C8585A5A3;
        Wed,  1 Mar 2023 09:23:40 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.194.30])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 6462C40CF8EC;
        Wed,  1 Mar 2023 09:23:39 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH v2 02/14] platform/x86: x86-android-tablets: Move into its own subdir
Date:   Wed,  1 Mar 2023 10:23:19 +0100
Message-Id: <20230301092331.7038-3-hdegoede@redhat.com>
In-Reply-To: <20230301092331.7038-1-hdegoede@redhat.com>
References: <20230301092331.7038-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Move the x86-android-tablets code into its own subdir, this is
a preparation patch for splitting the somewhat large file into
multiple smaller files.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
- Use GPL-2.0-or-later for SPDX identifier
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
index 931a34371e93..2537fe542231 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22631,7 +22631,7 @@ M:	Hans de Goede <hdegoede@redhat.com>
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
index 000000000000..2b3daca5380b
--- /dev/null
+++ b/drivers/platform/x86/x86-android-tablets/Kconfig
@@ -0,0 +1,21 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
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
index 000000000000..52a0d6de5fcb
--- /dev/null
+++ b/drivers/platform/x86/x86-android-tablets/Makefile
@@ -0,0 +1,8 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
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

