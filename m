Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67FF6377AAB
	for <platform-driver-x86@vger.kernel.org>; Fri, 17 Jul 2026 08:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784278210; cv=none; b=XMKGKEFCppVRt5nCX7jnaAI/T29G3B0mx2pTCqzXGJreJ29JmFjm0ff5UDONfHaDLKvDj+/vq2DmWSzjH49i1SBoMySfLU8n7h3XGBKXaUOOJ7wM3ekBfSIlEabEk0pedwonY12rJ8F1Pcf6sCTS69CYixTddAwa6lXe+7TjYCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784278210; c=relaxed/simple;
	bh=wQDkd4qhzspIG4mNV9Yy1WbVTQ2+GtTto+4gUSQIpa8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YOjOUSrIRY4zLd7tvC1mT+7va7Dxy2YzG0UvFGz0RRBLjvsca4ICDtNhcNMrmTl6pPuMt8iJa9wMth+Ov92bM9M/xkawCrmR1CnSBX1cs/RLHdHUaPpLwHjEAXL+UWrTQ4B8InxOYOmIWukvqYLPZtuhmjnpxwiAkpTz9sevhnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems; spf=pass smtp.mailfrom=starlabs.systems; dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b=rnoC3Nig; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b="rnoC3Nig"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4954c9f380bso515935e9.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 17 Jul 2026 01:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20251104.gappssmtp.com; s=20251104; t=1784278205; x=1784883005; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=E+3lV74b+0E9DOjl2bLZFOk6+jkzg9u0ynWt2mFCeZk=;
        b=rnoC3NigH4d5KBr104tjbgxK2q+x6LjoSmy31YehaZZx6Nj45IyZb2MNUDrCoq8dbW
         BrQvWqEMZ1eQxcNrKjCLxcEg1idxXVHwuUPHx71N18rQig5pMmoBQS8DT+xYLQyIUKVd
         u8SdLw2G7KGZCWptJTlNVFNGNwvCajuNQh/XgKyiGIV4cY64zEs/hZzjg/e/z4CELXpG
         DYteJ+ejs0kzxjiYlDuw5Z5Iqd9pIaferFhONB4beSPQw3/kaJzHveLzjgMaXZ7U5HAc
         oJLiXQuSbyybFBC6+sH7vrz2+NWOHyppw+NWhHwPazDMTBJryR5vpf9rpc4KiUZAZ+aj
         xjuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784278205; x=1784883005;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E+3lV74b+0E9DOjl2bLZFOk6+jkzg9u0ynWt2mFCeZk=;
        b=XBpgAFmyLMZDj+aagaymQOzaJa94EjDIngokGtRNPs0OYxPESC5t93zQeLPjPB639k
         Uh8NZowQ9OOT1GZbZB3m+b5KcXBELPHFkYoe6zHNg76PWR2mrHupTcJ1glES4hpMGcfx
         c+liRz58ysr7nKGDqZd3ZyT9KygHcKxWozPl9ZzXflHi8PCeAF1LdwTXLkZmeeCWuXov
         YupWgtWOxFEuxz9gJFYHBF+SmDFIT7H3AV/4l4Tf5SA7NFGfTZSvutE1iszhQ589ZSCs
         k4ieJJ2fqWFC3lP56LxifDrZtPUaIqMJf+40Dq2vOR+SilAtP0GNlvZQuNfbrla0mxGs
         ib1A==
X-Forwarded-Encrypted: i=1; AHgh+Rruz0GS1Vyxs7yVIGdcjsNs4tgXQuHg2dUMBhpm354G+n6KAVR6zaFQJoCsJrRtX8Slxsmy19cRKH99p0Qwhy+sKdFP@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5lmIz3Ybm6F2bEW9ezSROFwNvmHgddufSdBN/cKHgIXkv+x3F
	+D0I3OLv4LrmqKmrX4O50Xri7rY4FHWu1T8gxUPqb5ztFJfkD6CoYfpb7BMT+uo37A==
X-Gm-Gg: AfdE7cmm7u1ZGEiyL/FYnwWVlqoBwpkWKQlWp/dwS0/ea9C66J80XreIF3rJtqM+BfD
	CTuH4klloMTEHj7tAS3N3Y9C1Lv4UD25hucyfFM46PnK8ImobVBZTvM366n5/o5xWBtO0q2P9lF
	yBJvGeilBifWEr73LYM23Te8pBd9gy7lyASjLG34lGrsXWjgRoNCFVJDReet19tE1iGi+f8NUKg
	JJd6bb+WNMLKLd643TA3+rEwQfqysjP3GO8sAMb+kGIYlhbCRrgv/JTThXKZSAIwKktDgvB7TI6
	+x43AfY4znbdbUKqlFxpI2U98BQ6HKplofVtGf8nRVJJiGsFP5gqsPts5uqHyPCXQGO0NZDCyuf
	+soePWzaCNppwvE1g51EClMRBTVe0EIUFNm7IKVOckhnmno4uwPyoSlulO6hufurNlmpQ5vGLQt
	y+ee/yP+N+11TnCvfVIpB1xfQvaNt4
