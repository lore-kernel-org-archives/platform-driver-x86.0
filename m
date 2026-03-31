Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E5C044D68A
	for <platform-driver-x86@vger.kernel.org>; Tue, 31 Mar 2026 18:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774980749; cv=none; b=hyCeXCe/b7pQSV7uBxjHVaXBsG6M5zP2UbZJ1btpfX5vKXNlcI0ts8j7NZI9IljEaHPAtM8g6Clwzv1SFFSzrPxlvZC0FAyNkmurWHpIKTzpes7W7sFRFIf9hcd0tHJP8RW7rYYGLB1cm31I3SKGbRzFOnPKTGsmq+98/UUnCOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774980749; c=relaxed/simple;
	bh=B1LBbhqPdmlHhkPZJzil9YvdVcehWUBIB6Xk5BxbN3w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CFkZ/YyhxSNsTLeLi6WkBezl/BZYzRfrK+jsF0NtEJxxJPgKuV83mUrO9VdH/xuHoWQPji40gXNj41J3oMQWW/FE35VYYRML8kRZhEAtdiVpGMJnN/OpylpMi6xkC6mOWmXz2hjPXCzvPtnqzjLKhzFwsPl21xfDZyymiGYrE7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Trnom79d; arc=none smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Trnom79d"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-12713e56abdso138133c88.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 31 Mar 2026 11:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774980742; x=1775585542; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZbE2H1seNIMYPCC+OqB4YdVVeZgyTGdmDEfXgNXjg14=;
        b=Trnom79dbn+MeUIBnzNoUFNYe7nrDzd9D/PisMVtygjysTRXUrZOm/d7vBVslpFTpn
         UkTmxG6GW8mG6ScQETQSOl0geuVEKSH9j7S3Wpsf9ntyrC/tQh/2Geo1p0ExrynSxNKE
         QzqCMajpCyb8CHWxeUVF4gFpS/qk2k7xb39wxgcJ2CcFANzxe4sJmXjGMHsOg2q2OpKT
         dgxcunS2Skju4hi0AB1J8IH7XDE1r1wS2e01qljUK2UrnL/0dtJ2Bmr9s8ZUW6ZEFJFi
         YEZKtaMT1VHk53E0aqrNZ+X8OLlZ60NbO0l8A9QD+4cs9qY2Xu5np58R8LBGLWCkzfi4
         Qa+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774980742; x=1775585542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZbE2H1seNIMYPCC+OqB4YdVVeZgyTGdmDEfXgNXjg14=;
        b=cq0uNE4OtjaxOOcnDz5opoUrxPq0gbTVybffsYhbCv0Pinwsxb9vjDIBhZW8VOIzzy
         V0fXu64QSDNkq1K8d8H0FSALHNfBLCA9NG3KAsfSuAn1gTWECzdryIUgS/kDpjofKsQg
         PpzMzOJ26PbwgZCrVujtv6ueSaIxvjBIRoduifcu4S+XmyhcLk68Y6HQikq+W4gJ7m7N
         V1i0Ct1LSHKolFMKufHuPstgCPH8//HltbuY0AGtoxDKnPM6F4g+031y0rUH2NEABY7F
         ZL15xL+Ps7qjE83RsMlXXLicpIAOy5UMSi9fAE3/YuDDr4i2Fqv79XILf7LwfdwmpCFJ
         k/4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXL4bq0SKI7JHa8k3M01KYe7RLTpNtnVrwy8A4p/o5sRutk6s3N5PN+D9lBgUFu4Jq7j32qgSMc6eTHwUXXmU1i27CB@vger.kernel.org
X-Gm-Message-State: AOJu0YyT6SMVoxhcSlMbtwTBZW5ocQp8gbs5U8eF3nyQXkstrOaXz6MP
	4kZAitL8HoS1BDLAUxpfDDRXnIiHBIezwY1tSBGy/ABlH+GQzdx7DXfM
