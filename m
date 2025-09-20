Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A6AE26B098
	for <platform-driver-x86@vger.kernel.org>; Sat, 20 Sep 2025 20:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758398865; cv=none; b=VFF5ORlCdDJf5613WxodAXtAJovFGM4FKHDxZ0oodlrENGYvU7d2lQ4Mgq/nlCtWZ++3mCMYxdpVU3hB+k/qDC8vgtAQMzGz49gxiLUge/UjlEYdAbuKY0CMb0pf7fNNVQEWgbMDUvHPCPX4ZKof7Y/qtCOhahOF0otynLEYTHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758398865; c=relaxed/simple;
	bh=bG6t3r215DvxE6cOQBthc2eJgc4cX81IiVnuRZV+Gbw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EA/HLn0UbT2djs9yLrWQq+27adv3TOy+76wXy7X2HhUQxM/fy8Fafr7ZRtTJ2RIsFZKYwDSdZ+ri1lHLHoCLhmeftUw5Uhe9HSSWcZSJT681hTF1jBaSGgNVtDMzf2nGeSPOEmMz+TOgAkNp10AxnX7wbwtX7g5Pr8ABDjhhOs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ua4mfZoW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ua4mfZoW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B800EC4CEF0;
	Sat, 20 Sep 2025 20:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758398865;
	bh=bG6t3r215DvxE6cOQBthc2eJgc4cX81IiVnuRZV+Gbw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ua4mfZoWrZphdy9j+sYIf5XZ8R/xQF0f7cYjXFZrdLWD24i6gTW2/rRjSPxkHnnJv
	 veTRVdkv1OHJBpQtWajoaQBdb4ygknrhLr5/jGBryCJlIOu2T2mTrFeqG5F36UT2Im
	 NKnvIgfTaP6Unne2jnGL4YLJ7uGE53UBI0X+vh/ZbgFhRcGFKtiEXoTsmXSEcB/vAR
	 uF6Dfsr+UWxmZXkt9vYP91VnnAQgPC4fgN3zLwV3k2CabDPKUHjKPx4xTjz7WjSwqE
	 QeAzHn6euA7iB96640PNix6JIUHs/Oo7F6EN2oln13d/54xOTubQHkz6TKNy1aIawH
	 f5JdHwqK4RvzA==
From: Hans de Goede <hansg@kernel.org>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Arnd Bergmann <arnd@kernel.org>
Cc: Hans de Goede <hansg@kernel.org>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v4 15/20] platform/x86: x86-android-tablets: Update my email address
Date: Sat, 20 Sep 2025 22:07:08 +0200
Message-ID: <20250920200713.20193-16-hansg@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250920200713.20193-1-hansg@kernel.org>
References: <20250920200713.20193-1-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hdegoede@redhat.com will stop working soon, replace it with my kernel.org
address.

Reviewed-by: Andy Shevchenko <andy@kernel.org>
Signed-off-by: Hans de Goede <hansg@kernel.org>
---
 drivers/platform/x86/x86-android-tablets/asus.c               | 2 +-
 drivers/platform/x86/x86-android-tablets/core.c               | 4 ++--
 drivers/platform/x86/x86-android-tablets/dmi.c                | 2 +-
 drivers/platform/x86/x86-android-tablets/lenovo.c             | 2 +-
 drivers/platform/x86/x86-android-tablets/other.c              | 2 +-
 drivers/platform/x86/x86-android-tablets/shared-psy-info.c    | 2 +-
 drivers/platform/x86/x86-android-tablets/shared-psy-info.h    | 2 +-
 drivers/platform/x86/x86-android-tablets/vexia_atla10_ec.c    | 2 +-
 .../platform/x86/x86-android-tablets/x86-android-tablets.h    | 2 +-
 9 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/platform/x86/x86-android-tablets/asus.c b/drivers/platform/x86/x86-android-tablets/asus.c
index 39eb2f9dc031..7d29c7654d21 100644
--- a/drivers/platform/x86/x86-android-tablets/asus.c
+++ b/drivers/platform/x86/x86-android-tablets/asus.c
@@ -5,7 +5,7 @@
  * devices typically have a bunch of things hardcoded, rather than specified
  * in their DSDT.
  *
- * Copyright (C) 2021-2023 Hans de Goede <hdegoede@redhat.com>
+ * Copyright (C) 2021-2023 Hans de Goede <hansg@kernel.org>
  */
 
 #include <linux/gpio/machine.h>
diff --git a/drivers/platform/x86/x86-android-tablets/core.c b/drivers/platform/x86/x86-android-tablets/core.c
index d0638664d1da..a8e9fa97b676 100644
--- a/drivers/platform/x86/x86-android-tablets/core.c
+++ b/drivers/platform/x86/x86-android-tablets/core.c
@@ -5,7 +5,7 @@
  * devices typically have a bunch of things hardcoded, rather than specified
  * in their DSDT.
  *
- * Copyright (C) 2021-2023 Hans de Goede <hdegoede@redhat.com>
+ * Copyright (C) 2021-2023 Hans de Goede <hansg@kernel.org>
  */
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
@@ -558,6 +558,6 @@ static void __exit x86_android_tablet_exit(void)
 }
 module_exit(x86_android_tablet_exit);
 
