Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A38290DBB
	for <platform-driver-x86@vger.kernel.org>; Sun, 15 Feb 2026 13:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771163786; cv=none; b=GdhTYPoJBkWE4ud4HFgighDyUJoUSBMJL/YqDLWQv11eJ45scejPdKoSlPwluQDQI93PCKSvIHIZkL882hdf01TthijRgPC2vfPN+B5hJE+dDHmRUmDfBppmjomNT4sK729Wh/6/Ty/xj9Bf0akhq2BsIRL/bZG2i/KIvawF9CM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771163786; c=relaxed/simple;
	bh=fjbj+G2aej0WILVVxEzG0KOP5UawdML7JtDfKMWMcEI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rpVpGUhsZQvkZKXZkYLZbF0V2ZTYvSN2A/J4Xce000PHd1abthtjTKYKTwQFBxVschBVCxv8XZ3ei7yCJhUkIgXWhfUJX3N8vr4H1Mec1TNU0Syllri1SwcH9cUIktgFb60OASHtalbMhs/bC8Bb6LFYTfmVkQ5dsrjl3eFt6Q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UWUkjVMF; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UWUkjVMF"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b8842e5a2a1so282416966b.2
        for <platform-driver-x86@vger.kernel.org>; Sun, 15 Feb 2026 05:56:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771163783; x=1771768583; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D72bH6TFEd/xjwRUKFafNxAFApefHcnISZxA2LBJkcc=;
        b=UWUkjVMFSlYB+0H2tmJ8i9LJFugei3WxUxoLjxY6wtmOkkPxLkDzOWOHQQCTxFDgg+
         T/8+yzdh1piNpEBRsvYF5HM5w3zZODUNA6YiU6JOEUOyK6xR/pUwP2hIbyLul7lgwlkX
         CQLtU2EeAV5BzZNjnAbUHb8MlZaBH38ddFkj3kyauL1EwEYtvExf396GYGvWAUdtD/Zu
         OTAFHE+rH8QitB/JwD094GPXl2Nzjl5i53Kxkm8pJJoJ66xsRpG27Y1NRiJCmVkJTnik
         kJP4rY1XGewTywcTfeIDWaP4SDE0JcqXfFkBt4OliWTsKOhnIRBp/DqLkfU/DOmb0mWt
         1xJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771163783; x=1771768583;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=D72bH6TFEd/xjwRUKFafNxAFApefHcnISZxA2LBJkcc=;
        b=hF50RLitkZClXPfO23PEOlXKqfZ6VJI3WWZo7rtp7NNpD3jMWb/6El/cQ1gxMB5E3w
         MOFgUYi6RRdbR384qMwqzy/bRMChzV6dUbEpH050G6QdvmoiHXNxbCJzi0RLQtlwf6/p
         Zor246iQ5dDFR35GYW8ewKfqeKVFF8BdxNiMeOx6D74x9VoiMWJ1ixCcJiGUNZj2OWb4
         +l6jIqWse60XQzqWesLYI33q4/izBwKvpGrRdH3aC/vijYs5v0LhaHFFl8MQZnk4/JDP
         yUAEENpulLvtb2YbF8FNs7h2iqRX8kqofDrX237V0WYseuQ0NSyTp6WYxES4YWZYiWQT
         vihA==
X-Forwarded-Encrypted: i=1; AJvYcCV8J/pKf1PTXA3IRyoX/5iM5VASa/kntjw33smETwUUYg06AgpegSMziPXEq7J1UDXqdd4fbKrTt4O4AGqUHZcO+ZM6@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3Dwm/pUig8/SecD+9iQwnw5zgK8d1157cwKKpoVX8e1cpMKqe
	9RU94w7vGWxRbt6HB2i8HhX++HIYX8aKbKVu0BeJPyqT+6cRo8/a6ubj
