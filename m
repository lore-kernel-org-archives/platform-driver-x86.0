Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DFF03AEF3B
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 Jul 2026 08:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783930413; cv=none; b=cmQJ4NmfzFHRkCJMV39bIwrh9xguH5vffQUftZMoQN9VTPb0UKIIGm99i6OWmKm1P5lrcwL+IZPRmQT8J774n2yZewlwCA+Of92Bn5GRQ1BfF1e/LO5fb83PMRsSxoPTU91eJ66AGVvZmgsXfNUgTosG+iytRqdvT2mEIrafRZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783930413; c=relaxed/simple;
	bh=S94oCv1sKaRXNelLqy1bWkF805oLPsDh6WzmdJMTiEI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=emBBwaNlTzsFCuqCC8YwbXbtYKx+eLbbD5SI4AKhGiOt4ie7BWPGy3ktK06TVv8vMI9q4j0j7D0zfaD/QbVVPG58ReNiU3fJUaHyeXnX30RP1vM79KcLvVNutp8V8JH0HQS/MfAdoxvrtQDK/PFXUAwFKdYla5isG+oRMzOFHBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems; spf=pass smtp.mailfrom=starlabs.systems; dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b=EHaHwW2a; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b="EHaHwW2a"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-493e4ccccc2so18306855e9.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Jul 2026 01:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20251104.gappssmtp.com; s=20251104; t=1783930409; x=1784535209; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yDPDBXQwUcNBWvjxJSXqQoGjnan8r5wipzaZZQnvLug=;
        b=EHaHwW2a3n+mYnL1ioRt+kjMlz2eNYdhSy+p0j22jAX3fWF5nOIERlkRW3Tjpsqj8x
         2dOQFVUYtDLHHu43iO/hG8nerT4LT4TrJjp+VjYcWw19Dnx9KLd9ntbeynhTs5ba3A7s
         Yk1WHmPgUNlFXM6rfOjo6ADHuobEjNSdaZ/btUT/Tri3tDjHb9Tkf3fePkN8AEdV9mlf
         iOWNrcv8yNc+Jl5vpKACb4E3BIHFmMxZykThjXrlmcurq6WBWBiWNShSrj7MRJQXe6W9
         aK/S24oPSJp6DEqnEWhynEnQrocZzUzMDSR2tpZNz0M6Gj6MxTvhhQtgjn8A4M6PGzBR
         K7Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783930409; x=1784535209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yDPDBXQwUcNBWvjxJSXqQoGjnan8r5wipzaZZQnvLug=;
        b=e81lLfGlYh8iPrPOkssDP2YQItKoEUKoxSr67j04mOmm6Y2u047WvHeX3o2YN1/XE/
         ryFonKsTbvZTkmGaq5XxQ8T55s5TC+oIJL7rxeAMczHA9wnw5Zd6e1MAgOlwV0m5YREx
         ZtTsKLF8uILvQJCTvjUStHQUdCPWI08rUezCMiSYvvicPWc584wELwDr44fQZ0jl9r/u
         SjgB4ohOdqseZRQVyxYvU3VZuzQVIxO2YxuoRQxlaAfLjEb6JajiGbKL/THjtVNOzueF
         /W44BDKM271FCjCdjODLuKazAKG6kpu/O8Zqrt77gsuHyT3GZhtd6v2tsFX/lbUAerbY
         HXag==
X-Forwarded-Encrypted: i=1; AHgh+RpdBgPh0tldpoXGeNRJ543BWbvGB/XhnVKf6MGhFy7zim/YRffr9py3LecIf4V+khscZw2uOjkTxtYtku39iu/15VMK@vger.kernel.org
X-Gm-Message-State: AOJu0YydXDRe1McuH8Rs0rbMNDeJ3rajkt8NzZ5hnCnjFK9+2djejUeY
	tb9CWCPtaeNE0KLPgdrjSPWuUNo8h5O9ptDIG7txc98+TZoBgaU3OsZqs0IYGjSAi7EOuWjBjQt
	w0nyedQ==
X-Gm-Gg: AfdE7cmJ1FvB2bzH1UL/BCXiJ79f+vsBRj0bA6DzDew1XtrqpzhM24vrkvB55q3YFG1
	ZQfdjntGJEk4iqkU5G1s1Jcvg60VM+XwPM1VSYi3imtNQXfhJzVVQLpvVNfnc4k/7aJZeVa/XAY
	IYCsY18TN8+FGTqrpQaqoChVHLjM1KFw8oswbLzduguovywzCzOVZourfFlfO/kb2PXA8uyPXiq
	h05cdCWUmyL3fnZ57M0Ltcwdg4ZoU4Qc4K6KwXYzWIOANcZPAxGRORje3xsni01huOYlufFau63
	xLM017orhCJXjd6MlalvUFconyPJ3sNjbSG91v1kLpv7Snv2i2FXDbMijVCYuGrDf7n+CFrG9wd
	P+lkwY9pd7kEQdeTm/8fzmvpTW9+yL3SyrWp9PpXZrUEK8vSyJa3jo68pgAdsP569I/pA1G0ror
	VzfVwZk0QIFQTXYsFhLKXdFBKFtDXCt/FX07G1RNnwBCg7BLFdw/RrWa2A
X-Received: by 2002:a05:600c:4693:b0:493:b7a6:3dac with SMTP id 5b1f17b1804b1-493f8830fd3mr75643205e9.33.1783930408724;
        Mon, 13 Jul 2026 01:13:28 -0700 (PDT)
