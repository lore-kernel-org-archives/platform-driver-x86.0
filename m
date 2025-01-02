Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C75946C;
	Thu,  2 Jan 2025 00:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735778952; cv=none; b=lZVa93RPkMCHh2hEXxkaAi8C1OKFqBmff7HXPk84j7erqLJqTI+GFN/U0V1GhO1Tyz2A6ZDliYS8o28t1nBaWzsq1EpHTydnuSSv9f1OqtiHXEG61ja8PYyvOoX2J9N9aF0UhcIU0QhRo6sFyx045enoaN6KYUcEBOTLNlfCyr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735778952; c=relaxed/simple;
	bh=3xK4i6Y72IF7e2YfCs2OikbTfSJkNhd4dXRMwqyzO34=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i00pezplkRSTrIjbKM/eehBbUsIm9fmRVBPeezZY4YxUFQvjLm7UXfuB8Dxqft8bH2uO2WR8WPdyL6x0uYDRHJF6lDJVdiuIWsLVlOhFuPVUIVHsP/08BT5qgvMti2Tq7eaIwAvA5/v7PYIN1v+0EKFHxE8Oki7tmq5syns0/cI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TftqaFoI; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TftqaFoI"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-21644aca3a0so62229075ad.3;
        Wed, 01 Jan 2025 16:49:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735778950; x=1736383750; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mutDscxqMcbCo3fe7ti2EhyV+2OLpjf/46O5Nen6FGg=;
        b=TftqaFoILKOeOSIJpsRpvXWwz5TS7dx4FiG3DTxIN8xGZA92Z9ycytFA8Lyw0BAarF
         y7rUeHWHiWFUpuU2MaDQUZE5+3C57G8oUmETug8YDIxV6IvhDuCEEmGVs8+gd0hHp3Bl
         qaW1GKJBVa6dJTpnDZaxK8tS+DBsnIZNanIxF/CUC/0PijV9Z9VlBjX7K+R8IrQ1rbDj
         dX2BQBWEPmM+BItxF5DpfcqXQqCVu35YcszeEVysPUf2nzIYelnFxRs//A459ngQ2c69
         1XnWFn07Md+2R51FGB9kBIr/idQjYNBy6vd6vDHjA1pnWPyl59hdYFoEl9tA4QDTOmfx
         MuUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735778950; x=1736383750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mutDscxqMcbCo3fe7ti2EhyV+2OLpjf/46O5Nen6FGg=;
        b=bFqbJiOZLOrQBShPDRQq2+iOw4lJn7+ggIN5CXWi2Rx9g9Knh//I9K4wYD0HoXIEUb
         CZgy+rGHhLSy1WbWPeztB199wU9kk2ssJrbi7qkczdzlv7h6TKTCFx+G2tKA977rim7v
         /BleSSXFl/htqov0ATx6z/qXhpFcvrC/oIgwojl5j3Z3Q0XYOeTj4igU86Op85f6bDum
         FKF9dG4eI4JD2LlfJtSnEOGevOqYw2v1x0HefjCEluEswXVBDpQ8Giw7Vqkzhz9wTd+Z
         bQX1zqCgDi1KHOocLKN5zRrxaHAuTUSIGPC7zVq9KNTmilEBcgFsICStW8uqla//gbcd
         nd3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVZEwhmmBcWFyK6jjBepa5O3mLiiBZqXhcIStPtDCXVe7ZLy/chRgfLkaczwG7rFXWs5otxMd9y7RLgqQ4DO1PNmiJRYQ==@vger.kernel.org, AJvYcCWlr7RpqMtjUrOe/jL5zXi/uCy1udvFfzsiL7uzbMosxP6nvrxR2Cf660jo2XGoRhEpQqh4r6gpJtd7M64+@vger.kernel.org, AJvYcCXDodVxiSCR0Qnr/JUvWNPXWo7YlM33gTdmQ4hi+e4oXHuSq7PQEFEkOhIp3iABzBR6nIT47lBP7k4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUCsWrPZ4tah+EI3lKNPZjm4uj6kmoldXJD9ySEtdDSM2+HxYG
	o6Kg3eJhZtJ4NnWtULdD4y429fIwiSixiv/Mo7NmpOTbXOk0K8ov
