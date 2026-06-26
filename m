Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A18F3B6C1C
	for <platform-driver-x86@vger.kernel.org>; Fri, 26 Jun 2026 18:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782496906; cv=none; b=azyVE19daW3qIHEEMIPJKMPJS1OJjLg4ZOAm9x3GxasKUXZ3f1HUnQ1gk+wz5lKOql3klLAgwtQJF1WMMbYqUcT3dD3xFwwe/IANYNrCSkUDJCkRbWgSY7qyVrdStP9KtU1i0r2lJYyePxO1HGlfD0sur0jtoM1Z0XpP2NTfblM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782496906; c=relaxed/simple;
	bh=SJP2pP59+qEX/d/6wwjWT+lx2vnJvHF2ua3dDmxMLlU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EotCBpA3zTsKRSpRG2k1xOJltwiqYrXJcnFm5OhHQ2HJcmEk6SzwMin8Zxxhbif9dXhihBx6LOU3Pfi8CvrsdywsWa8QrGTGz2MkQkcFY98Ed5bZBtvN/vgTD+OpQwUEJMLVp7zq77mVRWhTUISlIwaNPSjPaDktPD3eG7wdVlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=M5FrJ8fc; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="M5FrJ8fc"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4926f8e02e8so4331675e9.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 26 Jun 2026 11:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782496903; x=1783101703; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XVK9K+DUm1jk4GYOzpkGzIi+/L4/kLe+iyyhyftE2ac=;
        b=M5FrJ8fc7zNuYE4x8/39GDJOdwNxHbnifTGOJSP04bQpi3DFJBqlNcBJjlfLUDZvJq
         BJ6hY4H2k60vuACoFRLwLNsZfidXE+XNGc81B3UwxOpFVAhI8xMvyarKFoePcyjcAp6Z
         AremP8vfzEPQaHZqksY/6hZEv8Mbdx9kfj7TJ/PKGwyQoVIIaM/2myjemnia6ORB/c/N
         kg1xgSE1j/H0SYnzzkfLjfj1iZ3Bt/7HB/QaCSpohHUhtGAQFxvBQerGJo6GxfCwR+ng
         3RJQe2KMsY+mnsL6yg1nU/qsQMTjXHJRTvOf7LpcJLl4GLE36izasXGlNvdF364VGCyx
         lShw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782496903; x=1783101703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XVK9K+DUm1jk4GYOzpkGzIi+/L4/kLe+iyyhyftE2ac=;
        b=aw4jBDm1jMcG60bbBcNjUfjoV/hXc5muAI+6MXyb/oKVsuWQH01F0Kv2+kR8sqDV8J
         m5nnjKDGHsxiHB7kSecfnLPG7B2xGpqMhFGkW1dAAAPLiSLaB8JxHPCiPXZoSFVzLpdd
         b8MnBPRXuBM1LC8uY5yap5zTyKiB64ebrlgsD3v+0jK5Uv4l0nQ62BwLHCgMu7wXSO19
         pqFa4izmV2rsvd079S7PhLBHRJtiz2tIBKJusbaodAvdMnYhdb4p21mJ75WFd1I3yzqq
         l88A1M8NmXr9lW6ck5KXSUWUyRDAwr2jk+fn8dv0nO3I6l6ex8193wyMnXhV7NGdxRx1
         XJOg==
X-Forwarded-Encrypted: i=1; AFNElJ/N1O6r6FT6HVDOepzzNTgfgDMHLL5V5H+96F3vv14YGCGHZ8q1+v0tr2Wroh/hbVeuZZgd8wRr5Cg7xc6w+Gt0iW1H@vger.kernel.org
X-Gm-Message-State: AOJu0YxknPSYsFmIpWVtdzeWQXDCIcNvkVw0EWmbkb2h/uDD3OgBvgwJ
	Rj3jJSazJsc5WiQktS/XeUGwomERAyLu6T1mnXZneO1xR4/81GuhAi220l7Z2FSyQBE=
