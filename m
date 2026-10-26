Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793009405;
	b=hND0Ujy81QUsg7mVDJDd2XlADEQ2aruhd02l4mhOpwCN6pADKwqJr3e+6ME8OHKGKdiD
	 cNXDWDij/zc1M4nczg5QGdMcnIbcL+jzcQTKprRZzZbgBxC3eopdIzFV9JndHF6/tb7QA
	 BhBo2hTp7PbbEXOQTaCghu38+mAr1NnAJB8+loaj1l8GzsKY0L3crU32kxDISgEl8rgIv
	 a863yx+hnj10y0vYqPgx2fgZ3Nyh1tJ3+4r4jnItk7aUhg5iBxPuZjEThxWa16CthzD7y
	 47hAUq4o2slqRITWOGlWHc/3vC2XLAfQ+BeLbz37kHP/bSGnu5ejwB1wj1TdATWOarg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793009405;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=niELS6JRnslThgR0Pj7eeKqfPmjyBK1n52jf6VpJ/k8=;
	b=Pc0dPpfnnwdfVdlaUx342T2eURf36L+Z7cU7QJ9p/x/kMBFaz6g7p0cVDEl4QbANmvt7
	 N05v3AnqTb6J66lgVpvsi5OkM4hjl0OSZPrPufJUVcColcV5/005KMigzYRVZ4jGQyZAc
	 iFTceESSxfDuAqBXaDgmJTt0ONpVLmiriPypGkvQYtxnpySi34uqZ8nZNfue/nuLm6zXH
	 no7dOChUCkp13myzq7cBXC7CKrvedeVw8n8JN8zegA2hsSkgqjLFD4oLM4Jm+03mf8uEM
	 5mPQb1NK/WFTqtQI4Zqxm3Azo05OdTxkZMWH6yCjLM3HhIAsvcb5D+enBm7EF5Ihzsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AGBI+n4F;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 829CA60A2635
	for <platform-driver-x86@vger.kernel.org>; Mon, 26 Oct 2026 10:10:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 829CA60A2635
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AGBI+n4F
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3ab752f6244so2633689a91.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 26 Oct 2026 03:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793009405; x=1793614205; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=niELS6JRnslThgR0Pj7eeKqfPmjyBK1n52jf6VpJ/k8=;
        b=AGBI+n4FyqI0e7H1JI/OtOzxEDk30NE3utwQKNq4PfOTBiNpsUBjLSH8w7FDC/1pcm
         KwGM4CGOg8iyFFxYRGkoGecNUUkb3H3xVAr9POcBH0/Z1GEnSUHfd7tBJPqSqwNX08Jo
         3GlRU8wgDKCOZj1xWmDf6JKVJJSo6VPK5hxEkrptyM0Lpe12oT2BtdN7X7paG7UUAeBC
         PcAxRbbbAR9YcpmOdKPdlSlEAaYWJvHHoGqOqHv45YdDgnBNl9jUHuXwmhorUogoaw2B
         lmQ9yxqVJnQLQsMhWVEVNjWrI+wMatfd9HhitX3c057FmJmkkZcmYSkTeQZ4jPoWB+Sl
         KqUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793009405; x=1793614205;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=niELS6JRnslThgR0Pj7eeKqfPmjyBK1n52jf6VpJ/k8=;
        b=0pyLGAhTsnz5+EM0Wl2YoQML3Q0DJJnxSneD5yCTfiYbqyVa5Ww4oSoxlNW+7shM7h
         tl2Ey+hwwdchZ5D/4x005rWayu1FR4a+itpYdgUgBzoD5SiLrXUgKBpjWAKJ1k8863em
         OgKEOEzHUmw7t878IqPCPlVEkvIUFGS77Nzqb54ZgSMb0KJts8EUhO3x6VoVxl3219D3
         o8cpwnr41T7tseeZiwPtqY2Ta+vOxYdIYvF2Vk/H0UW08yCbJoQ1CDYE/43fojVopNit
         ZOj83T+8EBrfpuHOq7nMrZF8LeQNptWGiUe/0Fm6g9kT/gEk3FmHOkrTdTjXGFkejGJy
         bc5Q==
X-Forwarded-Encrypted: i=1; AKwUvBzUYPSDhFA8IAqydJhwrX3fEwJJV2UqSDxSn7DhmD+7ifznxBEHhhoS+tpmaP3/z7aCBD82xdismutQmdI40VEXv9mF@vger.kernel.org
X-Gm-Message-State: AFq9FYLUmEgnYizCmYrJu6BUjtWSoKZGUQxdp3J7EcJyamp3nQJj9k2p
	3p6jQdCAh0oqzfDBBHPCBFVvZCGVt9omCq/ivpwS6I2epiXPMi11lGvG