X-Gm-Gg: ASbGncuO0uW8gPyLk3Ic2QoCedkpPdBvmPLhnFAIzwKrzMiGOc3H1SBF64sPSuOxUv9
	hhEVeCJDrFI6l81HAauQ2NGVBC4VTUpVNEYwwX7I6rlIOs+qFzKivs+wj4MfuNR9bCwY4cb4TD7
	XlQg0b67GohyTPQozgzKg0RVtN2gzEKrPkz0QGaNzVbCuq09PfPInnbgNMRPfzDYr7c8+IBNs4Z
	PiYlabcKwkcmGdJPOFDYTKV39l6dCALRJjvb0LK3GagFeRoKdPGyM7U99BeAeBjfqAN1oOh8Wqo
	/Cd+HzY+hmpIu8aA6DaaGUlkBTuLuS6UFAEQs/b7QJBg+c0P1xAVsDQ=
X-Google-Smtp-Source: AGHT+IHqStCvWNNK4mmH2QyCUI5xZd52gn5UcpaPIeaLd6J8VDUPdBuyROIsIO/y8GYZhyCrqhPx7w==
X-Received: by 2002:a05:6a21:7e07:b0:1e6:5323:58c5 with SMTP id adf61e73a8af0-1e65323591dmr18209789637.12.1735778949841;
        Wed, 01 Jan 2025 16:49:09 -0800 (PST)
Received: from localhost.localdomain (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8351fasm23793594b3a.62.2025.01.01.16.49.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jan 2025 16:49:09 -0800 (PST)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Mario Limonciello <superm1@kernel.org>,
	Luke Jones <luke@ljones.dev>,
	Xino Ni <nijs1@lenovo.com>,
	Zhixin Zhang <zhangzx36@lenovo.com>,
	Mia Shao <shaohz1@lenovo.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
	"Cody T . -H . Chiu" <codyit@gmail.com>,
	John Martens <johnfanv2@gmail.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/4] platform/x86: Add Lenovo Capability Data 01 WMI Driver
Date: Wed,  1 Jan 2025 16:47:21 -0800
Message-ID: <20250102004854.14874-4-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250102004854.14874-1-derekjohn.clark@gmail.com>
References: <20250102004854.14874-1-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds lenovo-wmi-capdata01.c which provides a driver for the
LENOVO_CAPABILITY_DATA_01 WMI data block that comes on "Other Method"
enabled hardware. Provides an interface for querying if a given
attribute is supported by the hardware, as well as its default_value,
max_value, min_value, and step increment.

v2:
- Use devm_kzalloc to ensure driver can be instanced, remove global
  reference.
- Ensure reverse Christmas tree for all variable declarations.
- Remove extra whitespace.
- Use guard(mutex) in all mutex instances, global mutex.
- Use pr_fmt instead of adding the driver name to each pr_err.
- Remove noisy pr_info usage.
- Rename capdata_wmi to lenovo_wmi_cd01_priv and cd01_wmi to priv.
- Use list to get the lenovo_wmi_cd01_priv instance in
  lenovo_wmi_capdata01_get as none of the data provided by the macros
  that will use it can pass a member of the struct for use in
  container_of.

Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
 MAINTAINERS                                 |   1 +
 drivers/platform/x86/Kconfig                |  11 ++
 drivers/platform/x86/Makefile               |   1 +
 drivers/platform/x86/lenovo-wmi-capdata01.c | 131 ++++++++++++++++++++
 drivers/platform/x86/lenovo-wmi.h           |  20 +++
 5 files changed, 164 insertions(+)
 create mode 100644 drivers/platform/x86/lenovo-wmi-capdata01.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 8f8a6aec6b92..c9374c395905 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13038,6 +13038,7 @@ LENOVO WMI drivers
 M:	Derek J. Clark <derekjohn.clark@gmail.com>
 L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
