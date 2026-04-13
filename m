Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 371983B531D
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 Apr 2026 10:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776074533; cv=none; b=TOLVJ7fNu5Sx0v7OSZykVekuq9DqKfZPw6kgi5bYVWhMwWmUlSj2udll67ekXTSn/NTNTstkCb6S3a86MuojA3cIkliICAwFMdi6rQctWhSk2zgYRaH/rxu7W2lAcqCZRVypI4JTY4N86yKndoclFfDDjshBgesqqIO9ZLG6ZA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776074533; c=relaxed/simple;
	bh=A9NrOmrGg9D5qQPIJd3OHlgLpJRhg3BN4oaCn3ZDTsQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=luvXVUJ1mxK8ZYsCQ1xramlXySEuPjKNA0h+a8zEWfvsfp5+BD4LwSCBtKEmlgWr4q0Lk9FeBgBQdjeVzDpxIhJ5JDFaj9K8pgXen+xfdKsBP/Yyx20zv8KXMtghZ+1ZD5Iot1WeQ/Dop2PLoTgMqR1W7pg7NZRIJJW4Nfn3vps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gIKhpwwW; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gIKhpwwW"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b9e00649769so23396166b.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Apr 2026 03:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776074530; x=1776679330; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bb0Cl07VkZM2TjR90yXu/+DWSboJw3nu1/V+vc9DpAw=;
        b=gIKhpwwWKtymRLuq98PDrTlW2R22NTQ1qbtGLxxZxw74j0l3tAzE9u3VYOurI0MPyk
         glNk4QE/fv5qO/SOKwyz1tLDFzAqwYmW8GqLNFBfFN3tE6Tw5qy0qusBHlnDRh2Bo4+F
         oXQ6iYDBNbh/Oa4xfI+UfmqrpavC+2aA6S+cYu2Vmuuh6nPYeR7/ABY+SlAmbC6guQCr
         qcAtWPvE9eP6FAoJOdKkOq4NTe+v3M2JQx10WnEVMaW8PuD9tzZAyWhKOR/q9GLWUOGe
         LyD5SI/wJvF8Yncyj2PmORcgdDKiq9Skg6xu4/nOt6zoydfmH7hnmBaFp7Aaf3tgJrcb
         py3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776074530; x=1776679330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bb0Cl07VkZM2TjR90yXu/+DWSboJw3nu1/V+vc9DpAw=;
        b=si0yLAV2/0YNONFqqu861G/kXNfG2g1anZCAUFy90Q+t7RzzcCVf8MHFwUWPJaCDik
         nuNDJk6C8cLLnNvsWI2I697GZALqTU5nVWNNAQsY+zR22+/+WoLGR0neZUotdkyztGXX
         WJDszkLoVCBKWM0OI+YdaorGDKgcAeyHZ8yy5TJrWHi3DAIGOU6ovSyigv4bY5m3rzB5
         qcODGHCH3cEpDnPIEdpSeJryRJTZNWRlpsgeqDpQOHMtPjLSDL3CwVICK+zOBXGiISCT
         TW7HMNatSX9tJnTwsV41upbCe+J5JUPO5m+QoPZz1y61Cl+ndSLfGK33fOyGm2kMSipX
         ZDxA==
X-Forwarded-Encrypted: i=1; AFNElJ+MtHpJm4awllTAyuj4/l3J+9rrD30BWWJk2NK8m84vMamxKssXOCIYJzC/tAPALS3rr3lb5qt0CBBg3V78EqZaOzC7@vger.kernel.org
X-Gm-Message-State: AOJu0YyCnBs+/uWS7/DOewBG4myVGcBOCkXaZV5KaXPy32PQVWBSptXu
	QHNMZ7ZUah5lIXOaFv6HUJalx3JexPmhkVSHfMyVGIXZeuZdAMMq4EDp
X-Gm-Gg: AeBDievvHWd4FOLpx3/wpCPsWnv54eja37MyrHaPjTZkBaJTiiAG5QlSHo2cBn8lRD/
	G5GAmsLL8PWX8wNF16D4UUtSJvQWo4ufG7yzIvsQHj2vRJwJ6yubENEmTfu+Qh5mTbxnk/cwVWX
	/rgWleY6c4G2cAGAn183CpsMvLrI59SWsrZ1F2GDBrKfEAKnZ5d4nBWKIg0thOdBrAoku1vGD7y
	LQPqYGysfMN+qu4jPkzx7HqLx+BjeRKT4et2Waci/9TDTOx4gaRcSpVqimJx7gzTGMAHIiQGT+T
	+JTP/TqEgjaDbY0DA81XEFc/y8Fu6JiqnT6g1accNibe43Ik1CHhMGgOhi225qcjyskDFobn7ca
	hpKYGhIfAjAmSI5TxvIvzCJRK9Ruaw/sMqmjkNm45ev9cj0SBKLkmQ8JUUTQjef1MT20+kCZSb8
	I5WJGllpjFe3+RVq7fPQr3tw==
X-Received: by 2002:a17:907:a2c5:b0:b97:1009:7536 with SMTP id a640c23a62f3a-b9d72792d3amr700806166b.15.1776074529018;
        Mon, 13 Apr 2026 03:02:09 -0700 (PDT)
Received: from khalil-hp.home ([62.250.67.33])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6e7f189esm291993566b.58.2026.04.13.03.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 03:02:06 -0700 (PDT)
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
Subject: [PATCH v2 3/3] spi: pxa2xx: Handle clock gating for GPIO chip select devices
Date: Mon, 13 Apr 2026 12:01:40 +0200
Message-ID: <20260413100140.579845-4-khalil@rentman.nl>
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

