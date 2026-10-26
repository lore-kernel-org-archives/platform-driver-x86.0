Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793010102;
	b=fLrIpdh57sg9bh8xG+inf2AOKC7Hr4vPCkQufwsKWBzjF2K3Hd5CRKLAN5y/LfRqGnOa
	 BU8+HXAJopWvonBjtIA2Z3Ftwk60qSz6l1LHMCohiTFWvea2RNYK8nByyghJWmSyYqyOa
	 /9GrJJyGNXqqql4T0br3tJV6L1dFZoAeWb4ZpWH8MIdHXqgKQKhgyQqFIF8G3pI0jQEH6
	 4L0GHwpexz0sga7aGycOSSzm6EG739LRyCmzCtA6BV/mk5/dl8v5fFapfAkqYvWGPlNb+
	 KQ60NbNFjKSwur0b85n3fvIt4ng2tdYL0+SKiltasVIip+ewY2/ndQ+BFfL1ibuRRZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793010102;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ekcPeRS4977QsjC9hWodQ7fRVCdNhWDisPpyBhUx7KM=;
	b=PnjEXfr5BTrMLMpGmqYQ7x9dbdDMPSc2h2t5T6pavfsnFCilQzySe/TRiB+OLeiiAIMi
	 xVaUIMtRoap8svyLIZa5Sx+umQ40fTcKSW0lUihCVONGXfpCk8LHYpBXL6iBPtpSKfm/q
	 otSwj6R+g/ZpO2DwsyoQcyLVytIH6J0rIsEtJty6d7w2HTQGXCk3H8QeTiCsp9lfQT6k3
	 dWj8H4Y4RJx+IyEh/WrHOdEhuDYWc8StCbJVndC/J2I3q5hZgpmf2LutvGistm6PtVXCV
	 YDF6XIwxZvBmOBGQdY46tT0zaDrNvDJ1H8xdqwk3lhZACaTbH6PpGOxyjL/x8ApfNWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Y+QqoQaH;
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6170606A31A
	for <platform-driver-x86@vger.kernel.org>; Mon, 26 Oct 2026 10:21:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6170606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Y+QqoQaH
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cc4be0e5351so860417a12.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 26 Oct 2026 03:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793010101; x=1793614901; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ekcPeRS4977QsjC9hWodQ7fRVCdNhWDisPpyBhUx7KM=;
        b=Y+QqoQaHWvndyk0v1/pT2GKi0Y6qxMVWpgSyu2oQhIN90TZtTS0S1k/bRYTXcXYlAQ
         GJXg2sNLycOPe4g2EVKV3IsDuxcuXlC+LLSzHzkim7MpAho+BMmieczDvo4UDbTGjWkX
         JUm+7ImRQrbL+mn0t95PeXMU5LYlp0FRd2+S0ngFWGD1xCCFWtz2Nse0XsJ38Xo8Qk/y
         nxyxMn1Kih1OJsRKbDqhWRc0gqCVZsQe4/9CiEnJPFj3XyV+vh1lMyrLTKfggXaRM5yh
         V4L/4RGqM8Jh/OhhbjPUHD21vaV6rBxntBgQFpqmBtA4JXeP2TFvLbWKzf+X8HwBc8u4
         PPTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793010101; x=1793614901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ekcPeRS4977QsjC9hWodQ7fRVCdNhWDisPpyBhUx7KM=;
        b=RBkSndSxLuE4oaAZwURVpeOZndK5LDoa2fWgEaNxOdTe28lXZU8LYeYAaWKF9f8Nkw
         sacxAU7Qz/VwXmm/JNvFs3f7alRf/g/nT1xhUnMe9SLhSj4swb49K9aeE3Q92we9oS/T
         UfS9y7AJ7GNewwT0h7Gpdgc/o8XlFOx3vYJ2NPol7vMAbBvvi/pIZuUdcZFmkXxiDSDZ
         aO651QB6keQJAVIYE1chi+iHJTKte47DXSlwRDEpxK6qaqB6isU/QIWjnsFPhxHrcD7J
         7zpL1V9AtwtGnzJEUkYx35DThAW7VAhUtx99dPhRGdmppQ7rEa8Uo62Zup6b8byBJQ7E
         3G+w==
X-Forwarded-Encrypted: i=1; AKwUvBxEhHrZje55jgDIGIgkEuErqMHpickKfMXOCMbgn8fLneNycaqrSFkSGE+ESHgoqTl0KsyBrJG+GBtsceIdscQs66nZ@vger.kernel.org
X-Gm-Message-State: AFq9FYKlzxrki9Hzc9zCY4TtaS1MDnPbv6FqofgXFj4FbLLuM8b1QEKd
	S7dL4r4IuhCPaS52FeneiXJ7RwzioAw+HkqD/w6HoESMc3gRE/QCIy2t
X-Gm-Gg: AYBFou33if87FolruSHRfz9sMAsVTjSLLvZXorFHWDVlkxa++ZA0huIIhcV/GS0Ythf
	IQK5A2/c4AMCqK1XxzmajIWUDzxk7E6wDJpRyCwIUU6f8QRDyQRhRHSmlxIzMbCtMw+GQqa3Dut
	TVK0GcYeqYqE1q6Kq8MC9WB9znUC9aQ+czyv4s5Dgqu5B/EY15yDEqZRiENNbaImAg4q1YGOySt
	F8NP6exO7NUiFdqCXuOxbjqdWJyxgFx2wWQWbk0R2OMq1OVYfotrxwF4k15lcoy6iE43FU4zgeu
	MVePYQHqtcxSpQDyrHdkr9lBi10k/RSM+gs0pb32anoOS8x6f9V4jfXZRWPl8obOpf6QTbeBg4o
	jQ7t3PB1GUbiJKm5lRvq4oGgO7QOd7wVeufMC+B5SA6irD8DevWD6SGufW++ZlGYYqBZNhP8Lmz
	6jgEojB/24bKd6ZZo1zr5SWNBR8QpBhhJv183A3DMKRsR9h+I+k6dwNE8VZx/XNe05RXUW5CObF
	Q9P8nm+eExyLGMgNLZdzPXhxdHGnLuBdBi9mQ==
X-Received: by 2002:a17:90b:4d8c:b0:3ac:a521:95e with SMTP id 98e67ed59e1d1-3adead4f7ebmr5516241a91.47.1793010101173;
        Mon, 26 Oct 2026 03:21:41 -0700 (PDT)
Received: from qby-nixos-laptop ([2a13:edc0:18:16f::a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebe6af0dsm7877467a91.5.2026.10.26.03.21.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 03:21:40 -0700 (PDT)
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
Subject: [PATCH v14 3/6] platform/x86: bitland-mifs-wmi: Add Redmi mic-mute key entries
Date: Mon, 26 Oct 2026 18:20:58 +0800
Message-ID: <20261026102101.224568-4-qby140326@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261026102101.224568-1-qby140326@gmail.com>
References: <20261026102101.224568-1-qby140326@gmail.com>
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

