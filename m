Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8844139FCA7
	for <platform-driver-x86@vger.kernel.org>; Mon,  6 Apr 2026 20:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775506457; cv=none; b=qUrhaT8Oz3/o3rCCJ5P3YHGg03LXXB5oyxTWiH0K7Yn5fiP4yLnSOFKepjzcVYBzMwAU69lXQILcmSApi+6WeBHboK88fQchKQ/FAUzwNfgU3Q04U97I/dWAEipIIBI0P5SxGk689I8Q4jn5ZOc7logUiOMVpSrJpNJy5OUTaBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775506457; c=relaxed/simple;
	bh=cvE6jnfJKB7PyqI9IxmPPiPq9P+SLWPdZ3/G/ov1JPg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ONfxpxrNabp/EcVDzvKRHqfMEXC5FfAjwlui+vRDgtwWenElFBCieY7mlFXrPxivWmqfg4snixvLYBxT1sI94Kj9RHQSyexseGSTsGdROj/e8jGZdCd/v+/YqFGbxUYg0h3MRLGc5iZUIhi7rYuP5Nv1v807n3FrLPLJ7xYl9wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fHfPIvQr; arc=none smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fHfPIvQr"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-12732165d1eso5866606c88.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 06 Apr 2026 13:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775506454; x=1776111254; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dYDxYM+Wzx9ftLc+PRy/V3d4RDtxf8o4zddjc5rqdI0=;
        b=fHfPIvQrl54CWHaoheqyCOSkNyY6DLZD1HEsZhkrNLc2tZvnE+Yb35hIzKmjiF4dZt
         GxHisw4QbioS6qFwM6iDQ1F1KyRfWzY56BEClfyHiwSQcCw/fFyofQIwdQsSCdeWLpSp
         9rLJJVyZVBv+hInZu3YkK6/XO2pR2JC5DZakOQ5rS7vxN0gnmYhsdpA4KAQO2yRcH4fm
         SW8J7aLUfzBuQm/mUt6hOLzQLbIaUI+d4XFUauEs9s26/zqqzmiBQNIKnH8PKpaNTebv
         NRozNmCS5hFaM0b+PNTftBcv9/A6M9DpA30uZQYDSQFtXSO2coAjf1gHNuVkrInAr7AQ
         SOqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775506454; x=1776111254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dYDxYM+Wzx9ftLc+PRy/V3d4RDtxf8o4zddjc5rqdI0=;
        b=dm0B0e3dWacuiszM02MZhJwDbAwfFCDW++H5RBtFfnn0Ghsdu7vkmQsCB5m1IkrL/N
         yIr3O0b7KxWaeEo3gYH7z4d/F9W9P0sHQdCsRpzBe26lz/gXU9GCSPjvBd+2GSKGw4rT
         Tk7+AN1zao5d10oNx/G4TkNskTnrFn5Ykeh6sMkX2dbS3/8eVX1YfzcEcciUcX6WKO1m
         HAjbUKU9noLu6Qlrj8h353VbK2gQEZGj1d6kaAeJqw2zmMTGl4rXWIRavYUREc9GlDUm
         3vmjGHVr5PMFAIqajeyAZchdL2DtVYWoOk/yk1PdNGe85AtWlMkpMpaE+bLZkrot8FTH
         oUJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJ8TZeRt4+5iIVZb8+sHWkXZB1Ih6k2f2U+KZEUQzxvY45NjiEut03Yf2j63ygTrNx1VPOOLMestO+bym4NZ8hIJLy@vger.kernel.org
X-Gm-Message-State: AOJu0Yyrc2zVX6ubM3UFNb//tXXR6/7gTNPA7fmjTgJGb1taZhBaeLkU
	ErDrWsEg0FoZkg2H5ws2LDMu89DkAtWCFl1Y39EcBPdicWrJkaJ48O8H
