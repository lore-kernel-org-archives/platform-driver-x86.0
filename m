Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437103B531D
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 Apr 2026 10:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776074529; cv=none; b=hUAD4ACVpxJAaIA0TSQQZKB3jRm/Wf/DKNNqGo9syFeFtqlLDtpfnRp6bJQUcCclXHK5aIyaECxtJlCweiwal8bhUwWg4ZB2mVdxwxYlDhkL4K+gqhn4Pi73u1it+xUI94h49DHOMyM/W3I5jqqEXSBMh59PrDwnQm5wLb7pgGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776074529; c=relaxed/simple;
	bh=Tclstug7hRiXGCPxAlH+OYkGPX8vCtXfLKlt8b4ukG4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hvoFT6GXYV+KNGeEBx5dpGtWU3+kDbrNeKE+hjJAuHHlgjxJR7BA6gHC/gn0Uibg7+gsGVjqa/i5oLqE8S6re8nNoWcNxvuHbm4e0zwgoJfxFKhYD9tqVY4XFjWPcRfuuHe1D0R8Kfrdngtn4lYnk5La8d+l3KzaJWuiQKgcRM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JSxPmFDA; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JSxPmFDA"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6712eb9139bso2031772a12.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Apr 2026 03:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776074526; x=1776679326; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WUQbeJrmnLAC83DjJTyOiwZ5gn/HwjrSl7M0Tq5ML7I=;
        b=JSxPmFDA63grQ1mUJ5blko/G4NQhpHvnrJCOUGgOK0hBuN6vMTtMnEBGy0MEEtr2j2
         ZU6U2Adyh302rQfl460WwUh7z6oiGJxvvfezXwXKvAKMNrtOJ1D3O9Z/g621PNdl+MLM
         NjuOyDhChJQupkRQS7W1eoz6ZIeYsBcMs1f7ZPHfGipU6kGEupw/YCOVHA4j1K3hcEZN
         RD4iPUpwJkpUDk4S50r6J6rbY3cskcGJMeMrvvVC7l27gKRJOPnokrDIilRA+ifxdAbB
         W3+ecdkK7YGQnBrDxQAcoGm0ZFjJVAQDJsE9yECnC2jpQF/CB7bEk7kN7/dUYIZKpu1g
         btIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776074527; x=1776679327;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WUQbeJrmnLAC83DjJTyOiwZ5gn/HwjrSl7M0Tq5ML7I=;
        b=tLiDr2JtJP05BBFwq29oAVTaAr6xYQoCrGNuo7kxJkofw9m6opjDPAXHVNckTtaMXc
         1pMPqWCGT36CJuB6fYDm4d87qo5PjMyuqHxwblvvJhJIkt+4HvB/4iFU+NxkEqh889nn
         61ppSC1wcSdb193jV/6lpMKOo9jX16fcmeW9WHp0eVW9Olc64TO06sJUxA5skOO4sTlM
         lT+s3NluULJqvoH7gIU7f87D5S6YhD0dkqiwT/k7WVMymlI2/szu1Nutz7xj35vGPbXb
         2i+iyLJBWT0cHMgKjGw5siGwhN/fBcSK19ushTpQI0f7vBI4P5mTo6/6xN02eOIWzMpi
         awHA==
X-Forwarded-Encrypted: i=1; AJvYcCXTDln5vuNh1SVsKahcIBjENUz318raDli0SVxB05nLbp+L8ug30yTzLcIpLctgj6sXdmxBl8dxu+ZGf9Ey5CF9/KmG@vger.kernel.org
X-Gm-Message-State: AOJu0YzB4j1S6VRi7oZv+sGbOw/yyIFwNDsg3um5hIEo+VLYLOxE9D2c
	0+DREQeOI4Y88FTZpPulzDVi3NBnalpeF2P4v0gVIGo3Ox9A26PFylz0
