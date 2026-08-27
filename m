Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A26E0495054
	for <platform-driver-x86@vger.kernel.org>; Thu, 27 Aug 2026 18:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787854603; cv=none; b=g2psfXveSYaVo0uB3HG5rZtLxt/heaBk0lMpJRbP4zLIygAex6WK4ngTpnV36QAQwVOvGZWrQiSaRZo6OS1HH2dltR/bAHhAU0hOpe0Z7r3FS60qCvc2yHlBM393pgkZ2np37hKofj7TchTmYHaYWQAvEvUJuD1vz+phqNDPBLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787854603; c=relaxed/simple;
	bh=2S4T0eC7Kmna1hk61v36MroRNq9sEQ0STyE1FoXfjY0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J4R3dcFS93XBJmEGY0OM5e6GMxdNRffa1P8ETLSBu8vQTdcjoBYuz8pTOnTNiXzpPpbwWi2o3x6udMSP6ohjgKVUxxmQdCgxlW7O2arlQdJXW+xK3YA9sHMmzZpNyEZQHT4GQ4bFwXuSS9u0iqdSJgmH8WoY8j0k8MmfTU7rmS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ds2oCnkt; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ds2oCnkt"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-482ddbc11aaso92353f8f.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 27 Aug 2026 11:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787854597; x=1788459397; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3PlPZyn9Gp7asBZlBMMq0X5F7+8cWFv/GI7YGe1ICCI=;
        b=ds2oCnktNGyjUebNBsg/VZYpDnZMhYsdB6+aaVP/tPL8ziztor3tejgTMREfYNEUsk
         fwjXeVq7Quk1lt1NYsPH593ls80g0/E0uAlsUbW/w9hZRtTpHy1J8SrWJXI+4+wWQNh7
         UEuY6poxIq5DRlJFV7Ji+7ObUwj9OMZuTCKIiSA2f6EsHkp9Tynt2EslAfdkKuFxZ13j
         lFqeDL8dDtoJIWjJTQ4qRsl73KJlmavn6uSoVtsuvJxWoAa75nhiR6GKVt1oyjpCdQWT
         a6kcVuSp1hdm7FFDu47F3erkDSkKZ1ofnU9C6qlQk75Vf9F8tBmaJejuHYJCkrlZkFFv
         2g9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787854597; x=1788459397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3PlPZyn9Gp7asBZlBMMq0X5F7+8cWFv/GI7YGe1ICCI=;
        b=KqZUybALM8bHMLdUO1VhlYREEsVn+EfMHWRUQaxM8+fWRSVLaIux0vVQfkdh//jSJW
         n90DIH/ujkDZZjpc2tVvqHTZvb8bPklTXg1NlfwUpAQNhscbpy/kc2LC2Oz5ifAQUpUT
         yhzI8HfAoEXPLvt3e/7SHwlL3FwJRccp1Fiig9NsBuJggsDvXJFWTL1JzwjJ/t6uCHpk
         JVHNWWTLWUBN2Gu9Z9298MRp/Xt2LxMvZJxngl4jOqW7meiVjc2lc/qOAdpvpE+iiEPA
         1fpv/wUl9DKW5xKSlQwFPoT5E+XIsaEY20SK/5+MK7g3IfeNk1m97jCsioDC9kcgj2Dx
         4dzw==
X-Gm-Message-State: AFuF++nlPeGTSvAPxhQpTKZuAHj0AmUFitx8KuwRptJnxAgFkntgjIEB
	6c29Mfgft0vjFukRn/F5U4SVuFB9BcGN4v/EqVP5IRpKnN5lHgrQQuTtEsP4+QID
X-Gm-Gg: AR+sD10IoIdpRZ9Gu2pgwkhCOHlu8r8rECiKCJvxyqVPK+N/vu8Uc0gctjTN+RXRdcb
	QUfh+6LKbCB9YNGW4RST2nZ4HstvUDBi9obu+4xOQjc57U9wPpOnuEwfiGNIw2wOGyISCz1fjl9
	8cP7jBwPGsbveWYIMPv/jxZDBcBRa61D7D55uJwvYxz5t2hNbjQzVN7erI/uzFmB6Qy26IiGRfe
	wE9AyPD2N3eYqX787/rqcfR/YNjlsTP+4YfeiDssKhCvIFFkXG2QKbaXDCVB5UCKexkd6CmI2KH
	4G3WQr/n0LO6mRfnramwsrFT4eUeZfmu6uOCLIJqzixyC2qfRctL9KQBTNEF7tdIivYrjvljqZl
	F3eIVA3/75H3DF3O4cgrlmnkdtuRlm973Tv2fGrW8WCqEBZrwz2Ex1sjNQRpR2o3jlrjFD87sSO
	T8hVgUobqfWjHH8chlN/7zzuRr9E6L3fH33UeNQzQ5yjTt7zIL/Y+xz+jMn5Gwh4P50T93mXPzy
	5zCo0hB3zTuF7h6WQ+CPrqdSup20+ccRXIRZ8f/h2kSdPnu7mgauw0=
