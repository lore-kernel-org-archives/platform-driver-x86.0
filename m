Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C1F4A0F03
	for <platform-driver-x86@vger.kernel.org>; Tue,  1 Sep 2026 19:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788290798; cv=none; b=jlvQaDpkaWWW+IkLNeqLmklu2mL75K0qDFl4/Mwxyx79Oi5sYO+Hvi2OEE5JVuRw4GPNI+rqRJ8Zh7SmJ0htF6I969LmeMyi+0pSp7n3b4z4Kv4kgxYOC1zvDbyna2P6IlDiJcaMG8Uyvs4lZzFDrIoBh4aCtlN6ziLsKXobesA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788290798; c=relaxed/simple;
	bh=Phr/lyT83N6DYL7BdtQd1/VdiLOr4iWUkwC8JFgGLyw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G3UwEShbqDN3hHWJHfDD7ihYT0wAY0n1Df5Wtk7lMUdL/hxcgnMSb88hSqlWxD5gtwwVru7DAsE4DqvCYVo3U7I8rFXkc68K2vadW3y4Hp1CTKfjKCv2FY4sfmL+Aqpp6q7sXaU4uGsTTbzVesUuVSqjGVE6vqwCTP59h4IHl6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nb0qJvel; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nb0qJvel"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6a082b3671fso295024a12.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 01 Sep 2026 12:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788290793; x=1788895593; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+jZowfmyKxOguFaJuZq/Bm4rZ+Os6TFRN1DcxWsiy2Q=;
        b=nb0qJvelweh72Eh8xFecIIJGexpOlBTjJnA+Vd56Q5a+sPXa+vgsPG+IWtqei3h9S8
         mI2vZAcPE7GDz07cpSYuIK0BkuNduXvajSkpiEvZRJpepGwsDkM5PwQyzGjwrtjKFSSA
         8h+Hz6JX1sZOlk3hHQO4oFgKu/I7+E+IuCzWhEDGHA5ILfhmtNEBGH0jQIClV/IoYj1p
         Ocy6MwJFaIRrm4CRpFt7eVZyGhNGvAomWh0jiatmVP9vlBjoJLyj4cBtfb0gW8CjtB2a
         CgorVoJsVasH/F/3oCZjmRkbIEAHr1iBICVhTGW3ibHXs6PoUiLytY1SE5srW+rKvtic
         HWFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788290793; x=1788895593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+jZowfmyKxOguFaJuZq/Bm4rZ+Os6TFRN1DcxWsiy2Q=;
        b=ftaRpeQAeNjIHgrntR5TGAj5hqtG7TJf8FKvjXIfIeadNf2uH7WxY7nM+SYevIok+F
         D+014zijGDs/Y0UXWi/KkzCBUIn4w3LqGBI9vZqBUUh3wjOy+TOgI4XLRrW3cbSpYx49
         AsfM9JXTfKmucNAyv0vH24X9vOobF4jTh4/qhunfSRH1FW+Q+F+i5ckvL/6ZQShsTyZH
         KrbM0ThVtenhBCmPT8sr2O74eAX9t/ayR08KLBpEmq+VJwRAHWFkGK6J39BwX6csmg3I
         mssQmTbVtaBiN+mzcg9In1Hjf79JJv4Oj5nx+diNjYgJyRFLTe3oZWLxojJujNOXKVPT
         ddQQ==
X-Forwarded-Encrypted: i=1; AKwUvBzLo98i3mOYU/4HLLBX3WtjuNKm1Ieo5FK4lTy8bkcLrGmrX3kn8MM8dk/144Ruseq1isGAbQRZW3kObGE/bNRmH4Yi@vger.kernel.org
X-Gm-Message-State: AFuF++lN/mS/+QIBf8WnsRAqMDGhidp8jcG26eWGghg2UHOLywjdd6Cd
	gw3LPLnI1uGXfTlSnjBTHlufH3Wicqu3uHkpbezlDZ1tqXCj+ScHm6kw
X-Gm-Gg: AYBFou0zPI5+7gEDQpy5QKMxWlG1trxfwya2tZC4QSpGyPQaNGHw+0hevoU6VmNJnRz
	X4p0PDVoGUZeuLKgNrdGEnUoi/0detD/X4L0fi81EIBNQEeImKp+uwmrtSZY+790jQXhummcO65
	ZIqQv8gQjoPUyAQ9uDwq5/+xNI8dZrec3JOvZloe0cfPLIis+16aBbYN06j/aaMkQoKQLB1O32K
	Pl4MInt8qAfModyIZ72XA18FY+wF+bsBVJVTewPkMhi7a8oR711drfkq35wgofEd3N1Xbk1lnt5
	KlP0B+DNL3o0y+gpC5SIhygLcjRFteOlQJK7kQluoZ17oVZHN3yszefeOHxO2OQIVIZNuiMgU/q
	PLydgFjNJ7mL0g6cA3tUhb/EQ4+Ac77a4wZTYuo542pqKFp3kXCugRUVEOaA59GPJnNVdPgk5WJ
	7YFkDO787sTQMRDnOKsnV8y9vS6jnc2DiEk+BiKLCwdVxIwHGLcG8qv4UdFQPHKg==
X-Received: by 2002:a05:6402:5305:b0:6a6:757d:6311 with SMTP id 4fb4d7f45d1cf-6a68257c1eemr63061a12.9.1788290793582;
        Tue, 01 Sep 2026 12:26:33 -0700 (PDT)
Received: from khalil-hp.home ([62.250.116.161])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a67f94242csm146373a12.21.2026.09.01.12.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 12:26:33 -0700 (PDT)
From: Khalil <khalilst@gmail.com>
X-Google-Original-From: Khalil <khalil@rentman.nl>
To: Mark Brown <broonie@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Richard Fitzgerald <rf@opensource.cirrus.com>,
	patches@opensource.cirrus.com,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	linux-spi@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Khalil <khalil@rentman.nl>,
	Khalil <khalilst@gmail.com>
Subject: [PATCH v3 1/3] spi: Preserve preset cs_gpiod in __spi_add_device()
Date: Tue,  1 Sep 2026 21:26:23 +0200
Message-ID: <20260901192625.1497791-2-khalil@rentman.nl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901192625.1497791-1-khalil@rentman.nl>
References: <20260901192625.1497791-1-khalil@rentman.nl>
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
index 07c572e1df..fbfb9a1aa2 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -924,7 +924,8 @@ static int __spi_add_device(struct spi_device *spi, struct spi_device *parent)
 	if (ctlr->cs_gpiods) {
 		for (idx = 0; idx < spi->num_chipselect; idx++) {
 			cs = spi_get_chipselect(spi, idx);
-			spi_set_csgpiod(spi, idx, ctlr->cs_gpiods[cs]);
+			if (!spi_get_csgpiod(spi, idx))
+				spi_set_csgpiod(spi, idx, ctlr->cs_gpiods[cs]);
 		}
 	}
 
-- 
2.43.0

