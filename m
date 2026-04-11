Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0826D29ACF7
	for <platform-driver-x86@vger.kernel.org>; Sat, 11 Apr 2026 18:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775930663; cv=none; b=RtTKVG2zfADi/cW+4n0qLF24KMVCKz77Jw9u+w5/I+yv45Up9DCwDeL0veFULu9A+pepErlklUBk9JAO25pADHej38UNGn9MSjOT1rGPqZ/f7vwx9gRQMlsQCNqOMOw6XU68PdlvR97aQclCHWHGv/+QivjoI3UaCiB11SMkaEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775930663; c=relaxed/simple;
	bh=9aKPv9W66PoQjS1drLRMSLNL5N+3u0CUbWozsmMaGuY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qIVw606t2Z+4cSwNO+vQUTfusH+lD/4VsYE3BUn7W4Ikn9dJLOn9zmph0DEowsL82umJ3veVA8QoOXqE039F/tIFM2wbBe+KtYvjZGpKVuDHFN0Wu2kjiIlPGU8Eto0W1M3He+pTP+M8TCp+bq5zTCGIpqtp+Nq1o9hQ4+KxENY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qwa3jElP; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qwa3jElP"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b9d9971d059so159365366b.2
        for <platform-driver-x86@vger.kernel.org>; Sat, 11 Apr 2026 11:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775930660; x=1776535460; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tUEOsnfxXuZLqwLt1IFYC5XjnP8ak+RNfelGDS4bV6g=;
        b=qwa3jElP+iCMlndVflfYj152Tniir5hai7buLbBMRxoXa+Qn0CAbxYbkDwRQtthxOa
         07CsFti7gkzWoIGciMIAdUQRH8l4CMuvb8Zpc+DON5jTCQnlHS4X69ez4h39FD5g6yd/
         hsvPV/CjwSb4SfwX8yeUqjWQYK/G3OjPfngzBy0NVpyw+JrJ4PIiIvUDeulcLDbVQRVE
         KWmagHOxKfddfm/KpoxhKztksiiJfuJyKctEANyK7O69JrAUIO922iYDqwWMo2Te2Z0K
         UFItX8O4qAYmIQBKDoMF9dso+amNGQgFHYlqNXrCojUfnyhe2Ay+TildKEkli47rBmAl
         Yhow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775930660; x=1776535460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tUEOsnfxXuZLqwLt1IFYC5XjnP8ak+RNfelGDS4bV6g=;
        b=CP8kETfA2SBpYbhqdNlMS/jn8flREJDcjifc4Kd5yeD31AJtM7BUSXkYsTUXJ9gSA5
         nF0oXmV0S+7hCFkaYxX5D+hEdTtCe7XEdWIL63DrM8bV22EnZrJiSGxWP8Fa/n6C+auY
         iK1HL6gDhGvY5Pl1wquX+VOWjL1TfMCAGajolLNJcj9JZko1rkWHhYpZ6ZPPckFW1cxH
         5MOF6N0aj3zNLeJrefBiwiWy98PENs2cnLXDkzl4U98EthtAAXyjSFDUN3k5nbGNdZED
         MiHRotAoSK4mcZtf+mYORCZERQqC2DxQmV3jMrhg3E3aoPS2GfwGCVNsFxQ8lEWhQSv6
         GTkw==
X-Forwarded-Encrypted: i=1; AJvYcCX0DaIIUHSopPmrrJvQqtKCbsCDVvRfeNM6c1h7yKJijDvqDvvjqiH9rX649jzN5DB5tDYW9CONuBpN8ee0PBjDyN6p@vger.kernel.org
X-Gm-Message-State: AOJu0Ywnbz0PKplUTr6fPSm0/pfDm8SUW8ZKZfCH6zcIwg8KBgzoZCGH
	2c5i7ikwD6ibt26+Qzwi6VvdT/13mQdAjmKUxcldDjEduObGZXXUlB1Q
X-Gm-Gg: AeBDiet7J6aKZFGHCX5n6lbKbzo3OQlKRIP6z28BKXgLIrzoFSM6ZTw43xqSdQ2zJLh
	xmZat4Y1vPBZrqF/xrRVgqVeiw9nkucE234cm/qpoMBhbtd9ecnVb/fiDAdOwonfnT+9ueWhN3L
	NCm8ciAzzzkmNFNXiDskjR0DceSGCQCKrGi4PBol0M76RNq9aLrUTp6OTHhFkC8A++UPYDVxYzb
	g3NDOw2nOUatGjPchn/LZdLQnxMtJqVWCyhJ2GCJItmn/zNLoBTswwipUCE9WUgbG+ECgmq8l33
	LiRKS8Iikyz+r0vO+y0ERfeSCSbhV7YhBvJSy6ZK2IRS8VWof4UUkJI0HikaQHDtiM4WsPxaCSG
	VoBuMbL9Y1+4Zs77nP55nJBZhN0+3WxKVkdxOQ5yHjQo0QhJ1DZtESiSl6lduleFj9lbpNDXvCV
	MYkbGK//G1d9jSJLFoTYTJTayh/4FK4Jd/
X-Received: by 2002:a17:906:4790:b0:b98:7e30:8129 with SMTP id a640c23a62f3a-b9d7296657fmr412690366b.32.1775930659993;
        Sat, 11 Apr 2026 11:04:19 -0700 (PDT)
Received: from khalil-hp.home ([62.250.67.33])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6e5c56d3sm186160666b.32.2026.04.11.11.04.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 11:04:19 -0700 (PDT)
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
Subject: [PATCH 1/3] spi: Preserve preset cs_gpiod in __spi_add_device()
Date: Sat, 11 Apr 2026 20:04:12 +0200
Message-ID: <20260411180414.481427-2-khalil@rentman.nl>
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
index XXXXXXX..XXXXXXX 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -1148,7 +1148,8 @@ static int __spi_add_device(struct spi_device *spi)

 	if (ctlr->cs_gpiods) {
 		for (idx = 0; idx < SPI_CS_CNT_MAX; idx++) {
-			if (is_valid_cs(cs))
+			cs = spi_get_chipselect(spi, idx);
+			if (is_valid_cs(cs) && !spi_get_csgpiod(spi, idx))
 				spi_set_csgpiod(spi, idx, ctlr->cs_gpiods[cs]);
 		}
 	}
--
2.43.0
