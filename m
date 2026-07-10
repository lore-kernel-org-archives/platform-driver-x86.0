Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F05438024
	for <platform-driver-x86@vger.kernel.org>; Fri, 10 Jul 2026 16:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783701630; cv=pass; b=H4Cm9ouHntmqtz9MH5mLqol9G9Ehqv8wki57MfXaq1pBbEl/2/EibyEbf7Wcf8UYhy282uGi5UelIcML9b2MT2kjdTCZX/JNAPeShhTC0H1eNtA9DE5Ae26CtiIta/j1gGrw7Va5TVHr6Cs4tUZnBkJJZR+OU9WT9floP3G/JXY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783701630; c=relaxed/simple;
	bh=NK+kVKP6S362cx75ooRInZXocT5imFpcPn3okOB3JTc=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=MuZRvOVDPbiJbJImmzh0j1kRiDLJZT5llK4uoK2MmuGk0TmP6UUojkBNekbWV08BNOnkxk/xCZBN+NbX10Z89An9B+8/2tcoZUOqfaVCMiJMoFKho+HRjKJ1DIYVPdUZ3NcQqeMdiIXJ80aHlHe0oLVr5bkTpwrJ11ZXrLjBEKQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems; spf=pass smtp.mailfrom=starlabs.systems; dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b=yq9il0gc; arc=pass smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b="yq9il0gc"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-80d33d13a23so14385927b3.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 10 Jul 2026 09:40:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783701626; cv=none;
        d=google.com; s=arc-20260327;
        b=ijDNME1CstjtNAD4kdMFU4z2oXiyyc6AAoWdqyWmoj3+yUKe0nHSYwawQnVPyumK63
         j4c+7CQj0hIyTpFAD0gtoz3tUr9BSilgdb6FTUBaWl3ao8nlULrEf0Xbv/0O35WC93qt
         HVm3BJxrVxqUjI4f1PcVLI8qI6rypLHtGW1RqApjTzw6h9I3cX7jboPOlZpuRJ/f0vIm
         ZGLFuZ/G39D2ZA5Ndpw/cWWCSXjddd1vfay1jbqU61grJ/PElEG3I8M4VQ2kxjTbchUU
         Mv/cgUfICPN/vo39AvgO5jSMWUKo9taYcRtAlxunufC7mcrsD12XZvovLYSNxgJByJD8
         TxjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=6joQop+mUU8/A+piRVr/gTp2aCUMp1Wx0Jn3WJ6CmQ0=;
        fh=jAWcbMwF00rmhF5dUFfjkeNuS2U1xFJ+H3VzMXq12Mc=;
        b=hTXwY9A89WMyxPFYF/tWt4pZSBgWCNYob10fdLckYtZIK5w5JzeVRJbaZGAArPzCRt
         kHPCpTtgGGFfA5iiJqSGkX6Lfthw86kxtpNj5ccBeWQUVSYicTW8AMdQy8WTMoNJhnpv
         SoaOP2jsjXN8Zl9RcLYDBezuCzvQKDGl+ZtvyEkt0vbeHeVsGn1KQe2XAOxumX+G7ek8
         DDF8offzP1lTB9DLo+PzrobgSLlHsD/puRHTxH8rur0vsqQC5IL6eAMal4n99TGs6hji
         MJ4raHyWkPcBWwbEJzQv9HcOi5tDprfJq9+GggyT+3qIPBTyWMrtLaayNWhMZOJdYaxT
         KTKg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20251104.gappssmtp.com; s=20251104; t=1783701626; x=1784306426; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6joQop+mUU8/A+piRVr/gTp2aCUMp1Wx0Jn3WJ6CmQ0=;
        b=yq9il0gcT1dDzGDixxqWQMLsyb6wzgdlBGXJVwv2hPHT/wAQLXF5D375JqZa5rVpRW
         A0QvaTth5J8Wu4Hc0bWkoBtayrx6sQg/he/lc0X1uavQSaBrcOcyezYakVBE+gr+mdIz
         T8FMaLv3EoWLWnSSqHBdcs2/L7FQV3rkPVuAvHN4YPfTnCvKJUq5oBO6PcEAg9aZSONl
         zVBMEDZ4dfhUcOmG4TutCXZYuswxOwvYHWNkjXbLPuVzCNPDu+r57n5TGetHCy6wTUcf
         8xMFAJUkGK+wzC6RC4x2NZLk9B2ouIyC5Hj+Tq/zWR4d25sQU740PpCHMwT+TQp1LTvQ
         7vng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783701626; x=1784306426;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6joQop+mUU8/A+piRVr/gTp2aCUMp1Wx0Jn3WJ6CmQ0=;
        b=KqHDeCW4JcTeRSSXOh08WG9K8Zc1OjfyAOrANP46ug579Oy5oqRVo1rIaGfhhCjjas
         yFd8/DT075pugqLzsVrrTZ1b0gGgQbKdU7PqntD6QgdjOfbHwg62cSWTHmySAMThZln6
         kcWuHw1q5/WlhPNG9mz1Vkd/zagX51c0UX8M/m9F4QgvxRQE9GN1O7NqhOz8pmoJkChJ
         hWxVFjexk0IhJTGcffsxMhClxTf3DsUcF+eH6Rf/icDlZXPij8wWd/dRYISWmQBCERmj
         M9tfHq9bLJmJnY9ciM8uj0iMn8kKlzHQHdwtNANJpgINrASRr4AP7I0TWMHks5z7kMeY
         QXAQ==