+F:	drivers/platform/x86/lenovo-wmi-capdata01.c
 F:	drivers/platform/x86/lenovo-wmi-gamezone.c
 F:	drivers/platform/x86/lenovo-wmi.h
 
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 9a6ac7fdec9f..a2c1ab47ad9e 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -470,6 +470,17 @@ config LENOVO_WMI_GAMEZONE
 	  To compile this driver as a module, choose M here: the module will
 	  be called lenovo_wmi_gamezone.
 
+config LENOVO_WMI_DATA01
+	tristate "Lenovo Legion WMI capability Data 01 Driver"
+	depends on ACPI_WMI
+	help
+	  Say Y here if you have a WMI aware Lenovo Legion device in the "Gaming Series"
+	  line of hardware. This interface is a dependency for exposing tunable power
+	  settings.
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called lenovo_wmi_capdata01.
+
 config IDEAPAD_LAPTOP
 	tristate "Lenovo IdeaPad Laptop Extras"
 	depends on ACPI
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index 7cb29a480ed2..6c96cc3f3855 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -69,6 +69,7 @@ obj-$(CONFIG_YOGABOOK)		+= lenovo-yogabook.o
 obj-$(CONFIG_YT2_1380)		+= lenovo-yoga-tab2-pro-1380-fastcharger.o
 obj-$(CONFIG_LENOVO_WMI_CAMERA)	+= lenovo-wmi-camera.o
 obj-$(CONFIG_LENOVO_WMI_GAMEZONE)	+= lenovo-wmi-gamezone.o
+obj-$(CONFIG_LENOVO_WMI_DATA01)	+= lenovo-wmi-capdata01.o
 
 # Intel
 obj-y				+= intel/
