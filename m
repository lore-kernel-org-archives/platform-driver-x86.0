Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A1842E43E
	for <platform-driver-x86@vger.kernel.org>; Wed, 26 Aug 2026 13:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787750657; cv=none; b=B/gjVSDBEdhFAlgNokiYA4bgomL6UhR4XCAMDUjfNTPWG2bv1Hhy0pPDx76C9BQSNBCfR2AlHv23gF6Tn6pM+2IuqJrco1JsriF+mf42LWTAXKGT3xJd0dfz8y+aSSschx6vIY+b1zp6nxUKjaZPBJ3kXu/hk00Jw9or/iYi+xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787750657; c=relaxed/simple;
	bh=qlQUSYAqWutliK4r1zb1xrvURDYIiJX9EeG0XtqOjjE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ClRTCBkHZ0oeEu7AM5OjRinER3g0AMCmH6H0Hrt8WULZIU9Pom4/Vy7t7b4Hrm8rBC/ikPs4nDxIB+XtxbyTdhXG/BBvnW+CjWcGFl8l0o6DHZ7ADmM/ln+G3r2rGabEZ5ZPVvS8oufGcF0ZrEE+oyEJC8oOCVqqF9w76gImvG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rnvg4uaW; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rnvg4uaW"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6a422090b2fso1314074a12.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 26 Aug 2026 06:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787750653; x=1788355453; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vHlfE1utSrpFggpS3CJMaH3o/iytPwgXlz1qOpxIICk=;
        b=Rnvg4uaWSYIJXNEZYF7wfkdC0i+J1HzIN+S4KZz6ahFvRaZbb0T3vg/9fuLG2FMPnP
         N2NdThVDv9QpfAkUCljkHVaKTJ35aZFuQK+LE18DwsqClP0yhLDoCxIsWsAUp3Tqu8K8
         v6LnEglzOkZasYzjVhbj40/6p1w474ji7fud/pv2nI7J4S2CuT4/7gqjh+wMOyLsyCsu
         wdwCVvayjvOBQGQNEO26oab4m0erzMlI1Kz4mmjPPY4Ia4QBBQC+hxPzd+Eb5n+80WN3
         4n6k/a1ne/I0aKYLccaYowXpezKiXjPGo5lrJVEtV/zcGUJ/Kxrw3a4JTuDXBDVh9Fmp
         NvXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787750653; x=1788355453;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vHlfE1utSrpFggpS3CJMaH3o/iytPwgXlz1qOpxIICk=;
        b=qg1an9aMat2hprEsgP2ynta5w++OJszHX7fpxV6QNS+wUNmbv+gXUWuvy/dXwRKFsj
         Gmpfw3qt8Zie68kFcaYRLy7xDb+2Nm20etNaygyRq7ayZfVFMUd4c0QEGSJereJj9WHp
         v4Fyo0iK6CenHlN04vSWID+HpdtnmPid1xLuXUmjHwGI95KnPzY6V7jQungOKwgNYCZz
         SdwJVHkxjtE9diki8ptPSVnisri+/sEQQ1/VyJRyMlvhc3NljOqyXJ5iGqly4/mGRXM9
         AF8m7e1Q5xCJmrSiV1FdjcDWvHP1H32AtaqVM9BNdQWhSMp+G6B/ZIy1CPKF3gh7OXl4
         wM3w==
X-Forwarded-Encrypted: i=1; AHgh+Rrlae4KV0ww1Bzo7lpsiowCBc14Ow6VFELokKQv/rrwsqmHFv5ZpT9HBbymCHWDLY40GfEVMvIG3bIQ8Ejv6r6OwlJI@vger.kernel.org
X-Gm-Message-State: AFuF++l+ic5/eu5Wx9+cl3iwqxj3rXU8yygvav4vRDbQq/wi8dVxyzbu
	KcfaFFJPKgoPgKjL0ZinvTkvJrtfa3hec/xYeIztEM8HEZciGPsfUaXq
