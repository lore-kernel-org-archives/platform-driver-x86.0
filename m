Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F343D3B95E3
	for <platform-driver-x86@vger.kernel.org>; Sat, 11 Apr 2026 16:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775924631; cv=none; b=IMZ/Grcbc+oyDshP4sB1WO/R6UWh3dJ0xxtOpFuRJ5U91f0wZFKYtYQa7koHh8hZ3B46PXxGDstjzXxrFSXU4vt3tJ/WNv4vTaYM4EGH/eqy52w9hExqUa0MUdpmreCetOsLGeAY0vuN3Awkw3y2pYM92Ttv53pmUDkVlU1t5JE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775924631; c=relaxed/simple;
	bh=ZmXhWCRPkzi5nSZOzkOVzZtTzDx5rrOdANioh4FSUb8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JHtpbwr1FpVchRQ2Z5PPhWW/7448NyUMnjjLgv+A5lwDXnx2ATOMiizk9DxgIdbHvplcSu5T3vpJ7S+rsG/nbU0J8VlUUpCsDDihJYjS83jHjDlKv2hb5aiTrSRKwJXYqrMu4rM0+X643aPTkThaB0ommqEIHjHpJizfvXobnCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pcJGDRYg; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pcJGDRYg"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2c56aa62931so5023450eec.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 11 Apr 2026 09:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775924629; x=1776529429; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=myMYYqTqp1LBWmWIy6uL5gTbQy4ZdtNkIDqtI6ndFyI=;
        b=pcJGDRYgVauD6ZSqyf43XN4YOHYhpIx3KR2oSZ/VR/TkJBcygNC7AQ/6/QwcUklnmu
         PqCkv9G/ZHmC4w0DKv+WJ4tirSb82TT1XSFn7V6Uh4B8rLj3dmH26adC6JUuVxK8shOI
         dfxEmuj/XmFIWAXqfHt+WALSirQSaXunjnPM60q7z/35qtBAhnNyrgA39fnIFBcXxnUh
         q2gfz+G6LIQJRvpXPui4htGI6LlmB+Q0xIX9TOtvYOkIKfGqDa+kJdHxkpG+NPvENxcJ
         /vjBvANV+w1oe+S7JkA4gG/p8oVK9zV0IG4bOcmsEbbpaOjCtoY+gDgXxKF9Tdsf09kV
         eEoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775924629; x=1776529429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=myMYYqTqp1LBWmWIy6uL5gTbQy4ZdtNkIDqtI6ndFyI=;
        b=L6GRKIce284QqDoFVswtwETXHKW2tRYr6IgCY2yquy6FJIQVY/Ggbt1VhR3DIOHMV5
         a7mvhuzcTP4dtzztRxI5X60twUqmawi0XRazGHCGXFpY6aanb9SoDj6IMi8p1mYJtY+k
         HaRiNI5JY3e0StXHgmewTaMBr9e9tkZj/svP12FJzXJZ/nNMVuUCwZyTEuOcsBASerSm
         JLmAU/fkOYT0Uf2JfaPrNWwV8oExhGwPytKsUof7fPP+MYyJ7uSNYtR1jjiAsh1JCBQQ
         Dqw21HE3wjiwH2EHWS0qF+0Qx3XA7AYSOFqi2fEdrIIR1SUjYIhvJ+22HjjNlXsQ8NwK
         6fzQ==
X-Forwarded-Encrypted: i=1; AJvYcCWjjC50LCRQGxsUviw5iGQXrZ8JtVwaPMbwUgUPvca3HdWQ0VfBFG8XmVTF503f9VW9A8ewCK+32JcOGJfoyNGeqdwD@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/ar0vXdatPLIx86Cy8Qm4WzE3nWQ9cBTnelfsTkNw8o5qGvWd
	TKoFzvroNYaSf51J/ynwG71ioXvzvH3kMhIspmBEu8ZX40EbtuprHUYq
X-Gm-Gg: AeBDievnAnit21btDQuVZFish86xSxo0puzFCnefKTtcm4oCZ34vXg045bhcj9WVZ2I
	4E/2bZZ+8oMf43z9rYsO4Pil+oLYjmJlKpp4Q3gGMt0KgXhd4rvUq1yZBNSACuDmIT+ruEGSMcu
	L4SBxqJ0cLvSkPrPlMgvtUhbkbQxUgFKOWwfgnM9njba9d/tHArD1Voz3rb85Asc0dHdqVLsmIc
	KZ4uJpZpYcCI9wzCbYSUaDPOqNw2Symz8yTaGuc9xr8s7i1UiZgNlQFjDY8DEiCQGmGYSpj+uLt
	N0jo/z5hJ5LADwCKfql31yB1+YEpNWhOh2QP9Azr1xwL494YW9oqIKggYesJ2Zm5ossbAqVTIaB
	65V+BL4pgZFdMUi70USeoccnIYyzHmYj0RMLdLUkH58gS34MRKogoG4Zp/q+ITK/c1ADMSr5Taj
	6d8MdgvN/QPsIOi4IwicqXY6rzGHVa+eS6/0UsrBgx1B6f02eNRa8whFNlOdSbzYG6XOckkcyZ3
	F9x
X-Received: by 2002:a05:7301:608a:b0:2d4:2cc8:68e with SMTP id 5a478bee46e88-2d5896611e5mr4482993eec.16.1775924628807;
        Sat, 11 Apr 2026 09:23:48 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d55ce46a65sm9358907eec.0.2026.04.11.09.23.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 09:23:48 -0700 (PDT)
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
Subject: [PATCH v9 16/16] platform/x86: lenovo-wmi-capdata: Add debugfs file for dumping capdata
Date: Sat, 11 Apr 2026 16:23:34 +0000
Message-ID: <20260411162334.25682-17-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260411162334.25682-1-derekjohn.clark@gmail.com>
References: <20260411162334.25682-1-derekjohn.clark@gmail.com>
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

Tested-by: Kurt Borja <kuurtb@gmail.com>
Signed-off-by: Rong Zhang <i@rong.moe>
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

