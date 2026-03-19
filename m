Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702F738756F
	for <platform-driver-x86@vger.kernel.org>; Thu, 19 Mar 2026 02:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773888990; cv=none; b=CL1POeIvb3JHm1IDozyqS4kcgB6oHSmgVUnMZiauQv0q3bMQQDFsm55Aen2TTzZCbRhfmWllnIKfbyDnStIdK184rxsVRixbe8IWmPHLNEEmC6UU3N4uPDnXh+JMNVmv0Psf7NOGrigiVOBohFs7k6s6IBgjg6xGvP17Cha2yYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773888990; c=relaxed/simple;
	bh=j+TfdR2vMLzYv/kUd6Hr5UCBSIgEc4azCMqHxSkXbWg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GeU/hyW9k2v3mp6rIHZ5MkyCtFoxn5tXm7IPne/AnhgVzYVCqo9PcOvz/lZZngdZWplurNOSBLn4SOkN0RJrO9/F+tNG1QF7R/gsRTREyvTz0FxS2iyBBUxbONCHAk5hiPfZy3RaNMNwysHEdJ8w6PR7ZShw5mqjqjg6t5+bDXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nWqta3mO; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nWqta3mO"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2bdd40d3c61so576150eec.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 18 Mar 2026 19:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773888989; x=1774493789; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZgPWB+b9LbV2c18ggNpLoeCrPTB8CAkNmY8m136D6Cw=;
        b=nWqta3mOso4lZn7+gmMBtwu8ePo40ttfPa7PjyV/mb0X9/7GWTxrSn148HqlerQB6K
         0BfbFmv6nSBM1EenuSpTRCqZd8Zy7FSjpID1NnmJ01QeIzyGdRIw2pYChMH22S1QPowJ
         PogNDjAfwOzAwGu8MUxVDgcF/mO7ZXEml1oU9tIu/lqC54Q6MewOjizCEiueNoflwBJK
         ydp6VQxwQuhG3VfKzCYbYf4gOxpilCegfvYTGb9bRHux+IfeT8ylu8MyyeJ/NtboWQKI
         3i4kRNd1YBwa0Kxr698mESatsdMzc69qBUuEU90U2BOft7dlMSe/arfKJ2AyI+bY2lF7
         KEMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773888989; x=1774493789;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZgPWB+b9LbV2c18ggNpLoeCrPTB8CAkNmY8m136D6Cw=;
        b=IiGqi5Oplh+OnVs1yxJMETxwMW/MFViLsQUeptzRyYV9XVCDYSKyQaG0cKpGUIy4To
         GCil8Qzfz90ZUicdDfH1af2Wq5AA6E2/QZoEDY8L6VGT3w9JjaJZ2BqG4wOb1hDz4m7D
         GRECcqnli0yhR8NRkU3lmqLTKIK3Ea28gVGGtaeSDeONQHVtZhni1YRnPeooIrj3ka1z
         c9dN45HVt9unt7QvfMP7VQLx3Ltrc6zOuOjbnT1q8yCXpFADnrTmjZSsVa6XcDr9iFlB
         P8D/9Z31FJn/INYrQoXFiElZRieOzxOPSJv7VRSPDM5jPKnmUarAIrtkvHeQl6P0Ye6u
         yATg==
X-Forwarded-Encrypted: i=1; AJvYcCVDDV8rdbUSvnU2zto+jDouo/gJ2qTIktyH5HarwD+uy/MyvJyAFOvBxE0vLyKhI4GJadHEdUVgZXV8UQNvIwHIZJeX@vger.kernel.org
X-Gm-Message-State: AOJu0YzLX5QxbRx0kwdwz8Hadt4DMWXOXMV6M46utOfsvdwBVXyrkc1W
	BUuEw1L/nCH6abdp2pQq3VWDUYFYHGgSHwSYROb0VBgHs3u5yAHDrxP2