diff --git a/drivers/platform/x86/lenovo-wmi-capdata01.c b/drivers/platform/x86/lenovo-wmi-capdata01.c
new file mode 100644
index 000000000000..b10a6e4b320f
--- /dev/null
+++ b/drivers/platform/x86/lenovo-wmi-capdata01.c
@@ -0,0 +1,131 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * LENOVO_CAPABILITY_DATA_01 WMI data block driver. This interface provides
+ * information on tunable attributes used by the "Other Method" WMI interface,
+ * including if it is supported by the hardware, the default_value, max_value,
+ * min_value, and step increment.
+ *
+ * Copyright(C) 2024 Derek J. Clark <derekjohn.clark@gmail.com>
+ */
+
+#include <linux/list.h>
+#include "lenovo-wmi.h"
+
+#define LENOVO_CAPABILITY_DATA_01_GUID "7A8F5407-CB67-4D6E-B547-39B3BE018154"
+
+static DEFINE_MUTEX(cd01_call_mutex);
+static DEFINE_MUTEX(cd01_list_mutex);
+static LIST_HEAD(cd01_wmi_list);
+
+static const struct wmi_device_id lenovo_wmi_capdata01_id_table[] = {
+	{ LENOVO_CAPABILITY_DATA_01_GUID, NULL },
+	{}
+};
+
+struct lenovo_wmi_cd01_priv {
+	struct wmi_device *wdev;
+	struct list_head list;
+};
+
+static inline struct lenovo_wmi_cd01_priv *get_first_wmi_priv(void)
+{
+	guard(mutex)(&cd01_list_mutex);
+	return list_first_entry_or_null(&cd01_wmi_list,
+					struct lenovo_wmi_cd01_priv, list);
+}
+
+int lenovo_wmi_capdata01_get(struct lenovo_wmi_attr_id attr_id,
+			     struct capability_data_01 *cap_data)
+{
+	u32 attribute_id = *(int *)&attr_id;
+	struct lenovo_wmi_cd01_priv *priv;
+	union acpi_object *ret_obj;
+	int instance_idx;
+	int count;
+
+	priv = get_first_wmi_priv();
+	if (!priv)
+		return -ENODEV;
+
+	guard(mutex)(&cd01_call_mutex);
+	count = wmidev_instance_count(priv->wdev);
+	pr_info("Got instance count: %u\n", count);
+
+	for (instance_idx = 0; instance_idx < count; instance_idx++) {
+		ret_obj = wmidev_block_query(priv->wdev, instance_idx);
+		if (!ret_obj) {
+			pr_err("WMI Data block query failed.\n");
+			continue;
+		}
+
+		if (ret_obj->type != ACPI_TYPE_BUFFER) {
+			pr_err("WMI Data block query returned wrong type.\n");
+			kfree(ret_obj);
+			continue;
+		}
+
+		if (ret_obj->buffer.length != sizeof(*cap_data)) {
+			pr_err("WMI Data block query returned wrong buffer length: %u vice expected %lu.\n",
+			       ret_obj->buffer.length, sizeof(*cap_data));
+			kfree(ret_obj);
+			continue;
+		}
+
+		memcpy(cap_data, ret_obj->buffer.pointer,
+		       ret_obj->buffer.length);
+		kfree(ret_obj);
+
+		if (cap_data->id != attribute_id)
+			continue;
+		break;
+	}
+
+	if (cap_data->id != attribute_id) {
+		pr_err("Unable to find capability data for attribute_id %x\n",
+		       attribute_id);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(lenovo_wmi_capdata01_get, "CAPDATA_WMI");
+
+static int lenovo_wmi_capdata01_probe(struct wmi_device *wdev,
+				      const void *context)
+
+{
+	struct lenovo_wmi_cd01_priv *priv;
+
+	priv = devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->wdev = wdev;
+
+	guard(mutex)(&cd01_list_mutex);
+	list_add_tail(&priv->list, &cd01_wmi_list);
+
+	return 0;
+}
+
+static void lenovo_wmi_capdata01_remove(struct wmi_device *wdev)
+{
+	struct lenovo_wmi_cd01_priv *priv = dev_get_drvdata(&wdev->dev);
+
+	guard(mutex)(&cd01_list_mutex);
+	list_del(&priv->list);
+}
+
+static struct wmi_driver lenovo_wmi_capdata01_driver = {
+	.driver = { .name = "lenovo_wmi_capdata01" },
+	.id_table = lenovo_wmi_capdata01_id_table,
+	.probe = lenovo_wmi_capdata01_probe,
+	.remove = lenovo_wmi_capdata01_remove,
+};
+
+module_wmi_driver(lenovo_wmi_capdata01_driver);
+
+MODULE_DEVICE_TABLE(wmi, lenovo_wmi_capdata01_id_table);
+MODULE_AUTHOR("Derek J. Clark <derekjohn.clark@gmail.com>");
+MODULE_DESCRIPTION("Lenovo Capability Data 01 WMI Driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/platform/x86/lenovo-wmi.h b/drivers/platform/x86/lenovo-wmi.h
index 8a302c6c47cb..53cea84a956b 100644
--- a/drivers/platform/x86/lenovo-wmi.h
+++ b/drivers/platform/x86/lenovo-wmi.h
@@ -36,6 +36,22 @@ struct wmi_method_args {
 	u32 arg1;
 };
 
+struct lenovo_wmi_attr_id {
+	u32 mode_id : 16; /* Fan profile */
+	u32 feature_id : 8; /* Attribute (SPL/SPPT/...) */
+	u32 device_id : 8; /* CPU/GPU/... */
+} __packed;
+
+/* Data struct for LENOVO_CAPABILITY_DATA_01 */
+struct capability_data_01 {
+	u32 id;
+	u32 supported;
+	u32 default_value;
+	u32 step;
+	u32 min_value;
+	u32 max_value;
+};
+
 /* General Use functions */
 static int lenovo_wmidev_evaluate_method(struct wmi_device *wdev, u8 instance,
 					 u32 method_id, struct acpi_buffer *in,
@@ -102,4 +118,8 @@ int lenovo_wmidev_evaluate_method_1(struct wmi_device *wdev, u8 instance,
 					       0, retval);
 }
 
+/* LENOVO_CAPABILITY_DATA_01 exported functions */
+int lenovo_wmi_capdata01_get(struct lenovo_wmi_attr_id attr_id,
+			     struct capability_data_01 *cap_data);
+
 #endif /* !_LENOVO_WMI_H_ */
-- 
2.47.0

