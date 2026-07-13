Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAAC11B4138
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 Jul 2026 05:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783921533; cv=none; b=JUhCOy5n6nHxJ21lOt/nX5HX2cwZFljJkzJjwdimCVFE6LgHNDuZu25/QfeH9q9T/zkwj2pQRMNiJA+z+jsB0aysvdPmqsPwrLvYJMSeU3WTSd9F5KIdxkux6yIdW69rH34zzwjP423aslaGjoM5pK2b1561cri7tdMk464Ryrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783921533; c=relaxed/simple;
	bh=AEP4uxI1zCb4UVGFWZ3wz6W2Yh9643nHoAhpfQmZJ8w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BENnp1831dI+R1UmTGtrzCB4p/+CrG4KF70imjW0PbVJyzxgBFFDinFEt11cTrZ/4DR4FHZoKb1RvzBy4kjKudDta1TMdgGIr8oyzcnQifG0tbtykWndf2tzrRYej7l1NlbBFUr4IERqGrSwepKwpAlv42dnUxu2E3dB8ljFH8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems; spf=pass smtp.mailfrom=starlabs.systems; dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b=AuELKndw; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b="AuELKndw"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-476a130c138so3306738f8f.0
        for <platform-driver-x86@vger.kernel.org>; Sun, 12 Jul 2026 22:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20251104.gappssmtp.com; s=20251104; t=1783921529; x=1784526329; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xR98/09eXkQIDUktGVg5UEkoPWGYvzdvyoIyKvy+ChM=;
        b=AuELKndwwfA5eBcK5QqIyK0AXd5bZOD4LK5UzBGYkS+T/2BmU9ROsEtHvKmqxcX5zz
         tmSBDwkUNFKPXJSSQm3eFsdcGkPDnKx5Ug8FdN8amTyZvLG0+md0psKethppkGOb1d4+
         2DITkoPYUbeCTsIW7s/IHHP679iJzft1N5ZuTV9ooMLQIECHaLmch2PzYbffzwuykzXW
         s3IJyYp33luI7upCwOnzXwsut+I3IZhWwjnzGwOldbMGcUYy0PYx7O123D/hbfcV1p7h
         Vz5Ibc8viSVPECS4f3j5/1bt1BGbYQudi8b3oHFmxbvsMlEcIipum+mDtFcoy/Yw8dS6
         YImg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783921529; x=1784526329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xR98/09eXkQIDUktGVg5UEkoPWGYvzdvyoIyKvy+ChM=;
        b=Y2qkPycWu4pk9O7HgSU52gaZGQXQvB0AucPEWh1RUpymCilofQ8lmso+ZQl0JqvCtR
         Ns+G74pp9ap1Cz9WKGI2rFgScZWC9Y2uk46vfL228l/k2uFGlv0jCsunp7bZl8Tvgpox
         L5zwvqhxuDxpG8Sbodxr/uTx/2EoJmyunSV788L2EMCHvwzHU/Nvv0kKvnglcurRD7Od
         oS99BZqL1tkAcrJhSxtl3CEp7q3ODa4WgMrtzSjal+3pDE8H9awmiXq4sufLCjKav9U6
         TUHiQ1Fm1Mm43vMT4XpGEhhBpFZRinxM+QxlwYONN90SzCOaxAh1uPUoiz3CNTwTG/+S
         ufIw==
X-Forwarded-Encrypted: i=1; AHgh+Rqb0H48JgvwRxj3u5UbTKjmywbVhmy1PZUn/fsbS1F3vnDQzjEvOmb/LqZCeDa7iphKNTnoT/1zu3WxIRY8Q48QP2F1@vger.kernel.org
X-Gm-Message-State: AOJu0Yz44iBFOPrkpoU1IhVdPKJUP3mYXJyWaMZXV4vpHzAdiBGeHNGr
	Z74rOy9I5ESv9YZodEgo9JQkNZYKJMJmDi74oJkVdAq6b6ZrJt5ifhBykBZEDR+eXQ==