X-Gm-Gg: ATEYQzzm0JLnr+jbS+llEa/I57/BSG1uYX8NeznrQdkvTIsyWzjxoumhalO37gZTgup
	n1ZZDj+aI7tYsp2GoI5ipAPGky25WDlqE1kuJ/Vjnt/G7rt19QtTjjyLBuSQZhpm0rAVd37X6A8
	Nv78e9634mZVSor5S0pN/TnhLG0QN1AZPuLzOUZNnITmxUd0CZArs2jU/biSKVUmyHb7oWOkbz0
	flbNAON6svCnYsVTdni8IHbyKGFuUGaQZ/NJubR/Cqgljh01OBowip3D7/FPxDvSmkgkn/cXPv+
	2NrfuJiy62TIZT/oOvfGwVx9Ta0s28Zq0k0BTAyJ+/hNU56SlkBZLqzNzM78lgFo1YQ+MinX1XV
	iJRl3v9fPlzKh4oRSH2xB4+XswLlSW1GLOmU/5HZe0wHgNAwhKWd3Uyp3JeNcOy8DRWG0ar9zvl
	fG50QFf3rIomsI+SMUXdy4AF3EcDNkJWsvuMw1zgC+2t4MW+y/jfdey2c6KoIU8Rg/bN6Yu+lWK
	/KTx81dW8F85A==
X-Received: by 2002:a05:7300:7fa2:b0:2ba:6a79:f04c with SMTP id 5a478bee46e88-2c0e50631femr2651118eec.18.1773888988115;
        Wed, 18 Mar 2026 19:56:28 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:5966:2bd9:1ed:e7c4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c0e55a53fcsm8250983eec.24.2026.03.18.19.56.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 19:56:27 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Wed, 18 Mar 2026 19:56:18 -0700
Subject: [PATCH v2 2/2] platform/x86: barco-p50-gpio: convert to guard()
 notation
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260318-barco-p50-gpio-set-v2-2-c0a4a6416163@gmail.com>
References: <20260318-barco-p50-gpio-set-v2-0-c0a4a6416163@gmail.com>
In-Reply-To: <20260318-barco-p50-gpio-set-v2-0-c0a4a6416163@gmail.com>
To: =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Santosh Kumar Yadav <santoshkumar.yadav@barco.com>
Cc: Peter Korsgaard <peter.korsgaard@barco.com>, 
 Hans de Goede <hansg@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, platform-driver-x86@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
X-Mailer: b4 0.15-dev-a6826

Using guard notation simplifies control flow and makes the code clearer.

Suggested-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/platform/x86/barco-p50-gpio.c | 26 ++++++++++----------------
 1 file changed, 10 insertions(+), 16 deletions(-)

diff --git a/drivers/platform/x86/barco-p50-gpio.c b/drivers/platform/x86/barco-p50-gpio.c
index 360ffd8505d6..2a6d8607c402 100644
--- a/drivers/platform/x86/barco-p50-gpio.c
+++ b/drivers/platform/x86/barco-p50-gpio.c
@@ -272,33 +272,27 @@ static int p50_gpio_get(struct gpio_chip *gc, unsigned int offset)
 	struct p50_gpio *p50 = gpiochip_get_data(gc);
 	int ret;
 
-	mutex_lock(&p50->lock);
+	guard(mutex)(&p50->lock);
 
 	ret = p50_send_mbox_cmd(p50, P50_MBOX_CMD_READ_GPIO, gpio_params[offset], 0);
-	if (ret == 0) {
-		ret = p50_read_mbox_reg(p50, P50_MBOX_REG_DATA);
-		if (ret >= 0)
-			ret = !!ret;
-	}
+	if (ret < 0)
+		return ret;
 
-	mutex_unlock(&p50->lock);
+	ret = p50_read_mbox_reg(p50, P50_MBOX_REG_DATA);
+	if (ret < 0)
+		return ret;
 
-	return ret;
+	return !!ret;
 }
 
 static int p50_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
 {
 	struct p50_gpio *p50 = gpiochip_get_data(gc);
-	int ret;
-
-	mutex_lock(&p50->lock);
 
-	ret = p50_send_mbox_cmd(p50, P50_MBOX_CMD_WRITE_GPIO,
-				gpio_params[offset], value);
+	guard(mutex)(&p50->lock);
 
-	mutex_unlock(&p50->lock);
-
-	return ret;
+	return p50_send_mbox_cmd(p50, P50_MBOX_CMD_WRITE_GPIO,
+				 gpio_params[offset], value);
 }
 
 static int p50_gpio_probe(struct platform_device *pdev)

-- 
2.53.0.851.ga537e3e6e9-goog