X-Gm-Gg: ATEYQzy2BLWQO8H+Vl526gB67bA2gp07o6zb/ZztzWvS4+oX0jGNUytL0jEbxudPr4H
	bhdG/FVmPjUVrufMtSsmLVith/JY+tj8uxV8IwuWsQlVjG7AgWjHq0RSBZsuSTjLgBbiiCT/9rR
	yY6wODrRU4yt8LpgVU8hlEpNyxvWmViWI1NIns6MB0116Vx+onfhvJKMS5OAn+aiv6q2OBBvE3Y
	w3y1+VmNyC1/O3BwhTOFyvnm1GvACvSk0Y3KXlvPQmH47hclp/1KYy/Ahy0GhPXcBtsobfwG6XJ
	5Z7gEz2WXdxpe9QYA2K16UywZL3sdMBr5l+2/+iBD3FgVkY5ZL7/B2U6WfjYOGxMVQ+D5Zs9T+h
	jhdQvD4fWoRfPjOT699KXHaw6hsbvbNYDi+8A3GcoEeNh8H55Hb1BpYF27yjjZbybG8qdObNYXY
	Cc65LgsAIJL+Hr3Tb3gEZ339PGvS5UqOyCwk0hkuYQxkz3a6tjQIoxLGK6GbZ5Hf+iUVBl44i3H
	ZG7
X-Received: by 2002:a05:7022:2209:b0:119:e569:f874 with SMTP id a92af1059eb24-12be686a98cmr157009c88.17.1774980741023;
        Tue, 31 Mar 2026 11:12:21 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12abbe21787sm10769272c88.11.2026.03.31.11.12.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 11:12:20 -0700 (PDT)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>,
	Armin Wolf <W_Armin@gmx.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Rong Zhang <i@rong.moe>,
	Kurt Borja <kuurtb@gmail.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v6 11/13] platform/x86: lenovo: Decouple lenovo-wmi-gamezone and lenovo-wmi-other
Date: Tue, 31 Mar 2026 18:12:06 +0000
Message-ID: <20260331181208.421552-12-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260331181208.421552-1-derekjohn.clark@gmail.com>
References: <20260331181208.421552-1-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rong Zhang <i@rong.moe>

Currently, lenovo-wmi-gamezone depends on lenovo-wmi-other as the former
imports symbols from the latter. The imported symbols are just used to
register a notifier block. However, there is no runtime dependency
between both drivers, and either of them can run without the other,
which is the major purpose of using the notifier framework.

Such a link-time dependency is non-optimal. A previous attempt to "fix"
it made LENOVO_WMI_GAMEZONE select LENOVO_WMI_TUNING, which was
fundamentally broken and resulted in undefined Kconfig behavior, as
`select' cannot be used on a symbol with potentially unmet dependencies.

Decouple both drivers by moving the thermal mode notifier chain to
lenovo-wmi-helpers. Methods for notifier block (un)registration are
exported for lenovo-wmi-gamezone, while a method for querying the
current thermal mode are exported for lenovo-wmi-other.

This turns the dependency graph from

            +------------ lenovo-wmi-gamezone
            |                     |
            v                     |
    lenovo-wmi-helpers            |
            ^                     |
            |                     V
            +------------ lenovo-wmi-other

into

            +------------ lenovo-wmi-gamezone
            |
            v
    lenovo-wmi-helpers
            ^
            |
            +------------ lenovo-wmi-other

To make it clear, the name of the notifier chain is also renamed from
`om_chain_head' to `tm_chain_head', indicating that it's used to query
the current thermal mode.

No functional change intended.

Fixes: 6e38b9fcbfa3 ("platform/x86: lenovo: gamezone needs "other mode"")
Cc: stable@vger.kernel.org
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202603252259.gHvJDyh3-lkp@intel.com/
Closes: https://lore.kernel.org/oe-kbuild-all/202603260302.X0NjQOda-lkp@intel.com/
Signed-off-by: Rong Zhang <i@rong.moe>
Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
 drivers/platform/x86/lenovo/Kconfig        |   1 -
 drivers/platform/x86/lenovo/wmi-gamezone.c |   4 +-
 drivers/platform/x86/lenovo/wmi-helpers.c  | 101 ++++++++++++++++++++
 drivers/platform/x86/lenovo/wmi-helpers.h  |   8 ++
 drivers/platform/x86/lenovo/wmi-other.c    | 104 +--------------------
 drivers/platform/x86/lenovo/wmi-other.h    |  16 ----
 6 files changed, 112 insertions(+), 122 deletions(-)
 delete mode 100644 drivers/platform/x86/lenovo/wmi-other.h

