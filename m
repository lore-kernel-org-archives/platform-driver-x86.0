Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4846ADF51;
	Thu,  2 Jan 2025 00:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735778954; cv=none; b=Pme42PDOUWE1VguOADL/XpQZJ29FEmdwvbTUrScJcDD2rQVcNBgzxoAhrW7U/5bJrH7HaKu0b8i6ldbK0m6HXkR5PWScCPa/xrxvszlsznpUvYvNpIDIDeR63QliCyL/lnKYta7BnzqxdkQN40Tr4aYinYH9Xo/9OPbDxSxCiO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735778954; c=relaxed/simple;
	bh=eK+vRQDEPonpk52tSxMvFuKbnk4BoEEpefZivEW6ydc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=muJl10ef5TMM0A2xXbr23zP/lCj6kEa/C4NnU2rWdmhOOlwEGymmn/tvcD1hMx/naKzS8HU75wuz4HNd1q7N72DRvGvQEVpXetSGhtDv8H89RKIJjbay3XMR0vdOSjgQB1anN8TOJFRDqP7eV8sgStecZFhPy+y4bD0pALpPrDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=habGRYJw; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="habGRYJw"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2ef6c56032eso11000946a91.2;
        Wed, 01 Jan 2025 16:49:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735778951; x=1736383751; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ShwJ8TLbOcKxKAI/KLvvEdy/KAkXaMIOwnIz5Y5uY0M=;
        b=habGRYJwgugQVFsXcA1eVc/D4AywbaBEU4mIvK35TqxGkp84b1fntqgg6w1a2dTj6g
         +VPqfUNAls6+vZoQ09i+ubukhgnDD9G5Xt3nhAE2vcaPZwUmt52uDEZTzi9cFMMsmBTM
         TQ3yOLNjSBvVlBWJxzS1oz8ipVlcEvJFCFHfWzRIohwkl9nSSHeE710ZDA72lyvwMCF8
         3FMTcHiBFtfHjmya8mkCcavBHL0F1V/KbFHTUj6Y/ndeyWBAHlICr+scRf9PDJ/sj02A
         GgYx1O4vVKWcMi3BmVf3Ou2viclgV3nuyQmeUSn1w4CmmN76omCILIvqdI8J9fphYYxj
         zH8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735778951; x=1736383751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ShwJ8TLbOcKxKAI/KLvvEdy/KAkXaMIOwnIz5Y5uY0M=;
        b=BXnBMHwLECLHscqbVs2oS+LeMYpO/c5Ey88Hl0OPaIlhVAbmuEZXwYGXvuCYJQC4bu
         WXMg8kQPTmVzrG/0jyDoyciPHmLfWZ2LMi4LlM8oONjcplRLb2v1VXgHuummFwsLIRHK
         Fit09053CocDi3+B3cfsEAs1sNFhejBQ6CjjO0M29QQgoMMxyEsV+HHEh5VtEGRRabMo
         BYEdmVjdIEMKHYo4NKC6hW/ryLeFPqWOITHDMxEz0NSXvlRcrBr5WkWsjnLuEbcog7xO
         CCOe18OTtzDqLSvTCtH/dDXzYlvHGafG2onhoaIDNBmHFEM8EPPAeVe6zABG1fu9VBzT
         hiLA==
X-Forwarded-Encrypted: i=1; AJvYcCU6FYWdI6MA6XKoktubwTKMDu9v0XBhWFAdL/YlLron0wZXMIznS9U6QMs4ajLb39SFXqnSTdYAhcjb0Xp0rTd+FlF6CA==@vger.kernel.org, AJvYcCWBYxsupgqvzyO4wR2y8DpZ1ZxL6ybmAOijKHUAXPiVVim9YRNZ/v89/4/cKWUsDsJGyeZnBSwVkuna+qfG@vger.kernel.org, AJvYcCWhHZZ2QuXdUX0+CPrtIIcBr6yLcaHtudpo4VFSSrEUvik+2HaxyAMIjhA256saDINdPmEkfJ0vWdY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVq55XABqiWr6fSZvvxwh43yQTslkFtm8eCJQmiLna2O2rmHji
	pAOn5u55n9Od+lr2cvxHxbgPs53mrIONk/OEgThB8wOTan7esx5i