Received: from horizon.localdomain ([150.228.38.212])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb73ae14sm343217885e9.11.2026.07.13.01.13.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 01:13:28 -0700 (PDT)
From: Sean Rhodes <sean@starlabs.systems>
To: tzungbi@kernel.org
Cc: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	corentin.chary@gmail.com,
	luke@ljones.dev,
	denis.benato@linux.dev,
	prasanth.ksr@dell.com,
	jorge.lopez2@hp.com,
	mpearson-lenovo@squebb.ca,
	derekjohn.clark@gmail.com,
	josh@joshuagrisham.com,
	briannorris@chromium.org,
	jwerner@chromium.org,
	tzimmermann@suse.de,
	javierm@redhat.com,
	kees@kernel.org,
	u.kleine-koenig@baylibre.com,
	mst@redhat.com,
	chenhuacai@kernel.org,
	wenst@chromium.org,
	florian.fainelli@broadcom.com,
	titouan.ameline@gmail.com,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	Dell.Client.Kernel@dell.com,
	chrome-platform@lists.linux.dev
Subject: [PATCH v6 3/3] firmware: coreboot: Add CFR firmware attributes driver
Date: Mon, 13 Jul 2026 09:13:17 +0100
Message-ID: <20260713081317.2954586-4-sean@starlabs.systems>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260713081317.2954586-1-sean@starlabs.systems>
References: <20260713054526.2902319-1-sean@starlabs.systems>
 <20260713081317.2954586-1-sean@starlabs.systems>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

coreboot can publish a CFR tree in its coreboot table to describe
firmware setup options. Add a firmware-attributes driver for that table
entry under the coreboot firmware driver directory.

The driver exposes runtime EFI variable-backed boolean, enum and integer
settings through the firmware-attributes ABI. It only registers settings
with readable runtime EFI variables, skips suppressed, volatile,
dependency-gated and non-runtime options, and keeps read-only or inactive
options read-only in sysfs.

For settings with an APM_CNT runtime-apply record, write the EFI variable
and ask firmware to apply the setting immediately on x86. If firmware
reports a failure, restore the old EFI variable value. Settings without a
runtime apply hook, or non-x86 builds, keep the EFI variable update and
set pending_reboot.

Tested on a Star Labs Byte with firmware 26.07 and the driver built as a
module against Linux 6.17: runtime APM_CNT apply was verified with
power_led, and reboot-needed behavior was verified with debug_level.

Link: https://doc.coreboot.org/drivers/cfr.html
Link: https://doc.coreboot.org/drivers/cfr_internal.html
Signed-off-by: Sean Rhodes <sean@starlabs.systems>
---
 MAINTAINERS                              |    6 +
 drivers/firmware/coreboot/Kconfig        |   13 +
 drivers/firmware/coreboot/Makefile       |    1 +
 drivers/firmware/coreboot/coreboot-cfr.c | 1065 ++++++++++++++++++++++
 4 files changed, 1085 insertions(+)
 create mode 100644 drivers/firmware/coreboot/coreboot-cfr.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 8cf2766d515d..a00f54e0324e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6665,6 +6665,12 @@ F:	tools/testing/selftests/cgroup/test_hugetlb_memcg.c
 F:	tools/testing/selftests/cgroup/test_kmem.c
 F:	tools/testing/selftests/cgroup/test_memcontrol.c
 
+COREBOOT CFR FIRMWARE ATTRIBUTES DRIVER
+M:	Sean Rhodes <sean@starlabs.systems>
+L:	chrome-platform@lists.linux.dev
+S:	Maintained
+F:	drivers/firmware/coreboot/coreboot-cfr.c
+
 CORETEMP HARDWARE MONITORING DRIVER
 L:	linux-hwmon@vger.kernel.org
 S:	Orphan
diff --git a/drivers/firmware/coreboot/Kconfig b/drivers/firmware/coreboot/Kconfig
index b248bafe8b6b..e935a31e508d 100644
--- a/drivers/firmware/coreboot/Kconfig
+++ b/drivers/firmware/coreboot/Kconfig
@@ -44,6 +44,19 @@ config GOOGLE_COREBOOT_TABLE
 	  device tree node /firmware/coreboot.
 	  If unsure say N.
 
+config COREBOOT_CFR
+	tristate "coreboot CFR firmware attributes"
+	depends on EFI
+	depends on GOOGLE_COREBOOT_TABLE
+	select FW_ATTR_CLASS
+	help
+	  This driver parses the coreboot CFR table and exposes runtime EFI
+	  variable-backed options through the firmware-attributes sysfs
+	  interface.
+
+	  If you have a system running coreboot with CFR runtime
+	  configuration support, say Y or M here.
+
 config GOOGLE_MEMCONSOLE
 	tristate
 	depends on GOOGLE_MEMCONSOLE_X86_LEGACY || GOOGLE_MEMCONSOLE_COREBOOT
diff --git a/drivers/firmware/coreboot/Makefile b/drivers/firmware/coreboot/Makefile
index 8151e323cc43..1b9d0c0e7593 100644
--- a/drivers/firmware/coreboot/Makefile
+++ b/drivers/firmware/coreboot/Makefile
@@ -2,6 +2,7 @@
 
 obj-$(CONFIG_GOOGLE_SMI)		+= gsmi.o
 obj-$(CONFIG_GOOGLE_COREBOOT_TABLE)        += coreboot_table.o
+obj-$(CONFIG_COREBOOT_CFR)		+= coreboot-cfr.o
 obj-$(CONFIG_GOOGLE_FRAMEBUFFER_COREBOOT)  += framebuffer-coreboot.o
 obj-$(CONFIG_GOOGLE_MEMCONSOLE)            += memconsole.o
 obj-$(CONFIG_GOOGLE_MEMCONSOLE_COREBOOT)   += memconsole-coreboot.o