X-Gm-Gg: AZuq6aJ0WlklAUH4iUabKotcK3mYcojCNYWqqoZtgeD/Xozi1evP8A2z9FY+P2zwExp
	xqAg6je/LArtVNx0v+RylUqAueZupYx+c3Ur6uGBKEQnjoKDhSTieePi588jYMcIOQL4VolbUGz
	uu/nfNK0Hh5H7fQn5qR1IU7hcqLxKbBeOa2E9KNxhNJGo4Et2ROX9XbLUjCR/s4ZS1q//0ADqlG
	AbOvknVhyWWBR4nfo0aw3fvFFnmaorrHA2x/P6QuxOqrfv/NyUyV4JlvB3imR/VAMBhOBefJ+Uf
	mulk71QDpAJMVunB3I3R4cXUHY4qemAZy9uGuMRelgAvyvGRaJTCD6Fsv37voR/9rLDGEtQ5i3r
	BiySXde2EcvfFdGQu20NFysZHjFEFliAiz2ANc4S6PL3zDDKW7R3np3unG32mZV79RFA8JQ/MrL
	6/ZrRwUjNeZTGsCmZQvBHVRQoEP86kSDoq
X-Received: by 2002:a17:907:1ca5:b0:b86:eda4:f770 with SMTP id a640c23a62f3a-b8fb424efdamr444906166b.21.1771163782859;
        Sun, 15 Feb 2026 05:56:22 -0800 (PST)
Received: from khalil-hp.home ([62.250.67.33])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc7626bdbsm164179166b.40.2026.02.15.05.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Feb 2026 05:56:21 -0800 (PST)
From: Khalil <khalilst@gmail.com>
X-Google-Original-From: Khalil <khalil@rentman.nl>
To: broonie@kernel.org,
	hdegoede@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: rf@opensource.cirrus.com,
	linux-spi@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Khalil Laleh <khalilst@gmail.com>
Subject: [RFC PATCH 1/2] platform/x86: serial-multi-instantiate: Add GPIO chip select support for SPI devices
Date: Sun, 15 Feb 2026 14:55:23 +0100
Message-ID: <20260215135524.1171065-2-khalil@rentman.nl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260215135524.1171065-1-khalil@rentman.nl>
References: <20260215135524.1171065-1-khalil@rentman.nl>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To: broonie@kernel.org, hdegoede@kernel.org, ilpo.jarvinen@linux.intel.com
Cc: rf@opensource.cirrus.com, linux-spi@vger.kernel.org,
    platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Some ACPI platforms (e.g., HP/ASUS laptops with Intel Lunar Lake and
dual CS35L56 amplifiers) have a broken cs-gpios property in the SPI
controller's _DSD that only declares the first chip select. The second
chip select GPIO is defined as a GpioIo resource in the peripheral's
ACPI node but is not referenced by the controller.

This causes the SPI framework to have no GPIO descriptor for CS > 0,
so the chip select line is never toggled for the second device.

Fix this by acquiring the chip select GPIO from the ACPI GpioIo resource
in serial-multi-instantiate and installing it on the controller's
cs_gpiods array. The GPIO must be set on the controller (not the device)
because __spi_add_device() unconditionally overwrites spi->cs_gpiod[]
from ctlr->cs_gpiods[cs].

The controller's cs_gpiods array is reallocated to accommodate the
additional chip select, and SPI_CONTROLLER_GPIO_SS is set so the
framework calls both the GPIO toggle and the controller's set_cs
callback (needed for clock gate management on Intel LPSS controllers).

Link: https://bugzilla.kernel.org/show_bug.cgi?id=221064
Link: https://bugs.launchpad.net/ubuntu/+source/alsa-driver/+bug/2131138
Link: https://github.com/thesofproject/linux/issues/5621
Signed-off-by: Khalil Laleh <khalilst@gmail.com>
---
 drivers/platform/x86/serial-multi-instantiate.c | 83 ++++++++++++++++++
 1 file changed, 83 insertions(+)

--- a/drivers/platform/x86/serial-multi-instantiate.c
+++ b/drivers/platform/x86/serial-multi-instantiate.c
@@ -8,6 +8,9 @@

 #include <linux/acpi.h>
 #include <linux/bits.h>
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/gpio/machine.h>
 #include <linux/i2c.h>
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
@@ -17,6 +20,17 @@
 #include <linux/spi/spi.h>
 #include <linux/types.h>