X-Gm-Gg: AYBFou1q0hj/J/+MegdCr4CIzKysIBnWyCe3BU86CvhOLaQXuvGPUa7ZX7vVIYJEmI/
	+N2PtbvFx6Od6D+Rp7chNU+Y/CJzvIeO9jaz5gg192dFiWE0JjVgPRYVGP8Ao7ka3YjcFkBAJeZ
	2hGswNcmecvM8L8q3njQkSin6GfAgiJoStmp1K8+CGtchQLJPVdOG8KYT/bDhwQs4XrNnjpzCbs
	74PyEjdA1mPOo0AqUHHsNGKWw+x57MrD2nzXzIBKulGK4kV3uQg29vFFVpd5IgxOcx9+474mRKc
	B9x+3S7zY1oJAH3NKBKjVdIV/8nyjnZ8u8ELd2eLKz1QtMNIcFiRMQUQBHxJuKt3Z8w5prHL6se
	e9lOqZqocVkqVvyWWBH2mOtpQpF/331EhCBXTuS7p6Y1/7fhKb7qUCDpMyyogEG6z8MZcfb2vIe
	EbK+BLoM0IqksLrwsxA8K6zRfI9dCbedb0Se0eFaVIL5ew3pc0wVavMEseYVg5ASax1xdEqtBAa
	89hhOlQ3QiBPRVoAptdKm6fdMGroWNOoMkR7A==
X-Received: by 2002:a17:90b:3f4c:b0:3ac:95d7:2fa5 with SMTP id 98e67ed59e1d1-3adeae7b904mr5397160a91.44.1793009404767;
        Mon, 26 Oct 2026 03:10:04 -0700 (PDT)
Received: from qby-nixos-laptop ([2a13:edc0:18:16f::a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9b1e52f3sm14586065ad.67.2026.10.26.03.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 03:10:04 -0700 (PDT)
From: Mingyou Chen <qby140326@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilya Gladyshev <ilya.gladyshev@linux.dev>
Cc: KentoNion <kento@kekto.ru>,
	platform-driver-x86@vger.kernel.org,
	ted eric <ericted8810@gmail.com>,
	Armin Wolf <W_Armin@gmx.de>,
	linux-kernel@vger.kernel.org,
	Chris Taraszka <chris@miget.com>,
	Matias Civadda <matias.civadda2342001@gmail.com>,
	=?UTF-8?q?=E9=AB=98=20=E4=BF=8A=E6=96=87?= <btx342@gmail.com>,
	powerfullz <wleizc7319@gmail.com>,
	=?UTF-8?q?=E5=AD=99=20=E8=AA=89=E9=93=AD?= <wolf109909@outlook.com>,
	=?UTF-8?q?Milo=C5=A1=20Vlku?= <vlku.milos.fun@gmail.com>,
	Rsplwe <i@rsplwe.com>,
	Bozhen Peng <bozhenpeng93@gmail.com>,
	Anton Karasev <uselessfire@gmail.com>,
	Jame Jao <jaojame6@gmail.com>,
	Serhiy Shliapuhin <shlyapugin@gmail.com>,
	Mingyou Chen <qby140326@gmail.com>
Subject: [PATCH v14 1/6] MAINTAINERS: Add maintainer entry of bitland-mifs-wmi driver
Date: Mon, 26 Oct 2026 18:09:22 +0800
Message-ID: <20261026100927.217643-2-qby140326@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261026100927.217643-1-qby140326@gmail.com>
References: <20261026100927.217643-1-qby140326@gmail.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a new maintainer entry for the bitland-mifs-wmi platform driver.

Signed-off-by: Mingyou Chen <qby140326@gmail.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 508912fb4e54..250c471e674d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23044,6 +23044,13 @@ L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 F:	drivers/platform/x86/redmi-wmi.c
 
+BITLAND LAPTOP DRIVER
+M:	Mingyou Chen <qby140326@gmail.com>
+M:	Ilya Gladyshev <ilya.gladyshev@linux.dev>
+L:	platform-driver-x86@vger.kernel.org
+S:	Maintained
+F:	drivers/platform/x86/bitland-mifs-wmi.c
+
 REDPINE WIRELESS DRIVER
 L:	linux-wireless@vger.kernel.org
 S:	Orphan
-- 
2.56.0