-MODULE_AUTHOR("Hans de Goede <hdegoede@redhat.com>");
+MODULE_AUTHOR("Hans de Goede <hansg@kernel.org>");
 MODULE_DESCRIPTION("X86 Android tablets DSDT fixups driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/platform/x86/x86-android-tablets/dmi.c b/drivers/platform/x86/x86-android-tablets/dmi.c
index 278c6d151dc4..ebba7400d5c9 100644
--- a/drivers/platform/x86/x86-android-tablets/dmi.c
+++ b/drivers/platform/x86/x86-android-tablets/dmi.c
@@ -5,7 +5,7 @@
  * devices typically have a bunch of things hardcoded, rather than specified
  * in their DSDT.
  *
- * Copyright (C) 2021-2023 Hans de Goede <hdegoede@redhat.com>
+ * Copyright (C) 2021-2023 Hans de Goede <hansg@kernel.org>
  */
 
 #include <linux/dmi.h>
diff --git a/drivers/platform/x86/x86-android-tablets/lenovo.c b/drivers/platform/x86/x86-android-tablets/lenovo.c
index 1f325b2947ab..832be02495b5 100644
--- a/drivers/platform/x86/x86-android-tablets/lenovo.c
+++ b/drivers/platform/x86/x86-android-tablets/lenovo.c
@@ -5,7 +5,7 @@
  * devices typically have a bunch of things hardcoded, rather than specified
  * in their DSDT.
  *
- * Copyright (C) 2021-2023 Hans de Goede <hdegoede@redhat.com>
+ * Copyright (C) 2021-2023 Hans de Goede <hansg@kernel.org>
  */
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
diff --git a/drivers/platform/x86/x86-android-tablets/other.c b/drivers/platform/x86/x86-android-tablets/other.c
index 174f02322e52..bc473979e4f6 100644
--- a/drivers/platform/x86/x86-android-tablets/other.c
+++ b/drivers/platform/x86/x86-android-tablets/other.c
@@ -5,7 +5,7 @@
  * devices typically have a bunch of things hardcoded, rather than specified
  * in their DSDT.
  *
- * Copyright (C) 2021-2023 Hans de Goede <hdegoede@redhat.com>
+ * Copyright (C) 2021-2023 Hans de Goede <hansg@kernel.org>
  */
 
 #include <linux/acpi.h>
diff --git a/drivers/platform/x86/x86-android-tablets/shared-psy-info.c b/drivers/platform/x86/x86-android-tablets/shared-psy-info.c
index 62f41c14e6ba..29fc466f76fe 100644
--- a/drivers/platform/x86/x86-android-tablets/shared-psy-info.c
+++ b/drivers/platform/x86/x86-android-tablets/shared-psy-info.c
@@ -5,7 +5,7 @@
  * devices typically have a bunch of things hardcoded, rather than specified
  * in their DSDT.
  *
- * Copyright (C) 2021-2023 Hans de Goede <hdegoede@redhat.com>
+ * Copyright (C) 2021-2023 Hans de Goede <hansg@kernel.org>
  */
 
 #include <linux/gpio/machine.h>
diff --git a/drivers/platform/x86/x86-android-tablets/shared-psy-info.h b/drivers/platform/x86/x86-android-tablets/shared-psy-info.h
index e5ba1c65d62b..149befba3330 100644
--- a/drivers/platform/x86/x86-android-tablets/shared-psy-info.h
+++ b/drivers/platform/x86/x86-android-tablets/shared-psy-info.h
@@ -5,7 +5,7 @@
  * devices typically have a bunch of things hardcoded, rather than specified
  * in their DSDT.
  *
- * Copyright (C) 2021-2023 Hans de Goede <hdegoede@redhat.com>
+ * Copyright (C) 2021-2023 Hans de Goede <hansg@kernel.org>
  */
 #ifndef __PDX86_SHARED_PSY_INFO_H
 #define __PDX86_SHARED_PSY_INFO_H
diff --git a/drivers/platform/x86/x86-android-tablets/vexia_atla10_ec.c b/drivers/platform/x86/x86-android-tablets/vexia_atla10_ec.c
index 5d02af1c5aaa..2f8cd8d9e0ab 100644
--- a/drivers/platform/x86/x86-android-tablets/vexia_atla10_ec.c
+++ b/drivers/platform/x86/x86-android-tablets/vexia_atla10_ec.c
@@ -256,6 +256,6 @@ static struct i2c_driver atla10_ec_driver = {
 };
 module_i2c_driver(atla10_ec_driver);
 
-MODULE_AUTHOR("Hans de Goede <hdegoede@redhat.com>");
+MODULE_AUTHOR("Hans de Goede <hansg@kernel.org>");
 MODULE_DESCRIPTION("Battery driver for Vexia EDU ATLA 10 tablet EC");
 MODULE_LICENSE("GPL");
diff --git a/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h b/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
index 4bf4bcdf50c0..8e7d04bcb3f8 100644
--- a/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
+++ b/drivers/platform/x86/x86-android-tablets/x86-android-tablets.h
@@ -5,7 +5,7 @@
  * devices typically have a bunch of things hardcoded, rather than specified
  * in their DSDT.
  *
- * Copyright (C) 2021-2023 Hans de Goede <hdegoede@redhat.com>
+ * Copyright (C) 2021-2023 Hans de Goede <hansg@kernel.org>
  */
 #ifndef __PDX86_X86_ANDROID_TABLETS_H
 #define __PDX86_X86_ANDROID_TABLETS_H
-- 
2.51.0