X-Received: by 2002:a05:600c:41ca:b0:495:21e7:fd53 with SMTP id 5b1f17b1804b1-4954a50dacfmr13827775e9.18.1784278204852;
        Fri, 17 Jul 2026 01:50:04 -0700 (PDT)
Received: from horizon ([217.155.46.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2a2504sm33972955e9.2.2026.07.17.01.50.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 01:50:04 -0700 (PDT)
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
	oliver@liuxiaozhen.dev,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	Dell.Client.Kernel@dell.com,
	chrome-platform@lists.linux.dev,
	Sean Rhodes <sean@starlabs.systems>
Subject: [PATCH v7 0/3] firmware: Add coreboot CFR firmware attributes driver
Date: Fri, 17 Jul 2026 09:50:00 +0100
Message-ID: <20260717085003.369496-1-sean@starlabs.systems>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the firmware attributes class helper out of platform/x86, rename
the coreboot-table firmware driver directory from google to coreboot, and
add a coreboot CFR firmware attributes driver.

Changes in v7:
- Restore the existing include order in converted platform/x86 drivers
  and add Oliver's Tested-by to patch 1.
- Use for loops for the CFR record walks, document pointer-based value
  validation and intentionally ignored record types, and remove a
  redundant PAGE_SIZE check.
- Validate the CFR payload checksum before parsing it.
- Make EFI writes transactional: lock the complete operation, restore
  both the variable and live state on failure, and preserve a pending
  reboot indication when rollback cannot fully restore the setting.
- Lock EFI reads and expose settings read-only when EFI writes are not
  supported.
- Skip settings beneath suppressed or dependency-gated forms, propagate
  enclosing read-only/inactive state, and bound CFR form nesting.
- Propagate transient probe failures instead of silently dropping
  settings.
- Preserve APM token zero and skip an enumeration if its values cannot
  fit in the sysfs output buffer.
- Simplify the device_create() error path.

Testing:
- x86_64 allmodconfig W=1 builds of the CFR driver, firmware attributes
  helper, and all converted platform/x86 consumers.
- UML allmodconfig W=1 builds of the CFR driver and helper, exercising
  the path compiled without CONFIG_X86.

Sean Rhodes (3):
  firmware: Move firmware attributes class helper
  firmware: Rename google firmware directory to coreboot
  firmware: coreboot: Add CFR firmware attributes driver

 MAINTAINERS                                   |   18 +-
 drivers/firmware/Kconfig                      |    5 +-
 drivers/firmware/Makefile                     |    3 +-
 drivers/firmware/{google => coreboot}/Kconfig |   20 +-
 .../firmware/{google => coreboot}/Makefile    |    1 +
 drivers/firmware/{google => coreboot}/cbmem.c |    0
 drivers/firmware/coreboot/coreboot-cfr.c      | 1141 +++++++++++++++++
 .../{google => coreboot}/coreboot_table.c     |    0
 .../{google => coreboot}/coreboot_table.h     |    0
 .../framebuffer-coreboot.c                    |    0
 drivers/firmware/{google => coreboot}/gsmi.c  |    0
 .../memconsole-coreboot.c                     |    0
 .../memconsole-x86-legacy.c                   |    0
 .../{google => coreboot}/memconsole.c         |    0
 .../{google => coreboot}/memconsole.h         |    6 +-
 drivers/firmware/{google => coreboot}/vpd.c   |    0
 .../{google => coreboot}/vpd_decode.c         |    0
 .../{google => coreboot}/vpd_decode.h         |    0
 .../firmware_attributes_class.c               |    2 +-
 drivers/platform/x86/Kconfig                  |    3 -
 drivers/platform/x86/Makefile                 |    2 -
 drivers/platform/x86/asus-armoury.c           |    2 +-
 .../x86/dell/dell-wmi-sysman/sysman.c         |    2 +-
 drivers/platform/x86/hp/hp-bioscfg/bioscfg.c  |    2 +-
 drivers/platform/x86/lenovo/think-lmi.c       |    2 +-
 drivers/platform/x86/lenovo/wmi-other.c       |    2 +-
 drivers/platform/x86/samsung-galaxybook.c     |    2 +-
 .../linux/firmware_attributes.h               |    6 +-
 28 files changed, 1194 insertions(+), 25 deletions(-)
 rename drivers/firmware/{google => coreboot}/Kconfig (82%)
 rename drivers/firmware/{google => coreboot}/Makefile (92%)
 rename drivers/firmware/{google => coreboot}/cbmem.c (100%)
 create mode 100644 drivers/firmware/coreboot/coreboot-cfr.c
 rename drivers/firmware/{google => coreboot}/coreboot_table.c (100%)
 rename drivers/firmware/{google => coreboot}/coreboot_table.h (100%)
 rename drivers/firmware/{google => coreboot}/framebuffer-coreboot.c (100%)
 rename drivers/firmware/{google => coreboot}/gsmi.c (100%)
 rename drivers/firmware/{google => coreboot}/memconsole-coreboot.c (100%)
 rename drivers/firmware/{google => coreboot}/memconsole-x86-legacy.c (100%)
 rename drivers/firmware/{google => coreboot}/memconsole.c (100%)
 rename drivers/firmware/{google => coreboot}/memconsole.h (82%)
 rename drivers/firmware/{google => coreboot}/vpd.c (100%)
 rename drivers/firmware/{google => coreboot}/vpd_decode.c (100%)
 rename drivers/firmware/{google => coreboot}/vpd_decode.h (100%)
 rename drivers/{platform/x86 => firmware}/firmware_attributes_class.c (94%)
 rename drivers/platform/x86/firmware_attributes_class.h => include/linux/firmware_attributes.h (60%)

Range-diff against v6:
1:  02edc6d05059 ! 1:  c414cb12d7ac firmware: Move firmware attributes class helper
    @@ Commit message
     
         Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
         Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>
    +    Tested-by: Oliver Lin <oliver@liuxiaozhen.dev>
         Signed-off-by: Sean Rhodes <sean@starlabs.systems>
     
      ## MAINTAINERS ##
    @@ drivers/platform/x86/Makefile: obj-$(CONFIG_X86_PLATFORM_DRIVERS_HP)	+= hp/
      obj-$(CONFIG_SENSORS_HDAPS)	+= hdaps.o
     
      ## drivers/platform/x86/asus-armoury.c ##
    -@@
    - #include <linux/dmi.h>
    - #include <linux/err.h>
    - #include <linux/errno.h>
    -+#include <linux/firmware_attributes.h>
    - #include <linux/fs.h>
    - #include <linux/kernel.h>
    - #include <linux/kmod.h>
     @@
      #include <linux/sysfs.h>
      
      #include "asus-armoury.h"
     -#include "firmware_attributes_class.h"
    ++#include <linux/firmware_attributes.h>
      
      #define ASUS_NB_WMI_EVENT_GUID "0B3CBB35-E3C2-45ED-91C2-4C5A6D195D1C"
      
     
      ## drivers/platform/x86/dell/dell-wmi-sysman/sysman.c ##
     @@
    - #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
    - 
    - #include <linux/align.h>
    --#include <linux/fs.h>
    - #include <linux/dmi.h>
    --#include <linux/module.h>
    -+#include <linux/firmware_attributes.h>
    -+#include <linux/fs.h>
    - #include <linux/kernel.h>
    -+#include <linux/module.h>
    -+#include <linux/nls.h>
    - #include <linux/string.h>
      #include <linux/sysfs.h>
      #include <linux/wmi.h>
    -+
      #include "dell-wmi-sysman.h"
     -#include "../../firmware_attributes_class.h"
    ++#include <linux/firmware_attributes.h>
      
      #define MAX_TYPES  4
    --#include <linux/nls.h>
    - 
    - struct wmi_sysman_priv wmi_priv = {
    - 	.mutex = __MUTEX_INITIALIZER(wmi_priv.mutex),
    + #include <linux/nls.h>
     
      ## drivers/platform/x86/hp/hp-bioscfg/bioscfg.c ##
     @@
    - 
    - #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
    - 
    -+#include <linux/errno.h>
    -+#include <linux/firmware_attributes.h>
    - #include <linux/fs.h>
    --#include <linux/module.h>
    - #include <linux/kernel.h>
    -+#include <linux/module.h>
    -+#include <linux/nls.h>
    - #include <linux/printk.h>
      #include <linux/string.h>
      #include <linux/wmi.h>
    -+
      #include "bioscfg.h"
     -#include "../../firmware_attributes_class.h"
    --#include <linux/nls.h>
    --#include <linux/errno.h>
    ++#include <linux/firmware_attributes.h>
    + #include <linux/nls.h>
    + #include <linux/errno.h>
      
    - MODULE_AUTHOR("Jorge Lopez <jorge.lopez2@hp.com>");
    - MODULE_DESCRIPTION("HP BIOS Configuration Driver");
     
      ## drivers/platform/x86/lenovo/think-lmi.c ##
     @@
    - 
    - #include <linux/acpi.h>
    - #include <linux/array_size.h>
    -+#include <linux/dmi.h>
    - #include <linux/errno.h>
    -+#include <linux/firmware_attributes.h>
    - #include <linux/fs.h>
    - #include <linux/mutex.h>
    - #include <linux/string_helpers.h>
      #include <linux/types.h>
    --#include <linux/dmi.h>
    + #include <linux/dmi.h>
      #include <linux/wmi.h>
     -#include "../firmware_attributes_class.h"
    -+
    ++#include <linux/firmware_attributes.h>
      #include "think-lmi.h"
      
      static bool debug_support;
     
      ## drivers/platform/x86/lenovo/wmi-other.c ##
    -@@
    - #include <linux/container_of.h>
    - #include <linux/device.h>
    - #include <linux/export.h>
    -+#include <linux/firmware_attributes.h>
    - #include <linux/gfp_types.h>
    - #include <linux/hwmon.h>
    - #include <linux/idr.h>
     @@
      #include "wmi-capdata.h"
      #include "wmi-events.h"
      #include "wmi-helpers.h"
     -#include "../firmware_attributes_class.h"
    ++#include <linux/firmware_attributes.h>
      
      #define LENOVO_OTHER_MODE_GUID "DC2A8805-3A8C-41BA-A6F7-092E0089CD3B"
      
     
      ## drivers/platform/x86/samsung-galaxybook.c ##
     @@
    - #include <linux/acpi.h>
    - #include <linux/bits.h>
    - #include <linux/err.h>
    -+#include <linux/firmware_attributes.h>
    - #include <linux/i8042.h>
    - #include <linux/init.h>
    - #include <linux/input.h>
    -@@
    - #include <linux/sysfs.h>
      #include <linux/uuid.h>
      #include <linux/workqueue.h>
    -+
      #include <acpi/battery.h>
     -#include "firmware_attributes_class.h"
    ++#include <linux/firmware_attributes.h>
      
      #define DRIVER_NAME "samsung-galaxybook"
      
2:  d5d3d1334994 = 2:  198e2d4dff44 firmware: Rename google firmware directory to coreboot
3:  7a65c6b0e631 ! 3:  f4842df09f6e firmware: coreboot: Add CFR firmware attributes driver
    @@ drivers/firmware/coreboot/Kconfig: config GOOGLE_COREBOOT_TABLE
     +	tristate "coreboot CFR firmware attributes"
     +	depends on EFI
     +	depends on GOOGLE_COREBOOT_TABLE
    ++	select CRC32
     +	select FW_ATTR_CLASS
     +	help
     +	  This driver parses the coreboot CFR table and exposes runtime EFI
    @@ drivers/firmware/coreboot/coreboot-cfr.c (new)
     +#include <linux/array_size.h>
     +#include <linux/bitops.h>
     +#include <linux/cleanup.h>
    ++#include <linux/crc32.h>
     +#include <linux/ctype.h>
     +#include <linux/device.h>
     +#include <linux/device-id/coreboot.h>
    @@ drivers/firmware/coreboot/coreboot-cfr.c (new)
     +#define COREBOOT_CFR_APM_CNT_PORT	0xb2
     +#define COREBOOT_CFR_APM_STS_PORT	0xb3
     +#define COREBOOT_CFR_APM_APPLY_CMD	0xe3
    ++#define COREBOOT_CFR_MAX_FORM_DEPTH	16
     +
     +static efi_guid_t coreboot_cfr_guid = EFI_GUID(0xceae4c1d, 0x335b, 0x4685,
     +					       0xa4, 0xa0, 0xfc, 0x4a,
    @@ drivers/firmware/coreboot/coreboot-cfr.c (new)
     +	struct list_head settings;
     +	/* Serializes EFI variable writes and the matching runtime apply hook. */
     +	struct mutex lock;
    ++	bool efi_writes_supported;
     +	bool pending_reboot;
     +};
     +
    @@ drivers/firmware/coreboot/coreboot-cfr.c (new)
     +coreboot_cfr_child_entry(const void *base, size_t len, u32 tag)
     +{
     +	const struct coreboot_table_entry *entry;
    -+	size_t off = 0;
    ++	size_t off;
     +
    -+	while (off < len) {
    ++	for (off = 0; off < len; off += entry->size) {
     +		if (len - off < sizeof(*entry))
     +			return NULL;
     +
    @@ drivers/firmware/coreboot/coreboot-cfr.c (new)
     +
     +		if (entry->tag == tag)
     +			return entry;
    -+
    -+		off += entry->size;
     +	}
     +
     +	return NULL;
    @@ drivers/firmware/coreboot/coreboot-cfr.c (new)
     +	return no_free_ptr(efi_name);
     +}
     +
    -+static int coreboot_cfr_read_value(const struct coreboot_cfr_setting *setting,
    -+				   u32 *value, u32 *attrs)
    ++static int coreboot_cfr_read_efi_value_locked(efi_char16_t *efi_name,
    ++					      u32 *value, u32 *attrs)
     +{
     +	unsigned long size = sizeof(__le32);
    -+	efi_char16_t *efi_name;
     +	efi_status_t status;
     +	__le32 data;
     +	u32 attr;
     +
    -+	efi_name = coreboot_cfr_efi_name(setting->name);
    -+	if (IS_ERR(efi_name))
    -+		return PTR_ERR(efi_name);
    -+
     +	status = efivar_get_variable(efi_name, &coreboot_cfr_guid, &attr,
     +				     &size, &data);
    -+	kfree(efi_name);
     +	if (status != EFI_SUCCESS)
     +		return efi_status_to_err(status);
     +
    @@ drivers/firmware/coreboot/coreboot-cfr.c (new)
     +	return 0;
     +}
     +
    -+static int coreboot_cfr_write_efi_value(struct coreboot_cfr_setting *setting,
    -+					u32 value, u32 attrs)
    ++static int coreboot_cfr_read_value(const struct coreboot_cfr_setting *setting,
    ++				   u32 *value, u32 *attrs)
     +{
     +	efi_char16_t *efi_name;
    -+	efi_status_t status;
    -+	__le32 data;
    ++	int ret;
     +
     +	efi_name = coreboot_cfr_efi_name(setting->name);
     +	if (IS_ERR(efi_name))
     +		return PTR_ERR(efi_name);
     +
    -+	data = cpu_to_le32(value);
    -+	status = efivar_set_variable(efi_name, &coreboot_cfr_guid, attrs,
    -+				     sizeof(data), &data);
    ++	ret = efivar_lock();
    ++	if (ret) {
    ++		kfree(efi_name);
    ++		return ret;
    ++	}
    ++
    ++	ret = coreboot_cfr_read_efi_value_locked(efi_name, value, attrs);
    ++	efivar_unlock();
     +	kfree(efi_name);
    ++
    ++	return ret;
    ++}
    ++
    ++static int coreboot_cfr_write_efi_value_locked(efi_char16_t *efi_name,
    ++					       u32 value, u32 attrs)
    ++{
    ++	efi_status_t status;
    ++	__le32 data;
    ++
    ++	if (!efivar_supports_writes())
    ++		return -EROFS;
    ++
    ++	data = cpu_to_le32(value);
    ++	status = efivar_set_variable_locked(efi_name, &coreboot_cfr_guid, attrs,
    ++					    sizeof(data), &data, false);
     +	if (status != EFI_SUCCESS)
     +		return efi_status_to_err(status);
     +
    @@ drivers/firmware/coreboot/coreboot-cfr.c (new)
     +#ifdef CONFIG_X86
     +	u8 status;
     +
    -+	if (setting->runtime_apply_method != CFR_RUNTIME_APPLY_APM_CNT ||
    -+	    !setting->runtime_apply_id)
    ++	if (setting->runtime_apply_method != CFR_RUNTIME_APPLY_APM_CNT)
     +		return -EOPNOTSUPP;
     +
     +	outb((u8)setting->runtime_apply_id, COREBOOT_CFR_APM_STS_PORT);
    @@ drivers/firmware/coreboot/coreboot-cfr.c (new)
     +static int coreboot_cfr_write_value(struct coreboot_cfr_setting *setting,
     +				    u32 value)
     +{
    ++	efi_char16_t *efi_name;
     +	u32 attrs;
     +	u32 old;
    ++	int restore_ret;
     +	int ret;
     +	bool changed = false;
     +
     +	if (setting->read_only)
     +		return -EACCES;
     +
    -+	scoped_guard(mutex, &setting->drvdata->lock) {
    -+		ret = coreboot_cfr_read_value(setting, &old, &attrs);
    -+		if (ret)
    -+			return ret;
    ++	efi_name = coreboot_cfr_efi_name(setting->name);
    ++	if (IS_ERR(efi_name))
    ++		return PTR_ERR(efi_name);
     +
    -+		if ((attrs & COREBOOT_CFR_EFI_ATTRS) != COREBOOT_CFR_EFI_ATTRS)
    -+			return -EOPNOTSUPP;
    ++	mutex_lock(&setting->drvdata->lock);
    ++	ret = efivar_lock();
    ++	if (ret)
    ++		goto out_unlock_mutex;
    ++
    ++	ret = coreboot_cfr_read_efi_value_locked(efi_name, &old, &attrs);
    ++	if (ret)
    ++		goto out_unlock_efi;
     +
    -+		if (old == value)
    -+			return 0;
    ++	if ((attrs & COREBOOT_CFR_EFI_ATTRS) != COREBOOT_CFR_EFI_ATTRS) {
    ++		ret = -EOPNOTSUPP;
    ++		goto out_unlock_efi;
    ++	}
     +
    -+		ret = coreboot_cfr_write_efi_value(setting, value, attrs);
    -+		if (ret)
    -+			return ret;
    -+		changed = true;
    ++	if (old == value)
    ++		goto out_unlock_efi;
     +
    -+		ret = coreboot_cfr_apply_runtime(setting);
    -+		if (ret == -EOPNOTSUPP) {
    -+			/* EFI changed; firmware will consume it after reboot. */
    ++	ret = coreboot_cfr_write_efi_value_locked(efi_name, value, attrs);
    ++	if (ret)
    ++		goto out_unlock_efi;
    ++	changed = true;
    ++
    ++	ret = coreboot_cfr_apply_runtime(setting);
    ++	if (ret == -EOPNOTSUPP) {
    ++		/* EFI changed; firmware will consume it after reboot. */
    ++		setting->drvdata->pending_reboot = true;
    ++		ret = 0;
    ++	} else if (ret) {
    ++		restore_ret = coreboot_cfr_write_efi_value_locked(efi_name, old, attrs);
    ++		if (restore_ret) {
     +			setting->drvdata->pending_reboot = true;
    -+			ret = 0;
    -+		} else if (ret) {
    -+			int restore_ret;
    -+
    -+			restore_ret = coreboot_cfr_write_efi_value(setting, old, attrs);
    -+			if (restore_ret)
    -+				ret = restore_ret;
    -+			else
    -+				changed = false;
    ++			ret = restore_ret;
    ++		} else if (coreboot_cfr_apply_runtime(setting)) {
    ++			setting->drvdata->pending_reboot = true;
    ++		} else {
    ++			changed = false;
     +		}
     +	}
     +
    ++out_unlock_efi:
    ++	efivar_unlock();
    ++out_unlock_mutex:
    ++	mutex_unlock(&setting->drvdata->lock);
    ++	kfree(efi_name);
    ++
     +	if (changed)
     +		kobject_uevent(&setting->drvdata->class_dev->kobj, KOBJ_CHANGE);
     +	return ret;
    @@ drivers/firmware/coreboot/coreboot-cfr.c (new)
     +{
     +	u32 delta;
     +
    -+	if (setting->type != COREBOOT_CFR_SETTING_NUMBER)
    ++	if (setting->type != COREBOOT_CFR_SETTING_NUMBER) {
    ++		/* Enum and bool values are valid only if they have a label. */
     +		return coreboot_cfr_label_from_value(setting, value);
    ++	}
     +
     +	if (value < setting->min || value > setting->max)
     +		return false;
    @@ drivers/firmware/coreboot/coreboot-cfr.c (new)
     +	for (i = 0; i < setting->n_values; i++) {
     +		len += sysfs_emit_at(buf, len, "%s%s", i ? ";" : "",
     +				     setting->values[i].label);
    -+		if (len >= PAGE_SIZE)
    -+			return len;
     +	}
     +
     +	len += sysfs_emit_at(buf, len, "\n");
    @@ drivers/firmware/coreboot/coreboot-cfr.c (new)
     +static int coreboot_cfr_count_enum_values(const void *base, size_t len)
     +{
     +	const struct coreboot_table_entry *entry;
    -+	size_t off = 0;
    ++	size_t off;
     +	int count = 0;
     +
    -+	while (off < len) {
    ++	for (off = 0; off < len; off += entry->size) {
     +		if (len - off < sizeof(*entry))
     +			return -EINVAL;
     +
    @@ drivers/firmware/coreboot/coreboot-cfr.c (new)
     +
     +		if (entry->tag == CFR_TAG_ENUM_VALUE)
     +			count++;
    -+
    -+		off += entry->size;
     +	}
     +
     +	return count;
    @@ drivers/firmware/coreboot/coreboot-cfr.c (new)
     +	const struct lb_cfr_enum_value *enum_value;
     +	const struct lb_cfr_varbinary *label;
     +	const struct coreboot_table_entry *entry;
    -+	size_t off = 0;
    ++	size_t off;
     +	int count;
     +
     +	count = coreboot_cfr_count_enum_values(base, len);
    @@ drivers/firmware/coreboot/coreboot-cfr.c (new)
     +	if (!setting->values)
     +		return -ENOMEM;
     +
    -+	while (off < len) {
    ++	for (off = 0; off < len; off += entry->size) {
     +		entry = base + off;
    -+		if (entry->tag != CFR_TAG_ENUM_VALUE) {
    -+			off += entry->size;
    ++		if (entry->tag != CFR_TAG_ENUM_VALUE)
     +			continue;
    -+		}
     +
     +		if (entry->size < sizeof(*enum_value))
     +			return -EINVAL;
    @@ drivers/firmware/coreboot/coreboot-cfr.c (new)
     +
     +		setting->values[setting->n_values].value = enum_value->value;
     +		setting->n_values++;
    -+		off += entry->size;
     +	}
     +
     +	return 0;
     +}
     +
    ++static bool
    ++coreboot_cfr_possible_values_fit(const struct coreboot_cfr_setting *setting)
    ++{
    ++	size_t len = 1; /* Trailing newline. */
    ++	unsigned int i;
    ++
    ++	for (i = 0; i < setting->n_values; i++) {
    ++		if (i)
    ++			len++;
    ++
    ++		if (strlen(setting->values[i].label) >= PAGE_SIZE - len)
    ++			return false;
    ++
    ++		len += strlen(setting->values[i].label);
    ++	}
    ++
    ++	return true;
    ++}
    ++
     +static int coreboot_cfr_setting_is_usable(struct coreboot_cfr_setting *setting)
     +{
     +	u32 value;
    @@ drivers/firmware/coreboot/coreboot-cfr.c (new)
     +}
     +
     +static int coreboot_cfr_add_numeric_option(struct coreboot_cfr_drvdata *data,
    -+					   const struct lb_cfr_numeric_option *option)
    ++					   const struct lb_cfr_numeric_option *option,
    ++					   bool parent_read_only)
     +{
     +	const struct lb_cfr_varbinary *name;
     +	const struct lb_cfr_varbinary *display_name;
    @@ drivers/firmware/coreboot/coreboot-cfr.c (new)
     +	setting->min = option->min;
     +	setting->max = option->max;
     +	setting->step = option->step ?: 1;
    -+	setting->read_only = option->flags & COREBOOT_CFR_OPT_READ_ONLY_FLAGS;
    ++	setting->read_only =
    ++		(option->flags & COREBOOT_CFR_OPT_READ_ONLY_FLAGS) ||
    ++		!data->efi_writes_supported || parent_read_only;
     +
     +	runtime_apply = coreboot_cfr_child_runtime_apply(child_base, child_len);
     +	if (IS_ERR(runtime_apply)) {
    @@ drivers/firmware/coreboot/coreboot-cfr.c (new)
     +		goto err_put_setting;
     +	}
     +
    -+	if (runtime_apply && runtime_apply->method == CFR_RUNTIME_APPLY_APM_CNT &&
    -+	    runtime_apply->id) {
    ++	if (runtime_apply && runtime_apply->method == CFR_RUNTIME_APPLY_APM_CNT) {
     +		setting->runtime_apply_method = runtime_apply->method;
     +		setting->runtime_apply_id = runtime_apply->id;
     +	}
    @@ drivers/firmware/coreboot/coreboot-cfr.c (new)
     +
     +	if (ret)
     +		goto err_put_setting;
    ++	if (setting->type != COREBOOT_CFR_SETTING_NUMBER &&
    ++	    !coreboot_cfr_possible_values_fit(setting)) {
    ++		ret = 0;
    ++		goto err_put_setting;
    ++	}
     +
     +	ret = coreboot_cfr_setting_is_usable(setting);
     +	if (ret) {
    -+		ret = 0;
    ++		if (ret == -ENOENT || ret == -EINVAL || ret == -EOPNOTSUPP ||
    ++		    ret == -ENAMETOOLONG)
    ++			ret = 0;
     +		goto err_put_setting;
     +	}
     +
    @@ drivers/firmware/coreboot/coreboot-cfr.c (new)
     +}
     +
     +static int coreboot_cfr_parse_records(struct coreboot_cfr_drvdata *data,
    -+				      const void *base, size_t len)
    ++				      const void *base, size_t len,
    ++				      unsigned int depth,
    ++				      bool parent_read_only)
     +{
    ++	const struct lb_cfr_option_form *form;
     +	const struct coreboot_table_entry *entry;
     +	const void *child_base;
     +	size_t child_len;
    -+	size_t off = 0;
    ++	size_t off;
     +	int ret;
     +
    -+	while (off < len) {
    ++	for (off = 0; off < len; off += entry->size) {
     +		if (len - off < sizeof(*entry))
     +			return -EINVAL;
     +
    @@ drivers/firmware/coreboot/coreboot-cfr.c (new)
     +			if (entry->size < sizeof(struct lb_cfr_option_form))
     +				return -EINVAL;
     +
    ++			form = base + off;
    ++			if (form->dependency_id ||
    ++			    form->flags & CFR_OPTFLAG_SUPPRESS)
    ++				break;
    ++
    ++			if (depth >= COREBOOT_CFR_MAX_FORM_DEPTH)
    ++				return -E2BIG;
    ++
     +			child_base = base + off + sizeof(struct lb_cfr_option_form);
     +			child_len = entry->size - sizeof(struct lb_cfr_option_form);
     +			ret = coreboot_cfr_parse_records(data, child_base,
    -+							 child_len);
    ++							 child_len, depth + 1,
    ++							 parent_read_only ||
    ++							 (form->flags &
    ++							  COREBOOT_CFR_OPT_READ_ONLY_FLAGS));
     +			if (ret)
     +				return ret;
     +			break;
    @@ drivers/firmware/coreboot/coreboot-cfr.c (new)
     +		case CFR_TAG_OPTION_BOOL:
     +			if (entry->size < sizeof(struct lb_cfr_numeric_option))
     +				return -EINVAL;
    -+			ret = coreboot_cfr_add_numeric_option(data, base + off);
    ++			ret = coreboot_cfr_add_numeric_option(data, base + off,
    ++							      parent_read_only);
     +			if (ret)
     +				return ret;
     +			break;
     +		default:
    ++			/* Ignore unsupported, child-only and future record types. */
     +			break;
     +		}
    -+
    -+		off += entry->size;
     +	}
     +
     +	return 0;
    @@ drivers/firmware/coreboot/coreboot-cfr.c (new)
     +	if (root->size < sizeof(*root) || root->size > dev->entry.size)
     +		return -EINVAL;
     +
    ++	payload_len = root->size - sizeof(*root);
    ++	if (crc32_be(0, root + 1, payload_len) != root->checksum)
    ++		return -EBADMSG;
    ++
     +	if (!efivar_is_available())
     +		return -EPROBE_DEFER;
     +
    @@ drivers/firmware/coreboot/coreboot-cfr.c (new)
     +	if (!data)
     +		return -ENOMEM;
     +
    ++	ret = efivar_lock();
    ++	if (ret)
    ++		return ret;
    ++	data->efi_writes_supported = efivar_supports_writes();
    ++	efivar_unlock();
    ++
     +	INIT_LIST_HEAD(&data->settings);
     +	ret = devm_mutex_init(&dev->dev, &data->lock);
     +	if (ret)
    @@ drivers/firmware/coreboot/coreboot-cfr.c (new)
     +
     +	data->class_dev = device_create(&firmware_attributes_class, NULL,
     +					MKDEV(0, 0), NULL, DRIVER_NAME);
    -+	if (IS_ERR(data->class_dev)) {
    -+		ret = PTR_ERR(data->class_dev);
    -+		goto err_clear_data;
    -+	}
    ++	if (IS_ERR(data->class_dev))
    ++		return PTR_ERR(data->class_dev);
     +	dev_set_drvdata(data->class_dev, data);
     +
     +	data->attrs_kset = kset_create_and_add("attributes", NULL,
    @@ drivers/firmware/coreboot/coreboot-cfr.c (new)
     +	if (ret)
     +		goto err_unregister_attrs;
     +
    -+	payload_len = root->size - sizeof(*root);
    -+	ret = coreboot_cfr_parse_records(data, root + 1, payload_len);
    ++	ret = coreboot_cfr_parse_records(data, root + 1, payload_len, 0, false);
     +	if (ret)
     +		goto err_unregister_settings;
     +
    @@ drivers/firmware/coreboot/coreboot-cfr.c (new)
     +	kset_unregister(data->attrs_kset);
     +err_unregister_dev:
     +	device_unregister(data->class_dev);
    -+err_clear_data:
     +	return ret;
     +}
     +
-- 
2.53.0