X-Gm-Gg: AeBDievVmWp5zOsrwqg71GkEuO+02tGu8H8S3eey4jUqOP7JlCOrzC1wsvyuiJtMUVk
	Ph6UB90oTNWPszaRuonbqAVN02ed7pNyRoLL3ZQH6yOySGyjoz97kxLBlUMMPVCNgAFYAm8fbAJ
	cAPpvj1xMpf3VKESZJfS5xkuJ+AqqnD7ba5vriFqp4qP/JrzckgSvBdAJerhHPKYSEPYoRO0Sfx
	8Ozpj71fyE3YYhXH4l3Ie9mwplsvn/b/bFAd2pxBJLZ3c99hocg+jZyPgeTmJ0R5VZ96/uJ8u51
	sq4Hnqyy/TIbDawmBsPRYeAgya6qzyexNCyhyRudpnpRw6W530+eBaklA82FVKVwj4AJPslcCjI
	QQCIgQ3UJgbf8CoFm0IV7S/bsdMQ2dvOcmPGsrP+U67TgcRXeUSCoiFpkarK7O1rHxj6jUDcQCP
	nbOgUU6YK5LhsB4e+zetfRUQ==
X-Received: by 2002:a17:907:c80e:b0:b9c:b475:90f4 with SMTP id a640c23a62f3a-b9d7297e98bmr682082966b.29.1776074526148;
        Mon, 13 Apr 2026 03:02:06 -0700 (PDT)
Received: from khalil-hp.home ([62.250.67.33])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6e7f189esm291993566b.58.2026.04.13.03.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 03:02:05 -0700 (PDT)
From: Khalil <khalilst@gmail.com>
X-Google-Original-From: Khalil <khalil@rentman.nl>
To: broonie@kernel.org,
	hdegoede@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: rf@opensource.cirrus.com,
	linux-spi@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Khalil <khalil@rentman.nl>,
	Khalil <khalilst@gmail.com>
Subject: [PATCH v2 2/3] platform/x86: serial-multi-instantiate: Fix SPI chip select on platforms with incomplete ACPI cs-gpios
Date: Mon, 13 Apr 2026 12:01:39 +0200
Message-ID: <20260413100140.579845-3-khalil@rentman.nl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260413100140.579845-1-khalil@rentman.nl>
References: <20260413100140.579845-1-khalil@rentman.nl>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some HP laptops with Intel Lunar Lake and dual Cirrus Logic CS35L56
amplifiers over SPI have an incomplete cs-gpios property in the SPI
controller's _DSD - it only declares the first chip select. The
remaining chip select GPIOs are defined as GpioIo resources in the
peripheral's ACPI node but are not referenced by the controller.

This causes the SPI framework to reject devices whose chip select
exceeds num_chipselect with -EINVAL, preventing the second amplifier
from probing.

Fix this on known affected platforms by:

1. Adding a DMI quirk table to identify affected systems
2. For devices with chip selects outside the controller's range,
   acquiring the GPIO from the peripheral's ACPI GpioIo resource
3. Extending num_chipselect and reallocating the controller's
   cs_gpiods array to install the GPIO descriptor
4. Setting SPI_CONTROLLER_GPIO_SS so the framework calls both
   the GPIO toggle and controller->set_cs (needed for clock
   gating on Intel LPSS controllers)

Only chip selects beyond the controller's num_chipselect are fixed up.
Chip selects within range with a NULL cs_gpiods entry are left alone,
as NULL means "native chip select" which is intentional.

Tested on HP EliteBook 8 G1i 16 inch (board 8D8A) with 2x CS35L56
Rev B0 amplifiers. Both amplifiers probe and produce audio.

Signed-off-by: Khalil <khalilst@gmail.com>
---
 .../platform/x86/serial-multi-instantiate.c   | 168 ++++++++++++++++++
 1 file changed, 168 insertions(+)

diff --git a/drivers/platform/x86/serial-multi-instantiate.c b/drivers/platform/x86/serial-multi-instantiate.c
index 1a369334f..0d30bd0a7 100644
--- a/drivers/platform/x86/serial-multi-instantiate.c
+++ b/drivers/platform/x86/serial-multi-instantiate.c
@@ -8,6 +8,10 @@
 
 #include <linux/acpi.h>
 #include <linux/bits.h>
