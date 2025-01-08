Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF73B1F3D3E;
	Wed,  8 Jan 2025 08:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736325981; cv=none; b=Y+lk433fFtaxVBVkmghMXiDt364gnuaISOQr3CACjqOZPQyyMu+3I4NRBwimxCLV31P1QQU77AvxmPobQmn3Bwd2+/dtmqxfWIHmLRUU731kI0Nvz6xbipYfKyBRjH3OtilvRFYylcJIgXB0ilchvR4VzN3IcX7fCFuKaOaI60I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736325981; c=relaxed/simple;
	bh=36RW8tlYDTlB4RGxR1zaksxI9oB8GUC5R8ipffTabOk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kAQJwuQAIZXabimVz3OvCmbWcFf0Ch3iyhp79Hn5TaZ8bDUK1uPIvVnzjY0G4Ab/xDpttHk5OccHKObhG8gqQb5DFA7KPztgK583v/G/Mz8qHYJcpCX/9DnfQU+bmkoqqf3JGcNF6NUT41tBY29SDWTiWSkRQsqxPI2Jt1VUXoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cIIPoF44; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cIIPoF44"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-21669fd5c7cso247906215ad.3;
        Wed, 08 Jan 2025 00:46:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736325979; x=1736930779; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xF6tMM21o1icNmPXtWmlCcrJ/ii6nDhDmkxDOwJB6UY=;
        b=cIIPoF44HYaZdeM4AJuQgIabCnffvACvWZH28tbGA9cqomdZTXFMWm1k9soj0DDRIc
         AG4FU56wPGFH8Ct4CUQ6mJ52d4ohPFiclS/nDnlSPIZrFqjl9jxFAsmuy4OD5XrTiK1F
         IudrMslXHAGi42yUazXQP0TjMY+xV3Yf+Hr/AzqB2YSgYSv525lSu/bmrzYEHb4Csjf8
         ENgkBKc3bxhv6h7mg01mvkNWXEQ7aRlgpWTGTWb0uXaOC59dz5+LbQ1qTx635IDcAFw7
         DRX6dxA+k94fLVro96FP6yckRWHSIHuVHseLsCsIAUbbzfLPz9fGehy95JYD+I82cxZf
         VIbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736325979; x=1736930779;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xF6tMM21o1icNmPXtWmlCcrJ/ii6nDhDmkxDOwJB6UY=;
        b=C2ZVvo3sUFtzsJXP/JCvdmtjzUDNb3ska8GOXG5gAKFUwyYDPZ9coWIqYx3BgZaLab
         PrxP6XtT60eq9+nEEM2jsegH4+0oF/sssmlspN45b9hifjD4UbK7dimjaTyEFS9D1KjV
         KvTHD02OBdN+cgnnAt4KmNdcYtp2jcwXqT5QjAJ/ed0iuENgkDhR1N5XrzY0nPmcKHIe
         0O65UtAzAm4C6ecPFuptnSKdoVQ3rB330jc7pULHbVmS9e5ongGhnx2SddghqRZyg48/
         I1jDzBGiXJ3CwCvJtBpdhZ24f7/uvI6zQrTFCF0+26294BMfjU+1XcTFcoWCc1i5W3pw
         bokw==
X-Forwarded-Encrypted: i=1; AJvYcCXDv233O/Zao0sQlSpvbcrmWZPxMq7xLgGaIQCT/w7q1Z9ugJx7SUNh2OUShupiehZEgvqJkLexZUNk+z4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzocw3Fj1Ma8FNFJLHcdUjFI1yu9eqct0Y6tUuoHze74Grybb48
	zk3Vmum+s5lhR5yX2fxIiiZgpj+IL43/1bm1fqmBYDONZvc/wsfF0MD327zd4RU=
X-Gm-Gg: ASbGncu/M86jQFtqRprh/MCpWeA1i0YZL2hrZ7xRpyakIL5/zb11pp5COPb7BAH9E8g
	aVwZAeXUtwxdSF8dtsa8vIWDjg5BTR4vQmXlwkP55cFYNDJOPuVYuqJUU9aPVYv7vlm2idfPdBE
	mba7GoxVF/5F0KWMCac+kgyUZP8B7yAXOAL3fy0lbt8kR3VZOOUnJG/ztP4t49vI+MXaxobNjDC
	xsITTJiGC0kC1wPzjlzbXHnBHn6eYhM3fPLiJR9cd8yVmoMBY6aAiCXTb9LPw==
X-Google-Smtp-Source: AGHT+IExO8GrlZtIL8JW8uRnck1GnnLcXCxRWN/juSIti5Z7enZBgKl91D97ScmH3I7QGTicFHASAg==
X-Received: by 2002:a05:6a00:420f:b0:725:e721:1a41 with SMTP id d2e1a72fcca58-72d2201e7aemr3312462b3a.26.1736325978683;
        Wed, 08 Jan 2025 00:46:18 -0800 (PST)
Received: from [10.113.16.67] ([175.184.253.10])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad90c18fsm36150152b3a.184.2025.01.08.00.46.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 00:46:18 -0800 (PST)
From: Hridesh MG <hridesh699@gmail.com>
Date: Wed, 08 Jan 2025 14:15:27 +0530
Subject: [PATCH v3 5/5] platform/x86: acer-wmi: add support for Acer Nitro
 AN515-58
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250108-platform_profile-v3-5-ec3658d9be9c@gmail.com>
References: <20250108-platform_profile-v3-0-ec3658d9be9c@gmail.com>
In-Reply-To: <20250108-platform_profile-v3-0-ec3658d9be9c@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Shuah Khan <skhan@linuxfoundation.org>, Hridesh MG <hridesh699@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736325951; l=981;
 i=hridesh699@gmail.com; s=20241114; h=from:subject:message-id;
 bh=36RW8tlYDTlB4RGxR1zaksxI9oB8GUC5R8ipffTabOk=;
 b=DPKiNcfJnzIv1/0n/l0ECY1wbE8kHow+Hfic84MGIvplXG6AimTZNgRfx1awI4LBM4Hy/N0tU
 hQv9/+a3nIoBwDlrkMVTvJMa0upKo8nUd5Es8mh5frWGzl1FsXa8ilJ
X-Developer-Key: i=hridesh699@gmail.com; a=ed25519;
 pk=otVQutD5ZTsEpajsGv/haM3pQj0yofkuYrdNcaX5AUE=

Add predator_v4 quirk for the Acer Nitro AN515-58 to enable fan speed
monitoring and platform_profile handling.

Signed-off-by: Hridesh MG <hridesh699@gmail.com>
---
 drivers/platform/x86/acer-wmi.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index 6c98c1bb3bdce6a7c6559f6da4ff3c6ce56b60e3..4813ae68af545b50b981022839dea398497a64a0 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -601,6 +601,15 @@ static const struct dmi_system_id acer_quirks[] __initconst = {
 		},
 		.driver_data = &quirk_acer_travelmate_2490,
 	},
+	{
+		.callback = dmi_matched,
+		.ident = "Acer Nitro AN515-58",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Nitro AN515-58"),
+		},
+		.driver_data = &quirk_acer_predator_v4,
+	},
 	{
 		.callback = dmi_matched,
 		.ident = "Acer Predator PH315-53",

-- 
2.47.1

