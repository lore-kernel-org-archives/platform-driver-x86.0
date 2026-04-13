Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5675361650
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 Apr 2026 10:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776074747; cv=none; b=YXhGZbReKgdYTI15FQndrenVNo3I07S6xsl5Klg0d0K27NsH7f79y0TRE31E5RWU9Cj29jCyTlKro/ESJzPfE34B4sldrDRbAnmA62qDL1BX61YdCag+jgx5TzK9lhv8q0FOzdgZ1Nh1VS4XNW2zbDjqChssSYIl80lOSN5S3OU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776074747; c=relaxed/simple;
	bh=qC/bld90r+ThMcnTaEI8CINzwhOGNircQN5AmvhHCP0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m8pz8u4m1sgzrpLz4EU1z8UWkX5Oh658HmMkowKg7C0WJS6cL8Z218YPIr0LIY2JXa1Amww8DDbQo0V9u6JZfoZfimaCKTollKGf8KwZbiFeimSSpht1zkodtk7agPPBYJLeR1+cSpQEd2mX+24oQcG3nt6beCT2GuGPtKKN+ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E2oGpWnX; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E2oGpWnX"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-66dd1b5bb6aso6510296a12.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Apr 2026 03:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776074744; x=1776679544; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QkilzuMUQETyKz1FjFPqWn2VyiH1H/H3jmR+rqzk7H0=;
        b=E2oGpWnXUS9eehh2Me/Z19v8vqAUo2Fu7QOT0nwGAXJHZdzSW0OlLXpQZVXeRrdPxK
         VaKL0Pw4bXnuoDYPNTxByXzU6lF7XumZpK+Ygvmqoku83rx3XpPj8OPputHMWm5axM4P
         dAgZSHPdpYyOY3VY40nk//AucxNhztV0y5Z88PI4lChyAsa2Cs5U8LQqrzF5z7Bp8rhz
         MJokAemsJ45kzzvUnXMTmH4zJCosW0rV0nUlvD7nz1GKHUobAmf+77vx2xjSs9AvQgQp
         NUHewz7YrMrHGJZW5C2X9CoPd8zKokSOjWRLYw+AZwxfLX9K1yPTJZ7eA2Sf3QUEJi2n
         WQ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776074744; x=1776679544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QkilzuMUQETyKz1FjFPqWn2VyiH1H/H3jmR+rqzk7H0=;
        b=mtkX2RRQA801c0ZaZ38hCuWs4AZxBD4iSVoWmZA9CJRXM9+kQsglQbqaXJo/BRp/xS
         /+dOh1VL58uE7ZqY5TjUqbXU9YBQe6gNmEqvGiQWC4ZkYoigKFecJ7cE9FVHQnCDoRMn
         lBjYxqmNdJ6jPjuhtu2dau0r+zUGwVfqeAFbgV8UImanvSdGCDct8aBlR9te0JB93hH8
         rRd3j6HPcgJRlGGWAd2u0YivFm+snwLCjToVzhDRSB4XRlP2JrHbNKC3FaW5pVYUgBhp
         3RJXxSpXuzfaWRfhIQakxm03mbkLHn8+sCnlhFanP3PStcLAYbl70zJJq+KkIbovGRSs
         h7Ig==
X-Forwarded-Encrypted: i=1; AJvYcCU0Sw2EJpHfRYVM7c4xTDx1MJ90iu9g5F7cGilOmgXUiWq+oT848dLk6CMqT+09osC56IDJRAfKh7ABu3krE7QvAYa5@vger.kernel.org
X-Gm-Message-State: AOJu0YztObQ1CstTzCJHCzZAsZgIabNR/WzCq6MTTASqczI1cwhXJ3lT
	d/v8t6gsatUGpQZqQqslhm7wwvrt159RMpb46PjKF3Y8cqeCm7kymOdP
X-Gm-Gg: AeBDiesZBwWtEolF7yuw+iZ22Zk8k9Q/SmbGT0l14QpWMA+SmdT9aWbA1HHyz9b5Hmn
	pVJ2vHp0yltM5pnBONBFKzlnENlpTLoax7cr5LPSIZ3fWK/4zXnYhB/IEqQhzUJ/s7LKmVlY6Ti
	I8fDJ2mWGzzo4DlR+ba4Higq6Pto9h4zdz+DOTtlgk4muzL5QN/32Lq4sAN3zpx+Juq0K9vFSpK
	nBX8xPVcJni5UHBGBIotIVaEyU1Rt/pjniIc6nJX1h7khc2ufrVALUhGJ0WSsPu/tSf+ASfK8JY
	4y/R4D4KFN8CMqaakV6jqWza+cm/b/pYU2wfCmprz2DXgWAqcEPcnRAHrDv2fu9LZAWkyYaOXJP
	hrue9X4NJyp8JkI0403o/XnFStWc59bb2UvUbEd/ziUFW2+mz21fTo4t/t7MDefOb+gedaeRXDB
	1PeEQ7ZkzDsVz2mwDfmJDtUg==
X-Received: by 2002:a17:907:e11a:b0:b97:a1ca:e100 with SMTP id a640c23a62f3a-b9d7279ae3bmr479411866b.32.1776074743885;
        Mon, 13 Apr 2026 03:05:43 -0700 (PDT)
Received: from khalil-hp.home ([62.250.67.33])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6e5c5824sm297805066b.38.2026.04.13.03.05.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 03:05:43 -0700 (PDT)
From: Khalil <khalilst@gmail.com>
X-Google-Original-From: Khalil <khalil@rentman.nl>
To: broonie@kernel.org,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: rf@opensource.cirrus.com,
	linux-spi@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Khalil <khalil@rentman.nl>,
	Khalil <khalilst@gmail.com>
Subject: [PATCH v2 1/3] spi: Preserve preset cs_gpiod in __spi_add_device()
Date: Mon, 13 Apr 2026 12:05:28 +0200
Message-ID: <20260413100530.580649-2-khalil@rentman.nl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260413100530.580649-1-khalil@rentman.nl>
References: <20260413100530.580649-1-khalil@rentman.nl>
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

