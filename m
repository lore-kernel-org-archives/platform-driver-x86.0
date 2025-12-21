Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1D46FBF
	for <platform-driver-x86@vger.kernel.org>; Sun, 21 Dec 2025 21:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766350997; cv=none; b=iCPqBFVvXgHtQ2Wg9r0CbJMBsGvWc1ogJVXnTe1xcrpK29D/ALHqubj2qEsqOVk+bZqBdCMsbfzV3WTAltRCe7EXDU17QexnMYnzFOdlF9t/y/Sv4MYndqSuX+Hm8UJRHLlXEV+ctaRNgFUoTYPHtkUZfISz+72T1dPm/LUnk1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766350997; c=relaxed/simple;
	bh=aCbnMjBI7ze4sQF+R+PyaPodOdN++ld+MIXC/lfsCoM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mU6cquE1NSb0itPekPJftVJgYxjAjahlcn2W1OXjyKcQJyjZChEs0nnVc0d7kUk8iwN836tlxqZDSMuiixJ8cvIpa/4Y3gljbYbGYKnOCh/x9GDjLeMjjwkqnyeK3DU2zCcurO9hYq2ttOUZbb4fByUMD5hqBD/XO4zgLk10Tw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EYwtphyz; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EYwtphyz"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b79af62d36bso594641866b.3
        for <platform-driver-x86@vger.kernel.org>; Sun, 21 Dec 2025 13:03:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766350994; x=1766955794; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yxhPKm1etdcxC1Xo5wytb4E2GIlA0gPj7MvS6c25mQ4=;
        b=EYwtphyzWq87eC4ZEK2KXb9lqGiKehbsDFsPgUPjEthaKFimZMxXRJa61HMz9TplEQ
         MZFJbfWZO0bosbT7ShfFLzvL0LGDYkC7xRmnTB9tRxl2fh3ckbK+zBbatA5qWJqf/c6H
         /774EiLXmcOfUaEZPNxHK/MyTj/N5w0adsgFX1sMSqrZoA0qUJTqdN+g0qfQJgU4a0gs
         ABux9k1x0jWnPI8mEh+Sv/y2ldU0/hxUTo9a8dbvNYW9Cb92MRc7S8NAygFa19Yf3KWW
         IN6dNH3tlC15pZmnT2Ebh9wI0Dbi9qrjFaPZHGII/qr+8AEwOGHueD/muG7rNz131Rii
         4jSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766350994; x=1766955794;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yxhPKm1etdcxC1Xo5wytb4E2GIlA0gPj7MvS6c25mQ4=;
        b=lIto35gnlnWJWFWBCcJHgQv8CT8nHps7dGpf+2SVrwmuYzsZbdRJ7Jucz4+eI/aB2F
         fnJAakoJA8AKVT9IdziEkl52UXXCGnnmIMmvHcOrBSjr2ZDvJF11qmc0U6cWuWjNfJCQ
         v+75pVbcIyFpUVeW0iKpkiGfnblLqVkR9ZKenktQMA15I4F2wlm+iGgdreNj/LZl9hwE
         UO6ZpC4+Qv5vcBreBC3zBet+ErD8SPoPIaEmPwQFjHpZwbmpajfxr2GKJ6p7QezJWwbu
         +GG5sDi+Zj0IJ7GPaMWM1MMe3BfymsPiwJKxQZJc66kfuFjAjChFIwcV02YRcgymDsan
         TZzA==
X-Forwarded-Encrypted: i=1; AJvYcCWYus53xHh3VZW/lpJZXaEWCPp/kYU7V9bGtC1M+IR8dFKsSBbYHVXmHi7tB7PS/WNgT7582QOd7q8lWzJpcc49n3JR@vger.kernel.org
X-Gm-Message-State: AOJu0Yznr9WXpavVPfoT4RFnBtxUtYrU9FqIXSUWaa3EXM92yS18VJTx
	7+kKgAHhege9GzYvGfhe1TemEZZI1u6+QpeVmuhz+r3S+pJ3h0lRGEpw
