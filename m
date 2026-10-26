Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793009424;
	b=5FjH/f+lvo2jLgz/ija159e/6zVpWGq/0oBPthIGz+wbwz5sm+vlmmQBia4plbnmwypp
	 S/KYgWYG659FN6oyHNnGu6eY1L/vwJm8v8YUJXRqU6XilLlVhoMHEa5XuCsOjLkav5HYi
	 /06hj04sqO8BN9/VNV7UDT/hMmcelJCBa/c+X7FMMGW6caHr85Vei3O4PphijZOlxhZWy
	 iPVqjWl43zBiD/P8fZLp9lbZVN/1toLVwobVYE8L2ClnpNWM05ZCsqppPGQ6C96u3xz4b
	 IKhTgAga+2tCOVY+0nXUGr1PmIpKT2V89m0nkwz7NvrHpkdAlCDqtgrfNP2IiVfB+3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793009424;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ekcPeRS4977QsjC9hWodQ7fRVCdNhWDisPpyBhUx7KM=;
	b=UavZkKM5aE1PBEKwVmejHPvR+FKbJ4vGDQOYQeykfUnmslBsjH3nnL9mG6hQr4AlQ371
	 c1LSkh8/ul6wESXPaxswTAWr6MusDgE/W74+4eorX3yvCRE8tlkcd3chvuHVJKR5q9l7W
	 OEnmmTQoTLMWvFMdMdBpAoFUIupBp63oIemOKK5XF8BvKD7/sXKfByKDrsNjh/B4hxhd8
	 aKY76w6RLNH47/X4Rh4hmKvQf9ypt0c3lYqAn7B9pQ9my6JmiZTxc6Nf2FNupl9DjigJj
	 +KbRKi3abiQ/Yu5jESVoI4Tr3vgjNtLRpp7TnuIFH80ahLshBAJAeukpP/Ynbu8jFww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WDGxZLls;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE424606A325
	for <platform-driver-x86@vger.kernel.org>; Mon, 26 Oct 2026 10:10:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE424606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WDGxZLls
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e7e742a2c7so18097085ad.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 26 Oct 2026 03:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793009423; x=1793614223; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ekcPeRS4977QsjC9hWodQ7fRVCdNhWDisPpyBhUx7KM=;
        b=WDGxZLlsMxzMuqGzQTfHAWtcnH9ux4wc1Uysxni8ZX3pMHRN9ivHckJrvPojNkrt88
         Ud2FEBpoE3oGpAdGsUtrGRhWLa5HoptvLVldlB7uOlcs7wdIqIY2gXB2UdaULaY9lHxH
         ql8w1auXunuElPvhLeSCiUftZtaPljGsaO+RB+Xzpo6wF95t1zk+WTq0U156Y5y4zPuT
         QoL9jcINwpZ0MyURazWwLRJVo1ME9fymbWQ77751ecTjHTWUXkRIudXm1DmpSoUrTJiK
         a0JqPhhJIivwMPDYfDKkZSc3hIJ8j9Fp7SKQMvEwMOYFuaEvf006Sie4DCEHnbiZubqK
         rTGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793009423; x=1793614223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ekcPeRS4977QsjC9hWodQ7fRVCdNhWDisPpyBhUx7KM=;
        b=ugIMT/hWYWvCoqogHKiGWFPvW7ZIaRaZmNObe4jjuOKgK0zX+0hYDP7t9mcFlpsXhP
         cWptAIK70ZaCLQskurDHZRUaugH/pkzSdlSQy/kPVqqfRpnkbGyNa0xcYjIMGk47sTKb
         E+9el7XhnKP+DlJvB07QUezBVb9Ln6c9P/aDF9Sg2iYBXwPb2dZmREC8VkOrR9oScBdS
         CRrh1CtyPfQP3k/NEj0XO8S+C/vkqOH+wmqabW4zew/yjWJRTxzhyaI3wS7tfiX5jkLm
         FXTK8mAcvzUO3w14ZpwaMLs/zeyyOyIy0rV+NRUO78TrmxRXq6GGoBtbSQ/KsIT2iI+h
         PAcQ==
X-Forwarded-Encrypted: i=1; AKwUvBz9CN7JycyH18DlJCddfAicqu8rXv7Q0hlcvcRFTCWSs/Fo+hLBStr8qNfvbdGSdX5mvZlcEnDxWWxfrMpR16zRYcmH@vger.kernel.org
X-Gm-Message-State: AFq9FYJvPlunW/zmGHInbwgY6y1WQmVJSaktXV0qCoSlmYlbjL5so1uN
	azzFfTaL9fM11FJ4Uxm15jtHoZHVIEUhFKKlFeK5xbIS8HUwPJzgRLRv
X-Gm-Gg: AYBFou0iaEP9rAAasn8Um6Q4KMArlKZS42HxJ69D2/tuvJ77I+4f6w6skHW3OBMEpy/
	+goarfmoUDhg6RYDgWgCd4vIhDUB3A/BiwR96sx24dpPi5W4EJv3LHObPWfr9RzAXKrDrZEgDlP
	yJa1LOtNrP5zQAIIknvswXeBANxDbgK+rPeQGPvdvdi+PtuY4XzTLYghSRrLDBDBNmU55/gPvoX
	NGcP9z5/6/AiBYxLz6m7lCvKEuMy0qi7gNypLEt0sTA4pJ+DRuRMxwtYuvikD7n7vm4P7JqAjG5
	eFX6n/Qma7CSP+6cZFMKY35Gjkk9TUGBsd6ek7kI29LG7jNxkLgtixelEHGU42OSohmTkzw7O3Y
	19lzxp/cfD/CMFB4a7i6SuT3ASA+GCOLGiIrds1NSapwFGO/pd+P899GPI984NBVZl5e3r6d1nG
	Fo5E4ip5YdNGL58cRxODNfQ+zQZ2rdHdhVi80iyaAdfptc7F/m6kw6HXbsi88Ecm2MuEoqElwSB
	33ItDf2FdlrLKt7RJ8xgy6Ea+/kHjcLYfkRSxQkRPHzaFRwH7rvlM5p0Ik=
X-Received: by 2002:a17:902:ec90:b0:2dd:c053:b9cb with SMTP id d9443c01a7336-2ea9cc455c1mr37566465ad.28.1793009422685;
        Mon, 26 Oct 2026 03:10:22 -0700 (PDT)
Received: from qby-nixos-laptop ([2a13:edc0:18:16f::a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9b1e52f3sm14586065ad.67.2026.10.26.03.10.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 03:10:21 -0700 (PDT)
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
Date: Mon, 26 Oct 2026 18:09:24 +0800
Message-ID: <20261026100927.217643-4-qby140326@gmail.com>
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

