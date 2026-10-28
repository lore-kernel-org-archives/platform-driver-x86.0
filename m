Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793186901;
	b=pMPvp8XeOCbxeTiSlEFRiKaIe/NBWn7JOmwayFJ5pWO3VWvRGyjVXqki2+GEQw4hSWD4
	 sd5yVW7GQqMyv/ZQJHRXjIWNzMEcGvDmpvYE0eYCk4p2fjOcylY6tD+vnDr/q3Ymiafwo
	 zjPSO4VmbtDZcNvAeUJ+LN05EofGNJajDrmBjsPyyyksShj65Y/38HciwThMmAyxh6kZu
	 ZwO2jKJxIGDy7sCCeOvSAvi/GXivjWbdxM9W+MP8S1Tm1Q34l7UO2ovQXb/+//0FyNsKL
	 fXrkZEMhAA3r16D0soKfTf/hPziCMtAkwWYT6GTPQn10aPeUFzIgJDTpE6aOE9weAEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793186901;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ekcPeRS4977QsjC9hWodQ7fRVCdNhWDisPpyBhUx7KM=;
	b=Tdijd5wuCK7mddiipqCTbqSRudxwq6GgyhIg+q1WFuS4ae55FrZnwzs6oKFNzeOZcvEM
	 qL8+aLYOjgb4iZSNHxu7u/NxYVXiqSr2lzQqk6xCT/0Aup0o6VeiF6iEeuNvILqQQoE6D
	 Ol/ygc6kOWKIvWJcGO0Q5sNBvydv/DB8McODa+AtdLtX2sN66Sc4AYZIjMbMct5ULu4Tc
	 ZicQa+0teWXKzuBP0IqSwgD8hya/q5r+x/p9QD7hvhaExZ5KL7VzhiTyJLVplyKu0vZS6
	 RAsaCsRRh6XsttUeWnO5TifGJXZsuA+j2y/O5l7hUYODca/wu9M/pOCDtO92K3edmzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="B/SE6aOf";
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B2FD60A2612
	for <platform-driver-x86@vger.kernel.org>; Wed, 28 Oct 2026 11:28:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B2FD60A2612
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B/SE6aOf
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2e985106c0cso6945095ad.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 28 Oct 2026 04:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793186900; x=1793791700; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ekcPeRS4977QsjC9hWodQ7fRVCdNhWDisPpyBhUx7KM=;
        b=B/SE6aOfvk2sT9M4z6LeHHldaHp1jPEIphlBmUxuu/A9m4dJDSF4b+hZCcE01O+Gt6
         Y/inpP8vP566W31hVmfBThGPSCaSRI3CSyQpgIyKrh0HuBczRQsfV1NPxQTw+emWI9x3
         06clqoudzQVsuMpBPMO/bZ5zxSzEe7YL2lwtfC+iZoiySx07wDiyznzf9pGiBU46nWqx
         lh9Z9qvJWyQ1olNtdnYiOY+n84g3UJnjWRAPUlho8XCP5dynDky/s97ZMq5qrgl7kcas
         q27RDSwvNqWofR6pgszYTbbpWSz9/wM4ntKimQU4nyE/7eJ+gFbPnKuavGkycs1kbP8u
         uFmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793186900; x=1793791700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ekcPeRS4977QsjC9hWodQ7fRVCdNhWDisPpyBhUx7KM=;
        b=xjIDSUCSfcwcP4ovdQ+DQHRn32gijslYVvsooSRMNVhTAY0Wicb4V/LacapHGFOji2
         pynMBAOxP1XQrhSRD3O0o/6LYWgcZQfUG6buHGdhyqN2YE7ANL5rZgZZCBP4adAoaUkt
         o+dBcP2sZudFrhLs14iLVFOYzGTXgf7PC0DsMj3ZpkUvFnGPbzdd++uHr6/vz4ZByYQv
         CvSjE4s7/2Kw/gvaLGpxu3lvl+yNvRO040jlFX/IdKaVn+OXVtQ9wM2Uz7nRClRrXFOb
         OurpyHixC540I1SU41TGMO3ZZ54f3VVJPC5YZR77ANXPLalUbxuPUqaMqPIdktiTqx33
         +iyw==
X-Forwarded-Encrypted: i=1; AKwUvBxrRcFwB6ePWMm4XzeRURQ6inWM7UpDwUuwiDQ39tb7s2J1+C4aeV9ogFdoM8+ByRt61r7XvM8DxyeyVN5Io2RAnTM4@vger.kernel.org
X-Gm-Message-State: AFq9FYIC4/EGy0Gr2HWuOO/A1VHM4G4IMljkOwNC1hJaz9u2o5U0OHSj
	x7B20gUYey5OfV5ZSwrkOA0vMF6FoEiGpERGBeFyeQ7YdJDY+AHKIYdF