X-Gm-Gg: AfdE7cl/bn0BNGlzhbgjLCjR643eV7bNM9JKGxcp+rndbGwlWwYOUPCLTWP3N8NpEL+
	zWqZX2obKaJcjSDGDfAP7McLQ0epRfxO74+M+8n6LRL4DNB6YBb7XZ6JSa6uY7umCNNWSOGOUoU
	1PCr7TvDV9ECFJ9aKzE5Z8wjVG28kkHUSUjXuFDgT6sM27l6oqmjwymd3KOiQ/r/3gdbKg+IED+
	ThC3dnUKcmB+2HIx3n8osgl3DLcvIqxW99wgbDDBAMFRm1DsmTUw6SanET1K+Ff49R0VKdfwtTu
	E6mBp5J2gmUDxPi1p+9zpiq/MVzcFfk7hqNqZ0YiF4uX80XWGS1fHeuHcOqrw3+CSshbw9NDzGB
	3tyU7YPwX/CIC42ZY7F1anEGSDbFaTTuEedYK8IXK1c6R/FU/8Az6WAwaZ0SXgyJT6eHBQlZBRR
	1qIeL1nDBdIf0cdQq3KH1Ug817kiQMdozJSvI5dIqVKCZOxkS3BoIh1Zbq0IIaN+D3aTUNoE6HC
	Rg8v7d4Ul3pSU0=
X-Received: by 2002:a05:600c:4e0b:b0:490:b0e0:3de2 with SMTP id 5b1f17b1804b1-492668933d8mr119989965e9.33.1782496902976;
        Fri, 26 Jun 2026 11:01:42 -0700 (PDT)
Received: from localhost (p200300f65f47db04b3606a871f5f1c38.dip0.t-ipconnect.de. [2003:f6:5f47:db04:b360:6a87:1f5f:1c38])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49269071d05sm99409545e9.11.2026.06.26.11.01.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 11:01:42 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Daniel Scally <dan.scally@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	=?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 11/17] platform/x86: int3472: Add include defining struct dmi_system_id
Date: Fri, 26 Jun 2026 20:00:30 +0200
Message-ID:  <a19ec23082072792e126e9bf9bc51dae803710a6.1782490566.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782490566.git.u.kleine-koenig@baylibre.com>
References: <cover.1782490566.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1269; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=SJP2pP59+qEX/d/6wwjWT+lx2vnJvHF2ua3dDmxMLlU=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqPr5Rzo/IR2KboduOnfgZoMlC+PFDR+aBaKIgj HduG6SqeP6JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaj6+UQAKCRCPgPtYfRL+ TkscB/9oMmQmnaitpVy9+vCw16rMwGBGxYb42pnBwJuVpfwWMoDLWIk4VVGU8MFyEXlsmwiUgel 10pbqhLF64C5yLyE9J9HGn4quyMCXnLMPp7sZwdvV4HxlvjQpQDHLGNICNoCTmbcblUrXR8awUf yYhE3g5hd4GAT24Knkmdm82pzXHPjoTe35+NHon0V6ErsrBVw1X+ILji7oEcyXcSjoyFqaDIRxs oQpQTPzAhmkub1r8rrQYUpbDWbKBw51bS0/cH2ssy/Ocj4BGfEPq0QcoA3l6qvRfWq4rN+a+/fD io5txC9Cc5n+Sc8Bp5ult/dNmJkjrhnv1+HAH5iI5G6kwoxG
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Currently <linux/mod_devicetable.h> is included transitively in
int3472.h via

	<linux/clk-provider.h> ->
	<linux/of.h> ->
	<linux/mod_devicetable.h>

However these includes will be tightend such that only the bits relevant
for of will be provided by <linux/of.h>. To ensure that dmi_system_id
stays around, include the respective header explicitly.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 include/linux/platform_data/x86/int3472.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/platform_data/x86/int3472.h b/include/linux/platform_data/x86/int3472.h
index 93f1e1fe09b4..f570e3266a2a 100644
--- a/include/linux/platform_data/x86/int3472.h
+++ b/include/linux/platform_data/x86/int3472.h
@@ -13,6 +13,7 @@
 #include <linux/leds.h>
 #include <linux/regulator/driver.h>
 #include <linux/regulator/machine.h>
+#include <linux/mod_device_id/dmi.h>
 #include <linux/types.h>
 
 /* FIXME drop this once the I2C_DEV_NAME_FORMAT macro has been added to include/linux/i2c.h */
@@ -72,7 +73,6 @@
 	container_of(clk, struct int3472_discrete_device, clock)
 
 struct acpi_device;
-struct dmi_system_id;
 struct i2c_client;
 struct platform_device;
 
-- 
2.47.3