X-Received: by 2002:a05:6000:2f8a:b0:481:5021:33cd with SMTP id ffacd0b85a97d-482f799da69mr950497f8f.3.1787854597208;
        Thu, 27 Aug 2026 11:16:37 -0700 (PDT)
Received: from 1Z10 ([78.213.170.242])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e28dbf33sm11328702f8f.23.2026.08.27.11.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 11:16:36 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Linus Walleij <linusw@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH v2 3/4] platform/x86: x86-android-tablets: Add Yoga Book TS3A227E
Date: Thu, 27 Aug 2026 20:16:26 +0200
Message-ID: <20260827181627.2427880-4-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260827181627.2427880-1-mauriziocasciano7@gmail.com>
References: <20260826132233.3342481-1-mauriziocasciano7@gmail.com>
 <20260827181627.2427880-1-mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Yoga Book YB1-X91F/L firmware describes the TS3A227E headset
detector as a secondary resource of the RT5677 codec rather than as an
independent I2C device. No client is therefore created for it.

Instantiate the device on I2C1 at address 0x3b, describe its GPIO
interrupt, and provide the mic-bias setting used by the Yoga Book
design. This lets the ASoC machine driver use jack and button detection.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Assisted-by: LLM sparse
---
 .../platform/x86/x86-android-tablets/lenovo.c | 29 ++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/x86-android-tablets/lenovo.c b/drivers/platform/x86/x86-android-tablets/lenovo.c
index a8c849ee03db..88693b9a1b01 100644
--- a/drivers/platform/x86/x86-android-tablets/lenovo.c
+++ b/drivers/platform/x86/x86-android-tablets/lenovo.c
@@ -149,6 +149,16 @@ static const struct software_node * const lenovo_yb1_x91_drv2604_nodes[] = {
 	&lenovo_yb1_x91_drv2604_1_node,
 };
 
+static const struct property_entry lenovo_yb1_ts3a227e_props[] = {
+	/* Value taken from the Lenovo Android kernel code drop. */
+	PROPERTY_ENTRY_U32("ti,micbias", 7),
+	{ }
+};
+
+static const struct software_node lenovo_yb1_ts3a227e_node = {
+	.properties = lenovo_yb1_ts3a227e_props,
+};
+
 static const struct x86_i2c_client_info lenovo_yb1_x90_i2c_clients[] __initconst = {
 	{
 		/* BQ27542 fuel-gauge */
@@ -304,7 +314,7 @@ const struct x86_dev_info lenovo_yogabook_x90_info __initconst = {
 	.init = lenovo_yb1_x90_init,
 };
 
-/* Lenovo Yoga Book X91F/L Windows tablet needs manual instantiation of the fuel-gauge client */
+/* Lenovo Yoga Book X91F/L Windows tablet needs extra platform descriptions. */
 static const struct x86_i2c_client_info lenovo_yogabook_x91_i2c_clients[] __initconst = {
 	{
 		/* BQ27542 fuel-gauge */
@@ -315,6 +325,23 @@ static const struct x86_i2c_client_info lenovo_yogabook_x91_i2c_clients[] __init
 			.swnode = &fg_bq25890_supply_node,
 		},
 		.adapter_path = "\\_SB_.PCI0.I2C1",
+	}, {
+		/* The jack-detection IC is described as a secondary RT5677 resource. */
+		.board_info = {
+			.type = "ts3a227e",
+			.addr = 0x3b,
+			.dev_name = "ts3a227e",
+			.swnode = &lenovo_yb1_ts3a227e_node,
+		},
+		.adapter_path = "\\_SB_.PCI0.I2C1",
+		.irq_data = {
+			.type = X86_ACPI_IRQ_TYPE_GPIOINT,
+			.chip = "INT33FF:00",
+			.index = 77,
+			.trigger = ACPI_EDGE_SENSITIVE,
+			.polarity = ACPI_ACTIVE_LOW,
+			.con_id = "ts3a227e_irq",
+		},
 	},
 };
 
-- 
2.53.0