X-Gm-Gg: ASbGncs1SiR5Mz/vpfa02/GBGG8T1Ue3HR8ijTHDkEElLseNrAopL85+q/pxE1jw7vm
	pZFErf/k0hxuUtzF9nDz75H5G4tqvmDweQbNyXdctyfv0vwq/05xLi/W7Ou3jMFmROfbX+Yn6BQ
	ppMeRcUSgRe6TwKunIWV+Xf9uBDaP9Qlujc7l9HYpjDlQnff7IrdAn7W2tMhPoe10aRYmEmZIdL
	c4LCpAJa5B8svOLoeS/vS0UJYb+vMSvPxwm9MlbIbktj+DCPJ0y8QuaRxTdMPx9htYgHnK3LWgn
	pGH91l1NSrDn/vxcvRW3Fddg4KwtbvGt5NgE1NqRaIXIzm3qHiBtUic=
X-Google-Smtp-Source: AGHT+IGT9043U9UunNh1m403Q4ZXdQUiSfcoRD7tn7EfkwYnFO3SH2gBIMdZ9zVE6kgIRhjRV2bgTQ==
X-Received: by 2002:a05:6a00:4ace:b0:728:eb32:356c with SMTP id d2e1a72fcca58-72abde01b08mr52583223b3a.11.1735778951414;
        Wed, 01 Jan 2025 16:49:11 -0800 (PST)