X-Gm-Gg: AYBFou08SmCZQL+iLhkIUasaUkGIH8TbbUYZCmEZZEDfLScCvaRET064ALnNaUFggsJ
	EvIv/Yhoopjgt8qTOeRRS+ckixXl6MOiPMAJlYsrCwnrAul4K6BDOiwAqZgN2XOIeXugAI6gG/8
	L9HaDj1aOMT+G02p4LvKjGfh0mQZ5qdnhBK0iNeBKwSce1l8QycbxxSbmZKgjslozeShF79Igxi
	mjDXgN7YM8QjHqHsU59/jDSCgg/Ng0hO9r4HGDJBYJFLA7M1/95V3J6MT7Aq/eTj2MlSG+zJSKz
	pLIbICh1wSD9vhy5ji4Lj6i9lQ3tsRSNBBOYUpXmV8QDdM7GmshyAHNhQe7X2Tlr/BkJlcAEocP
	ipl4aT7M0iSCGR2au0rv2Wh269RDoGlPfKtbPhOCEvggs6AkmeQxZjWfIqecoLxGUiWh78HDI95
	Uc88IK3jl54zcyQcvq86P55ef1Xxoiws9cCJEuRR4KhqWEgNIhj5CqgNqHI6h7ZDo3PY3z9D4ic
	8rNe4cJHcVbqPot+fCkX4uxXTtH2POn4X5xymcPb13wHTDcOIMe4fNhkSv6zv5pbPMQU1NP07f3
	KZ0+BJR6mCQ=
X-Received: by 2002:a17:902:da8a:b0:2e2:c283:354f with SMTP id d9443c01a7336-2eb00500729mr19777295ad.28.1793186900466;
        Wed, 28 Oct 2026 04:28:20 -0700 (PDT)
Received: from qby-nixos-laptop ([2a13:edc0:18:16f::a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6b76dafsm20128745ad.18.2026.10.28.04.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 04:28:19 -0700 (PDT)
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
	Mingyou Chen <qby140326@gmail.com>,
	Nika Krasnova <nika@nikableh.moe>
Subject: [PATCH v15 3/6] platform/x86: bitland-mifs-wmi: Add Redmi mic-mute key entries
Date: Wed, 28 Oct 2026 11:27:39 +0000
Message-ID: <20261028112742.674847-4-qby140326@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028112742.674847-1-qby140326@gmail.com>
References: <20261028112742.674847-1-qby140326@gmail.com>
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

Add the missing Redmibook mic-mute hotkey definitions to the shared
sparse keymap table:
- 0x00002101
- 0x00012101

Reported-by: Nika Krasnova <nika@nikableh.moe>
Link:
https://lore.kernel.org/platform-driver-x86/20260531123345.237521-1-nika@nikableh.moe/
Signed-off-by: Mingyou Chen <qby140326@gmail.com>
---
 drivers/platform/x86/bitland-mifs-wmi.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
index 9afa2e2764b0..0d7815c2faf9 100644
--- a/drivers/platform/x86/bitland-mifs-wmi.c
+++ b/drivers/platform/x86/bitland-mifs-wmi.c
@@ -111,7 +111,7 @@ enum bitland_mifs_event_id {
 	WMI_EVENT_CPU_FAN_SPEED		= 26,
 	WMI_EVENT_CONFIG		= 27,
 	WMI_EVENT_GPU_FAN_SPEED		= 32,
-	WMI_EVENT_WIN_KEY_LOCK		= 33,
+	WMI_EVENT_MIC_MUTE		= 33,
 	WMI_EVENT_RESERVED_23		= 34,
 	WMI_EVENT_OPEN_APP		= 35,
 };
@@ -636,6 +636,10 @@ static const struct key_entry bitland_mifs_wmi_keymap[] = {
 	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_SWITCHVIDEOMODE, 0, 0), { KEY_SWITCHVIDEOMODE } },
 	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_REFRESH_RATE, 0, 0), { KEY_REFRESH_RATE_TOGGLE } },
 
+	/* Mic-mute key */
+	{ KE_KEY,    BI_HOTKEY_CODE(WMI_EVENT_MIC_MUTE, 0, 0), { KEY_MICMUTE } },
+	{ KE_KEY,    BI_HOTKEY_CODE(WMI_EVENT_MIC_MUTE, 1, 0), { KEY_MICMUTE } },
+
 	/* AI button has code for each position */
 	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_FN_5, 1, 0), { KEY_ASSISTANT } },
 
-- 
2.56.0

