Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6231338E8CD
	for <platform-driver-x86@vger.kernel.org>; Tue, 12 May 2026 23:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778630299; cv=none; b=ugEK1ywqdbbNXjA3oUEgtdsnKKx+6OJKr3VIU62nXnE4BGuSKOfDpce9ZF3Dd5DP+TcK6NYrRBrGGS/cLTO+T20cgalFtnPAsGNcbHLiJJ+wcwPTajCl9JDEwTASf3Ddc08wBEM5S8wZnLDaX6WwdE5kDbeneHbBKXtXyDH1N4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778630299; c=relaxed/simple;
	bh=PMQb3zR86C6B8YYGFksu8QgaO8McJvzRKVARHfl1SVs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d8D7auIjsckUybRQW3v9gR9W/n7HwLUvvSkCFdxRODjuNhA0aDY3DOiTaUn52W61P70cnuHMTHzrmAzXTvPeUoOa+aYFg1DgAzudcYKSQCOTFt2x3E1Cb+QXpEQZSY1kcrENiUtj5oW0rf+6A3R/JerEHvsd15dA2Imy7NBx8uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k4Yx+iau; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k4Yx+iau"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2f36da5c8fbso6115069eec.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 12 May 2026 16:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778630297; x=1779235097; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UFDEHciNgTBMetNN4oXhJG9zuLjkzYr+k/kwmV3qsh0=;
        b=k4Yx+iauKyPp7zAlprG0+RvLfn//slb7Wi/e46BtOnixAnNeivx0ATWPqnZWqL/PC8
         yWEgdcz9sPhgwCeZlO6gSJBzAHpZPonH5G3iQ8fKpnxNaX1fT+hs6XlWGXB/yNdtKyjT
         wTlQCIhXr197QTNdhkEDPOaOjjkSovcZdagacODQPsxcmyzx+HvMtHMH1k81YGMZ82wO
         CkWYaEss/tK45TF2VE5exO30sCvdJWcXjRTFx1rGjYo9CiHr3LZPs8FO9HLk/F/hf+tb
         ZAXi9ri+IF1GAJyfZoY2noj77l7yxTlTZgJvBjvr0WlBSKvZo1zfTRlL/t1xEr9gRVVs
         YO2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778630297; x=1779235097;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UFDEHciNgTBMetNN4oXhJG9zuLjkzYr+k/kwmV3qsh0=;
        b=SN9GCKcV+h9sBQcOdNzO2V4Y9jEIb4QX0KZb/M51z95wz4tWdSPj3TMayXOURJ3clr
         xpO8/Och6pBOI8bJMYkwX/I2InUGtWpa5/w7Zh/9DhNlivSYEeSdSz0G55J+ZAEXAlpr
         aW4XXcfokNe+QN9eYyJB7qDIrh6nc2zZOey1YSIl2YNpTA7Gn2lXIvkU3YgfFg3m2Mg6
         XFnmaaXj3xbYQTyakVq4BeJu++fJLbBtMA2nOupUVgHP6bIyrctkjh87oyGL/f8rWTCv
         tifUnZQVYxK2uknJPZ2hUmRvfOLOv26FIb//PPYXCm8+C8D7xS05f++tXuoR5SzZnb9e
         ikzA==
X-Forwarded-Encrypted: i=1; AFNElJ+RBYLD2QN920K9IWSCNQippbtORRI+ulBKwnp5RfMezABwXWwdV/fNJ+XOlw90nDyR3lEHuHqNA7HL/o96o0L9bXrd@vger.kernel.org
X-Gm-Message-State: AOJu0YzmLLLPW1fDbpGGpmhKAGryzdBPvbH7mV25xB1rjrLlK4ztwlOi
	JfYC67Hw+O0YoMQ0xN8pfsmfUgs9jY8QFRTHr4f9EetIj67SFsoLJk23
X-Gm-Gg: Acq92OHbo/VXUj3RyWlxL4UuIGnFoN7dDEnQAaQ/9mOpN7o1lWhS2OoE6sy0K4ZzXyo
	DiJqlwVTtG1RmqiP3Fe4jvsOXrdH8EHubKYH17ZuF9cQEWo9KryxwJW3mHq7iS2WQrBHjnAtjZN
	qiwsA95i5uuXkUY5DhK/xgKQ3GvG0yyemCUetMokZahad16YbkTyP8Luhkd0RPMGsdMM34iPn55
	10dgUWBL7PVT7cePyesYY6DL8pOHlHURuEof8f6Klf8/DV+1GFjrz7cJefXl5oEy5VOZ8Ip0Pgt
	IqKxr766mZDcrOrUdR6XJewJdE5B5GQn4JPmUrAvuaXTae5T9iba02OXE95opcmuLKbvIqZA18S
	74n2Ev2us+ktYLH29yK77VoYVXS2zfb3ZWLALZcxE6ZXDqhBFNc97gwe2/uPKf09Nllj5vwVN4d
	SJ1O0ZgE1UjZGfndgS3NpyXLRVIDz+cRGfSGIrG311wNj6xvRSS1qG7Vo3nksaHm3dN7o71GU5c
	ZAR
X-Received: by 2002:a05:7301:1292:b0:2ed:e12:376d with SMTP id 5a478bee46e88-3011a468e45mr715170eec.35.1778630296503;
        Tue, 12 May 2026 16:58:16 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f888e3e285sm23625851eec.27.2026.05.12.16.58.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 16:58:16 -0700 (PDT)
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
Subject: [PATCH v13 7/7] platform/x86: lenovo-wmi-capdata: Add debugfs file for dumping capdata
Date: Tue, 12 May 2026 23:58:08 +0000
Message-ID: <20260512235808.691046-8-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260512235808.691046-1-derekjohn.clark@gmail.com>
References: <20260512235808.691046-1-derekjohn.clark@gmail.com>
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
index 714aa6fd6f1f..d5e961566136 100644
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
@@ -87,6 +89,7 @@ struct lwmi_cd_priv {
 	struct notifier_block acpi_nb; /* ACPI events */
 	struct wmi_device *wdev;
 	struct cd_list *list;
+	struct dentry *debugfs_dir;
 
 	/*
 	 * A capdata device may be a component master of another capdata device.
@@ -117,6 +120,8 @@ struct cd_list {
 
 static struct wmi_driver lwmi_cd_driver;
 
+/* ======== Device components ======== */
+
 /**
  * lwmi_cd_match() - Match rule for the master driver.
  * @dev: Pointer to the capability data parent device.
@@ -470,6 +475,116 @@ EXPORT_SYMBOL_NS_GPL(lwmi_cd01_get_data, "LENOVO_WMI_CAPDATA");
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
@@ -772,6 +887,8 @@ static int lwmi_cd_probe(struct wmi_device *wdev, const void *context)
 		dev_err(&wdev->dev, "failed to register %s: %d\n",
 			info->name, ret);
 	} else {
+		lwmi_cd_debugfs_add(priv);
+
 		dev_dbg(&wdev->dev, "registered %s with %u items\n",
 			info->name, priv->list->count);
 	}
@@ -782,6 +899,8 @@ static void lwmi_cd_remove(struct wmi_device *wdev)
 {
 	struct lwmi_cd_priv *priv = dev_get_drvdata(&wdev->dev);
 
+	lwmi_cd_debugfs_remove(priv);
+
 	switch (priv->list->type) {
 	case LENOVO_CAPABILITY_DATA_00:
 		lwmi_cd_sub_master_del(priv);
@@ -821,6 +940,7 @@ static struct wmi_driver lwmi_cd_driver = {
 
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

