Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6509C2FD7BC
	for <platform-driver-x86@vger.kernel.org>; Sat, 11 Apr 2026 18:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775930665; cv=none; b=t1YwsCyf+8I/XShPHsjVVAw7Pjbx+b6u4ciyqs+8ZhTGbpXF5RqEm5AZhFE3djrj7YOpo4QWPVEn+GUyMIdMKYogK7PRrW5XUR9RXo48Kkk2l0/Qee6lcr/+HUZzQu1wARqtr4pA3Cxrm8WTZV5xiVuTZ2+i7b5XDswKW+VWI8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775930665; c=relaxed/simple;
	bh=F+3unnwfG8mEtF1vJsp3nr2TnWCw5/D1ao7o6rizU7U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s1+ES8mxmbYhrjYZx9LYngFe7JXJYjuKCXqjoVPcOr6+lHLzkus+gBjkXFFbM2JNva8/zDea0i0j8meOaJhgav0c5gpYip9zyYjJz3TrzzTUIGMxTdEv1xPbqxCvsMYVISWUGGp1pqoki5aQyTD9DB45Xk3o/tcdv8dmOAejmGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aWL/ACfg; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aWL/ACfg"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6710b4f63dcso632676a12.2
        for <platform-driver-x86@vger.kernel.org>; Sat, 11 Apr 2026 11:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775930662; x=1776535462; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sc495D3OguMO7EA5HHUBGx+k9Q7iag37WzE7hUJCoNI=;
        b=aWL/ACfgEXbM3Z4qVSeRsWua8XmGf8TS6/Y6wl0dvNb48Yni0eu/yzRojixbtOa4GL
         ERffOal3veCllDf7bj0OA3pwEQtYfw1zjnhJQe9iCRWO3QYPspek2mA9vosxL3ZdgHyM
         elqohwVSs+QiJ/zHpjZhkVzBjGvgpbf2DGLCgYkSfpc6cqRo+Py4kOoBTBK0RiNYOHCh
         cY9BA0mEENaeiDlO+AdT3ckU6+LJdWq1BAmPj3OLQ+VP7aOuVR+UhNBpiRg/RGoAjKkq
         5aLfYe52YZN1E4Pkh2fGG0TW2DWQY4rQ0t5nlWJjNn7mKya2CyYoafxiT/r7saGnX12N
         T2Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775930662; x=1776535462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sc495D3OguMO7EA5HHUBGx+k9Q7iag37WzE7hUJCoNI=;
        b=Mxd76oDO1TenckMMXoKYPjxRUyDAcxxHZxItGt7Alnd8pZTHFE1mCqwFwpLeQCVdUG
         d86cGoAIYRSmXFPEguWBXoRQgQna+kDrYysxlKa9rl8FA367dcppp5HxNdhjgULKlD8j
         Z1A36Ek7gk5Clo/lROGA0DHGxua88D01TEvt3E/kEAIgrXNkRc35axV0qTAGBhI7gNyu
         sG9gdzy/e3JTG4Q0Y7fgH5nNzBzPFyqoB5BzOSsqFo9har/1XhM36pbGuJ5y2ZSKkhBY
         9zyywfBKELSiY8SzR6CUHd+SaxxEuEBS2/FJoqjrBLFbGQpfeH/9IEiycCBAWmXMrHBJ
         KShQ==
X-Forwarded-Encrypted: i=1; AJvYcCXaFfNf3RJUMsRYIKhlxz4YjaqJbgBTYrivvvNWCC00zaCmDhiaZjOJwkNs/uH36MFkSLkDPnPPsEMl3z7U1fjIwEP0@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7WPbr1ksKDLtEBUaZ6AOW7vYGB8zFJlb0TiNBakramOXEYqpf
	S9Vt4ECE9bwApZsY+gFloH9dV4spIVCs7J3pJ6dMXD7rcSB1zpc701I9
