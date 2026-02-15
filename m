Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 054D22F12BB
	for <platform-driver-x86@vger.kernel.org>; Sun, 15 Feb 2026 13:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771163789; cv=none; b=Rr+mB/eN/vrChjkFsMhD6keR9iLmpxQnEsjyZoI3PJ6YzN2F7O/vGiCx5WQp4FFGW9ev2vztM29u+HaZPIwBuewfLOEEdMA3WRisvK+4nJsumdmACgp+DR+nR9GCKGmG0bnZ9XGJCNPhRE40nv+D0fuKFH82ovNEYoPXR/2tcEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771163789; c=relaxed/simple;
	bh=HUfPOigY4ct7TOsZh4k/o24ztrERbzR54bjCePZL4wA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ug4zk7IXQ1gxaWDdDWpLILQLAgBaslozyzkNxzroLGeJ0u5Fi8REpKphkhDugH318+h0+BJ6IzXVyfdr/T8zOrys3YaVZsOrHfUoxH7fJYI5wqDLZNHaV0uQcD7cYwDHWBY6AIXtj16yJC+YXqOQ2x7XCTErfctcq0YSNMGmP50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eS89OoT9; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eS89OoT9"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b8fa79b9fcdso392816866b.0
        for <platform-driver-x86@vger.kernel.org>; Sun, 15 Feb 2026 05:56:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771163786; x=1771768586; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ugmt3MCxrIjqV0vioHLUrf7C9aYPhs8EvgX2Agpkc9Y=;
        b=eS89OoT9Vx2kkjLVVTS3hIY4AlDTOj6VCXdYomhTClj3XnQbnXPgi0Uyb3c1+UMpVt
         GovrosLpTcqc/W8/fa09JVrLB717gA3YJctZLqDBS9tRpmDdBVZjMfwornYBkc0J7bAo
         S+/X0ruxLxA4y4fj2BXG9ldUTRTKOhsLJZVd/GOECJISgCIKMNTga3Ici2W407usLDv/
         1FogGo5FQ1d3LQ62Unmq6zeZ0euSrRcL5C8Jxd1DBWClkUq/F2OipOeWbYSA3XSJavkY
         UEnkyOWcHKtcTy5zBa+MAjku3hc38zm1QpthgQCRj+InksMKdXBmD+bY824waj7ZOUd5
         s9vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771163786; x=1771768586;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ugmt3MCxrIjqV0vioHLUrf7C9aYPhs8EvgX2Agpkc9Y=;
        b=TkK96cs1VExF4iaPy5tN9uZsaXENm2P2GzgzTc5IYcskebKW3nwK+m/rVdZyFcfOuo
         sNTgTfa6tUIQcGAp4PekVPFeUFSilGq0KT4SxWs71oEv/S1CL/oGPIgnTFMyC4kAD9PU
         e/eY0YFmL1loXcn4z/L36A8NG4oCZfjei7zaTfSAGOFvkl6DiJ60d8OKHByh+jcUi2pk
         dcQ8+PxEx8ENSc63Tg9UCB19nOgBw/R6YASabGhHwgNwcsBMlTd6Un31ulUMUlESfLVo
         2r0X/5Wpr0fur3ooECg4K8SUPca6eC0d/JO0g+7ucW1k23x4+Q/aOXQ0HFEP4JB+rQYl
         NChA==
X-Forwarded-Encrypted: i=1; AJvYcCUKCNedsu1J5P4wxtyzYMfz9ySzIOFqxz+jPqctklZSKKT+3AL0r9/HvXFKIYs5HZ2Ni28UlO/H+DS2E/bgkfFKVXUk@vger.kernel.org
X-Gm-Message-State: AOJu0YzazUf90q7ZGhMrsH2EZcxT/qqCTbDMFADKmIcQuJbSBYq9aYIG
	8dF4vKQgBAQhhOv1ONz3hMWH1VdYqadJHhM3b+f23RSio2lNjpbEIpoB
X-Gm-Gg: AZuq6aJ/pvoQCuiidmOyvrluwJw+WAKqktbEi07ixVam5tbTwb7QV1Kfc8c9hTuWO7v
	QLJrSdC7bIeiaJV4/cWl4KjM4XRGj44H3g5f9wUIi1t4iqrPXWfqIkCtEAOG//y97lMVpqXkhLg
	l+M5gZjRJRwpigDxP2QsugN9qL7drQMSd9BzbGOM7lAQlj2Ch+FbT0HRDwzQ14irto7/Qk5p/BS
	GjzU1uVMxYN89sZST38HaR32jrfFe4UdJFAJVICbKDGZpc9dg5aPxj8Z5Oh3d1Ql8kbXo6yLT83
	jU7mth1QCQz/trbXI16s0IpWwwE0tE01yEwT9igFcy6JGwrdhX8V5Vqu7STHTd3NhjIu/pj5b+F
	lYCGqdFkfRKDWItPQOquGzH9PEKuYl+kFADFOOGrbxmZIQD5tf9DdBpnuNg9mOSS3CjiBr2Hm0H
	XIMcR6UtTMbeVNnRkitEpn4g==
X-Received: by 2002:a17:907:6e86:b0:b87:6bb4:9eaa with SMTP id a640c23a62f3a-b8fc0539142mr295546766b.8.1771163785884;
        Sun, 15 Feb 2026 05:56:25 -0800 (PST)
Received: from khalil-hp.home ([62.250.67.33])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc7626bdbsm164179166b.40.2026.02.15.05.56.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Feb 2026 05:56:24 -0800 (PST)
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
Subject: [RFC PATCH 2/2] spi: pxa2xx: Handle dynamic clock gating for GPIO chip select devices
Date: Sun, 15 Feb 2026 14:55:24 +0100
Message-ID: <20260215135524.1171065-3-khalil@rentman.nl>
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

On Intel LPSS SPI controllers (Cannon Lake and later), the
cs_clk_stays_gated flag is set, meaning the SPI clock is dynamically
gated based on the native chip select state. When using GPIO chip
select (spi_is_csgpiod() returns true), the native CS register is never
asserted through the normal path, so the SPI clock never runs and all
reads return zeros.

Fix this by handling GPIO chip select devices explicitly in cs_assert
and cs_deassert:

- cs_assert: Assert the native CS in the control register (to enable
  the clock domain) and force the clock gate on via
  LPSS_PRIV_CLOCK_GATE.

- cs_deassert: Deassert the native CS and restore the clock gate to
  auto mode.

The SPI framework handles the actual GPIO toggle; this code only
manages the LPSS clock gating. SPI_CONTROLLER_GPIO_SS must be set on
the controller (done by serial-multi-instantiate) so the framework
calls both the GPIO toggle and this set_cs callback.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=221064
Link: https://bugs.launchpad.net/ubuntu/+source/alsa-driver/+bug/2131138
Link: https://github.com/thesofproject/linux/issues/5621
Signed-off-by: Khalil Laleh <khalilst@gmail.com>
---
 drivers/spi/spi-pxa2xx.c | 35 +++++++++++++++++++++++++++++----
 1 file changed, 31 insertions(+), 4 deletions(-)

--- a/drivers/spi/spi-pxa2xx.c
+++ b/drivers/spi/spi-pxa2xx.c
@@ -419,20 +419,43 @@
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
@@ -444,8 +467,22 @@
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