X-Gm-Gg: AeBDievRw6LpDj4pQe8LgKqCjfBzGK31hzZ9JgNRzDvxDfYBoF5DKlQIpY5b623T8Ug
	tjS279wLdbL5xsj38hFJhlWrtoTHv1cVJdvMzC9929tRArjL0ctMR2KdBO7n02Wl1LJIBodyrBo
	yKoNj3OPTLSWtv/X1pp1ZoG7GZ/winB1eL/vr11GGyIya3RBQMfPzPWiQuI3g2L5hQJkZ/l80Ri
	0eHzXiocdb9htxHA8XZiadbBXzX5igxzh+Llh9U8/TAYjDouT2eUT2fuRyR46yVMfvAdE+LsnGY
	XZsj9OouzoOZjAkk8h8puXHDKSxA5PAxYDNJLZ6aGVO9UushgwS310ZXbrc3javullufg67vqyy
	RTCCSo16kGCWxO8b5DHVw6rXQaHuSa3P5URxm+GmUbaCYqQuQ4TMFna6NGys1z/Flp5+fwOWghO
	9E4CLjM1qEzZxP/SGEsegJIybqTD7hT33yuqq3IIPAvtv0SLdfpfzZRpI/dZpAV0PlPgBkn1uaE
	qBR
X-Received: by 2002:a05:7022:62aa:b0:12b:f899:7185 with SMTP id a92af1059eb24-12bfb711224mr6681225c88.16.1775506454096;
        Mon, 06 Apr 2026 13:14:14 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12bed93f861sm17022333c88.0.2026.04.06.13.14.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 13:14:13 -0700 (PDT)
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
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 16/16] platform/x86: lenovo-wmi-capdata: Add debugfs file for dumping capdata
Date: Mon,  6 Apr 2026 20:14:00 +0000
Message-ID: <20260406201400.438221-17-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260406201400.438221-1-derekjohn.clark@gmail.com>
References: <20260406201400.438221-1-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rong Zhang <i@rong.moe>

The Lenovo GameZone/Other interfaces have some delicate divergences
among different devices. When making a bug report or adding support for
new devices/interfaces, capdata is the most important information to
cross-check with.

Add a debugfs file (lenovo_wmi/<device_name>/capdata), so that users can
dump capdata and include it in their reports.

Since `struct capdata01' is just an extension to `struct capdata00',
also converts the former to include the latter anonymously
(-fms-extensions, since v6.19). In this manner type casting won't be
confusing.

Signed-off-by: Rong Zhang <i@rong.moe>
Tested-by: Kurt Borja <kuurtb@gmail.com>
Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
 drivers/platform/x86/lenovo/Kconfig       |   1 +
 drivers/platform/x86/lenovo/wmi-capdata.c | 120 ++++++++++++++++++++++
 drivers/platform/x86/lenovo/wmi-capdata.h |   4 +-
 3 files changed, 122 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/lenovo/Kconfig b/drivers/platform/x86/lenovo/Kconfig
index b9a5d18caa1e..4443f40ef8aa 100644
--- a/drivers/platform/x86/lenovo/Kconfig
+++ b/drivers/platform/x86/lenovo/Kconfig
@@ -236,6 +236,7 @@ config YT2_1380
 config LENOVO_WMI_CAPDATA
 	tristate
 	depends on ACPI_WMI
+	depends on LENOVO_WMI_HELPERS
 
 config LENOVO_WMI_EVENTS
 	tristate
diff --git a/drivers/platform/x86/lenovo/wmi-capdata.c b/drivers/platform/x86/lenovo/wmi-capdata.c
index 169665be4dcf..b5e2c16d638f 100644
--- a/drivers/platform/x86/lenovo/wmi-capdata.c
+++ b/drivers/platform/x86/lenovo/wmi-capdata.c
@@ -31,6 +31,7 @@
 #include <linux/cleanup.h>
 #include <linux/component.h>
 #include <linux/container_of.h>
+#include <linux/debugfs.h>
 #include <linux/device.h>
 #include <linux/dev_printk.h>
 #include <linux/err.h>
@@ -42,6 +43,7 @@
 #include <linux/mutex_types.h>
 #include <linux/notifier.h>
 #include <linux/overflow.h>
+#include <linux/seq_file.h>
 #include <linux/stddef.h>
 #include <linux/types.h>
 #include <linux/wmi.h>