X-Gm-Gg: AeBDiesQqKucWOrfh8jfNHDPFuJ44/OwUTrNN7cN3RKJmP949M2DWmicW6vNT36M0rN
	fZ9EKvPWyg3O8Nz5C4FXGPPrGiowXvzYQ5tysmw4KuEtOW7F5S3LlJIJBZrRT97JKXgdYKQHvKY
	NptIvUgagn8aXmR25l8CoWGDrXMdP0fNDP2x6TDkJ4NXuAgjgT5wCr2kvk/XK0JZnANV+vhrU8x
	f2kFdUqp9hDNiV9qqPt0I+tfEALbPIT3FgbvO9JqEqqlC7YZCNeepGZskaK/zOVc6wuNtjyOLM7
	pKRshodfEuqYrXofyQ3c57GLvb015eagwRJ9QvFtlI4LzrhQgHP73jzlVgM3UO/lww66FikKYvp
	p9U+vPFKCk36W3jWT4eK1NhWAyibQ3TQGCWQQYSajsGjYPADZiHUhS3Lv1LOJjobfQXjAgKETa0
	RVWNWJrtS7FcDkROzL8nOKsw==
X-Received: by 2002:a17:907:a1a0:b0:b9c:69df:4d8e with SMTP id a640c23a62f3a-b9d7298091fmr310218866b.25.1775930661559;
        Sat, 11 Apr 2026 11:04:21 -0700 (PDT)
Received: from khalil-hp.home ([62.250.67.33])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6e5c56d3sm186160666b.32.2026.04.11.11.04.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 11:04:21 -0700 (PDT)
From: Khalil <khalilst@gmail.com>
X-Google-Original-From: Khalil <khalil@rentman.nl>
To: broonie@kernel.org,
	hdegoede@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: rf@opensource.cirrus.com,
	linux-spi@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Khalil <khalilst@gmail.com>
Subject: [PATCH 3/3] spi: pxa2xx: Handle clock gating for GPIO chip select devices
Date: Sat, 11 Apr 2026 20:04:14 +0200
Message-ID: <20260411180414.481427-4-khalil@rentman.nl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260411180414.481427-1-khalil@rentman.nl>
References: <20260215135524.1171065-2-khalil@rentman.nl>
 <20260411180414.481427-1-khalil@rentman.nl>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Khalil <khalilst@gmail.com>

On Intel LPSS SPI controllers (Cannon Lake and later) with dynamic
clock gating (cs_clk_stays_gated=true), the SPI clock is gated when
no native chip select is asserted. When using a GPIO chip select
(via SPI_CONTROLLER_GPIO_SS), the SPI framework toggles the GPIO
and also calls the controller's set_cs callback.

Handle this in the pxa2xx cs_assert/cs_deassert functions: when the
device uses a GPIO chip select on an LPSS controller, assert native
CS in the control register to enable the clock, and force the clock
gate on. On deassert, restore both.

This is needed on platforms where serial-multi-instantiate installs
a GPIO chip select from the peripheral's ACPI GpioIo resource to
work around an incomplete cs-gpios property on the SPI controller.

Also remove the unconditional num_chipselect bump to 2 that was
added as a temporary workaround - the proper fix is now in
serial-multi-instantiate.

Signed-off-by: Khalil <khalilst@gmail.com>
---
 drivers/spi/spi-pxa2xx.c | 78 ++++++++++++++++++++-------------------
 1 file changed, 41 insertions(+), 37 deletions(-)