X-Gm-Gg: AY/fxX7u6P7gSaJZryGTMujBcmc0vB7BbYV3QQYabrtFYlgDL0jtb6fN9zxOnZL2eDb
	h31llgXcK7KFVddGALp0Ajqjd32mfUZdYuAiGObSBp/aUtJN8rx8sELrv6fEVQ4dh/BqlZngsl3
	OQoYovY2YzLdXXKjes8wnhFwnncQx93DNiAUomnJtUCo2pGeLPnQdKNiwcmzGaO/XL5bPLoPrsl
	BGMplksZEEfMhYGVEu0g0nRegK5vq38UpJRZBDs9I+BId2HEVgY5Tka6OwWJKfao1KYxOcx6Zdn
	f33aHm26A6CU6fPcXX9T+E2pqMJLZNm1BCENk3WWdzy9W7beIYHvpVjzulWfiK5zuq8I4y4YcXf
	2pgH/gtuC8he/XuXk1WmsOzFclY4GITHXdgO/WNv+Y9+x4grmYDWdROex52s15jUewmIu1352qm
	Jeoj/ASaGHvLLH7JZJ2t0ItjJQkhOPSDauNO2+SdGo45jz73qrMxSMnHwE43aI44T/
X-Google-Smtp-Source: AGHT+IHinQWOG8IjXWZwyfZLqr9hHDVSLz0QbnUfYn+YXUNgIoPy9Xp/jee9PFGMvSSfKtTqwCAuaw==
X-Received: by 2002:a17:907:9686:b0:b4b:dd7e:65f2 with SMTP id a640c23a62f3a-b8036ecbb91mr985856166b.5.1766350994243;
        Sun, 21 Dec 2025 13:03:14 -0800 (PST)
Received: from localhost (2a02-a44a-2a80-0-8c2a-39d0-7ce1-2682.fixed6.kpn.net. [2a02:a44a:2a80:0:8c2a:39d0:7ce1:2682])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f37ee8sm839737466b.59.2025.12.21.13.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 13:03:13 -0800 (PST)
From: Tim Wassink <timwassink.dev@gmail.com>
To: Corentin Chary <corentin.chary@gmail.com>,
	"Luke D. Jones" <luke@ljones.dev>,
	Denis Benato <benato.denis96@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Tim Wassink <timwassink.dev@gmail.com>
Subject: [PATCH] platform/x86: asus-nb-wmi: add quirk_asus_ignore_fan for UX3405MA
Date: Sun, 21 Dec 2025 22:01:48 +0100
Message-ID: <20251221210218.12274-1-timwassink.dev@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ASUS Zenbook 14 (UX3405MA) uses a newer WMI interface for thermal
management that does not support the legacy WMI fan control methods.
Currently, this results in ENODEV (-19) errors in dmesg when the driver
attempts to fetch factory fan curve defaults.

Add a quirk to use quirk_asus_ignore_fan to silence these errors and
signal that legacy fan control is intentionally unsupported, as thermal
policies are handled through the platform_profile interface.

Signed-off-by: Tim Wassink <timwassink.dev@gmail.com>
---
 drivers/platform/x86/asus-nb-wmi.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
index 6a62bc5b02fd..eaa8abe506cb 100644
--- a/drivers/platform/x86/asus-nb-wmi.c
+++ b/drivers/platform/x86/asus-nb-wmi.c
@@ -544,6 +544,15 @@ static const struct dmi_system_id asus_quirks[] = {
 		},
 		.driver_data = &quirk_asus_zenbook_duo_kbd,
 	},
+	{
+		.callback = dmi_matched,
+		.ident = "ASUS Zenbook 14 UX3405MA",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "UX3405MA"),
+		},
+		.driver_data = &quirk_asus_ignore_fan,
+	},
 	{
 		.callback = dmi_matched,
 		.ident = "ASUS ROG Z13",
-- 
2.52.0

