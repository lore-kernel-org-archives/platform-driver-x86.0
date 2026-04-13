Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 256D037F8D3
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 Apr 2026 10:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776074528; cv=none; b=j2k1hd8hKfPvOymzrcpVvg8hn3qgSSNjmfQSQmtxGNgvzv1rxdKP4DDB0cFudjej/JNUs5xsk1aVMQ3AUpOHy+aKjjRsnL6BThx106Ox97EFemxtu08/r1qEDYgCj7QMVuf2u5LLugnucUredrbz/IvHwczlg+WDk3/wv48barQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776074528; c=relaxed/simple;
	bh=qC/bld90r+ThMcnTaEI8CINzwhOGNircQN5AmvhHCP0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KCIiWGvyFTGfHOXUnAtJ8NqSAFKLpYWf1VkONcWmVH9Opb11sR0tp0w1vkLFsGfTynEvKPqs9uBwkha3x2HZoPGsoHkoqAGq6Q1GpsLoeqmmy+9aExPY0aDDDyymhzHgi8cVLegdB5qufaJnPLHpEwIDJhzAS3YpSjSLNnMvERw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qoUccUgv; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qoUccUgv"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b9bff57cb62so682494866b.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Apr 2026 03:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776074525; x=1776679325; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QkilzuMUQETyKz1FjFPqWn2VyiH1H/H3jmR+rqzk7H0=;
        b=qoUccUgvKtNQgbQfRJhbpWS660seLNbDFcSWxSKZ3sV5qXXch5gT+YTlPSZGmk8l21
         pE/wT69ivm/oTcAv3+B1G3KMNrCucRDLemO6q34KuEwOlxPm6+FUGXD2K+yMWEak8I+O
         prM0zPPOIlPB3l8Mc4rdm/T1blKKvUucgJroH7t/U5atUaO7m4L5ZzRyPSJNbUtbwk0u
         bCb8Za8jq260aU887lrCp92atTyPUYXCsbGW3rIgl46OGEGdCZtKwJJ5LRg8tcqrZpaE
         xPqFFpuAtICkfnNUFCUgB0xxvZg/VKm1XKdbArNTZKVF/s5KFOkBnVCd84XM+ldztMR0
         bFxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776074525; x=1776679325;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QkilzuMUQETyKz1FjFPqWn2VyiH1H/H3jmR+rqzk7H0=;
        b=X7etQJQC7AIiqK2XFmUVvxRG1PkyKgwSqyiMumnV/BWIB5xpEVHsVMJgOYs5E86E+M
         DNpIucJ4VqutDy1Spdghvde0zVFcefpWcKPVkOvtmy2zQtUJzdoexaqQUBadxQ8noBl2
         16X8p2CNCtO9YgkGqX1Ng9WCCQyXwLPdvowM13R+WkJaQfsO9l1RW1R0kWjkva5wUbKF
         XPSMO5gHJ60fu2l5VQs+5yG5cgcCrHho5gnVROkRuHAdyTRiL4hxsfVn9BXwEIrVwDX6
         tEsHdsKFl4djnS6jfeZHkL7FKc9dMpwYW7tpEiBDyiuLq1f1a1prcVoG6VlQaXR36kmu
         xEPA==
X-Forwarded-Encrypted: i=1; AFNElJ8Tn7tl5v9fY/GtkVNy0tJH8PG1FkhmdRGFfYhZ5Nyn3RrGsWcfiwNYa6uumJA/ldL0n82t6AuWnTcb9+Udyfgoz9fB@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9NeYSjtWc1XQr2+fSZaeJBJWzONtJp7/EYRIGjWgXUcMFn176
	b9DXb+LFmggwA1niziWNXkXObmtl4cK8a69Cyhd0Eq6RsbdGuQ86twYo
X-Gm-Gg: AeBDies1jHGrsdPCFD/jAx4qz0IkvvIQBIfUMrWcTR3kF7YVxtxrQDZvoQi1Hwcik7d
	oy8tLoJAN0XHlhnVpMXTH3h3tdTZHArNrjXaYiyJW26KaM6Qhw2Zub1d10DT17j6nn6PGwYmuTL
	D07wFm8BBO+x5cJp0y9+BqFXmIeXfyeKVcqpjts2Uo0Z4HioyAgpyX9OUisO/txmgcabaV4rKax
	yhrE6TdaX9mkREEPZlyWX0i+m/NWDfLxB/U9LVZ2lgT/BLApw5MaTlR6+88qreyExlkkf2rMz23
	8/gzhMOTz5l3bdHloEO4C/umaJxaEXan2qHEGYVKt/y5e/o8mpbvu7I5AWW+c3tl3dc2G3t9ia1
	IxEjS20epitjgXTpR2i1iGOqnjsejXBli5F4y05ye5Oz+xmAWIWv0fgp4OKvcCSAGfoS9iX4gD9
	GGGUzbpgUANsK8Dfs1u4DjjA==
X-Received: by 2002:a17:906:518c:20b0:b9c:7748:a26f with SMTP id a640c23a62f3a-b9d7260e086mr530307666b.17.1776074525085;
        Mon, 13 Apr 2026 03:02:05 -0700 (PDT)
Received: from khalil-hp.home ([62.250.67.33])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6e7f189esm291993566b.58.2026.04.13.03.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 03:02:04 -0700 (PDT)
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
Subject: [PATCH v2 1/3] spi: Preserve preset cs_gpiod in __spi_add_device()
Date: Mon, 13 Apr 2026 12:01:38 +0200
Message-ID: <20260413100140.579845-2-khalil@rentman.nl>
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

__spi_add_device() unconditionally overwrites spi->cs_gpiod[] from
ctlr->cs_gpiods[cs], even if the caller has already set a GPIO
descriptor on the device. This prevents drivers like
serial-multi-instantiate from pre-configuring a GPIO chip select
acquired from ACPI before adding the device.

Skip the overwrite when the device already has a cs_gpiod set for
the given index, allowing callers to preset GPIO chip selects that
aren't described in the controller's cs-gpios property.

This is useful on platforms where the ACPI _DSD cs-gpios property
on the SPI controller is incomplete, but the peripheral's ACPI node
does contain the correct GpioIo resource for its chip select.

Suggested-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Signed-off-by: Khalil <khalilst@gmail.com>
---
 drivers/spi/spi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index a0b2bd3b8..64be99d13 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -734,7 +734,8 @@ static int __spi_add_device(struct spi_device *spi, struct spi_device *parent)
 
 		for (idx = 0; idx < spi->num_chipselect; idx++) {
 			cs = spi_get_chipselect(spi, idx);
-			spi_set_csgpiod(spi, idx, ctlr->cs_gpiods[cs]);
+			if (!spi_get_csgpiod(spi, idx))
+				spi_set_csgpiod(spi, idx, ctlr->cs_gpiods[cs]);
 		}
 	}
 
-- 
2.43.0