diff --git a/drivers/platform/x86/lenovo/Kconfig b/drivers/platform/x86/lenovo/Kconfig
index 75a8b144b0da..b9a5d18caa1e 100644
--- a/drivers/platform/x86/lenovo/Kconfig
+++ b/drivers/platform/x86/lenovo/Kconfig
@@ -252,7 +252,6 @@ config LENOVO_WMI_GAMEZONE
 	select ACPI_PLATFORM_PROFILE
 	select LENOVO_WMI_EVENTS
 	select LENOVO_WMI_HELPERS
-	select LENOVO_WMI_TUNING
 	help
 	  Say Y here if you have a WMI aware Lenovo Legion device and would like to use the
 	  platform-profile firmware interface to manage power usage.
diff --git a/drivers/platform/x86/lenovo/wmi-gamezone.c b/drivers/platform/x86/lenovo/wmi-gamezone.c
index 602a48de1b4e..a614af8f08e8 100644
--- a/drivers/platform/x86/lenovo/wmi-gamezone.c
+++ b/drivers/platform/x86/lenovo/wmi-gamezone.c
@@ -22,7 +22,6 @@
 
 #include "wmi-events.h"
 #include "wmi-helpers.h"
-#include "wmi-other.h"
 
 #define LENOVO_GAMEZONE_GUID "887B54E3-DDDC-4B2C-8B88-68A26A8835D0"
 
@@ -384,7 +383,7 @@ static int lwmi_gz_probe(struct wmi_device *wdev, const void *context)
 		return ret;
 
 	priv->mode_nb.notifier_call = lwmi_gz_mode_call;