X-Forwarded-Encrypted: i=1; AHgh+RplyQt7eUWdJ5O+W6D4rRKA6POADakS0r99h1bl7ym1wRzaPpFRasrLYC+FUupr7Rpn4iIpbSTktIYoL8LvY+MmpsrV@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6z0wG99sKVmiswlqmRXulPMpVWCrQ7VKJ0cT3VSZafXz6iBNT
	1mlJ+1fWPmoSvEdVadd+BtFGOPRHyiAZagCus1zdRAeFcVrgCn1z5LFjTgZA9PXpqV78vkOz4Vz
	HAp1JKYIAkJp4O7fCekQpPta3+DM8n74uVcT8AeeS
X-Gm-Gg: AfdE7cnH6VAzGjkf6w7nqh+ZVwbrrFT2tlgWP4K06jIufwrKQBPdEYo+aPvpAqhfGH3
	kJjv3VdDTKjpKKcg0C714OM2x/TqC0j1ADE6Zyx78f2i3kVAfJu9LGvtbDoCHUF7o5s3w1cMU6b
	31HtEmGPvdpKgfyODBGVc1OusUn8/46Uc4CMG60ZDt3i7OD8WQWuQA4wfl4+Zu2Ftb9o5yQM78j
	Fp0wWQ/pAlnZnu6mOxq+PEZavdiJLBVzUCcTut12frgZF+FDLqcopcsdpGv2Ja1P/eKeLtLXWtI
	gYuRE9MhkPC9yUX68zW4EuSxrWE=
X-Received: by 2002:a05:690c:3384:b0:81e:6d5d:3634 with SMTP id
 00721157ae682-81e6d5d372cmr55622987b3.6.1783701625764; Fri, 10 Jul 2026
 09:40:25 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 10 Jul 2026 11:40:24 -0500
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 10 Jul 2026 11:40:24 -0500
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Sean Rhodes <sean@starlabs.systems>
Date: Fri, 10 Jul 2026 11:40:24 -0500
X-Gm-Features: AUfX_mwUJBJHeBWEdCA3gaxWrbe0ttLSmA8x9e--kx9nBsNgH6JthS95a_lzJPI
Message-ID: <CABtds-39j-1r+XOB9gZPXFuiBumL3PjEco+2OFzz3CfXJqDjQw@mail.gmail.com>
Subject: [PATCH v4 3/3] firmware: coreboot: Add CFR firmware attributes driver
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Hans de Goede <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Corentin Chary <corentin.chary@gmail.com>, "Luke D. Jones" <luke@ljones.dev>, 
	Denis Benato <denis.benato@linux.dev>, Prasanth Ksr <prasanth.ksr@dell.com>, 
	Jorge Lopez <jorge.lopez2@hp.com>, Mark Pearson <mpearson-lenovo@squebb.ca>, 
	"Derek J. Clark" <derekjohn.clark@gmail.com>, Joshua Grisham <josh@joshuagrisham.com>, 
	Brian Norris <briannorris@chromium.org>, Julius Werner <jwerner@chromium.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Javier Martinez Canillas <javierm@redhat.com>, Kees Cook <kees@kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Huacai Chen <chenhuacai@kernel.org>, 
	Chen-Yu Tsai <wenst@chromium.org>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Titouan Ameline de Cadeville <titouan.ameline@gmail.com>, linux-kernel@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com, 
	chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

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
 drivers/firmware/coreboot/coreboot-cfr.c | 1068 ++++++++++++++++++++++
 4 files changed, 1088 insertions(+)
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
diff --git a/drivers/firmware/coreboot/Kconfig
b/drivers/firmware/coreboot/Kconfig
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
diff --git a/drivers/firmware/coreboot/Makefile
b/drivers/firmware/coreboot/Makefile
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
diff --git a/drivers/firmware/coreboot/coreboot-cfr.c
b/drivers/firmware/coreboot/coreboot-cfr.c
new file mode 100644
index 000000000000..3171f9006032
--- /dev/null
+++ b/drivers/firmware/coreboot/coreboot-cfr.c
@@ -0,0 +1,1068 @@
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
+#include <linux/efi.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/kdev_t.h>
+#include <linux/kobject.h>
+#include <linux/limits.h>
+#include <linux/list.h>
+#include <linux/device-id/coreboot.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+#include <linux/sysfs.h>
+#include <linux/types.h>
+
+#include <linux/firmware_attributes.h>
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
+static struct coreboot_cfr_drvdata *coreboot_cfr_data;
+
+static struct coreboot_cfr_setting *to_coreboot_cfr_setting(struct
kobject *kobj)
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
+	const char *data = (const char *)str + sizeof(*str);
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
+static ssize_t min_value_show(struct kobject *kobj, struct
kobj_attribute *attr,
+			      char *buf)
+{
+	struct coreboot_cfr_setting *setting = to_coreboot_cfr_setting(kobj);
+
+	return sysfs_emit(buf, "%u\n", setting->min);
+}
+
+static ssize_t max_value_show(struct kobject *kobj, struct
kobj_attribute *attr,
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
+static struct kobj_attribute scalar_increment_attr =
__ATTR_RO(scalar_increment);
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
+	return sysfs_emit(buf, "%d\n",
+			  coreboot_cfr_data && coreboot_cfr_data->pending_reboot);
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
+	coreboot_cfr_data = data;
+
+	data->class_dev = device_create(&firmware_attributes_class, NULL,
+					MKDEV(0, 0), NULL, DRIVER_NAME);
+	if (IS_ERR(data->class_dev)) {
+		ret = PTR_ERR(data->class_dev);
+		goto err_clear_data;
+	}
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
+	if (coreboot_cfr_data == data)
+		coreboot_cfr_data = NULL;
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
+	if (coreboot_cfr_data == data)
+		coreboot_cfr_data = NULL;
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
