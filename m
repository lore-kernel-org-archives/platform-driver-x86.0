Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942CA265CA2
	for <platform-driver-x86@vger.kernel.org>; Sun, 12 Apr 2026 16:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776011540; cv=none; b=peB31qwhOirX5CIvuF45wJ6DCa0nkzu9fcyYlJnwldtS32d0c4ZYYW4TfWAzWuxYYlRaeT8VkHAr4+FztS7+1wvNTzzKF+2jdnh5x9la90ZjDok4ZR0F2bCkc/M90jqUZbFwybTqUhacy33XCLfMMJVDCUcpXWQ/GDl71WggmfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776011540; c=relaxed/simple;
	bh=qC/bld90r+ThMcnTaEI8CINzwhOGNircQN5AmvhHCP0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JL7Wp/WvP6Kd+r2cpSHExB55JzB2sIcPYo69G4ICyMjGSAlviQK64hl2ofG8SxH15s0VEjqCiMFn/8/bDE1QwtMPyHLlzvr1qCZiNrrFdAHyKuuL6ZbZMSxThHAi6DxBq6iYpLxIc6XAkuy15stt0tjWtJXtPKBFJSljB6spPUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R1lemTGY; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R1lemTGY"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b9c1da7ac63so554188266b.0
        for <platform-driver-x86@vger.kernel.org>; Sun, 12 Apr 2026 09:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776011537; x=1776616337; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QkilzuMUQETyKz1FjFPqWn2VyiH1H/H3jmR+rqzk7H0=;
        b=R1lemTGYVMEfAWjZifZg7CULmonpTMYojK+x8GF+k3EOuW0jeosAybx6vLMP+WGDqZ
         2K8spSvtSocIkQuxRmCt0cIlbFY+9dFhF26DrxlM0BiTGZVDE/HK8+mVgi7haNtf1Tud
         BivJOh4obcobjf+GUaHdfttItb+xwQt8EZpRWsftJFKr0xyqR7OExYFGQKTZ4DelVWHp
         0PB+/NEhJmiqOSeVW57D36p/jMCmtCHMAO4h6FxkRYoOkqqyYONelJnm8qIje7Nb7a2m
         osaRN/ofkfYt/2xgJDGRaQaRBmv/nF9n9pnyKYm85ibT2Vn2Zr2TfJLZa+2Py40kCbF+
         WKIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776011537; x=1776616337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QkilzuMUQETyKz1FjFPqWn2VyiH1H/H3jmR+rqzk7H0=;
        b=ACMndZkQYF9oWl8XLDHkIxVScvwZAFHlH0RtRz0cqXypzPPfTXDUNNOwOL8xGPlUDa
         CBoDwOPIUJTVmZuGiGb0gijtk72wa7LowydG+pPAifCWNCS9zH56kR0Ulk9Mldidjf2P
         e7zMAuW4sydejomjtI9th00b+kiP+Za0nSUhzQm8THOMFCJ9nGFmyOOBtOYZ3gJ3ITON
         cbJ6y1inZUVgfLy09QYVDaW1Ds4QPDedhh7hTCcCuLG/ibQ9fk/VQ5f9CSZlew/8qxK1
         Nk65BexV8yvs+AE4Llh9c+lR8dpTHvQhWJUklxnchnkJpgBKyBCFLy8wNva8fxnRPFOn
         /5Pg==
X-Forwarded-Encrypted: i=1; AJvYcCWbhmX2zAQ37wayzRfYYZ3nl/GjGQrtggmrkUNkC4skM9cE7ByUR/yc7QL+gT5Za2Q0Zt+BDn9hDrhgaxAfS6suS4oM@vger.kernel.org
X-Gm-Message-State: AOJu0Yztl6caPxG64hrzamb8iUlywE2fzuOW7VRyAd1mDfCrqe2sijo9
	5oK6WXhFPcPgB75cWcql1xYG4ma8Yp0q0vpj4kL3PjT/rohABYS+71Ti
X-Gm-Gg: AeBDieuNNXtz1OKDJXy5/93v2JhzDOWSVanZ0S0sjFO2SlbHn/UUpW6wjUn3GJH/GR0
	NAl4YjdDPsr5kaVJy+1qf8coh0Ov2PbIgFNoH3mGGVTeP6Z080LbZKiNCGCVLf7ndUDgaENiZ77
	014E6KUxNXnCSRHJ1pSZKgWaVOr4fcoVbTwc+IfuqUqo5aLvP3GJ0hLFgpuG0VmsKFyvt2GGc69
	CjKLOy3WTmlUk9yP/iItgXsGO0PkeiG8jVU6tmQORLTmURMh8/9wHQWlljf0DD6EmU+NU+Pl3Rv
	94eLAqGBMWmrTAqGlCxySn99asuWeJ4UrxbqlMCUEwW/lUmsZeshk5IhM4tEI0TRAyEmOLmaPWi
	vinFgaRLce7+5Yb6X07JRJOHPIA8ITiarHQRS/qW5YNojDd29yCBcKYFiLRMI/Eb1pHnBuDvPde
	wfa7M9jdmIjxr9bMdXZfWKhQ==
X-Received: by 2002:a17:907:6ea7:b0:b8f:f08a:4b80 with SMTP id a640c23a62f3a-b9d724ee4f5mr589125966b.3.1776011536824;
        Sun, 12 Apr 2026 09:32:16 -0700 (PDT)
Received: from khalil-hp.home ([62.250.67.33])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6e7f1a3bsm236468666b.62.2026.04.12.09.32.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 09:32:16 -0700 (PDT)
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
Subject: [PATCH 1/3] spi: Preserve preset cs_gpiod in __spi_add_device()
Date: Sun, 12 Apr 2026 18:31:49 +0200
Message-ID: <20260412163151.506282-2-khalil@rentman.nl>
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