X-Gm-Gg: AfdE7ckstvCbZ7WhqaLDfmVFJsFAL7ixZWo5RkeU4757IeM4H3lme6VsMPMSt63lztC
	U4qSnNaU1CzNiEUSTQ4OjGsP+1SMHUom43q45SUtj2rrv/hktaWeCHpaIob6ouW22j4wn4pNddR
	AtWe5t5FVMflFGucoMckghyExWMXRS7goaE6RYtjI35asTBUMr7gaECcpy00GHCkrLkMAAg9kas
	cBuR2XXPKwgylP1uQiGbaZMquqW52qS7GPdBf8EK7TzZVEXXh7Wk3IXHRFtvn/RHRq/YPOWpIGn
	zJfr2wE44P/5fRVWedATu8QcvldJR6WmelwF+3FrEXtXV1Z6laL25mZFWXvB5z+WH2aLChviiS9
	c4g7txlDdqmWfIgh+RnDL5xHE5MigvMmitiq4oI9xNKC1ylcT4yq530u5seCcPHb87i0ciWmSbW
	/qOV1YsMx+iDYR8LeGL9uq6k+utq7Ydv5cuXKRIqU=
X-Received: by 2002:a5d:5f45:0:b0:475:f100:35fb with SMTP id ffacd0b85a97d-47f2dd42e56mr8303249f8f.56.1783921528987;
        Sun, 12 Jul 2026 22:45:28 -0700 (PDT)
Received: from horizon ([217.155.46.38])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0f21328sm83474963f8f.32.2026.07.12.22.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 22:45:27 -0700 (PDT)
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
Subject: [PATCH v5 0/3] firmware: Add coreboot CFR firmware attributes driver
Date: Mon, 13 Jul 2026 06:45:23 +0100
Message-ID: <20260713054526.2902319-1-sean@starlabs.systems>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <CABtds-0uN8WW2SkDzwYf8cbQGZnx=Y8Nocs-ebMYB0KWOiX_Kw@mail.gmail.com>
References: <CABtds-0uN8WW2SkDzwYf8cbQGZnx=Y8Nocs-ebMYB0KWOiX_Kw@mail.gmail.com>
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

Changes in v5:
- Keep the coreboot CFR include list sorted.
- Move firmware_attributes.h into the sorted include block.
- Store the CFR driver data on the firmware-attributes class device instead
  of using a file-global pointer.
- Use the existing (str + 1) pattern when deriving CFR string payload data.

Sean Rhodes (3):
  firmware: Move firmware attributes class helper
  firmware: Rename google firmware directory to coreboot
  firmware: coreboot: Add CFR firmware attributes driver

 MAINTAINERS                                   |   18 +-
 drivers/firmware/Kconfig                      |    5 +-
 drivers/firmware/Makefile                     |    3 +-
 drivers/firmware/{google => coreboot}/Kconfig |   19 +-
 .../firmware/{google => coreboot}/Makefile    |    1 +
 drivers/firmware/{google => coreboot}/cbmem.c |    0
 drivers/firmware/coreboot/coreboot-cfr.c      | 1065 +++++++++++++++++
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
 28 files changed, 1117 insertions(+), 25 deletions(-)
 rename drivers/firmware/{google => coreboot}/Kconfig (83%)
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