diff --git a/drivers/firmware/coreboot/coreboot-cfr.c b/drivers/firmware/coreboot/coreboot-cfr.c
new file mode 100644
index 000000000000..a03d5a0f1fdb
--- /dev/null
+++ b/drivers/firmware/coreboot/coreboot-cfr.c
@@ -0,0 +1,1065 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * coreboot CFR firmware attributes driver.
+ *
+ * Parses LB_TAG_CFR_ROOT records from the coreboot table and exposes
+ * runtime EFI variable-backed options through the firmware-attributes class.
+ */
+
+#include <linux/array_size.h>
+#include <linux/bitops.h>
+#include <linux/cleanup.h>
+#include <linux/ctype.h>
+#include <linux/device.h>
+#include <linux/device-id/coreboot.h>
+#include <linux/efi.h>
+#include <linux/err.h>
+#include <linux/firmware_attributes.h>
+#include <linux/io.h>
+#include <linux/kdev_t.h>
+#include <linux/kobject.h>
+#include <linux/limits.h>
+#include <linux/list.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+#include <linux/sysfs.h>
+#include <linux/types.h>
+
+#include "coreboot_table.h"
+
+#define DRIVER_NAME "coreboot-cfr"
+
+#define LB_TAG_CFR_ROOT		0x47
+#define CFR_VERSION		0
+
+enum cfr_tags {
+	CFR_TAG_OPTION_FORM		= 1,
+	CFR_TAG_ENUM_VALUE		= 2,
+	CFR_TAG_OPTION_ENUM		= 3,
+	CFR_TAG_OPTION_NUMBER		= 4,
+	CFR_TAG_OPTION_BOOL		= 5,
+	CFR_TAG_VARCHAR_OPT_NAME	= 7,
+	CFR_TAG_VARCHAR_UI_NAME		= 8,
+	CFR_TAG_RUNTIME_APPLY		= 13,
+};
+
+enum cfr_option_flags {
+	CFR_OPTFLAG_READONLY	= BIT(0),
+	CFR_OPTFLAG_INACTIVE	= BIT(1),
+	CFR_OPTFLAG_SUPPRESS	= BIT(2),
+	CFR_OPTFLAG_VOLATILE	= BIT(3),
+	CFR_OPTFLAG_RUNTIME	= BIT(4),
+};
+
+enum cfr_runtime_apply_method {
+	CFR_RUNTIME_APPLY_NONE		= 0,
+	CFR_RUNTIME_APPLY_APM_CNT	= 1,
+};
+
+struct lb_cfr {
+	u32 tag;
+	u32 size;
+	u32 version;
+	u32 checksum;
+} __packed;
+
+struct lb_cfr_varbinary {
+	u32 tag;
+	u32 size;
+	u32 data_length;
+} __packed;
+
+struct lb_cfr_enum_value {
+	u32 tag;
+	u32 size;
+	u32 value;
+} __packed;
+
+struct lb_cfr_runtime_apply {
+	u32 tag;
+	u32 size;
+	u32 method;
+	u32 id;
+} __packed;
+
+struct lb_cfr_numeric_option {
+	u32 tag;
+	u32 size;
+	cb_u64 object_id;
+	cb_u64 dependency_id;
+	u32 flags;
+	u32 default_value;
+	u32 min;
+	u32 max;
+	u32 step;
+	u32 display_flags;
+} __packed;
+
+struct lb_cfr_option_form {
+	u32 tag;
+	u32 size;
+	cb_u64 object_id;
+	cb_u64 dependency_id;
+	u32 flags;
+} __packed;
+
+#define COREBOOT_CFR_OPT_SKIP_FLAGS \
+	(CFR_OPTFLAG_SUPPRESS | CFR_OPTFLAG_VOLATILE)
+
+#define COREBOOT_CFR_OPT_READ_ONLY_FLAGS \
+	(CFR_OPTFLAG_READONLY | CFR_OPTFLAG_INACTIVE)
+
+#define COREBOOT_CFR_EFI_ATTRS \
+	(EFI_VARIABLE_NON_VOLATILE | EFI_VARIABLE_BOOTSERVICE_ACCESS | \
+	 EFI_VARIABLE_RUNTIME_ACCESS)
+
+#define COREBOOT_CFR_APM_CNT_PORT	0xb2
+#define COREBOOT_CFR_APM_STS_PORT	0xb3
+#define COREBOOT_CFR_APM_APPLY_CMD	0xe3
+
+static efi_guid_t coreboot_cfr_guid = EFI_GUID(0xceae4c1d, 0x335b, 0x4685,
+					       0xa4, 0xa0, 0xfc, 0x4a,
+					       0x94, 0xee, 0xa0, 0x85);
+
+enum coreboot_cfr_setting_type {
+	COREBOOT_CFR_SETTING_ENUM,
+	COREBOOT_CFR_SETTING_NUMBER,
+	COREBOOT_CFR_SETTING_BOOL,
+};
+
+struct coreboot_cfr_enum {
+	char *label;
+	u32 value;
+};
+
+struct coreboot_cfr_setting {
+	struct kobject kobj;
+	struct list_head node;
+	struct coreboot_cfr_drvdata *drvdata;
+	enum coreboot_cfr_setting_type type;
+	char *name;
+	char *display_name;
+	struct coreboot_cfr_enum *values;
+	unsigned int n_values;
+	u32 default_value;
+	u32 min;
+	u32 max;
+	u32 step;
+	u32 runtime_apply_method;
+	u32 runtime_apply_id;
+	bool read_only;
+};
+
+struct coreboot_cfr_drvdata {
+	struct device *class_dev;
+	struct kset *attrs_kset;
+	struct list_head settings;
+	/* Serializes EFI variable writes and the matching runtime apply hook. */
+	struct mutex lock;
+	bool pending_reboot;
+};
+
+static struct coreboot_cfr_setting *to_coreboot_cfr_setting(struct kobject *kobj)
+{
+	return container_of(kobj, struct coreboot_cfr_setting, kobj);
+}
+
+static bool coreboot_cfr_string_is_valid_name(const char *name)
+{
+	return name && name[0] && !strchr(name, '/');
+}
+
+static char *coreboot_cfr_string_dup(const struct lb_cfr_varbinary *str)
+{
+	const char *data = (const char *)(str + 1);
+	size_t len = str->data_length;
+
+	if (len && !data[len - 1])
+		len--;
+
+	return kmemdup_nul(data, len, GFP_KERNEL);
+}
+
+static const struct coreboot_table_entry *
+coreboot_cfr_child_entry(const void *base, size_t len, u32 tag)
+{
+	const struct coreboot_table_entry *entry;
+	size_t off = 0;
+
+	while (off < len) {
+		if (len - off < sizeof(*entry))
+			return NULL;
+
+		entry = base + off;
+		if (entry->size < sizeof(*entry) || entry->size > len - off)
+			return NULL;
+
+		if (entry->tag == tag)
+			return entry;
+
+		off += entry->size;
+	}
+
+	return NULL;
+}
+
+static const struct lb_cfr_varbinary *
+coreboot_cfr_child_string(const void *base, size_t len, u32 tag)
+{
+	const struct lb_cfr_varbinary *str;
+	const struct coreboot_table_entry *entry;
+
+	entry = coreboot_cfr_child_entry(base, len, tag);
+	if (!entry)
+		return NULL;
+
+	if (entry->size < sizeof(*str))
+		return NULL;
+
+	str = (const struct lb_cfr_varbinary *)entry;
+	if (str->data_length > entry->size - sizeof(*str))
+		return NULL;
+
+	return str;
+}
+
+static const struct lb_cfr_runtime_apply *
+coreboot_cfr_child_runtime_apply(const void *base, size_t len)
+{
+	const struct lb_cfr_runtime_apply *runtime_apply;
+	const struct coreboot_table_entry *entry;
+
+	entry = coreboot_cfr_child_entry(base, len, CFR_TAG_RUNTIME_APPLY);
+	if (!entry)
+		return NULL;
+
+	if (entry->size < sizeof(*runtime_apply))
+		return ERR_PTR(-EINVAL);
+
+	runtime_apply = (const struct lb_cfr_runtime_apply *)entry;
+	if (runtime_apply->method == CFR_RUNTIME_APPLY_APM_CNT &&
+	    runtime_apply->id > U8_MAX)
+		return ERR_PTR(-EINVAL);
+
+	return runtime_apply;
+}
+
+static efi_char16_t *coreboot_cfr_efi_name(const char *name)
+{
+	size_t len, i;
+
+	len = strlen(name);
+	if (len >= EFI_VAR_NAME_LEN)
+		return ERR_PTR(-ENAMETOOLONG);
+
+	efi_char16_t *efi_name __free(kfree) =
+		kcalloc(len + 1, sizeof(*efi_name), GFP_KERNEL);
+	if (!efi_name)
+		return ERR_PTR(-ENOMEM);
+
+	for (i = 0; i < len; i++) {
+		if (!isascii(name[i]))
+			return ERR_PTR(-EINVAL);
+		efi_name[i] = name[i];
+	}
+
+	return no_free_ptr(efi_name);
+}
+
+static int coreboot_cfr_read_value(const struct coreboot_cfr_setting *setting,
+				   u32 *value, u32 *attrs)
+{
+	unsigned long size = sizeof(__le32);
+	efi_char16_t *efi_name;
+	efi_status_t status;
+	__le32 data;
+	u32 attr;
+
+	efi_name = coreboot_cfr_efi_name(setting->name);
+	if (IS_ERR(efi_name))
+		return PTR_ERR(efi_name);
+
+	status = efivar_get_variable(efi_name, &coreboot_cfr_guid, &attr,
+				     &size, &data);
+	kfree(efi_name);
+	if (status != EFI_SUCCESS)
+		return efi_status_to_err(status);
+
+	if (size != sizeof(data))
+		return -EINVAL;
+
+	if (!(attr & EFI_VARIABLE_RUNTIME_ACCESS))
+		return -EOPNOTSUPP;
+
+	*value = le32_to_cpu(data);
+	if (attrs)
+		*attrs = attr;
+
+	return 0;
+}
+
+static int coreboot_cfr_write_efi_value(struct coreboot_cfr_setting *setting,
+					u32 value, u32 attrs)
+{
+	efi_char16_t *efi_name;
+	efi_status_t status;
+	__le32 data;
+
+	efi_name = coreboot_cfr_efi_name(setting->name);
+	if (IS_ERR(efi_name))
+		return PTR_ERR(efi_name);
+
+	data = cpu_to_le32(value);
+	status = efivar_set_variable(efi_name, &coreboot_cfr_guid, attrs,
+				     sizeof(data), &data);
+	kfree(efi_name);
+	if (status != EFI_SUCCESS)
+		return efi_status_to_err(status);
+
+	return 0;
+}
+
+static int coreboot_cfr_apply_runtime(struct coreboot_cfr_setting *setting)
+{
+#ifdef CONFIG_X86
+	u8 status;
+
+	if (setting->runtime_apply_method != CFR_RUNTIME_APPLY_APM_CNT ||
+	    !setting->runtime_apply_id)
+		return -EOPNOTSUPP;
+
+	outb((u8)setting->runtime_apply_id, COREBOOT_CFR_APM_STS_PORT);
+	outb(COREBOOT_CFR_APM_APPLY_CMD, COREBOOT_CFR_APM_CNT_PORT);
+	status = inb(COREBOOT_CFR_APM_STS_PORT);
+	if (status)
+		return -EIO;
+
+	return 0;
+#else
+	return -EOPNOTSUPP;
+#endif
+}
+
+static int coreboot_cfr_write_value(struct coreboot_cfr_setting *setting,
+				    u32 value)
+{
+	u32 attrs;
+	u32 old;
+	int ret;
+	bool changed = false;
+
+	if (setting->read_only)
+		return -EACCES;
+
+	scoped_guard(mutex, &setting->drvdata->lock) {
+		ret = coreboot_cfr_read_value(setting, &old, &attrs);
+		if (ret)
+			return ret;
+
+		if ((attrs & COREBOOT_CFR_EFI_ATTRS) != COREBOOT_CFR_EFI_ATTRS)
+			return -EOPNOTSUPP;
+
+		if (old == value)
+			return 0;
+
+		ret = coreboot_cfr_write_efi_value(setting, value, attrs);
+		if (ret)
+			return ret;
+		changed = true;
+
+		ret = coreboot_cfr_apply_runtime(setting);
+		if (ret == -EOPNOTSUPP) {
+			/* EFI changed; firmware will consume it after reboot. */
+			setting->drvdata->pending_reboot = true;
+			ret = 0;
+		} else if (ret) {
+			int restore_ret;
+
+			restore_ret = coreboot_cfr_write_efi_value(setting, old, attrs);
+			if (restore_ret)
+				ret = restore_ret;
+			else
+				changed = false;
+		}
+	}
+
+	if (changed)
+		kobject_uevent(&setting->drvdata->class_dev->kobj, KOBJ_CHANGE);
+	return ret;
+}
+
+static const char *
+coreboot_cfr_label_from_value(const struct coreboot_cfr_setting *setting,
+			      u32 value)
+{
+	unsigned int i;
+
+	for (i = 0; i < setting->n_values; i++) {
+		if (setting->values[i].value == value)
+			return setting->values[i].label;
+	}
+
+	return NULL;
+}
+
+static int coreboot_cfr_parse_value(struct coreboot_cfr_setting *setting,
+				    const char *label, u32 *value_out)
+{
+	unsigned int i;
+
+	for (i = 0; i < setting->n_values; i++) {
+		if (!sysfs_streq(label, setting->values[i].label))
+			continue;
+
+		*value_out = setting->values[i].value;
+		return 0;
+	}
+
+	return kstrtou32(label, 0, value_out);
+}
+
+static bool coreboot_cfr_value_is_valid(struct coreboot_cfr_setting *setting,
+					u32 value)
+{
+	u32 delta;
+
+	if (setting->type != COREBOOT_CFR_SETTING_NUMBER)
+		return coreboot_cfr_label_from_value(setting, value);
+
+	if (value < setting->min || value > setting->max)
+		return false;
+
+	if (!setting->step)
+		return true;
+
+	delta = value - setting->min;
+	return delta % setting->step == 0;
+}
+
+static ssize_t type_show(struct kobject *kobj, struct kobj_attribute *attr,
+			 char *buf)
+{
+	struct coreboot_cfr_setting *setting = to_coreboot_cfr_setting(kobj);
+
+	if (setting->type == COREBOOT_CFR_SETTING_NUMBER)
+		return sysfs_emit(buf, "integer\n");
+
+	return sysfs_emit(buf, "enumeration\n");
+}
+
+static ssize_t display_name_language_code_show(struct kobject *kobj,
+					       struct kobj_attribute *attr,
+					       char *buf)
+{
+	return sysfs_emit(buf, "en_US.UTF-8\n");
+}
+
+static ssize_t display_name_show(struct kobject *kobj,
+				 struct kobj_attribute *attr, char *buf)
+{
+	struct coreboot_cfr_setting *setting = to_coreboot_cfr_setting(kobj);
+
+	return sysfs_emit(buf, "%s\n", setting->display_name);
+}
+
+static ssize_t possible_values_show(struct kobject *kobj,
+				    struct kobj_attribute *attr, char *buf)
+{
+	struct coreboot_cfr_setting *setting = to_coreboot_cfr_setting(kobj);
+	ssize_t len = 0;
+	unsigned int i;
+
+	for (i = 0; i < setting->n_values; i++) {
+		len += sysfs_emit_at(buf, len, "%s%s", i ? ";" : "",
+				     setting->values[i].label);
+		if (len >= PAGE_SIZE)
+			return len;
+	}
+
+	len += sysfs_emit_at(buf, len, "\n");
+	return len;
+}
+
+static ssize_t min_value_show(struct kobject *kobj, struct kobj_attribute *attr,
+			      char *buf)
+{
+	struct coreboot_cfr_setting *setting = to_coreboot_cfr_setting(kobj);
+
+	return sysfs_emit(buf, "%u\n", setting->min);
+}
+
+static ssize_t max_value_show(struct kobject *kobj, struct kobj_attribute *attr,
+			      char *buf)
+{
+	struct coreboot_cfr_setting *setting = to_coreboot_cfr_setting(kobj);
+
+	return sysfs_emit(buf, "%u\n", setting->max);
+}
+
+static ssize_t scalar_increment_show(struct kobject *kobj,
+				     struct kobj_attribute *attr, char *buf)
+{
+	struct coreboot_cfr_setting *setting = to_coreboot_cfr_setting(kobj);
+
+	return sysfs_emit(buf, "%u\n", setting->step);
+}
+
+static ssize_t default_value_show(struct kobject *kobj,
+				  struct kobj_attribute *attr, char *buf)
+{
+	struct coreboot_cfr_setting *setting = to_coreboot_cfr_setting(kobj);
+	const char *label;
+
+	if (setting->type == COREBOOT_CFR_SETTING_NUMBER)
+		return sysfs_emit(buf, "%u\n", setting->default_value);
+
+	label = coreboot_cfr_label_from_value(setting, setting->default_value);
+	if (!label)
+		return sysfs_emit(buf, "%u\n", setting->default_value);
+
+	return sysfs_emit(buf, "%s\n", label);
+}
+
+static ssize_t current_value_show(struct kobject *kobj,
+				  struct kobj_attribute *attr, char *buf)
+{
+	struct coreboot_cfr_setting *setting = to_coreboot_cfr_setting(kobj);
+	const char *label;
+	u32 value;
+	int ret;
+
+	ret = coreboot_cfr_read_value(setting, &value, NULL);
+	if (ret)
+		return ret;
+
+	if (setting->type == COREBOOT_CFR_SETTING_NUMBER)
+		return sysfs_emit(buf, "%u\n", value);
+
+	label = coreboot_cfr_label_from_value(setting, value);
+	if (!label)
+		return -EINVAL;
+
+	return sysfs_emit(buf, "%s\n", label);
+}
+
+static ssize_t current_value_store(struct kobject *kobj,
+				   struct kobj_attribute *attr,
+				   const char *buf, size_t count)
+{
+	struct coreboot_cfr_setting *setting = to_coreboot_cfr_setting(kobj);
+	u32 value;
+	int ret;
+
+	ret = coreboot_cfr_parse_value(setting, buf, &value);
+	if (ret)
+		return ret;
+
+	if (!coreboot_cfr_value_is_valid(setting, value))
+		return -EINVAL;
+
+	ret = coreboot_cfr_write_value(setting, value);
+	if (ret)
+		return ret;
+
+	return count;
+}
+
+static struct kobj_attribute type_attr = __ATTR_RO(type);
+static struct kobj_attribute display_name_language_code_attr =
+	__ATTR_RO(display_name_language_code);
+static struct kobj_attribute display_name_attr = __ATTR_RO(display_name);
+static struct kobj_attribute possible_values_attr = __ATTR_RO(possible_values);
+static struct kobj_attribute min_value_attr = __ATTR_RO(min_value);
+static struct kobj_attribute max_value_attr = __ATTR_RO(max_value);
+static struct kobj_attribute scalar_increment_attr = __ATTR_RO(scalar_increment);
+static struct kobj_attribute default_value_attr = __ATTR_RO(default_value);
+static struct kobj_attribute current_value_attr = __ATTR_RW(current_value);
+
+static struct attribute *coreboot_cfr_setting_attrs[] = {
+	&type_attr.attr,
+	&display_name_language_code_attr.attr,
+	&display_name_attr.attr,
+	&possible_values_attr.attr,
+	&min_value_attr.attr,
+	&max_value_attr.attr,
+	&scalar_increment_attr.attr,
+	&default_value_attr.attr,
+	&current_value_attr.attr,
+	NULL,
+};
+
+static umode_t coreboot_cfr_attr_is_visible(struct kobject *kobj,
+					    struct attribute *attr, int n)
+{
+	struct coreboot_cfr_setting *setting = to_coreboot_cfr_setting(kobj);
+
+	if (setting->type == COREBOOT_CFR_SETTING_NUMBER &&
+	    attr == &possible_values_attr.attr)
+		return 0;
+
+	if (setting->type != COREBOOT_CFR_SETTING_NUMBER &&
+	    (attr == &min_value_attr.attr || attr == &max_value_attr.attr ||
+	     attr == &scalar_increment_attr.attr))
+		return 0;
+
+	if (setting->read_only && attr == &current_value_attr.attr)
+		return 0444;
+
+	return attr->mode;
+}
+
+static const struct attribute_group coreboot_cfr_setting_group = {
+	.attrs = coreboot_cfr_setting_attrs,
+	.is_visible = coreboot_cfr_attr_is_visible,
+};
+
+static void coreboot_cfr_free_setting(struct coreboot_cfr_setting *setting)
+{
+	unsigned int i;
+
+	for (i = 0; i < setting->n_values; i++)
+		kfree(setting->values[i].label);
+
+	kfree(setting->values);
+	kfree(setting->display_name);
+	kfree(setting->name);
+	kfree(setting);
+}
+
+static void coreboot_cfr_setting_release(struct kobject *kobj)
+{
+	coreboot_cfr_free_setting(to_coreboot_cfr_setting(kobj));
+}
+
+static const struct kobj_type coreboot_cfr_setting_ktype = {
+	.release = coreboot_cfr_setting_release,
+	.sysfs_ops = &kobj_sysfs_ops,
+};
+
+static ssize_t pending_reboot_show(struct kobject *kobj,
+				   struct kobj_attribute *attr, char *buf)
+{
+	struct coreboot_cfr_drvdata *data;
+
+	data = dev_get_drvdata(kobj_to_dev(kobj->parent));
+
+	return sysfs_emit(buf, "%d\n", data->pending_reboot);
+}
+
+static struct kobj_attribute pending_reboot_attr = __ATTR_RO(pending_reboot);
+
+static int coreboot_cfr_copy_bool_values(struct coreboot_cfr_setting *setting)
+{
+	static const struct coreboot_cfr_enum bool_values[] = {
+		{ .label = "Disabled", .value = 0 },
+		{ .label = "Enabled", .value = 1 },
+	};
+	unsigned int i;
+
+	setting->values = kcalloc(ARRAY_SIZE(bool_values), sizeof(*setting->values),
+				  GFP_KERNEL);
+	if (!setting->values)
+		return -ENOMEM;
+
+	for (i = 0; i < ARRAY_SIZE(bool_values); i++) {
+		setting->values[i].label = kstrdup(bool_values[i].label,
+						   GFP_KERNEL);
+		if (!setting->values[i].label)
+			return -ENOMEM;
+		setting->values[i].value = bool_values[i].value;
+		setting->n_values++;
+	}
+
+	return 0;
+}
+
+static int coreboot_cfr_count_enum_values(const void *base, size_t len)
+{
+	const struct coreboot_table_entry *entry;
+	size_t off = 0;
+	int count = 0;
+
+	while (off < len) {
+		if (len - off < sizeof(*entry))
+			return -EINVAL;
+
+		entry = base + off;
+		if (entry->size < sizeof(*entry) || entry->size > len - off)
+			return -EINVAL;
+
+		if (entry->tag == CFR_TAG_ENUM_VALUE)
+			count++;
+
+		off += entry->size;
+	}
+
+	return count;
+}
+
+static int coreboot_cfr_copy_enum_values(struct coreboot_cfr_setting *setting,
+					 const void *base, size_t len)
+{
+	const struct lb_cfr_enum_value *enum_value;
+	const struct lb_cfr_varbinary *label;
+	const struct coreboot_table_entry *entry;
+	size_t off = 0;
+	int count;
+
+	count = coreboot_cfr_count_enum_values(base, len);
+	if (count <= 0)
+		return count ?: -EINVAL;
+
+	setting->values = kcalloc(count, sizeof(*setting->values), GFP_KERNEL);
+	if (!setting->values)
+		return -ENOMEM;
+
+	while (off < len) {
+		entry = base + off;
+		if (entry->tag != CFR_TAG_ENUM_VALUE) {
+			off += entry->size;
+			continue;
+		}
+
+		if (entry->size < sizeof(*enum_value))
+			return -EINVAL;
+
+		enum_value = base + off;
+		label = coreboot_cfr_child_string(enum_value + 1,
+						  enum_value->size - sizeof(*enum_value),
+						  CFR_TAG_VARCHAR_UI_NAME);
+		if (!label)
+			return -EINVAL;
+
+		setting->values[setting->n_values].label =
+			coreboot_cfr_string_dup(label);
+		if (!setting->values[setting->n_values].label)
+			return -ENOMEM;
+
+		setting->values[setting->n_values].value = enum_value->value;
+		setting->n_values++;
+		off += entry->size;
+	}
+
+	return 0;
+}
+
+static int coreboot_cfr_setting_is_usable(struct coreboot_cfr_setting *setting)
+{
+	u32 value;
+	int ret;
+
+	ret = coreboot_cfr_read_value(setting, &value, NULL);
+	if (ret)
+		return ret;
+
+	if (!coreboot_cfr_value_is_valid(setting, value))
+		return -EINVAL;
+
+	return 0;
+}
+
+static int coreboot_cfr_register_setting(struct coreboot_cfr_drvdata *data,
+					 struct coreboot_cfr_setting *setting)
+{
+	int ret;
+
+	ret = kobject_init_and_add(&setting->kobj, &coreboot_cfr_setting_ktype,
+				   &data->attrs_kset->kobj, "%s", setting->name);
+	if (ret) {
+		kobject_put(&setting->kobj);
+		return ret;
+	}
+
+	ret = sysfs_create_group(&setting->kobj, &coreboot_cfr_setting_group);
+	if (ret) {
+		kobject_put(&setting->kobj);
+		return ret;
+	}
+
+	list_add_tail(&setting->node, &data->settings);
+	return 0;
+}
+
+static int coreboot_cfr_add_numeric_option(struct coreboot_cfr_drvdata *data,
+					   const struct lb_cfr_numeric_option *option)
+{
+	const struct lb_cfr_varbinary *name;
+	const struct lb_cfr_varbinary *display_name;
+	const struct lb_cfr_runtime_apply *runtime_apply;
+	const void *child_base = option + 1;
+	struct coreboot_cfr_setting *setting;
+	size_t child_len = option->size - sizeof(*option);
+	int ret;
+
+	if (!(option->flags & CFR_OPTFLAG_RUNTIME))
+		return 0;
+
+	if (option->flags & COREBOOT_CFR_OPT_SKIP_FLAGS)
+		return 0;
+
+	if (option->dependency_id)
+		return 0;
+
+	setting = kzalloc_obj(*setting, GFP_KERNEL);
+	if (!setting)
+		return -ENOMEM;
+
+	INIT_LIST_HEAD(&setting->node);
+	setting->drvdata = data;
+	setting->default_value = option->default_value;
+	setting->min = option->min;
+	setting->max = option->max;
+	setting->step = option->step ?: 1;
+	setting->read_only = option->flags & COREBOOT_CFR_OPT_READ_ONLY_FLAGS;
+
+	runtime_apply = coreboot_cfr_child_runtime_apply(child_base, child_len);
+	if (IS_ERR(runtime_apply)) {
+		ret = PTR_ERR(runtime_apply);
+		goto err_put_setting;
+	}
+
+	if (runtime_apply && runtime_apply->method == CFR_RUNTIME_APPLY_APM_CNT &&
+	    runtime_apply->id) {
+		setting->runtime_apply_method = runtime_apply->method;
+		setting->runtime_apply_id = runtime_apply->id;
+	}
+
+	name = coreboot_cfr_child_string(child_base, child_len,
+					 CFR_TAG_VARCHAR_OPT_NAME);
+	if (!name) {
+		ret = -EINVAL;
+		goto err_put_setting;
+	}
+
+	setting->name = coreboot_cfr_string_dup(name);
+	if (!setting->name) {
+		ret = -ENOMEM;
+		goto err_put_setting;
+	}
+
+	if (!coreboot_cfr_string_is_valid_name(setting->name)) {
+		ret = -EINVAL;
+		goto err_put_setting;
+	}
+
+	display_name = coreboot_cfr_child_string(child_base, child_len,
+						 CFR_TAG_VARCHAR_UI_NAME);
+	if (display_name)
+		setting->display_name = coreboot_cfr_string_dup(display_name);
+	else
+		setting->display_name = kstrdup(setting->name, GFP_KERNEL);
+	if (!setting->display_name) {
+		ret = -ENOMEM;
+		goto err_put_setting;
+	}
+
+	switch (option->tag) {
+	case CFR_TAG_OPTION_BOOL:
+		setting->type = COREBOOT_CFR_SETTING_BOOL;
+		setting->min = 0;
+		setting->max = 1;
+		setting->step = 1;
+		ret = coreboot_cfr_copy_bool_values(setting);
+		break;
+	case CFR_TAG_OPTION_ENUM:
+		setting->type = COREBOOT_CFR_SETTING_ENUM;
+		ret = coreboot_cfr_copy_enum_values(setting, child_base,
+						    child_len);
+		break;
+	case CFR_TAG_OPTION_NUMBER:
+		setting->type = COREBOOT_CFR_SETTING_NUMBER;
+		if (!setting->min && !setting->max)
+			setting->max = U32_MAX;
+		else if (setting->max < setting->min)
+			setting->max = U32_MAX;
+		ret = 0;
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
+
+	if (ret)
+		goto err_put_setting;
+
+	ret = coreboot_cfr_setting_is_usable(setting);
+	if (ret) {
+		ret = 0;
+		goto err_put_setting;
+	}
+
+	ret = coreboot_cfr_register_setting(data, setting);
+	if (ret)
+		return ret;
+
+	return 0;
+
+err_put_setting:
+	coreboot_cfr_free_setting(setting);
+	return ret;
+}
+
+static int coreboot_cfr_parse_records(struct coreboot_cfr_drvdata *data,
+				      const void *base, size_t len)
+{
+	const struct coreboot_table_entry *entry;
+	const void *child_base;
+	size_t child_len;
+	size_t off = 0;
+	int ret;
+
+	while (off < len) {
+		if (len - off < sizeof(*entry))
+			return -EINVAL;
+
+		entry = base + off;
+		if (entry->size < sizeof(*entry) || entry->size > len - off)
+			return -EINVAL;
+
+		switch (entry->tag) {
+		case CFR_TAG_OPTION_FORM:
+			if (entry->size < sizeof(struct lb_cfr_option_form))
+				return -EINVAL;
+
+			child_base = base + off + sizeof(struct lb_cfr_option_form);
+			child_len = entry->size - sizeof(struct lb_cfr_option_form);
+			ret = coreboot_cfr_parse_records(data, child_base,
+							 child_len);
+			if (ret)
+				return ret;
+			break;
+		case CFR_TAG_OPTION_ENUM:
+		case CFR_TAG_OPTION_NUMBER:
+		case CFR_TAG_OPTION_BOOL:
+			if (entry->size < sizeof(struct lb_cfr_numeric_option))
+				return -EINVAL;
+			ret = coreboot_cfr_add_numeric_option(data, base + off);
+			if (ret)
+				return ret;
+			break;
+		default:
+			break;
+		}
+
+		off += entry->size;
+	}
+
+	return 0;
+}
+
+static void coreboot_cfr_unregister_settings(struct coreboot_cfr_drvdata *data)
+{
+	struct coreboot_cfr_setting *setting, *tmp;
+
+	list_for_each_entry_safe(setting, tmp, &data->settings, node) {
+		sysfs_remove_group(&setting->kobj, &coreboot_cfr_setting_group);
+		list_del(&setting->node);
+		kobject_put(&setting->kobj);
+	}
+}
+
+static int coreboot_cfr_probe(struct coreboot_device *dev)
+{
+	const struct lb_cfr *root = (const struct lb_cfr *)dev->raw;
+	struct coreboot_cfr_drvdata *data;
+	size_t payload_len;
+	int ret;
+
+	if (dev->entry.size < sizeof(*root))
+		return -EINVAL;
+
+	if (root->tag != LB_TAG_CFR_ROOT || root->version != CFR_VERSION)
+		return -EINVAL;
+
+	if (root->size < sizeof(*root) || root->size > dev->entry.size)
+		return -EINVAL;
+
+	if (!efivar_is_available())
+		return -EPROBE_DEFER;
+
+	data = devm_kzalloc(&dev->dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	INIT_LIST_HEAD(&data->settings);
+	ret = devm_mutex_init(&dev->dev, &data->lock);
+	if (ret)
+		return ret;
+
+	dev_set_drvdata(&dev->dev, data);
+
+	data->class_dev = device_create(&firmware_attributes_class, NULL,
+					MKDEV(0, 0), NULL, DRIVER_NAME);
+	if (IS_ERR(data->class_dev)) {
+		ret = PTR_ERR(data->class_dev);
+		goto err_clear_data;
+	}
+	dev_set_drvdata(data->class_dev, data);
+
+	data->attrs_kset = kset_create_and_add("attributes", NULL,
+					       &data->class_dev->kobj);
+	if (!data->attrs_kset) {
+		ret = -ENOMEM;
+		goto err_unregister_dev;
+	}
+
+	ret = sysfs_create_file(&data->attrs_kset->kobj,
+				&pending_reboot_attr.attr);
+	if (ret)
+		goto err_unregister_attrs;
+
+	payload_len = root->size - sizeof(*root);
+	ret = coreboot_cfr_parse_records(data, root + 1, payload_len);
+	if (ret)
+		goto err_unregister_settings;
+
+	if (list_empty(&data->settings)) {
+		ret = -ENODEV;
+		goto err_unregister_settings;
+	}
+
+	return 0;
+
+err_unregister_settings:
+	coreboot_cfr_unregister_settings(data);
+	sysfs_remove_file(&data->attrs_kset->kobj, &pending_reboot_attr.attr);
+err_unregister_attrs:
+	kset_unregister(data->attrs_kset);
+err_unregister_dev:
+	device_unregister(data->class_dev);
+err_clear_data:
+	return ret;
+}
+
+static void coreboot_cfr_remove(struct coreboot_device *dev)
+{
+	struct coreboot_cfr_drvdata *data = dev_get_drvdata(&dev->dev);
+
+	coreboot_cfr_unregister_settings(data);
+	sysfs_remove_file(&data->attrs_kset->kobj, &pending_reboot_attr.attr);
+	kset_unregister(data->attrs_kset);
+	device_unregister(data->class_dev);
+}
+
+static const struct coreboot_device_id coreboot_cfr_ids[] = {
+	{ .tag = LB_TAG_CFR_ROOT },
+	{ }
+};
+MODULE_DEVICE_TABLE(coreboot, coreboot_cfr_ids);
+
+static struct coreboot_driver coreboot_cfr_driver = {
+	.probe = coreboot_cfr_probe,
+	.remove = coreboot_cfr_remove,
+	.drv = {
+		.name = DRIVER_NAME,
+	},
+	.id_table = coreboot_cfr_ids,
+};
+module_coreboot_driver(coreboot_cfr_driver);
+
+MODULE_AUTHOR("Sean Rhodes <sean@starlabs.systems>");
+MODULE_DESCRIPTION("coreboot CFR firmware attributes driver");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("EFIVAR");
-- 
2.53.0

