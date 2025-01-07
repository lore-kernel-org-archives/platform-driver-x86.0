Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D35215442C;
	Tue,  7 Jan 2025 02:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736216145; cv=none; b=pVJvCCP6PdXVus/6ruL+jskp0Gb7mL6FcEX5Cur2YppMzZ295rSnotGXV7yEbmqawNJsirvsapCKwuYflIv2qfH+Pe6TX4FfeCtP7PsN2suFyFQHlX10mpPWzfevcoA2s8vzzxyVu1n4g9wusE8RNPsqzMKUUweqCEbEhvCZpcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736216145; c=relaxed/simple;
	bh=5WBulsK4IcIngHb57Zw0IqkxrAaHZAwEajneUW8KAVM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mSa9i/VioBjqorEBTEa1MvkaPgIx2T0RCaYqax+3qTvkTrXLVVYKemXRGt7yy3hwUh56jWbTnhxP/BaslYdDpT/l8LAhp+xlZ0aJ69TtZuQJh3AFAMtsP4ax2rB72LOK2kaJKJR3YtIJJEyE6SH5XM9/4uWMUjKdaOgXcDqfgSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DQferdPz; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DQferdPz"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-216728b1836so198260475ad.0;
        Mon, 06 Jan 2025 18:15:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736216140; x=1736820940; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3ONS68bugKIHnAxtWThyeupsd8Td3ewB7zCmh+0VQBY=;
        b=DQferdPzXBz7XMngkc/OlCgrInnXmeyxfpgU8kTVha1jIYWUl2O8qlpr5VayCbLIMX
         GokFYyUmQ4D+S8L56xA6kF/M5xI5+kMtKuAL7IGzuJhe/Q17B6uRS8SPz28RYMWOGUpb
         q5GUq6nhPF/qxzXU7Fmc/Y7LeiSIuF2HC6i/RnoDh4TG2uah3s0mXdm4r0stC4UVtgRS
         /A7cOVKlwLO9HvvhXCBVQ1Ipqz7KBOJ4KiLavjiYeA4T12xpQGv9AF4x2X54gqkXdMa8
         QZVni+9aBDsPBwuQZSs2Oq8YlD2Nyb7LEi/L3Ui0q8GEsYUfaB8KlqmqcNyMrEtHkKoc
         OwOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736216140; x=1736820940;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3ONS68bugKIHnAxtWThyeupsd8Td3ewB7zCmh+0VQBY=;
        b=nzDI3ymzhkgOlYUlY8DP09uxkWUNYvv/7ckUpgw26Q+jou3zVTzklt/iSQSaLGMUvD
         nHluiPUPtZBv/P2WME9iJkZ2xIqai5VEo2CzPGnyuL5UmtngYAFGWBVJhdNCVmoL3ayl
         TMqu3mrfzuS5xXTVGdkQRiEvGRsF9K2zfTrLnmtFxzIv3f+5PiKqGKFHzZKJeDjbuAvW
         BjMD8igNm/aQkP208zMPTv0G1yDJzQeHdURaVP+CC9Vg+b8ayu/IilpbA/hboHkMWW1s
         i7HCalXmJNAuE+xIH4NM46buoEVF3Vs1YjT5mSk/mzVFNG8WRdlfnNdrLQvq6UENCtLz
         lE8A==
X-Forwarded-Encrypted: i=1; AJvYcCUHuhCm0wtGv4/ib+wmyxYQ8rOufiJ/QwjmQVdVQcbJJfzWm+uOJWBnJ1qlxEa16r4snu1YKLlg73E2u3R4ARiooe/DzQ==@vger.kernel.org, AJvYcCW12JxyBWqu4pDrEo/1u47F/2f9pUU0JXnYyjmIR4HUZdFJu+UaeHAeW42Gmi/ZVjuamvGN9YF/8Kh2eM4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJs7cNKCB5ez1KinWR5BW8m8oCQt0TGBn2SL0zdu3g4v6kxUKm
	h3t2zsOAFjETGjy5+FuX/Bs2GFWAeunXG25gAkWphNxaDzlYlwpk
X-Gm-Gg: ASbGncs6bx9WIZeiAId3pfD5+v7YBplg9suUsCJaL2ZjC8DVOFoFcQliqqU8sgogkns
	Te0vCbEWm1WSCH9cndwRn9ETZaqTlxz0Tc3TTB3qKMOucabVv++B38lBFnAXiYuKa3Z2uIDpOxW
	hlvdxGrWgNWiH9iDcl+EFzpCrj410bF7sLPsNqyaUhotF9nE1f4tS/2PGfCtY7MHp04T2x5dXC5
	HGtP7k38P0JYvZ0/ZbzmPKdZwtE9pSRH6bVUqZV1ejYUYPJLZZiY2t8XNH9YX5SWuASYTSxV4bV
	tuJ4MGe63e+x6ICv5TUyhbTUeEdJwquYlw6I7GfcUtkxmoqV
X-Google-Smtp-Source: AGHT+IGa7C75rUKAJpnb5wgm/IovSZBfNO/MIHo+afXqVno43rno1rmvpHt5hwch2YwyPuf0JxFkWg==
X-Received: by 2002:aa7:9319:0:b0:725:ef4b:de30 with SMTP id d2e1a72fcca58-72abde2ff67mr79923250b3a.14.1736216139596;
        Mon, 06 Jan 2025 18:15:39 -0800 (PST)
Received: from nitin-ThinkPad-X1-2-in-1-Gen-9.. (127.37.178.217.static.user.transix.jp. [217.178.37.127])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-72ac3214f81sm30184169b3a.166.2025.01.06.18.15.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 18:15:39 -0800 (PST)
From: Nitin Joshi <nitjoshi@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nitin Joshi <nitjoshi@gmail.com>
Subject: [PATCH] platform/x86: thinkpad-acpi: replace strcpy with strscpy
Date: Tue,  7 Jan 2025 11:15:07 +0900
Message-ID: <20250107021507.4786-1-nitjoshi@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

strcpy() performs no bounds checking on the destination buffer. This
could result in linear overflows beyond the end of the buffer, leading
to all kinds of misbehaviors.[1]

[1]: https://www.kernel.org/doc/html/latest/process/deprecated.html#strcpy

Signed-off-by: Nitin Joshi <nitjoshi@gmail.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 2cfb2ac3f465..c9e2dfb942ec 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -11681,7 +11681,7 @@ static int __init set_ibm_param(const char *val, const struct kernel_param *kp)
 		if (strcmp(ibm->name, kp->name) == 0 && ibm->write) {
 			if (strlen(val) > sizeof(ibms_init[i].param) - 1)
 				return -ENOSPC;
-			strcpy(ibms_init[i].param, val);
+			strscpy(ibms_init[i].param, val);
 			return 0;
 		}
 	}
-- 
2.43.0