-	return devm_lwmi_om_register_notifier(&wdev->dev, &priv->mode_nb);
+	return devm_lwmi_tm_register_notifier(&wdev->dev, &priv->mode_nb);
 }
 
 static const struct wmi_device_id lwmi_gz_id_table[] = {
@@ -406,7 +405,6 @@ module_wmi_driver(lwmi_gz_driver);
 
 MODULE_IMPORT_NS("LENOVO_WMI_EVENTS");
 MODULE_IMPORT_NS("LENOVO_WMI_HELPERS");
-MODULE_IMPORT_NS("LENOVO_WMI_OTHER");
 MODULE_DEVICE_TABLE(wmi, lwmi_gz_id_table);
 MODULE_AUTHOR("Derek J. Clark <derekjohn.clark@gmail.com>");
 MODULE_DESCRIPTION("Lenovo GameZone WMI Driver");
diff --git a/drivers/platform/x86/lenovo/wmi-helpers.c b/drivers/platform/x86/lenovo/wmi-helpers.c
index 7379defac500..e1cf869224d2 100644
--- a/drivers/platform/x86/lenovo/wmi-helpers.c
+++ b/drivers/platform/x86/lenovo/wmi-helpers.c
@@ -21,11 +21,15 @@
 #include <linux/errno.h>
 #include <linux/export.h>
 #include <linux/module.h>
+#include <linux/notifier.h>
 #include <linux/unaligned.h>
 #include <linux/wmi.h>
 
 #include "wmi-helpers.h"
 
+/* Thermal mode notifier chain. */
+static BLOCKING_NOTIFIER_HEAD(tm_chain_head);
+
 /**
  * lwmi_dev_evaluate_int() - Helper function for calling WMI methods that
  * return an integer.
@@ -84,6 +88,103 @@ int lwmi_dev_evaluate_int(struct wmi_device *wdev, u8 instance, u32 method_id,
 };
 EXPORT_SYMBOL_NS_GPL(lwmi_dev_evaluate_int, "LENOVO_WMI_HELPERS");
 
+/**
+ * lwmi_tm_register_notifier() - Add a notifier to the blocking notifier chain
+ * @nb: The notifier_block struct to register
+ *
+ * Call blocking_notifier_chain_register to register the notifier block to the
+ * thermal mode notifier chain.
+ *
+ * Return: 0 on success, %-EEXIST on error.
+ */
+int lwmi_tm_register_notifier(struct notifier_block *nb)
+{
+	return blocking_notifier_chain_register(&tm_chain_head, nb);
+}
+EXPORT_SYMBOL_NS_GPL(lwmi_tm_register_notifier, "LENOVO_WMI_HELPERS");
+
+/**
+ * lwmi_tm_unregister_notifier() - Remove a notifier from the blocking notifier
+ * chain.
+ * @nb: The notifier_block struct to register
+ *
+ * Call blocking_notifier_chain_unregister to unregister the notifier block from the
+ * thermal mode notifier chain.
+ *
+ * Return: 0 on success, %-ENOENT on error.
+ */
+int lwmi_tm_unregister_notifier(struct notifier_block *nb)
+{
+	return blocking_notifier_chain_unregister(&tm_chain_head, nb);
+}
+EXPORT_SYMBOL_NS_GPL(lwmi_tm_unregister_notifier, "LENOVO_WMI_HELPERS");
+
+/**
+ * devm_lwmi_tm_unregister_notifier() - Remove a notifier from the blocking
+ * notifier chain.
+ * @data: Void pointer to the notifier_block struct to register.
+ *
+ * Call lwmi_tm_unregister_notifier to unregister the notifier block from the
+ * thermal mode notifier chain.
+ *
+ * Return: 0 on success, %-ENOENT on error.
+ */
+static void devm_lwmi_tm_unregister_notifier(void *data)
+{
+	struct notifier_block *nb = data;
+
+	lwmi_tm_unregister_notifier(nb);
+}
+
+/**
+ * devm_lwmi_tm_register_notifier() - Add a notifier to the blocking notifier
+ * chain.
+ * @dev: The parent device of the notifier_block struct.
+ * @nb: The notifier_block struct to register
+ *
+ * Call lwmi_tm_register_notifier to register the notifier block to the
+ * thermal mode notifier chain. Then add devm_lwmi_tm_unregister_notifier
+ * as a device managed action to automatically unregister the notifier block
+ * upon parent device removal.
+ *
+ * Return: 0 on success, or an error code.
+ */
+int devm_lwmi_tm_register_notifier(struct device *dev,
+				   struct notifier_block *nb)
+{
+	int ret;
+
+	ret = lwmi_tm_register_notifier(nb);
+	if (ret < 0)
+		return ret;
+
+	return devm_add_action_or_reset(dev, devm_lwmi_tm_unregister_notifier,
+					nb);
+}
+EXPORT_SYMBOL_NS_GPL(devm_lwmi_tm_register_notifier, "LENOVO_WMI_HELPERS");
+
+/**
+ * lwmi_tm_notifier_call() - Call functions for the notifier call chain.
+ * @mode: Pointer to a thermal mode enum to retrieve the data from.
+ *
+ * Call blocking_notifier_call_chain to retrieve the thermal mode from the
+ * lenovo-wmi-gamezone driver.
+ *
+ * Return: 0 on success, or an error code.
+ */
+int lwmi_tm_notifier_call(enum thermal_mode *mode)
+{
+	int ret;
+
+	ret = blocking_notifier_call_chain(&tm_chain_head,
+					   LWMI_GZ_GET_THERMAL_MODE, &mode);
+	if ((ret & ~NOTIFY_STOP_MASK) != NOTIFY_OK)
+		return -EINVAL;
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(lwmi_tm_notifier_call, "LENOVO_WMI_HELPERS");
+
 MODULE_AUTHOR("Derek J. Clark <derekjohn.clark@gmail.com>");
 MODULE_DESCRIPTION("Lenovo WMI Helpers Driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/platform/x86/lenovo/wmi-helpers.h b/drivers/platform/x86/lenovo/wmi-helpers.h
index 3364d8e152ca..ed7db3ebba6c 100644
--- a/drivers/platform/x86/lenovo/wmi-helpers.h
+++ b/drivers/platform/x86/lenovo/wmi-helpers.h
@@ -7,6 +7,8 @@
 
 #include <linux/types.h>
 
+struct device;
+struct notifier_block;
 struct wmi_device;
 
 struct wmi_method_args_32 {
@@ -30,4 +32,10 @@ enum thermal_mode {
 int lwmi_dev_evaluate_int(struct wmi_device *wdev, u8 instance, u32 method_id,
 			  unsigned char *buf, size_t size, u32 *retval);
 
+int lwmi_tm_register_notifier(struct notifier_block *nb);
+int lwmi_tm_unregister_notifier(struct notifier_block *nb);
+int devm_lwmi_tm_register_notifier(struct device *dev,
+				   struct notifier_block *nb);
+int lwmi_tm_notifier_call(enum thermal_mode *mode);
+
 #endif /* !_LENOVO_WMI_HELPERS_H_ */
diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x86/lenovo/wmi-other.c
index e0633c42972c..d871ee02dfcb 100644
--- a/drivers/platform/x86/lenovo/wmi-other.c
+++ b/drivers/platform/x86/lenovo/wmi-other.c
@@ -41,7 +41,6 @@
 #include <linux/kobject.h>
 #include <linux/limits.h>
 #include <linux/module.h>
-#include <linux/notifier.h>
 #include <linux/platform_profile.h>
 #include <linux/power_supply.h>
 #include <linux/types.h>
@@ -52,7 +51,6 @@
 #include "wmi-capdata.h"
 #include "wmi-events.h"
 #include "wmi-helpers.h"
-#include "wmi-other.h"
 #include "../firmware_attributes_class.h"
 
 #define LENOVO_OTHER_MODE_GUID "DC2A8805-3A8C-41BA-A6F7-092E0089CD3B"
@@ -110,7 +108,6 @@ enum lwmi_feature_id_gpu {
 #define LWMI_OM_SYSFS_NAME "lenovo-wmi-other"
 #define LWMI_OM_HWMON_NAME "lenovo_wmi_other"
 
-static BLOCKING_NOTIFIER_HEAD(om_chain_head);
 static DEFINE_IDA(lwmi_om_ida);
 
 enum attribute_property {
@@ -138,7 +135,6 @@ struct lwmi_om_priv {
 	struct device *hwmon_dev;
 	struct device *fw_attr_dev;
 	struct kset *fw_attr_kset;
-	struct notifier_block nb;
 	struct wmi_device *wdev;
 	int ida_id;
 
@@ -979,102 +975,6 @@ struct capdata01_attr_group {
 	struct tunable_attr_01 *tunable_attr;
 };
 
-/**
- * lwmi_om_register_notifier() - Add a notifier to the blocking notifier chain
- * @nb: The notifier_block struct to register
- *
- * Call blocking_notifier_chain_register to register the notifier block to the
- * lenovo-wmi-other driver notifier chain.
- *
- * Return: 0 on success, %-EEXIST on error.
- */
-int lwmi_om_register_notifier(struct notifier_block *nb)
-{
-	return blocking_notifier_chain_register(&om_chain_head, nb);
-}
-EXPORT_SYMBOL_NS_GPL(lwmi_om_register_notifier, "LENOVO_WMI_OTHER");
-
-/**
- * lwmi_om_unregister_notifier() - Remove a notifier from the blocking notifier
- * chain.
- * @nb: The notifier_block struct to register
- *
- * Call blocking_notifier_chain_unregister to unregister the notifier block from the
- * lenovo-wmi-other driver notifier chain.
- *
- * Return: 0 on success, %-ENOENT on error.
- */
-int lwmi_om_unregister_notifier(struct notifier_block *nb)
-{
-	return blocking_notifier_chain_unregister(&om_chain_head, nb);
-}
-EXPORT_SYMBOL_NS_GPL(lwmi_om_unregister_notifier, "LENOVO_WMI_OTHER");
-
-/**
- * devm_lwmi_om_unregister_notifier() - Remove a notifier from the blocking
- * notifier chain.
- * @data: Void pointer to the notifier_block struct to register.
- *
- * Call lwmi_om_unregister_notifier to unregister the notifier block from the
- * lenovo-wmi-other driver notifier chain.
- *
- * Return: 0 on success, %-ENOENT on error.
- */
-static void devm_lwmi_om_unregister_notifier(void *data)
-{
-	struct notifier_block *nb = data;
-
-	lwmi_om_unregister_notifier(nb);
-}
-
-/**
- * devm_lwmi_om_register_notifier() - Add a notifier to the blocking notifier
- * chain.
- * @dev: The parent device of the notifier_block struct.
- * @nb: The notifier_block struct to register
- *
- * Call lwmi_om_register_notifier to register the notifier block to the
- * lenovo-wmi-other driver notifier chain. Then add devm_lwmi_om_unregister_notifier
- * as a device managed action to automatically unregister the notifier block
- * upon parent device removal.
- *
- * Return: 0 on success, or an error code.
- */
-int devm_lwmi_om_register_notifier(struct device *dev,
-				   struct notifier_block *nb)
-{
-	int ret;
-
-	ret = lwmi_om_register_notifier(nb);
-	if (ret < 0)
-		return ret;
-
-	return devm_add_action_or_reset(dev, devm_lwmi_om_unregister_notifier,
-					nb);
-}
-EXPORT_SYMBOL_NS_GPL(devm_lwmi_om_register_notifier, "LENOVO_WMI_OTHER");
-
-/**
- * lwmi_om_notifier_call() - Call functions for the notifier call chain.
- * @mode: Pointer to a thermal mode enum to retrieve the data from.
- *
- * Call blocking_notifier_call_chain to retrieve the thermal mode from the
- * lenovo-wmi-gamezone driver.
- *
- * Return: 0 on success, or an error code.
- */
-static int lwmi_om_notifier_call(enum thermal_mode *mode)
-{
-	int ret;
-
-	ret = blocking_notifier_call_chain(&om_chain_head,
-					   LWMI_GZ_GET_THERMAL_MODE, &mode);
-	if ((ret & ~NOTIFY_STOP_MASK) != NOTIFY_OK)
-		return -EINVAL;
-
-	return 0;
-}
-
 /* Attribute Methods */
 
 /**
@@ -1178,7 +1078,7 @@ static ssize_t attr_current_value_store(struct kobject *kobj,
 	u32 value;
 	int ret;
 
-	ret = lwmi_om_notifier_call(&mode);
+	ret = lwmi_tm_notifier_call(&mode);
 	if (ret)
 		return ret;
 
@@ -1237,7 +1137,7 @@ static ssize_t attr_current_value_show(struct kobject *kobj,
 	int retval;
 	int ret;
 
-	ret = lwmi_om_notifier_call(&mode);
+	ret = lwmi_tm_notifier_call(&mode);
 	if (ret)
 		return ret;
 
diff --git a/drivers/platform/x86/lenovo/wmi-other.h b/drivers/platform/x86/lenovo/wmi-other.h
deleted file mode 100644
index 8ebf5602bb99..000000000000
--- a/drivers/platform/x86/lenovo/wmi-other.h
+++ /dev/null
@@ -1,16 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-
-/* Copyright (C) 2025 Derek J. Clark <derekjohn.clark@gmail.com> */
-
-#ifndef _LENOVO_WMI_OTHER_H_
-#define _LENOVO_WMI_OTHER_H_
-
-struct device;
-struct notifier_block;
-
-int lwmi_om_register_notifier(struct notifier_block *nb);
-int lwmi_om_unregister_notifier(struct notifier_block *nb);
-int devm_lwmi_om_register_notifier(struct device *dev,
-				   struct notifier_block *nb);
-
-#endif /* !_LENOVO_WMI_OTHER_H_ */
-- 
2.53.0