X-Gm-Gg: AR+sD12Tv5Udg/B5W5jO97P3o99p/XB4g82a355upeyXBP0rqkfXTXxOfwqh+85mMlx
	pRxVN6zEQAl8MHcGmrFiEwJHKAyImU/Vb9QBlNwKM1HmBwlfKm0vGl2rtk4My8G506h/BQzlLxS
	v70NeYv2fONY5nE8uNTdcCQF5jxJUwpAj8KBI3etYulBVi6jgCc14W9ngo7Gx9lmOiNIjbULZKn
	dEn2tFdhE8dM/pPUYAbll2pN3C4DcXZdcQG7xtSQg8IVBDA5q3QBngSvXNHktgdfRICPTyh3arV
	P7ZcgjrQq9UWEZs30hRHVPTZP28R+UuDaP8E5KZOXDBBTTePFFAlzj035gqDxyh6H8H12SWGDen
	LFvZm9KPnb6Rx+DOsrlCBd3lMj03RjEFTwPbJaTYgWBg0g0vyu4z0xjyA5tXyL3jFFSNJH5pZwn
	dukTiUMi8e5MXQqWjhTbN3VO51Of2FIEBx7Rr0KxLPkUL9JsQ7DHQzf16//biYlgUxUOMwAOe7J
	SPLbHHAPdpQV+1i8NELhe0pOdLQ4O5sd6ai/9K8UGk=
X-Received: by 2002:a17:907:9815:b0:c20:5798:7b9f with SMTP id a640c23a62f3a-c250bc1567amr880907666b.10.1787750652793;
        Wed, 26 Aug 2026 06:24:12 -0700 (PDT)
