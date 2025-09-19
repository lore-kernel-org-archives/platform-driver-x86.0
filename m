Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01F07274FFD
	for <platform-driver-x86@vger.kernel.org>; Fri, 19 Sep 2025 20:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758314891; cv=none; b=GS4Cmyjo6uxmOJDPAePvTNDeWV4AXqU/LQ53HiiKOxZ7mGakbXFvXKjuJeNt+uYG18ctCDr19lai1Vr85NkcBUbrrTdS6d1dfP0pmUIPiRcKVWALk3Zc9xdVZAAbZQxZB0ryXc5T5EWJFloBwZyge79XroXKmroH3y/6boc5/4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758314891; c=relaxed/simple;
	bh=wCr9YSImzVN+jYjWExdIlYx1sSlWJ/K38wV8katzxD8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kFdMUfjRNXAIi417yaellXZzrpt83JYiQbboN8gEO648Sg+Rh9e3+Q19buiH4tT7vD2Idvo5bfvI01R0SKdkJm5EDDAbwrnmy+dSr6+DzFe3tygKlaJ9qN5l7ErIKkFwBDGOU/XWfjiC9Yvak0s29ncSlZBNz2PAe2xTHw6FhAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H1/AkRbI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H1/AkRbI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DED0C4CEFA;
	Fri, 19 Sep 2025 20:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758314890;
	bh=wCr9YSImzVN+jYjWExdIlYx1sSlWJ/K38wV8katzxD8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=H1/AkRbIkazmo45WNw/Eu/iKIDXJLy2QI45tOKj2+DIQlF1FaOxRqGK0dUvzIfTGb
	 IKxb6xSHqXvOJB9+HtK+R9vwSc0ysJDFJtp10i/expnafSYMBwto3P9MpTayb9NPbG
	 95ltZdtzsPcmBPhg7igvQUD/1Yxy2Kj9RfAwFnxmW3c40aPmh6NWw/+DWpdvG7vZZ+
	 V65e057+7hoh4imiyY8CQO7jjl3ycM2PffaiURk/d+Jg6I5L56+hy8JBB+fU2WdgSt
	 ohgrm+prXxqgfekOmCcxDvovue06IZogAXdBLP1M3cZbmiWAiccwwDA4Se+6k35e8h
	 4u+pUvRKtdSEQ==
From: Hans de Goede <hansg@kernel.org>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Arnd Bergmann <arnd@kernel.org>
Cc: Hans de Goede <hansg@kernel.org>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v3 14/19] platform/x86: x86-android-tablets: Update my email address
Date: Fri, 19 Sep 2025 22:47:37 +0200
Message-ID: <20250919204742.25581-15-hansg@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250919204742.25581-1-hansg@kernel.org>
References: <20250919204742.25581-1-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hdegoede@redhat.com will stop working soon, replace it with my kernel.org
address.

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
index 5675e888d84f..15d216be0bed 100644
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
@@ -567,6 +567,6 @@ static void __exit x86_android_tablet_exit(void)
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