Range-diff against v4:
1:  4a82d0a07612 = 1:  4a82d0a07612 firmware: Move firmware attributes class helper
2:  285b33f805dc = 2:  285b33f805dc firmware: Rename google firmware directory to coreboot
3:  5edcdb4635c2 ! 3:  ce91f4da5510 firmware: coreboot: Add CFR firmware attributes driver
    @@ drivers/firmware/coreboot/coreboot-cfr.c (new)
     +#include <linux/bitops.h>
     +#include <linux/cleanup.h>
     +#include <linux/ctype.h>
    ++#include <linux/device.h>
    ++#include <linux/device-id/coreboot.h>
     +#include <linux/efi.h>
     +#include <linux/err.h>
    ++#include <linux/firmware_attributes.h>
     +#include <linux/io.h>
     +#include <linux/kdev_t.h>
     +#include <linux/kobject.h>
     +#include <linux/limits.h>
     +#include <linux/list.h>
    -+#include <linux/device-id/coreboot.h>
     +#include <linux/module.h>
     +#include <linux/mutex.h>
     +#include <linux/slab.h>
    @@ drivers/firmware/coreboot/coreboot-cfr.c (new)
     +#include <linux/sysfs.h>
     +#include <linux/types.h>
     +
    -+#include <linux/firmware_attributes.h>
    -+
     +#include "coreboot_table.h"
     +
     +#define DRIVER_NAME "coreboot-cfr"
    @@ drivers/firmware/coreboot/coreboot-cfr.c (new)
     +	bool pending_reboot;
     +};
     +
    -+static struct coreboot_cfr_drvdata *coreboot_cfr_data;
    -+
     +static struct coreboot_cfr_setting *to_coreboot_cfr_setting(struct kobject *kobj)
     +{
     +	return container_of(kobj, struct coreboot_cfr_setting, kobj);
    @@ drivers/firmware/coreboot/coreboot-cfr.c (new)
     +
     +static char *coreboot_cfr_string_dup(const struct lb_cfr_varbinary *str)
     +{
    -+	const char *data = (const char *)str + sizeof(*str);
    ++	const char *data = (const char *)(str + 1);
     +	size_t len = str->data_length;
     +
     +	if (len && !data[len - 1])
    @@ drivers/firmware/coreboot/coreboot-cfr.c (new)
     +static ssize_t pending_reboot_show(struct kobject *kobj,
     +				   struct kobj_attribute *attr, char *buf)
     +{
    -+	return sysfs_emit(buf, "%d\n",
    -+			  coreboot_cfr_data && coreboot_cfr_data->pending_reboot);
    ++	struct coreboot_cfr_drvdata *data;
    ++
    ++	data = dev_get_drvdata(kobj_to_dev(kobj->parent));
    ++
    ++	return sysfs_emit(buf, "%d\n", data->pending_reboot);
     +}
     +
     +static struct kobj_attribute pending_reboot_attr = __ATTR_RO(pending_reboot);
    @@ drivers/firmware/coreboot/coreboot-cfr.c (new)
     +		return ret;
     +
     +	dev_set_drvdata(&dev->dev, data);
    -+	coreboot_cfr_data = data;
     +
     +	data->class_dev = device_create(&firmware_attributes_class, NULL,
     +					MKDEV(0, 0), NULL, DRIVER_NAME);
    @@ drivers/firmware/coreboot/coreboot-cfr.c (new)
     +		ret = PTR_ERR(data->class_dev);
     +		goto err_clear_data;
     +	}
    ++	dev_set_drvdata(data->class_dev, data);
     +
     +	data->attrs_kset = kset_create_and_add("attributes", NULL,
     +					       &data->class_dev->kobj);
    @@ drivers/firmware/coreboot/coreboot-cfr.c (new)
     +err_unregister_dev:
     +	device_unregister(data->class_dev);
     +err_clear_data:
    -+	if (coreboot_cfr_data == data)
    -+		coreboot_cfr_data = NULL;
     +	return ret;
     +}
     +
    @@ drivers/firmware/coreboot/coreboot-cfr.c (new)
     +	sysfs_remove_file(&data->attrs_kset->kobj, &pending_reboot_attr.attr);
     +	kset_unregister(data->attrs_kset);
     +	device_unregister(data->class_dev);
    -+	if (coreboot_cfr_data == data)
    -+		coreboot_cfr_data = NULL;
     +}
     +
     +static const struct coreboot_device_id coreboot_cfr_ids[] = {
-- 
2.53.0