+#include <linux/delay.h>
+#include <linux/dmi.h>
+#include <linux/gpio/consumer.h>
+#include <linux/gpio/machine.h>
 #include <linux/i2c.h>
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
@@ -46,6 +50,53 @@ struct smi {
 	int spi_num;
 	struct i2c_client **i2c_devs;
 	struct spi_device **spi_devs;
+	struct gpio_desc *cs_gpio;
+};
+
+/*
+ * Quirk data for platforms with broken ACPI SPI chip select descriptions.
+ * cs_gpio_idx: index of the GpioIo resource in the ACPI _CRS that provides
+ *              the chip select GPIO for devices missing a proper cs-gpios
+ *              entry on the SPI controller.
+ */
+struct smi_cs_gpio_quirk {
+	int cs_gpio_idx;
+};
+
+static const struct smi_cs_gpio_quirk hp_elitebook_8g1i_quirk = {
+	.cs_gpio_idx = 0,
+};
+
+/*
+ * DMI table of platforms with broken SPI chip select ACPI descriptions.
+ *
+ * These systems have multiple SPI peripherals (e.g., dual CS35L56
+ * amplifiers) but the SPI controller's _DSD cs-gpios property is
+ * incomplete - it only declares the first chip select. The remaining
+ * chip select GPIOs are defined as GpioIo resources in the peripheral's
+ * ACPI node but are not referenced by the controller.
+ */
+static const struct dmi_system_id smi_cs_gpio_dmi_table[] = {
+	{
+		.ident = "HP EliteBook 8 G1i 16 inch",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "HP"),
+			DMI_MATCH(DMI_BOARD_NAME, "8D8A"),
+		},
+		.driver_data = (void *)&hp_elitebook_8g1i_quirk,
+	},
+	{ }
+};
+
+/*
+ * ACPI GPIO mapping for the chip select GpioIo resource.
+ * Maps "cs-gpios" to the GpioIo resource at index 0 of the ACPI _CRS.
+ */
+static const struct acpi_gpio_params smi_cs_gpio_params = { 0, 0, false };
+
+static const struct acpi_gpio_mapping smi_cs_gpio_mapping[] = {
+	{ "cs-gpios", &smi_cs_gpio_params, 1 },
+	{ }
 };
 
 static int smi_get_irq(struct platform_device *pdev, struct acpi_device *adev,
@@ -99,6 +150,101 @@ static void smi_devs_unregister(struct smi *smi)
 	}
 }
 
