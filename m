Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE9FD2F12DA
	for <platform-driver-x86@vger.kernel.org>; Sun, 10 May 2026 04:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778387166; cv=none; b=TOCQCTd/WMMb9M+7yAOypmakSe5GEm46moZnimt8Tz1GnzEKG31OQtXjzt0cQC5+RFJpmCkaUsqhKzx4wRfQvcgdVgpeUOg8G3YPanuACofjfKMRod4j/j0WeyRsTSQjC58kGODYC97fuO3S+iJh71xUsli0zM2BOoz4JZFZtSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778387166; c=relaxed/simple;
	bh=OgxzN92YsSq8XXvmHxxPVvtGkiV1+rIsQMXH/cf1Bt8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C2ZOuedb+9AxRUeaW0Sxi/1hrX9Fz2PAtigGO6jjhKUVFZt1lldwTBaZvhdeGhL75OosG+gGn0KrJ7BqASu0JcWdG07IOE3avANbBchK+3/p6jtpqiYqCjxPr+RcgVsIBfOXjFpJgx1uTLyc7ICmCTTsG/Xn2vwNIE4zu84hf34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fUDRL7LC; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fUDRL7LC"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1309f4ee97fso4147533c88.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 09 May 2026 21:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778387163; x=1778991963; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vsqr/VZxyQ1YPkQlz6R0M08w/ShHAMNim70De2aBRuo=;
        b=fUDRL7LCeeSZLdOhEmK+p9TAXwlW2eRRZrOr9qOyrtBFTV7ewQBpshXgULkp5PjXJK
         A8eHCAJryjn36StGnsiQ/epJNU1qU3DikfZPmVhnwX7jZ9X7NWD+rqWVn+1M+E18wTpr
         sw3+DsMdhHjUZuD2FXIOCwE1x8ZwCmhxuS5ZyPW65awplynzLnnZxdFGN8yqWFINrnzQ
         Hj/gzaa3q4ukEwc155zpmVV9DDSqYGn4oHIE4f4Q+TNq//8yZEAH2Jd19Qjbor1mZyTa
         fxUf+V8Usl5APjsy3cNlLu7UhDpSFIdjZNMHMzxJgev1bMMwLSvAB7r5MQo99ot4aCe+
         6DWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778387163; x=1778991963;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Vsqr/VZxyQ1YPkQlz6R0M08w/ShHAMNim70De2aBRuo=;
        b=UCUQKuQKWD+LCBvIKjKYoosXN9VQhQNOjGqqg//9ecEpeKvVcXum5TqXyHfvx590/2
         nNyJ0V61JFFhJjJcP71ahf2CfDpfzFL20bdU/GZGJ9hG1AxRaZ3IyEajuZirRrZElmHn
         NMfyrShj7/EzT1thQ51jYbqyulmoIbY6ZkQaTBLrOvmPu1+yvoq8mRaPJDkuBGQwg4Yo
         tyo3AaMK9liufEtS6Cb6iHW+rqm+PHQl4zlSskl5Ol0ESbMLcxUlRovRZuzJVa8K46v7
         daxRbbHawEGjDGec8RJf0gAbX+DhMM8bcrDrGmVMiyoi6domz2HzaDVzhKqWGBENf/qZ
         7wyg==
X-Forwarded-Encrypted: i=1; AFNElJ8nWX1rP/BIjhkAa3AWhAcfCACMqfOZNv+Mo47pfuwo56gI7NYXXRUsizuL0nzCEXDfWUYwjCc76sQrWZD2YWigZR4y@vger.kernel.org
X-Gm-Message-State: AOJu0YxWfpI5Sa/2wDI1mnxNltWsWMQqyqesXmFsQe/WWtxkZfUK/S6y
	zQ5DgGr6sK/ymWefNua4QHJOaP0sxBl8lsTDKg63h5GA5pZPhAu2nlr/
X-Gm-Gg: Acq92OE36RQLAHI7vwPDhNDZpqrG81NaDwh6GAYuwDih1r0naZax1dlvpU+MMbRm94i
	q0R+hSJcB5MA3w3InTgseZiR10GMVspQ3qXosqbhvXWXQCpfoSs7L+7uH/wa0vL7lLFTWElT6IF
	Mg1iS654OgwPBjq34/KZQmt/bFaaM7mRCHCAIEhnsx/QxeH5+0fwGn5gk/FY0DF4mAdvzjokm4+
	no606foBW2LiyHl8qN/jdVYpYx4mc5B+oJ04IEdc3iVc2eKPubGd3wgs7qt97RNWdCRbUQfhvqf
	apeYKm20QvIKKAg0fhZHgW2xnAHQM3u3XAuWVOp7g+Ol/dQaBGgwZwYtViqsBX3trbD+8RoipdX
	y9+ZN5tunI+1lUAWZK171ttYlUgNgR3rllL6l5ARnvDBjx+p/WGRgXP4v+4b+SoI8oEOz9J5ckE
	xSX9QCJiHBRS3U6YeIECC9bbf/Ca5WRvExBs/1yUlvTSTWQXQaQZCTfslUjZV/2vnMv0POJse8m
	wpI
X-Received: by 2002:a05:7301:7c12:b0:2f2:6dde:df50 with SMTP id 5a478bee46e88-2f54d79bc2dmr9452002eec.17.1778387162907;
        Sat, 09 May 2026 21:26:02 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8862d3047sm10069960eec.10.2026.05.09.21.26.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 21:26:02 -0700 (PDT)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>,
	Armin Wolf <W_Armin@gmx.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Rong Zhang <i@rong.moe>,
	Kurt Borja <kuurtb@gmail.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	"Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	marshall@shzj.cc,
	hyacinth@shzj.cc,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v12 16/16] platform/x86: lenovo-wmi-capdata: Add debugfs file for dumping capdata
Date: Sun, 10 May 2026 04:25:46 +0000
Message-ID: <20260510042546.436874-17-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260510042546.436874-1-derekjohn.clark@gmail.com>
References: <20260510042546.436874-1-derekjohn.clark@gmail.com>
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
also convert the former to include the latter anonymously
(-fms-extensions, since v6.19). This is declared as a union in the
capdata01 struct, with both the anonymous declaration and as a named
member to avoid type casting when passing just the capdata00 struct
pointer.

Tested-by: Kurt Borja <kuurtb@gmail.com>
Signed-off-by: Rong Zhang <i@rong.moe>
Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
v12:
  - Make capdata00 a union of an anonymous member and a named member of
    capdata01 to avoid casting when capdata00 is accessed directly.
---
 drivers/platform/x86/lenovo/Kconfig       |   1 +
 drivers/platform/x86/lenovo/wmi-capdata.c | 120 ++++++++++++++++++++++
 drivers/platform/x86/lenovo/wmi-capdata.h |   7 +-
 3 files changed, 125 insertions(+), 3 deletions(-)

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
index 169665be4dcf..63561af734c8 100644
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
+	lwmi_cd00_show(s, &cd01->cd00);
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
index a49229cec245..92098aeeee84 100644
--- a/drivers/platform/x86/lenovo/wmi-capdata.h
+++ b/drivers/platform/x86/lenovo/wmi-capdata.h
@@ -38,9 +38,10 @@ struct capdata00 {
 };
 
 struct capdata01 {
-	u32 id;
-	u32 supported;
-	u32 default_value;
+	union {
+		struct capdata00;
+		struct capdata00 cd00;
+	};
 	u32 step;
 	u32 min_value;
 	u32 max_value;
-- 
2.53.0