Received: from 1Z10 ([37.163.238.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a88ae4dsm648518666b.39.2026.08.26.06.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 06:24:12 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mathias Nyman <mathias.nyman@intel.com>
Cc: Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	platform-driver-x86@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [RFC PATCH 2/2] platform/x86: Add Cherry Trail XMM7260 power driver
Date: Wed, 26 Aug 2026 15:24:03 +0200
Message-ID: <20260826132403.3345072-3-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260826132403.3345072-1-mauriziocasciano7@gmail.com>
References: <20260826132403.3345072-1-mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Lenovo Yoga Book YB1-X91L exposes its XMM7260 modem as an
INT34D0 ACPI device and connects it to the Cherry Trail xHCI SSIC
port. The modem needs an ACPI _DSM and PMIC power sequence before its
USB boot function can switch to the MBIM runtime function.

Add a DMI-scoped platform driver which performs that sequence, holds
xHCI runtime PM during enumeration and retries the boot-device status
request until MBIM appears or the enumeration window expires. The
firmware interface and PMIC data come from the Yoga Book ACPI tables;
the sequencing model is based on Intel's GPL-2.0 modem-control code.

The driver depends on the preceding xHCI SSIC restore quirk: without
that quirk the controller cannot reliably enumerate the modem after
setup or power transitions.

Link: https://github.com/jekhor/yogabook-linux-android-kernel/blob/574bae692716f1b14093497bfab8a007fe8e460b/drivers/staging/modem_control/mcd_acpi.c
Link: https://github.com/jekhor/yogabook-linux-android-kernel/blob/574bae692716f1b14093497bfab8a007fe8e460b/drivers/staging/modem_control/mcd_pmic.c
Link: https://github.com/jekhor/yogabook-linux/blob/96acd46c5a03565a114a0c6602734bb02717639a/devices/YB1-X91L/acpi/DSDT.dsl
Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Assisted-by: LLM sparse
---
 MAINTAINERS                            |   1 +
 drivers/platform/x86/intel/Kconfig     |  16 +
 drivers/platform/x86/intel/Makefile    |   1 +
 drivers/platform/x86/intel/cht_modem.c | 418 +++++++++++++++++++++++++
 4 files changed, 436 insertions(+)
 create mode 100644 drivers/platform/x86/intel/cht_modem.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 24ca91ce5d86..ac39ab76f7c6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -29578,6 +29578,7 @@ Q:	https://patchwork.kernel.org/project/platform-driver-x86/list/
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git
 F:	drivers/platform/olpc/
 F:	drivers/platform/x86/
+F:	drivers/platform/x86/intel/cht_modem.c
 F:	include/linux/platform_data/x86/
 
 X86 PLATFORM UV HPE SUPERDOME FLEX
diff --git a/drivers/platform/x86/intel/Kconfig b/drivers/platform/x86/intel/Kconfig
index 2900407d6095..0c81fe46c105 100644
--- a/drivers/platform/x86/intel/Kconfig
+++ b/drivers/platform/x86/intel/Kconfig
@@ -115,6 +115,22 @@ config INTEL_CHTDC_TI_PWRBTN
 	  To compile this driver as a module, choose M here: the module
 	  will be called intel_chtdc_ti_pwrbtn.
 
+config INTEL_CHT_MODEM
+	tristate "Intel Cherry Trail ACPI modem power driver"
+	depends on ACPI
+	depends on INTEL_SOC_PMIC_CHTWC
+	depends on USB
+	depends on USB_XHCI_PCI
+	help
+	  This driver controls the firmware power sequence for Intel XMM
+	  modems connected to the Cherry Trail xHCI SSIC port and described
+	  by the INT34D0 ACPI device. Currently this supports the Lenovo
+	  Yoga Book YB1-X91L.
+
+	  Build this driver into the kernel when the modem must be powered
+	  before the built-in xHCI controller probes. If built as a module,
+	  it will be called intel-cht_modem.
+
 config INTEL_CHTWC_INT33FE
 	tristate "Intel Cherry Trail Whiskey Cove ACPI INT33FE Driver"
 	depends on X86 && ACPI && I2C && REGULATOR
diff --git a/drivers/platform/x86/intel/Makefile b/drivers/platform/x86/intel/Makefile
index 138b13756158..5ceeccd75c36 100644
--- a/drivers/platform/x86/intel/Makefile
+++ b/drivers/platform/x86/intel/Makefile
@@ -32,6 +32,7 @@ intel-target-$(CONFIG_INTEL_VSEC)		+= vsec.o
 intel-target-$(CONFIG_INTEL_BYTCRC_PWRSRC)	+= bytcrc_pwrsrc.o
 intel-target-$(CONFIG_INTEL_BXTWC_PMIC_TMU)	+= bxtwc_tmu.o
 intel-target-$(CONFIG_INTEL_CHTDC_TI_PWRBTN)	+= chtdc_ti_pwrbtn.o
+intel-target-$(CONFIG_INTEL_CHT_MODEM)		+= cht_modem.o
 intel-target-$(CONFIG_INTEL_CHTWC_INT33FE)	+= chtwc_int33fe.o
 intel-target-$(CONFIG_X86_ANDROID_TABLETS)	+= crystal_cove_charger.o
 intel-target-$(CONFIG_INTEL_MRFLD_PWRBTN)	+= mrfld_pwrbtn.o
diff --git a/drivers/platform/x86/intel/cht_modem.c b/drivers/platform/x86/intel/cht_modem.c
new file mode 100644
index 000000000000..30665b660f0c
--- /dev/null
+++ b/drivers/platform/x86/intel/cht_modem.c
@@ -0,0 +1,418 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Intel Cherry Trail ACPI modem power driver
+ *
+ * Copyright (C) 2008, 2013 Intel Corporation
+ * Copyright (C) 2026 Maurizio Casciano
+ */
+
+#include <linux/acpi.h>
+#include <linux/bitops.h>
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/dmi.h>
+#include <linux/init.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/pci.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+#include <linux/usb.h>
+#include <linux/uuid.h>
+#include <linux/workqueue.h>
+
+#define CHT_MODEM_DSM_REVISION		0
+#define CHT_MODEM_DSM_POWER_OFF		1
+#define CHT_MODEM_DSM_RESET		3
+
+/* ACPI's MCD0001 PMIC package for the XMM7260_CONF_3 configuration. */
+#define CHT_MODEM_PMIC_HID		"INT34D3"
+#define CHT_MODEM_PMIC_CTRL_REG		0x6e29
+#define CHT_MODEM_PMIC_CTRL_MASK	GENMASK(1, 0)
+#define CHT_MODEM_PMIC_CTRL_ON		BIT(0)
+#define CHT_MODEM_PMIC_POWER_DELAY_US	20000
+
+#define PCI_DEVICE_ID_INTEL_CHT_XHCI	0x22b5
+#define CHT_MODEM_USB_VENDOR_ID		0x8087
+#define CHT_MODEM_USB_BOOT_PRODUCT_ID	0x07ef
+#define CHT_MODEM_USB_MBIM_PRODUCT_ID	0x0911
+#define CHT_MODEM_STATUS_TRIGGER_DELAY	(50 * HZ)
+#define CHT_MODEM_STATUS_RETRY_DELAY	(5 * HZ)
+#define CHT_MODEM_ENUMERATION_TIMEOUT	(90 * HZ)
+
+static const guid_t cht_modem_dsm_guid =
+	GUID_INIT(0xac340cb7, 0xe901, 0x45bf,
+		  0xb7, 0xe6, 0x2b, 0x34, 0xec, 0x93, 0x1e, 0x23);
+
+struct cht_modem {
+	struct device *dev;
+	struct regmap *pmic_regmap;
+	struct pci_dev *xhci;
+	struct delayed_work trigger_status_work;
+	struct delayed_work release_xhci_work;
+	/* Protects powered and serializes firmware operations. */
+	struct mutex lock;
+	bool xhci_runtime_held;
+	bool powered;
+};
+
+struct cht_modem_usb_state {
+	bool boot;
+	bool runtime;
+	int status_ret;
+};
+
+static const struct dmi_system_id cht_modem_dmi_table[] = {
+	{
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Lenovo YB1-X91L"),
+		},
+	},
+	{ }
+};
+
+static int cht_modem_evaluate_dsm(struct cht_modem *modem, u64 function)
+{
+	union acpi_object params[4] = {
+		{
+			.buffer = {
+				.type = ACPI_TYPE_BUFFER,
+				.length = sizeof(cht_modem_dsm_guid),
+				.pointer = (u8 *)&cht_modem_dsm_guid,
+			},
+		},
+		{
+			.integer = {
+				.type = ACPI_TYPE_INTEGER,
+				.value = CHT_MODEM_DSM_REVISION,
+			},
+		},
+		{
+			.integer = {
+				.type = ACPI_TYPE_INTEGER,
+				.value = function,
+			},
+		},
+		{
+			.package = {
+				.type = ACPI_TYPE_PACKAGE,
+				.count = 0,
+				.elements = NULL,
+			},
+		},
+	};
+	struct acpi_object_list input = {
+		.count = ARRAY_SIZE(params),
+		.pointer = params,
+	};
+	acpi_status status;
+
+	/* These firmware functions perform an action without returning data. */
+	status = acpi_evaluate_object(ACPI_HANDLE(modem->dev), "_DSM", &input,
+				      NULL);
+	if (ACPI_FAILURE(status)) {
+		dev_err(modem->dev, "_DSM function %llu failed: %s\n", function,
+			acpi_format_exception(status));
+		return -EIO;
+	}
+
+	return 0;
+}
+
+static int cht_modem_set_pmic_power(struct cht_modem *modem, bool on)
+{
+	unsigned int value = on ? CHT_MODEM_PMIC_CTRL_ON : 0;
+	int ret;
+
+	ret = regmap_update_bits(modem->pmic_regmap, CHT_MODEM_PMIC_CTRL_REG,
+				 CHT_MODEM_PMIC_CTRL_MASK, value);
+	if (ret)
+		dev_err(modem->dev, "failed to set modem PMIC power: %d\n", ret);
+
+	return ret;
+}
+
+static void cht_modem_release_xhci_runtime(struct cht_modem *modem)
+{
+	if (!modem->xhci_runtime_held)
+		return;
+
+	pm_runtime_put(&modem->xhci->dev);
+	modem->xhci_runtime_held = false;
+	dev_info(modem->dev,
+		 "released xHCI runtime hold after modem enumeration window\n");
+}
+
+static int cht_modem_check_usb_device(struct usb_device *udev, void *data)
+{
+	struct cht_modem_usb_state *state = data;
+	u16 product;
+	u16 status;
+
+	if (le16_to_cpu(udev->descriptor.idVendor) !=
+	    CHT_MODEM_USB_VENDOR_ID)
+		return 0;
+
+	product = le16_to_cpu(udev->descriptor.idProduct);
+	if (product == CHT_MODEM_USB_MBIM_PRODUCT_ID) {
+		state->runtime = true;
+		return 1;
+	}
+
+	if (product != CHT_MODEM_USB_BOOT_PRODUCT_ID)
+		return 0;
+
+	state->boot = true;
+	state->status_ret = usb_get_std_status(udev, USB_RECIP_DEVICE, 0,
+					       &status);
+	return 1;
+}
+
+static void cht_modem_trigger_status_work(struct work_struct *work)
+{
+	struct cht_modem *modem =
+		container_of(to_delayed_work(work), struct cht_modem,
+			     trigger_status_work);
+	struct cht_modem_usb_state state = { };
+
+	mutex_lock(&modem->lock);
+	if (!modem->powered || !modem->xhci_runtime_held)
+		goto out;
+
+	usb_for_each_dev(&state, cht_modem_check_usb_device);
+	if (state.runtime) {
+		dev_info(modem->dev, "XMM7260 MBIM runtime interface detected\n");
+		goto out;
+	}
+
+	if (state.boot) {
+		if (state.status_ret && state.status_ret != -ENODEV &&
+		    state.status_ret != -ESHUTDOWN)
+			dev_warn(modem->dev,
+				 "XMM7260 boot-interface GET_STATUS failed: %d\n",
+				 state.status_ret);
+		else
+			dev_info(modem->dev,
+				 "triggered XMM7260 boot-interface GET_STATUS\n");
+	}
+
+	/* Retry until the runtime interface appears or the hold expires. */
+	mod_delayed_work(system_dfl_wq, &modem->trigger_status_work,
+			 CHT_MODEM_STATUS_RETRY_DELAY);
+out:
+	mutex_unlock(&modem->lock);
+}
+
+static void cht_modem_release_xhci_work(struct work_struct *work)
+{
+	struct cht_modem *modem =
+		container_of(to_delayed_work(work), struct cht_modem,
+			     release_xhci_work);
+
+	cancel_delayed_work(&modem->trigger_status_work);
+	mutex_lock(&modem->lock);
+	cht_modem_release_xhci_runtime(modem);
+	mutex_unlock(&modem->lock);
+}
+
+static int cht_modem_hold_xhci_runtime(struct cht_modem *modem)
+{
+	modem->xhci = pci_get_device(PCI_VENDOR_ID_INTEL,
+				     PCI_DEVICE_ID_INTEL_CHT_XHCI, NULL);
+	if (!modem->xhci)
+		return -EPROBE_DEFER;
+
+	/*
+	 * The XMM7260 first enumerates as 8087:07ef and takes roughly 48
+	 * seconds to re-enumerate as the 8087:0911 MBIM modem. Keep xHCI in
+	 * D0 across that window; otherwise SSIC link training stops in RxDetect.
+	 */
+	pm_runtime_get_noresume(&modem->xhci->dev);
+	modem->xhci_runtime_held = true;
+	mod_delayed_work(system_dfl_wq, &modem->release_xhci_work,
+			 CHT_MODEM_ENUMERATION_TIMEOUT);
+
+	return 0;
+}
+
+static struct regmap *cht_modem_get_pmic_regmap(struct device *dev)
+{
+	struct acpi_device *adev;
+	struct device *pmic_dev;
+	struct regmap *regmap;
+
+	adev = acpi_dev_get_first_match_dev(CHT_MODEM_PMIC_HID, NULL, -1);
+	if (!adev)
+		return ERR_PTR(-EPROBE_DEFER);
+
+	pmic_dev = get_device(acpi_get_first_physical_node(adev));
+	acpi_dev_put(adev);
+	if (!pmic_dev)
+		return ERR_PTR(-EPROBE_DEFER);
+
+	regmap = dev_get_regmap(pmic_dev, NULL);
+	if (!regmap) {
+		put_device(pmic_dev);
+		return ERR_PTR(-EPROBE_DEFER);
+	}
+
+	if (!device_link_add(dev, pmic_dev, DL_FLAG_AUTOREMOVE_CONSUMER)) {
+		put_device(pmic_dev);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	put_device(pmic_dev);
+	return regmap;
+}
+
+static int cht_modem_power_on(struct cht_modem *modem)
+{
+	int ret = 0;
+
+	mutex_lock(&modem->lock);
+	if (!modem->powered) {
+		ret = cht_modem_set_pmic_power(modem, true);
+		if (ret)
+			goto out;
+
+		usleep_range(CHT_MODEM_PMIC_POWER_DELAY_US,
+			     CHT_MODEM_PMIC_POWER_DELAY_US + 1000);
+		/* MRST also cycles the SSIC pull-down/pull-up state around MDON. */
+		ret = cht_modem_evaluate_dsm(modem, CHT_MODEM_DSM_RESET);
+		if (!ret) {
+			modem->powered = true;
+			dev_info(modem->dev,
+				 "powered on and holding xHCI for SSIC enumeration\n");
+		} else {
+			cht_modem_set_pmic_power(modem, false);
+		}
+	}
+
+out:
+	mutex_unlock(&modem->lock);
+
+	return ret;
+}
+
+static void cht_modem_power_off(struct cht_modem *modem)
+{
+	int ret;
+
+	mutex_lock(&modem->lock);
+	if (modem->powered) {
+		ret = cht_modem_evaluate_dsm(modem, CHT_MODEM_DSM_POWER_OFF);
+		if (!ret)
+			ret = cht_modem_set_pmic_power(modem, false);
+		if (!ret)
+			modem->powered = false;
+	}
+	mutex_unlock(&modem->lock);
+}
+
+static int cht_modem_probe(struct platform_device *pdev)
+{
+	struct cht_modem *modem;
+	int ret;
+
+	if (!dmi_check_system(cht_modem_dmi_table))
+		return -ENODEV;
+
+	/*
+	 * INT34D0 advertises functions 0 and 1 only, despite also implementing
+	 * the power-on function used below.
+	 */
+	if (!acpi_check_dsm(ACPI_HANDLE(&pdev->dev), &cht_modem_dsm_guid,
+			    CHT_MODEM_DSM_REVISION,
+			    BIT(CHT_MODEM_DSM_POWER_OFF)))
+		return -ENODEV;
+
+	modem = devm_kzalloc(&pdev->dev, sizeof(*modem), GFP_KERNEL);
+	if (!modem)
+		return -ENOMEM;
+
+	modem->dev = &pdev->dev;
+	modem->pmic_regmap = cht_modem_get_pmic_regmap(&pdev->dev);
+	if (IS_ERR(modem->pmic_regmap))
+		return dev_err_probe(&pdev->dev, PTR_ERR(modem->pmic_regmap),
+				     "failed to get Whiskey Cove PMIC regmap\n");
+
+	mutex_init(&modem->lock);
+	INIT_DELAYED_WORK(&modem->release_xhci_work,
+			  cht_modem_release_xhci_work);
+	INIT_DELAYED_WORK(&modem->trigger_status_work,
+			  cht_modem_trigger_status_work);
+	platform_set_drvdata(pdev, modem);
+
+	ret = cht_modem_hold_xhci_runtime(modem);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "failed to hold Cherry Trail xHCI runtime PM\n");
+
+	ret = cht_modem_power_on(modem);
+	if (ret) {
+		cancel_delayed_work_sync(&modem->release_xhci_work);
+		cht_modem_release_xhci_runtime(modem);
+		pci_dev_put(modem->xhci);
+		modem->xhci = NULL;
+	} else {
+		mod_delayed_work(system_dfl_wq, &modem->trigger_status_work,
+				 CHT_MODEM_STATUS_TRIGGER_DELAY);
+	}
+
+	return ret;
+}
+
+static void cht_modem_remove(struct platform_device *pdev)
+{
+	struct cht_modem *modem = platform_get_drvdata(pdev);
+
+	cancel_delayed_work_sync(&modem->trigger_status_work);
+	cancel_delayed_work_sync(&modem->release_xhci_work);
+	mutex_lock(&modem->lock);
+	cht_modem_release_xhci_runtime(modem);
+	mutex_unlock(&modem->lock);
+	cht_modem_power_off(modem);
+	pci_dev_put(modem->xhci);
+}
+
+static void cht_modem_shutdown(struct platform_device *pdev)
+{
+	struct cht_modem *modem = platform_get_drvdata(pdev);
+
+	cancel_delayed_work_sync(&modem->trigger_status_work);
+	cancel_delayed_work_sync(&modem->release_xhci_work);
+	cht_modem_power_off(modem);
+}
+
+static const struct acpi_device_id cht_modem_acpi_ids[] = {
+	{ "INT34D0" },
+	{ }
+};
+MODULE_DEVICE_TABLE(acpi, cht_modem_acpi_ids);
+
+static struct platform_driver cht_modem_driver = {
+	.driver = {
+		.name = "intel-cht-modem",
+		.acpi_match_table = cht_modem_acpi_ids,
+	},
+	.probe = cht_modem_probe,
+	.remove = cht_modem_remove,
+	.shutdown = cht_modem_shutdown,
+};
+
+static int __init cht_modem_init(void)
+{
+	return platform_driver_register(&cht_modem_driver);
+}
+subsys_initcall(cht_modem_init);
+
+static void __exit cht_modem_exit(void)
+{
+	platform_driver_unregister(&cht_modem_driver);
+}
+module_exit(cht_modem_exit);
+
+MODULE_DESCRIPTION("Intel Cherry Trail ACPI modem power driver");
+MODULE_LICENSE("GPL");
-- 
2.53.0