+/*
+ * smi_spi_setup_cs_gpio - Fix up chip select for a device on a platform
+ * with broken ACPI cs-gpios description.
+ *
+ * On affected platforms, the SPI controller's cs-gpios property is incomplete,
+ * so the framework has no GPIO descriptor for some chip selects. This causes
+ * __spi_add_device() to reject the device with -EINVAL (cs >= num_chipselect).
+ *
+ * This function:
+ * 1. Extends num_chipselect if the device's CS is out of range
+ * 2. Reallocates cs_gpiods to match, preventing out-of-bounds access
+ *    in __spi_add_device()
+ * 3. Installs the GPIO from the peripheral's ACPI node into the
+ *    controller's cs_gpiods array so __spi_add_device() propagates
+ *    it to the device
+ * 4. Sets SPI_CONTROLLER_GPIO_SS so the framework calls both the GPIO
+ *    toggle and controller->set_cs (needed for clock gating on Intel
+ *    LPSS controllers)
+ */
+static int smi_spi_setup_cs_gpio(struct device *dev,
+				 struct spi_device *spi_dev,
+				 struct smi *smi,
+				 const struct smi_cs_gpio_quirk *quirk)
+{
+	struct spi_controller *ctlr = spi_dev->controller;
+	struct gpio_desc **new_gpiods;
+	u16 cs = spi_get_chipselect(spi_dev, 0);
+
+	/*
+	 * Only fix up chip selects that the controller doesn't know about.
+	 * A NULL cs_gpiods[cs] within the controller's num_chipselect range
+	 * means "native chip select" - that's intentional, not broken.
+	 * The broken case is when cs >= num_chipselect, meaning the ACPI
+	 * cs-gpios property on the controller was incomplete.
+	 */
+	if (cs < ctlr->num_chipselect)
+		return 0;
+
+	/* Extend num_chipselect to cover this device */
+	dev_info(dev, "Extending num_chipselect from %u to %u for CS%u\n",
+		 ctlr->num_chipselect, cs + 1, cs);
+	ctlr->num_chipselect = cs + 1;
+
+	/* Acquire the CS GPIO from the ACPI GpioIo resource if not yet done */
+	if (!smi->cs_gpio) {
+		int ret;
+
+		ret = devm_acpi_dev_add_driver_gpios(dev, smi_cs_gpio_mapping);
+		if (ret) {
+			dev_warn(dev, "Failed to add CS GPIO mapping: %d\n", ret);
+			return ret;
+		}
+
+		smi->cs_gpio = devm_gpiod_get(dev, "cs", GPIOD_OUT_HIGH);
+		if (IS_ERR(smi->cs_gpio)) {
+			dev_warn(dev, "Failed to get CS GPIO: %ld\n",
+				 PTR_ERR(smi->cs_gpio));
+			smi->cs_gpio = NULL;
+			return -ENOENT;
+		}
+		dev_info(dev, "Acquired CS GPIO for CS%u from ACPI GpioIo[%d]\n",
+			 cs, quirk->cs_gpio_idx);
+	}
+
+	/*
+	 * Reallocate the controller's cs_gpiods array to accommodate the
+	 * new num_chipselect, and install the GPIO descriptor. This is
+	 * necessary because __spi_add_device() unconditionally reads
+	 * ctlr->cs_gpiods[cs] to set the device's cs_gpiod.
+	 */
+	new_gpiods = devm_kcalloc(&ctlr->dev, ctlr->num_chipselect,
+				  sizeof(*new_gpiods), GFP_KERNEL);
+	if (!new_gpiods)
+		return -ENOMEM;
+
+	if (ctlr->cs_gpiods) {
+		unsigned int i;
+
+		for (i = 0; i < cs; i++)
+			new_gpiods[i] = ctlr->cs_gpiods[i];
+	}
+	new_gpiods[cs] = smi->cs_gpio;
+	ctlr->cs_gpiods = new_gpiods;
+
+	/*
+	 * SPI_CONTROLLER_GPIO_SS ensures the framework calls both the
+	 * GPIO CS toggle and controller->set_cs(). This is required on
+	 * Intel LPSS controllers where set_cs handles clock gating.
+	 */
+	ctlr->flags |= SPI_CONTROLLER_GPIO_SS;
+
+	dev_info(dev, "Installed GPIO CS on controller for CS%u\n", cs);
+	return 0;
+}
+
 /**
  * smi_spi_probe - Instantiate multiple SPI devices from inst array
  * @pdev:	Platform device
@@ -112,10 +258,19 @@ static int smi_spi_probe(struct platform_device *pdev, struct smi *smi,
 {
 	struct device *dev = &pdev->dev;
 	struct acpi_device *adev = ACPI_COMPANION(dev);
+	const struct dmi_system_id *dmi_id;
+	const struct smi_cs_gpio_quirk *quirk = NULL;
 	struct spi_controller *ctlr;
 	struct spi_device *spi_dev;
 	char name[50];
 	int i, ret, count;
+	u16 cs;
+
+	dmi_id = dmi_first_match(smi_cs_gpio_dmi_table);
+	if (dmi_id) {
+		quirk = dmi_id->driver_data;
+		dev_info(dev, "Applying CS GPIO quirk for %s\n", dmi_id->ident);
+	}
 
 	ret = acpi_spi_count_resources(adev);
 	if (ret < 0)
@@ -139,6 +294,19 @@ static int smi_spi_probe(struct platform_device *pdev, struct smi *smi,
 		}
 
 		ctlr = spi_dev->controller;
+		cs = spi_get_chipselect(spi_dev, 0);
+
+		/*
+		 * On quirked platforms, fix up the chip select GPIO for
+		 * devices that would otherwise fail due to incomplete
+		 * ACPI cs-gpios on the SPI controller.
+		 */
+		if (quirk) {
+			ret = smi_spi_setup_cs_gpio(dev, spi_dev, smi, quirk);
+			if (ret)
+				dev_dbg(dev, "CS GPIO setup returned %d for CS%u\n",
+					ret, cs);
+		}
 
 		strscpy(spi_dev->modalias, inst_array[i].type);
 
-- 
2.43.0