Received: from localhost.localdomain (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8351fasm23793594b3a.62.2025.01.01.16.49.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jan 2025 16:49:11 -0800 (PST)
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
Subject: [PATCH v2 4/4] platform/x86: Add Lenovo Other Mode WMI Driver
Date: Wed,  1 Jan 2025 16:47:22 -0800
Message-ID: <20250102004854.14874-5-derekjohn.clark@gmail.com>
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

Adds lenovo-wmi-other.c which provides a driver for the Lenovo
"Other Mode" WMI interface that comes on some Lenovo "Gaming
Series" hardware. Provides a firmware-attributes class which
enables the use of tunable knobs for SPL, SPPT, and FPPT.

v2:
- Use devm_kzalloc to ensure driver can be instanced, remove global
  reference.
- Ensure reverse Christmas tree for all variable declarations.
- Remove extra whitespace.
- Use guard(mutex) in all mutex instances, global mutex.
- Use pr_fmt instead of adding the driver name to each pr_err.
- Remove noisy pr_info usage.
- Rename other_method_wmi to lenovo_wmi_om_priv and om_wmi to priv.
- Use list to get the lenovo_wmi_om_priv instance in some macro
  called functions as the data provided by the macros that use it
  doesn't pass a member of the struct for use in container_of.
- Do not rely on GameZone interface to grab the current fan mode.

Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
 MAINTAINERS                             |   1 +
 drivers/platform/x86/Kconfig            |  12 +
 drivers/platform/x86/Makefile           |   1 +
 drivers/platform/x86/lenovo-wmi-other.c | 385 ++++++++++++++++++++++++
 drivers/platform/x86/lenovo-wmi.h       | 116 +++++++
 5 files changed, 515 insertions(+)
 create mode 100644 drivers/platform/x86/lenovo-wmi-other.c

diff --git a/MAINTAINERS b/MAINTAINERS
index c9374c395905..318e1e517eed 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13040,6 +13040,7 @@ L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 F:	drivers/platform/x86/lenovo-wmi-capdata01.c
 F:	drivers/platform/x86/lenovo-wmi-gamezone.c
+F:	drivers/platform/x86/lenovo-wmi-other.c
 F:	drivers/platform/x86/lenovo-wmi.h
 
 LETSKETCH HID TABLET DRIVER
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index a2c1ab47ad9e..e2285ab987c5 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -481,6 +481,18 @@ config LENOVO_WMI_DATA01
 	  To compile this driver as a module, choose M here: the module will
 	  be called lenovo_wmi_capdata01.
 
+config LENOVO_WMI_TUNING
+	tristate "Lenovo Other Method WMI Driver"
+	depends on LENOVO_WMI_DATA01
+	select FW_ATTR_CLASS
+	help
+	  Say Y here if you have a WMI aware Lenovo Legion device and would like to use the
+	  firmware_attributes API to control various tunable settings typically exposed by
+	  Lenovo software in Windows.
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called lenovo_wmi_other.
+
 config IDEAPAD_LAPTOP
 	tristate "Lenovo IdeaPad Laptop Extras"
 	depends on ACPI
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index 6c96cc3f3855..3e059b3c3647 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -70,6 +70,7 @@ obj-$(CONFIG_YT2_1380)		+= lenovo-yoga-tab2-pro-1380-fastcharger.o
 obj-$(CONFIG_LENOVO_WMI_CAMERA)	+= lenovo-wmi-camera.o
 obj-$(CONFIG_LENOVO_WMI_GAMEZONE)	+= lenovo-wmi-gamezone.o
 obj-$(CONFIG_LENOVO_WMI_DATA01)	+= lenovo-wmi-capdata01.o
+obj-$(CONFIG_LENOVO_WMI_TUNING)	+= lenovo-wmi-other.o
 
 # Intel
 obj-y				+= intel/
diff --git a/drivers/platform/x86/lenovo-wmi-other.c b/drivers/platform/x86/lenovo-wmi-other.c
new file mode 100644
index 000000000000..2392faa74973
--- /dev/null
+++ b/drivers/platform/x86/lenovo-wmi-other.c
@@ -0,0 +1,385 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Lenovo Other Method WMI interface driver. This driver uses the fw_attributes
+ * class to expose the various WMI functions provided by the "Other Method" WMI
+ * interface. This enables CPU and GPU power limit as well as various other
+ * attributes for devices that fall under the "Gaming Series" of Lenovo laptop
+ * devices. Each attribute exposed by the "Other Method"" interface has a
+ * corresponding LENOVO_CAPABILITY_DATA_01 struct that allows the driver to
+ * probe details about the attribute such as set/get support, step, min, max,
+ * and default value. Each attibute has multiple pages, one for each of the
+ * fan profiles managed by the GameZone interface, so it must be probed prior
+ * to returning the current_value.
+ *
+ * These attributes typically don't fit anywhere else in the sysfs and are set
+ * in Windows using one of Lenovo's multiple user applications.
+ *
+ * Copyright(C) 2024 Derek J. Clark <derekjohn.clark@gmail.com>
+ */
+
+#include <linux/list.h>
+#include "lenovo-wmi.h"
+#include "firmware_attributes_class.h"
+
+#define FW_ATTR_FOLDER "lenovo-wmi-other"
+#define LENOVO_OTHER_METHOD_GUID "DC2A8805-3A8C-41BA-A6F7-092E0089CD3B"
+
+/* Device IDs */
+#define WMI_DEVICE_ID_CPU 0x01
+
+/* WMI_DEVICE_ID_CPU feature IDs */
+#define WMI_FEATURE_ID_CPU_SPPT 0x01 /* Short Term Power Limit */
+#define WMI_FEATURE_ID_CPU_FPPT 0x03 /* Long Term Power Limit */
+#define WMI_FEATURE_ID_CPU_SPL 0x02 /* Peak Power Limit */
+#define WMI_FEATURE_ID_CPU_FPPT_BAD 0x03 /* Long Term Power Limit */
+
+/* Method IDs */
+#define WMI_METHOD_ID_VALUE_GET 17 /* Other Method Getter */
+#define WMI_METHOD_ID_VALUE_SET 18 /* Other Method Setter */
+
+static DEFINE_MUTEX(call_mutex);
+static DEFINE_MUTEX(om_list_mutex);
+static LIST_HEAD(om_wmi_list);
+
+struct lenovo_wmi_om_priv {
+	struct wmi_device *wdev;
+	struct device *fw_attr_dev;
+	struct kset *fw_attr_kset;
+	struct list_head list;
+};
+
+static inline struct lenovo_wmi_om_priv *get_first_wmi_priv(void)
+{
+	guard(mutex)(&om_list_mutex);
+	return list_first_entry_or_null(&om_wmi_list, struct lenovo_wmi_om_priv,
+					list);
+}
+
+static const struct wmi_device_id lenovo_wmi_other_id_table[] = {
+	{ LENOVO_OTHER_METHOD_GUID, NULL },
+	{}
+};
+
+/* Tunable Attributes */
+struct tunable_attr_01 ppt_pl1_spl = { .device_id = WMI_DEVICE_ID_CPU,
+				       .feature_id = WMI_FEATURE_ID_CPU_SPL };
+struct tunable_attr_01 ppt_pl2_sppt = { .device_id = WMI_DEVICE_ID_CPU,
+					.feature_id = WMI_FEATURE_ID_CPU_SPPT };
+struct tunable_attr_01 ppt_pl3_fppt = { .device_id = WMI_DEVICE_ID_CPU,
+					.feature_id = WMI_FEATURE_ID_CPU_FPPT };
+
+struct capdata01_attr_group {
+	const struct attribute_group *attr_group;
+	struct tunable_attr_01 *tunable_attr;
+};
+
+static const struct class *fw_attr_class;
+
+/**
+ * attr_capdata01_setup() - Get the data of the specified attribute
+ * from LENOVO_CAPABILITY_DATA_01 and store it.
+ * @tunable_attr: The attribute to be populated.
+ *
+ * Returns: Either 0 or an error.
+ */
+static int attr_capdata01_setup(struct tunable_attr_01 *tunable_attr)
+{
+	struct capability_data_01 cap_data;
+	int mode = SMARTFAN_MODE_CUSTOM;
+	int err;
+
+	struct lenovo_wmi_attr_id attr_id = { mode << 8,
+					      tunable_attr->feature_id,
+					      tunable_attr->device_id };
+
+	err = lenovo_wmi_capdata01_get(attr_id, &cap_data);
+	if (err) {
+		pr_err("Failed to get capability data: %u\n", err);
+		return err;
+	}
+
+	if (cap_data.supported < 1)
+		return -EOPNOTSUPP;
+
+	tunable_attr->capdata = cap_data;
+
+	return 0;
+}
+
+/**
+ * attr_capdata01_show() - Get the value of the specified attribute property
+ * from LENOVO_CAPABILITY_DATA_01.
+ * @kobj: Pointer to the driver object.
+ * @kobj_attribute: Pointer to the attribute calling this function.
+ * @buf: The buffer to write to.
+ * @tunable_attr: The attribute to be read.
+ * @prop: The property of this attribute to be read.
+ *
+ * This function is intended to be generic so it can be called from any "_show"
+ * attribute which works only with integers.
+ *
+ * If the WMI is success, then the sysfs attribute is notified.
+ *
+ * Returns: Either count, or an error.
+ */
+ssize_t attr_capdata01_show(struct kobject *kobj, struct kobj_attribute *attr,
+			    char *buf, struct tunable_attr_01 *tunable_attr,
+			    enum attribute_property prop)
+{
+	struct capability_data_01 cap_data;
+	int retval;
+
+	cap_data = tunable_attr->capdata;
+
+	switch (prop) {
+	case DEFAULT_VAL:
+		retval = cap_data.default_value;
+		break;
+	case MAX_VAL:
+		retval = cap_data.max_value;
+		break;
+	case MIN_VAL:
+		retval = cap_data.min_value;
+		break;
+	case STEP_VAL:
+		retval = cap_data.step;
+		break;
+	default:
+		return -EINVAL;
+	}
+	return sysfs_emit(buf, "%u\n", retval);
+}
+
+/* Simple attribute creation */
+
+/*
+ * att_current_value_store() - Set the current value of the given attribute
+ * @kobj: Pointer to the driver object.
+ * @kobj_attribute: Pointer to the attribute calling this function.
+ * @buf: The buffer to read from, this is parsed to `int` type.
+ * @count: Required by sysfs attribute macros, pass in from the callee attr.
+ * @tunable_attr: The attribute to be stored.
+ *
+ * This function is intended to be generic so it can be called from any
+ * attribute's "current_value_store" which works only with integers. The
+ * integer to be sent to the WMI method is range checked and an error returned
+ * if out of range.
+ *
+ * If the value is valid and WMI is success, then the sysfs attribute is
+ * notified.
+ *
+ * Returns: Either count, or an error.
+ */
+ssize_t attr_current_value_store(struct kobject *kobj,
+				 struct kobj_attribute *attr, const char *buf,
+				 size_t count,
+				 struct tunable_attr_01 *tunable_attr)
+{
+	struct capability_data_01 cap_data;
+	struct lenovo_wmi_om_priv *priv;
+	int mode = SMARTFAN_MODE_CUSTOM;
+	u32 value;
+	int err;
+
+	struct lenovo_wmi_attr_id attr_id = { mode << 8,
+					      tunable_attr->feature_id,
+					      tunable_attr->device_id };
+
+	err = kstrtouint(buf, 10, &value);
+	if (err) {
+		pr_err("Error converting value to int: %u\n", err);
+		return err;
+	}
+
+	cap_data = tunable_attr->capdata;
+
+	if (value < cap_data.min_value || value > cap_data.max_value)
+		return -EINVAL;
+
+	priv = get_first_wmi_priv();
+	if (!priv)
+		return -ENODEV;
+
+	guard(mutex)(&call_mutex);
+	err = lenovo_wmidev_evaluate_method_2(priv->wdev, 0x0,
+					      WMI_METHOD_ID_VALUE_SET,
+					      *(int *)&attr_id, value, NULL);
+
+	if (err) {
+		pr_err("Error setting attribute: %u\n", err);
+		return err;
+	}
+
+	tunable_attr->store_value = value;
+
+	sysfs_notify(kobj, NULL, attr->attr.name);
+
+	return count;
+};
+
+/*
+ * attr_current_value_show() - Get the current value of the given attribute
+ * @kobj: Pointer to the driver object.
+ * @kobj_attribute: Pointer to the attribute calling this function.
+ * @buf: The buffer to write to.
+ * @tunable_attr: The attribute to be read.
+ *
+ * This function is intended to be generic so it can be called from any "_show"
+ * attribute which works only with integers.
+ *
+ * If the WMI is success, then the sysfs attribute is notified.
+ *
+ * Returns: Either count, or an error.
+ */
+ssize_t attr_current_value_show(struct kobject *kobj,
+				struct kobj_attribute *attr, char *buf,
+				struct tunable_attr_01 *tunable_attr)
+{
+	struct lenovo_wmi_om_priv *priv;
+	int mode = SMARTFAN_MODE_CUSTOM;
+	int retval;
+	int err;
+
+	struct lenovo_wmi_attr_id attr_id = { mode << 8,
+					      tunable_attr->feature_id,
+					      tunable_attr->device_id };
+
+	priv = get_first_wmi_priv();
+	if (!priv)
+		return -ENODEV;
+
+	guard(mutex)(&call_mutex);
+	err = lenovo_wmidev_evaluate_method_1(priv->wdev, 0x0,
+					      WMI_METHOD_ID_VALUE_GET,
+					      *(int *)&attr_id, &retval);
+
+	if (err) {
+		pr_err("Error getting attribute: %u\n", err);
+		return err;
+	}
+
+	return sysfs_emit(buf, "%u\n", retval);
+}
+
+ATTR_GROUP_LL_TUNABLE_CAP01(ppt_pl1_spl, "ppt_pl1_spl",
+			    "Set the CPU sustained power limit");
+ATTR_GROUP_LL_TUNABLE_CAP01(ppt_pl2_sppt, "ppt_pl2_sppt",
+			    "Set the CPU slow package power tracking limit");
+ATTR_GROUP_LL_TUNABLE_CAP01(ppt_pl3_fppt, "ppt_pl3_fppt",
+			    "Set the CPU fast package power tracking limit");
+
+static const struct capdata01_attr_group capdata01_attr_groups[] = {
+	{ &ppt_pl1_spl_attr_group, &ppt_pl1_spl },
+	{ &ppt_pl2_sppt_attr_group, &ppt_pl2_sppt },
+	{ &ppt_pl3_fppt_attr_group, &ppt_pl3_fppt },
+	{},
+};
+
+static int other_method_fw_attr_add(struct lenovo_wmi_om_priv *priv)
+{
+	int err, i;
+
+	err = fw_attributes_class_get(&fw_attr_class);
+	if (err) {
+		pr_err("Failed to get firmware_attributes_class: %u\n", err);
+		return err;
+	}
+
+	priv->fw_attr_dev = device_create(fw_attr_class, NULL, MKDEV(0, 0),
+					  NULL, "%s", FW_ATTR_FOLDER);
+	if (IS_ERR(priv->fw_attr_dev)) {
+		err = PTR_ERR(priv->fw_attr_dev);
+		pr_err("Failed to create firmware_attributes_class device: %u\n",
+		       err);
+		goto fail_class_get;
+	}
+
+	priv->fw_attr_kset = kset_create_and_add("attributes", NULL,
+						 &priv->fw_attr_dev->kobj);
+	if (!priv->fw_attr_kset) {
+		err = -ENOMEM;
+		pr_err("Failed to create firmware_attributes_class kset: %u\n",
+		       err);
+		goto err_destroy_classdev;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(capdata01_attr_groups) - 1; i++) {
+		err = attr_capdata01_setup(
+			capdata01_attr_groups[i].tunable_attr);
+		if (err) {
+			pr_err("Failed to populate capability data for %s: %u\n",
+			       capdata01_attr_groups[i].attr_group->name, err);
+			continue;
+		}
+
+		err = sysfs_create_group(&priv->fw_attr_kset->kobj,
+					 capdata01_attr_groups[i].attr_group);
+		if (err) {
+			pr_err("Failed to create sysfs-group for %s: %u\n",
+			       capdata01_attr_groups[i].attr_group->name, err);
+			goto err_remove_groups;
+		}
+	}
+
+	return 0;
+
+err_remove_groups:
+	while (i-- > 0) {
+		sysfs_remove_group(&priv->fw_attr_kset->kobj,
+				   capdata01_attr_groups[i].attr_group);
+	}
+
+	return err;
+
+err_destroy_classdev:
+	device_destroy(fw_attr_class, MKDEV(0, 0));
+
+	return err;
+
+fail_class_get:
+	fw_attributes_class_put();
+
+	return err;
+}
+
+static int lenovo_wmi_other_probe(struct wmi_device *wdev, const void *context)
+{
+	struct lenovo_wmi_om_priv *priv;
+
+	priv = devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->wdev = wdev;
+
+	guard(mutex)(&om_list_mutex);
+	list_add_tail(&priv->list, &om_wmi_list);
+
+	return other_method_fw_attr_add(priv);
+}
+
+static void lenovo_wmi_other_remove(struct wmi_device *wdev)
+{
+	struct lenovo_wmi_om_priv *priv = dev_get_drvdata(&wdev->dev);
+
+	guard(mutex)(&om_list_mutex);
+	list_del(&priv->list);
+	kset_unregister(priv->fw_attr_kset);
+	device_destroy(fw_attr_class, MKDEV(0, 0));
+	fw_attributes_class_put();
+}
+
+static struct wmi_driver lenovo_wmi_other_driver = {
+	.driver = { .name = "lenovo_wmi_other" },
+	.id_table = lenovo_wmi_other_id_table,
+	.probe = lenovo_wmi_other_probe,
+	.remove = lenovo_wmi_other_remove,
+};
+
+module_wmi_driver(lenovo_wmi_other_driver);
+
+MODULE_IMPORT_NS("CAPDATA_WMI");
+MODULE_DEVICE_TABLE(wmi, lenovo_wmi_other_id_table);
+MODULE_AUTHOR("Derek J. Clark <derekjohn.clark@gmail.com>");
+MODULE_DESCRIPTION("Lenovo Other Method WMI Driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/platform/x86/lenovo-wmi.h b/drivers/platform/x86/lenovo-wmi.h
index 53cea84a956b..1c8358551ba6 100644
--- a/drivers/platform/x86/lenovo-wmi.h
+++ b/drivers/platform/x86/lenovo-wmi.h
@@ -42,6 +42,14 @@ struct lenovo_wmi_attr_id {
 	u32 device_id : 8; /* CPU/GPU/... */
 } __packed;
 
+enum attribute_property {
+	DEFAULT_VAL,
+	MAX_VAL,
+	MIN_VAL,
+	STEP_VAL,
+	SUPPORTED,
+};
+
 /* Data struct for LENOVO_CAPABILITY_DATA_01 */
 struct capability_data_01 {
 	u32 id;
@@ -52,6 +60,14 @@ struct capability_data_01 {
 	u32 max_value;
 };
 
+/* Tunable attribute that uses LENOVO_CAPABILITY_DATA_01 */
+struct tunable_attr_01 {
+	struct capability_data_01 capdata;
+	u32 device_id;
+	u32 feature_id;
+	u32 store_value;
+};
+
 /* General Use functions */
 static int lenovo_wmidev_evaluate_method(struct wmi_device *wdev, u8 instance,
 					 u32 method_id, struct acpi_buffer *in,
@@ -122,4 +138,104 @@ int lenovo_wmidev_evaluate_method_1(struct wmi_device *wdev, u8 instance,
 int lenovo_wmi_capdata01_get(struct lenovo_wmi_attr_id attr_id,
 			     struct capability_data_01 *cap_data);
 
+/* Other Method attribute functions */
+ssize_t attr_capdata01_show(struct kobject *kobj, struct kobj_attribute *attr,
+			    char *buf, struct tunable_attr_01 *tunable_attr,
+			    enum attribute_property prop);
+
+ssize_t attr_current_value_store(struct kobject *kobj,
+				 struct kobj_attribute *attr, const char *buf,
+				 size_t count,
+				 struct tunable_attr_01 *tunable_attr);
+
+ssize_t attr_current_value_show(struct kobject *kobj,
+				struct kobj_attribute *attr, char *buf,
+				struct tunable_attr_01 *tunable_attr);
+
+ssize_t int_type_show(struct kobject *kobj, struct kobj_attribute *attr,
+		      char *buf);
+
+ssize_t int_type_show(struct kobject *kobj, struct kobj_attribute *attr,
+		      char *buf)
+{
+	return sysfs_emit(buf, "integer\n");
+}
+
+/* Other Method attribute macros */
+#define __LL_ATTR_RO(_func, _name)                                    \
+	{                                                             \
+		.attr = { .name = __stringify(_name), .mode = 0444 }, \
+		.show = _func##_##_name##_show,                       \
+	}
+
+#define __LL_ATTR_RO_AS(_name, _show)                                 \
+	{                                                             \
+		.attr = { .name = __stringify(_name), .mode = 0444 }, \
+		.show = _show,                                        \
+	}
+
+#define __LL_ATTR_RW(_func, _name) \
+	__ATTR(_name, 0644, _func##_##_name##_show, _func##_##_name##_store)
+
+/* Shows a formatted static variable */
+#define __ATTR_SHOW_FMT(_prop, _attrname, _fmt, _val)                         \
+	static ssize_t _attrname##_##_prop##_show(                            \
+		struct kobject *kobj, struct kobj_attribute *attr, char *buf) \
+	{                                                                     \
+		return sysfs_emit(buf, _fmt, _val);                           \
+	}                                                                     \
+	static struct kobj_attribute attr_##_attrname##_##_prop =             \
+		__LL_ATTR_RO(_attrname, _prop)
+
+/* Attribute current_value show/store */
+#define __LL_TUNABLE_RW_CAP01(_attrname)                                      \
+	static ssize_t _attrname##_current_value_store(                       \
+		struct kobject *kobj, struct kobj_attribute *attr,            \
+		const char *buf, size_t count)                                \
+	{                                                                     \
+		return attr_current_value_store(kobj, attr, buf, count,       \
+						&_attrname);                  \
+	}                                                                     \
+	static ssize_t _attrname##_current_value_show(                        \
+		struct kobject *kobj, struct kobj_attribute *attr, char *buf) \
+	{                                                                     \
+		return attr_current_value_show(kobj, attr, buf, &_attrname);  \
+	}                                                                     \
+	static struct kobj_attribute attr_##_attrname##_current_value =       \
+		__LL_ATTR_RW(_attrname, current_value)
+
+/* Attribute property show only */
+#define __LL_TUNABLE_RO_CAP01(_prop, _attrname, _prop_type)                   \
+	static ssize_t _attrname##_##_prop##_show(                            \
+		struct kobject *kobj, struct kobj_attribute *attr, char *buf) \
+	{                                                                     \
+		return attr_capdata01_show(kobj, attr, buf, &_attrname,       \
+					   _prop_type);                       \
+	}                                                                     \
+	static struct kobj_attribute attr_##_attrname##_##_prop =             \
+		__LL_ATTR_RO(_attrname, _prop)
+
+#define ATTR_GROUP_LL_TUNABLE_CAP01(_attrname, _fsname, _dispname)     \
+	__LL_TUNABLE_RW_CAP01(_attrname);                              \
+	__LL_TUNABLE_RO_CAP01(default_value, _attrname, DEFAULT_VAL);  \
+	__ATTR_SHOW_FMT(display_name, _attrname, "%s\n", _dispname);   \
+	__LL_TUNABLE_RO_CAP01(max_value, _attrname, MAX_VAL);          \
+	__LL_TUNABLE_RO_CAP01(min_value, _attrname, MIN_VAL);          \
+	__LL_TUNABLE_RO_CAP01(scalar_increment, _attrname, STEP_VAL);  \
+	static struct kobj_attribute attr_##_attrname##_type =         \
+		__LL_ATTR_RO_AS(type, int_type_show);                  \
+	static struct attribute *_attrname##_attrs[] = {               \
+		&attr_##_attrname##_current_value.attr,                \
+		&attr_##_attrname##_default_value.attr,                \
+		&attr_##_attrname##_display_name.attr,                 \
+		&attr_##_attrname##_max_value.attr,                    \
+		&attr_##_attrname##_min_value.attr,                    \
+		&attr_##_attrname##_scalar_increment.attr,             \
+		&attr_##_attrname##_type.attr,                         \
+		NULL,                                                  \
+	};                                                             \
+	static const struct attribute_group _attrname##_attr_group = { \
+		.name = _fsname, .attrs = _attrname##_attrs            \
+	}
+
 #endif /* !_LENOVO_WMI_H_ */
-- 
2.47.0