+/*
+ * ACPI GPIO mapping for the chip select GpioIo resource.
+ * Maps "cs-gpios" to the first GpioIo resource in the ACPI _CRS.
+ */
+static const struct acpi_gpio_params smi_cs_gpio_params = { 0, 0, false };
+
+static const struct acpi_gpio_mapping smi_cs_gpio_mapping[] = {
+	{ "cs-gpios", &smi_cs_gpio_params, 1 },
+	{ }
+};
+
 #define IRQ_RESOURCE_TYPE	GENMASK(1, 0)
 #define IRQ_RESOURCE_NONE	0
 #define IRQ_RESOURCE_GPIO	1
@@ -114,8 +128,11 @@
 	struct acpi_device *adev = ACPI_COMPANION(dev);
 	struct spi_controller *ctlr;
 	struct spi_device *spi_dev;
+	struct gpio_desc *cs_gpio = NULL;
 	char name[50];
 	int i, ret, count;
+	bool gpio_mapped = false;
+	u16 cs;

 	ret = acpi_spi_count_resources(adev);
 	if (ret < 0)
@@ -139,6 +156,72 @@
 		}

 		ctlr = spi_dev->controller;
+		cs = spi_get_chipselect(spi_dev, 0);
+
+		if (cs >= ctlr->num_chipselect) {
+			dev_info(dev, "Increasing num_chipselect from %u to %u for CS%u\n",
+				 ctlr->num_chipselect, cs + 1, cs);
+			ctlr->num_chipselect = cs + 1;
+		}
+
+		/*
+		 * For devices with CS > 0, use GPIO chip select from ACPI
+		 * GpioIo resource. The GPIO must be set on the controller's
+		 * cs_gpiods array (not the device's cs_gpiod) because
+		 * __spi_add_device() overwrites spi->cs_gpiod from
+		 * ctlr->cs_gpiods[cs]. Also reallocate the array since
+		 * a broken ACPI cs-gpios property may have undersized it.
+		 *
+		 * SPI_CONTROLLER_GPIO_SS ensures the framework calls both
+		 * the GPIO toggle and controller->set_cs (for clock gate
+		 * management on Intel LPSS controllers).
+		 */
+		if (cs > 0 && !gpio_mapped) {
+			ret = devm_acpi_dev_add_driver_gpios(dev, smi_cs_gpio_mapping);
+			if (ret)
+				dev_warn(dev, "Failed to add GPIO mapping: %d\n", ret);
+			else
+				gpio_mapped = true;
+		}
+
+		if (cs > 0 && gpio_mapped && !cs_gpio) {
+			cs_gpio = devm_gpiod_get(dev, "cs", GPIOD_OUT_HIGH);
+			if (IS_ERR(cs_gpio)) {
+				dev_warn(dev, "Failed to get CS GPIO: %ld\n",
+					 PTR_ERR(cs_gpio));
+				cs_gpio = NULL;
+			} else {
+				dev_info(dev, "Got CS GPIO for amp CS%u\n", cs);
+			}
+		}
+
+		if (cs > 0 && cs_gpio) {
+			/*
+			 * Set GPIO on the controller's cs_gpiods array so
+			 * __spi_add_device() will propagate it to the device.
+			 * Reallocate the array to fit the new num_chipselect.
+			 */
+			struct gpio_desc **new_gpiods;
+
+			new_gpiods = devm_kcalloc(&ctlr->dev,
+						  ctlr->num_chipselect,
+						  sizeof(*new_gpiods),
+						  GFP_KERNEL);
+			if (new_gpiods) {
+				if (ctlr->cs_gpiods)
+					new_gpiods[0] = ctlr->cs_gpiods[0];
+				new_gpiods[cs] = cs_gpio;
+				ctlr->cs_gpiods = new_gpiods;
+				ctlr->flags |= SPI_CONTROLLER_GPIO_SS;
+				dev_info(dev, "Set GPIO CS on controller for CS%u\n", cs);
+			} else {
+				dev_err(dev, "Failed to alloc cs_gpiods\n");
+			}
+		}
+
+		dev_info(dev, "Device %d: CS=%u, num_chipselect=%u, gpio_cs=%s\n",
+			 i, cs, ctlr->num_chipselect,
+			 (cs > 0 && cs_gpio) ? "yes" : "no");

 		strscpy(spi_dev->modalias, inst_array[i].type);