diff --git a/drivers/spi/spi-pxa2xx.c b/drivers/spi/spi-pxa2xx.c
index XXXXXXX..XXXXXXX 100644
--- a/drivers/spi/spi-pxa2xx.c
+++ b/drivers/spi/spi-pxa2xx.c
@@ -419,33 +419,43 @@ static void cs_assert(struct spi_device *spi)
 {
 	struct driver_data *drv_data =
 		spi_controller_get_devdata(spi->controller);
-	struct gpio_desc *cs_gpio;
+	const struct lpss_config *config;

 	if (drv_data->ssp_type == CE4100_SSP) {
 		pxa2xx_spi_write(drv_data, SSSR, spi_get_chipselect(spi, 0));
 		return;
 	}

-	/*
-	 * For devices with GPIO chip select, toggle the GPIO directly.
-	 * This ensures GPIO CS works on Intel LPSS which only has native CS0.
-	 */
-	cs_gpio = spi_get_csgpiod(spi, 0);
-	if (cs_gpio) {
-		/* For ACPI: LOW = selected (gpiod_set_value uses logical value) */
-		gpiod_set_value_cansleep(cs_gpio, 0);
-		return;
-	}
-
-	if (is_lpss_ssp(drv_data))
-		lpss_ssp_cs_control(spi, true);
+	if (is_lpss_ssp(drv_data)) {
+		config = lpss_get_config(drv_data);
+
+		if (spi_is_csgpiod(spi)) {
+			/*
+			 * GPIO handles the actual chip select to the device.
+			 * On LPSS controllers with dynamic clock gating, the
+			 * SPI clock won't run unless the native CS state says
+			 * "asserted" in the CS control register. Assert native
+			 * CS in the register to enable the clock, and force
+			 * the clock gate on.
+			 */
+			lpss_ssp_cs_control(spi, true);
+			if (config->cs_clk_stays_gated) {
+				__lpss_ssp_update_priv(drv_data,
+					LPSS_PRIV_CLOCK_GATE,
+					LPSS_PRIV_CLOCK_GATE_CLK_CTL_MASK,
+					LPSS_PRIV_CLOCK_GATE_CLK_CTL_FORCE_ON);
+			}
+		} else {
+			lpss_ssp_cs_control(spi, true);
+		}
+	}
 }

 static void cs_deassert(struct spi_device *spi)
 {
 	struct driver_data *drv_data =
 		spi_controller_get_devdata(spi->controller);
-	struct gpio_desc *cs_gpio;
+	const struct lpss_config *config;
 	unsigned long timeout;

 	if (drv_data->ssp_type == CE4100_SSP)
@@ -457,19 +467,22 @@ static void cs_deassert(struct spi_device *spi)
 	       !time_after(jiffies, timeout))
 		cpu_relax();

-	/*
-	 * For devices with GPIO chip select, toggle the GPIO directly.
-	 * This ensures GPIO CS works on Intel LPSS which only has native CS0.
-	 */
-	cs_gpio = spi_get_csgpiod(spi, 0);
-	if (cs_gpio) {
-		/* For ACPI: HIGH = deselected (gpiod_set_value uses logical value) */
-		gpiod_set_value_cansleep(cs_gpio, 1);
-		return;
-	}
-
-	if (is_lpss_ssp(drv_data))
-		lpss_ssp_cs_control(spi, false);
+	if (is_lpss_ssp(drv_data)) {
+		config = lpss_get_config(drv_data);
+
+		if (spi_is_csgpiod(spi)) {
+			/* Deassert native CS and restore clock gating */
+			lpss_ssp_cs_control(spi, false);
+			if (config->cs_clk_stays_gated) {
+				__lpss_ssp_update_priv(drv_data,
+					LPSS_PRIV_CLOCK_GATE,
+					LPSS_PRIV_CLOCK_GATE_CLK_CTL_MASK,
+					LPSS_PRIV_CLOCK_GATE_CLK_CTL_FORCE_OFF);
+			}
+		} else {
+			lpss_ssp_cs_control(spi, false);
+		}
+	}
 }

 static void pxa2xx_spi_set_cs(struct spi_device *spi, bool level)
@@ -1454,13 +1467,6 @@ static int pxa2xx_spi_probe(struct device *dev, ...)
 		}
 	}
 	controller->num_chipselect = platform_info->num_chipselect;
-
-	/* Fix for HP EliteBook CS35L56 speakers - need at least 2 chip selects */
-	if (is_lpss_ssp(drv_data) && controller->num_chipselect < 2) {
-		dev_info(dev, "Increasing num_chipselect from %d to 2 for LPSS audio\n",
-			 controller->num_chipselect);
-		controller->num_chipselect = 2;
-	}
 	controller->use_gpio_descriptors = true;

--
2.43.0
