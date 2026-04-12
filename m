Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D3E2F0673
	for <platform-driver-x86@vger.kernel.org>; Sun, 12 Apr 2026 16:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776011542; cv=none; b=IO580SSLK2UjW/J1zJ8YJujg4Fuq09TlY013wREW4C32iF+JaE0eA5zKS0lEwMJZEOfnMVBa1URFywplz5/TZcJin9Mn3p+J0WUBCtoijGQggRIxppMU2QtYT/tEs0QOIWeG6LYjQXLoBmAa7auhsHPGSOWdBlvlsNJ1ORot5fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776011542; c=relaxed/simple;
	bh=A9NrOmrGg9D5qQPIJd3OHlgLpJRhg3BN4oaCn3ZDTsQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YUJcXJ1A12Lako+lJc8OWT+gFQcUgywKWil4lahBvmtkz8vQXtmPSNezgGmenrfXjooCG1gHSrG2D6I7gb81P5BPT5rBOvD6nxYt0pOzds5AI0F2uiipjam58AchxrQ1GGnLoyN5tupKvcVzFozZdxTbYRZs68NmVSZ46EbDxxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HWdieLq3; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HWdieLq3"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b9bff57cb62so588176366b.2
        for <platform-driver-x86@vger.kernel.org>; Sun, 12 Apr 2026 09:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776011539; x=1776616339; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bb0Cl07VkZM2TjR90yXu/+DWSboJw3nu1/V+vc9DpAw=;
        b=HWdieLq3FjGDVhne0yX7HcGi5NK+CKOtbSKa/lG5AU/ee0fYf7sdRBA/hW1t22mQBw
         ryr9dv9+YbhN2q7qMZHVv1tgaebLfPgnppXpMOs9M1evZ12TG1F9OOOebzqNumAlvasL
         cosJzquotaCabhO3rAnv/NFNpFS+JhmPbOhFz+2ftFrXjf4cyfWpKDMj1h7rTi+W6iX8
         enOrBH/pOighuPt9VKHU1Joce4nhFZH1du//oeTZRdjGtrwvJ4yDlLryGBxAUfPvd32g
         5irjQiYETany6eforh9+XUNnutaA5/q3+SqzuVa8O+XidEm5RD1/+/ku3lVdL3wZzl6G
         VsQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776011539; x=1776616339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bb0Cl07VkZM2TjR90yXu/+DWSboJw3nu1/V+vc9DpAw=;
        b=OMwUbaAkCgZ1Vp83kgVO5JhMEU+Zbtd0LjbhAKf7ZxO2a2sGUF+S5etbC6Rb7yHRiX
         Jf8BMgxKfR1qPiNdWg2J286ifIj5IwzcaYesUq4onok8Rw9bBzlKhppxFDYnIxD6UO3u
         b0S+T+3TG7maBEQwEtNvhP4ZwpWkYAw0nUC0rbsRZ66FmlnRfnkODN8HL9ls87/dSCMZ
         5nwe1LzR3wx252pQJRIzAtkNb1d6EGwCormaiWM1djhasrHp242rL9++CgqHO/Un39eH
         CA4eRY6vx/JbolLLnluSzw8t3zdBx3lWW4rU+RRUGafdp74rBL/E62eq+QqhuroYoOv2
         rUbQ==
X-Forwarded-Encrypted: i=1; AJvYcCUsCX+YmO4zBvQDDratf74Ot1k4BYxAAmJ6INe1c5QgligjHlSQQvCPNbeom7OFUatRN0NE1KN1WXlfpboFmul1Lj9Q@vger.kernel.org
X-Gm-Message-State: AOJu0YyHuEWjkiLZY4GxcYT7iKkm0cI1YfHNX/l/kV/PQnq2xm/HfyRC
	Q+kW6b62FDdwVUvZlN2HdWGO2rnbucr9QJo0xQq4/F39zQyWBZ3vvga0
X-Gm-Gg: AeBDiev85ucReVB23QXBHDisLorl+x7VNlrwbwUHiOA9VCiATBZOoopeRIMF1pNuk1m
	ZBAXWLa7ge0vHymvdTkq1DZPEar4bYrl+pqYy3zB4X9Mf9sBoU1Gsx6lSZf+TbWDIiqsw6S4RcA
	8vpTxzAZfo+5ARpxzkl7s/1ELZmIo/mQ7dyl9AIarZMjMCHICeuxsMCDU5Lc4imJVK0cGJu3dHd
	FqpeYIWFkhB7P+sigCVe+x1AdCbFZxI4vu/QO9g1W7iU8QCqSoQxcPYU47goSSXDD93yiMCHdmq
	XBKNaggVTMLoyWgpn3Q3G7NrSt+wtw6wUI9jM1F6znb79pc21h0dj0IAsIY91s29fyF273pbvfI
	oSE56q2PNx6XAUDo13+8n4tpURHlXTW16GwIPgBZRUH5XsCWz0kjbr8gR1xLNGoV5As5isnZ6c4
	848PzE/TpNdDSSnXKmefue1WSwhhK6Jwg8
X-Received: by 2002:a17:907:a646:b0:b9b:e5d:71de with SMTP id a640c23a62f3a-b9d72833620mr561255566b.49.1776011539215;
        Sun, 12 Apr 2026 09:32:19 -0700 (PDT)
Received: from khalil-hp.home ([62.250.67.33])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6e7f1a3bsm236468666b.62.2026.04.12.09.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 09:32:18 -0700 (PDT)
From: Khalil <khalilst@gmail.com>
X-Google-Original-From: Khalil <khalil@rentman.nl>
To: broonie@kernel.org,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com
Cc: rf@opensource.cirrus.com,
	linux-spi@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Khalil <khalil@rentman.nl>,
	Khalil <khalilst@gmail.com>
Subject: [PATCH 3/3] spi: pxa2xx: Handle clock gating for GPIO chip select devices
Date: Sun, 12 Apr 2026 18:31:51 +0200
Message-ID: <20260412163151.506282-4-khalil@rentman.nl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260412163151.506282-1-khalil@rentman.nl>
References: <20260215135524.1171065-2-khalil@rentman.nl>
 <20260412163151.506282-1-khalil@rentman.nl>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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

Signed-off-by: Khalil <khalilst@gmail.com>
---
 drivers/spi/spi-pxa2xx.c | 45 ++++++++++++++++++++++++++++++++++++----
 1 file changed, 41 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi-pxa2xx.c b/drivers/spi/spi-pxa2xx.c
index 6291d7c2e..fe5762063 100644
--- a/drivers/spi/spi-pxa2xx.c
+++ b/drivers/spi/spi-pxa2xx.c
@@ -419,20 +419,43 @@ static void cs_assert(struct spi_device *spi)
 {
 	struct driver_data *drv_data =
 		spi_controller_get_devdata(spi->controller);
+	const struct lpss_config *config;
 
 	if (drv_data->ssp_type == CE4100_SSP) {
 		pxa2xx_spi_write(drv_data, SSSR, spi_get_chipselect(spi, 0));
 		return;
 	}
 
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
+	const struct lpss_config *config;
 	unsigned long timeout;
 
 	if (drv_data->ssp_type == CE4100_SSP)
@@ -444,8 +467,22 @@ static void cs_deassert(struct spi_device *spi)
 	       !time_after(jiffies, timeout))
 		cpu_relax();
 
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
-- 
2.43.0