@@ -88,6 +90,7 @@ struct lwmi_cd_priv {
 	struct notifier_block acpi_nb; /* ACPI events */
 	struct wmi_device *wdev;
 	struct cd_list *list;
+	struct dentry *debugfs_dir;
 
 	/*
 	 * A capdata device may be a component master of another capdata device.
@@ -118,6 +121,8 @@ struct cd_list {
 
 static struct wmi_driver lwmi_cd_driver;
 
+/* ======== Device components ======== */
+
 /**
  * lwmi_cd_match() - Match rule for the master driver.
  * @dev: Pointer to the capability data parent device.
@@ -471,6 +476,116 @@ EXPORT_SYMBOL_NS_GPL(lwmi_cd01_get_data, "LENOVO_WMI_CAPDATA");
 DEF_LWMI_CDXX_GET_DATA(cd_fan, LENOVO_FAN_TEST_DATA, struct capdata_fan);
 EXPORT_SYMBOL_NS_GPL(lwmi_cd_fan_get_data, "LENOVO_WMI_CAPDATA");
 
+/* ======== debugfs ======== */
+
+/**
+ * lwmi_cd00_show() - Dump capdata00
+ * @s: Pointer to seq_file where the capdata00 is dumped.
+ * @cd00: Pointer to a capdata00 struct to be dumped.
+ */
+static void lwmi_cd00_show(struct seq_file *s, struct capdata00 *cd00)
+{
+	u8 dev = FIELD_GET(LWMI_ATTR_DEV_ID_MASK, cd00->id);
+	u8 feat = FIELD_GET(LWMI_ATTR_FEAT_ID_MASK, cd00->id);
+	u8 mode = FIELD_GET(LWMI_ATTR_MODE_ID_MASK, cd00->id);
+	u8 type = FIELD_GET(LWMI_ATTR_TYPE_ID_MASK, cd00->id);
+	bool extra = cd00->supported & ~(LWMI_SUPP_GET | LWMI_SUPP_SET | LWMI_SUPP_VALID);
+	bool get = cd00->supported & LWMI_SUPP_GET;
+	bool set = cd00->supported & LWMI_SUPP_SET;
+	bool valid = cd00->supported & LWMI_SUPP_VALID;
+
+	seq_printf(s, "  id:             0x%08x [dev: %2u, feat: %2u, mode: %2u, type: %2u]\n",
+		   cd00->id, dev, feat, mode, type);
+
+	seq_printf(s, "  supported:      0x%08x [%c%c%c%c]\n", cd00->supported,
+		   extra ? '+' : ' ',
+		   get   ? 'R' : ' ',
+		   set   ? 'W' : ' ',
+		   valid ? 'V' : ' ');
+
+	seq_printf(s, "  default_value:  %u\n", cd00->default_value);
+}
+
+/**
+ * lwmi_cd01_show() - Dump capdata01
+ * @s: Pointer to seq_file where the capdata01 is dumped.
+ * @cd01: Pointer to a capdata01 struct to be dumped.
+ */
+static void lwmi_cd01_show(struct seq_file *s, struct capdata01 *cd01)
+{
+	/* capdata01 is an extension to capdata00. */
+	lwmi_cd00_show(s, (struct capdata00 *)cd01);
+
+	seq_printf(s, "  step:           %u\n", cd01->step);
+	seq_printf(s, "  min_value:      %u\n", cd01->min_value);
+	seq_printf(s, "  max_value:      %u\n", cd01->max_value);
+}
+
+/**
+ * lwmi_cd_fan_show() - Dump capdata_fan
+ * @s: Pointer to seq_file where the capdata_fan is dumped.
+ * @cd_fan: Pointer to a capdata_fan struct to be dumped.
+ */
+static void lwmi_cd_fan_show(struct seq_file *s, struct capdata_fan *cd_fan)
+{
+	seq_printf(s, "  id:             %u\n", cd_fan->id);
+	seq_printf(s, "  min_rpm:        %u\n", cd_fan->min_rpm);
+	seq_printf(s, "  max_rpm:        %u\n", cd_fan->max_rpm);
+}
+
+/**
+ * lwmi_cd_debugfs_show() - Dump capability data to debugfs
+ * @s: Pointer to seq_file where the capability data is dumped.
+ * @data: unused.
+ *
+ * Return: 0
+ */
+static int lwmi_cd_debugfs_show(struct seq_file *s, void *data)
+{
+	struct lwmi_cd_priv *priv = s->private;
+	u8 idx;
+
+	guard(mutex)(&priv->list->list_mutex);
+
+	/* lwmi_cd_alloc() ensured priv->list->type must be a valid type. */
+	for (idx = 0; idx < priv->list->count; idx++) {
+		seq_printf(s, "%s[%u]:\n", lwmi_cd_table[priv->list->type].name, idx);
+
+		if (priv->list->type == LENOVO_CAPABILITY_DATA_00)
+			lwmi_cd00_show(s, &priv->list->cd00[idx]);
+		else if (priv->list->type == LENOVO_CAPABILITY_DATA_01)
+			lwmi_cd01_show(s, &priv->list->cd01[idx]);
+		else if (priv->list->type == LENOVO_FAN_TEST_DATA)
+			lwmi_cd_fan_show(s, &priv->list->cd_fan[idx]);
+	}
+
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(lwmi_cd_debugfs);
+
+/**
+ * lwmi_cd_debugfs_add() - Create debugfs directory and files for a device
+ * @priv: lenovo-wmi-capdata driver data.
+ */
+static void lwmi_cd_debugfs_add(struct lwmi_cd_priv *priv)
+{
+	priv->debugfs_dir = lwmi_debugfs_create_dir(priv->wdev);
+
+	debugfs_create_file("capdata", 0444, priv->debugfs_dir, priv, &lwmi_cd_debugfs_fops);
+}
+
+/**
+ * lwmi_cd_debugfs_remove() - Remove debugfs directory for a device
+ * @priv: lenovo-wmi-capdata driver data.
+ */
+static void lwmi_cd_debugfs_remove(struct lwmi_cd_priv *priv)
+{
+	debugfs_remove_recursive(priv->debugfs_dir);
+	priv->debugfs_dir = NULL;
+}
+
+/* ======== WMI interface ======== */
+
 /**
  * lwmi_cd_cache() - Cache all WMI data block information
  * @priv: lenovo-wmi-capdata driver data.
@@ -773,6 +888,8 @@ static int lwmi_cd_probe(struct wmi_device *wdev, const void *context)
 		dev_err(&wdev->dev, "failed to register %s: %d\n",
 			info->name, ret);
 	} else {
+		lwmi_cd_debugfs_add(priv);
+
 		dev_dbg(&wdev->dev, "registered %s with %u items\n",
 			info->name, priv->list->count);
 	}
@@ -783,6 +900,8 @@ static void lwmi_cd_remove(struct wmi_device *wdev)
 {
 	struct lwmi_cd_priv *priv = dev_get_drvdata(&wdev->dev);
 
+	lwmi_cd_debugfs_remove(priv);
+
 	switch (priv->list->type) {
 	case LENOVO_CAPABILITY_DATA_00:
 		lwmi_cd_sub_master_del(priv);
@@ -822,6 +941,7 @@ static struct wmi_driver lwmi_cd_driver = {
 
 module_wmi_driver(lwmi_cd_driver);
 
+MODULE_IMPORT_NS("LENOVO_WMI_HELPERS");
 MODULE_DEVICE_TABLE(wmi, lwmi_cd_id_table);
 MODULE_AUTHOR("Derek J. Clark <derekjohn.clark@gmail.com>");
 MODULE_AUTHOR("Rong Zhang <i@rong.moe>");
diff --git a/drivers/platform/x86/lenovo/wmi-capdata.h b/drivers/platform/x86/lenovo/wmi-capdata.h
index e0a30f2c0c87..0df3ae534ed5 100644
--- a/drivers/platform/x86/lenovo/wmi-capdata.h
+++ b/drivers/platform/x86/lenovo/wmi-capdata.h
@@ -38,9 +38,7 @@ struct capdata00 {
 };
 
 struct capdata01 {
-	u32 id;
-	u32 supported;
-	u32 default_value;
+	struct capdata00;
 	u32 step;
 	u32 min_value;
 	u32 max_value;
-- 
2.53.0

