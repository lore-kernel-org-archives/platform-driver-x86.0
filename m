Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794406406;
	b=egBPYCWr3QEEmWcXONbhhEWygwiIV489uMc9ibCG9SNeXBnSVQqWnwoyzCFRwDuFRntb
	 fLb5JkzVyRlILnl9PT/EUPkbnJfoNu11bAGZVHDwna6oAxYon8eBfhTXMAGw0VmyMX+BE
	 9fBy+QMVanLL42AlJQvuRNLRnOeWsz+h5hGD+S8R/5TArbU5SFi4HnGHnfuEi2RoJ7g4w
	 VXTTmxSchmjkWFrq/cMJYoidwAlDzSYmxrxpsNW/ij6MfQgNae9+H7K93SuccdT3t9yFw
	 Guvn9aAQJG87P8ZWgvLb1SudJIwWbLRiYHRS/DwpgCbHu5U5rPPoGiDrGqtFjAiqaSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794406406;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=oO8bzIPeevhw5WYdeSgRvpgMT/FxpDOZ2PUW72UZblw=;
	b=FlY4Zx1LzNsMvWl9n15nsToEa0MpsPl8RnJTQgzfvf6KXy0kdVEJOG32bZOj0seiWiIb
	 C+C5Ku8sG4xFQbMZR1C1HSYUvGAKJy+5CwI+4ve2/8UmAI4kFE/uxRanQAPvxgGKCQ/Em
	 HMVdXotTWGkDmtS5i7JRThc+xrm3TGGkxr/asWbPN5wB0B2/NzQhDptBx20JRAvKA0hJ6
	 bkttoYCISaV6ps3Bi1lZEiqeVeBpIqE7me6C8j2cdOM8WUwKKX8gBs6wFmkC0FW+jTsUg
	 LH8AWZPpN+NHljwv6nkHvrGOOcKMmuhoPIGP9IeXjD37xptk8yezY7haT5x8H+d2VyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E7Hipcsw;
	arc=none smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F0B2606A88A
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Nov 2026 14:13:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F0B2606A88A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E7Hipcsw
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cdb75699c7cso1332172a12.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 11 Nov 2026 06:13:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794406406; x=1795011206; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oO8bzIPeevhw5WYdeSgRvpgMT/FxpDOZ2PUW72UZblw=;
        b=E7HipcswdfbRiy0VHFux3K1DgUnTdbfMIxMCi3RCrpi79Zni5z/Kt9HcoX8Bc/VBrO
         lsh2hN1b5yquu8crVIAWhnvhmoQ6JtQl0Ab9vmc1mBOhonxk/9laRmXTTXmhLFtXgHMx
         yUYg/j0NRC5hNC6/NeG857hJ4dDmbWekdgeAV3SqOGTEwit/b77cUPwHX/KZjsapN1CB
         zUPK/l8tu4q3P+oBv1/acMIbGF0uoGa7kHBruVhP5TfDqbHeqC7B5lgVDSPXCGljPutU
         tQDxO5JGwamNO1mjx+2+yMSmGa6Lsyd/GDtafsC1403qpSU4OdWL468Y1v6JUudfZc9k
         SB1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794406406; x=1795011206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oO8bzIPeevhw5WYdeSgRvpgMT/FxpDOZ2PUW72UZblw=;
        b=ogII3ySho90b92D+vLzTYMA7CNZhe3z8LVNqozruoW6zX79PSGEAALXoFQH253mNWT
         kWLADY9J+5w1eFgosp2RsO2a4ORCetSXsYinPo+mZVF5ojBS6nX26xn+QTu+1vA03x3y
         IwBGhnSXX31DdxOZWl8M7pa4XvkzTfpBDu24M5gR8nZrNsDiGCwUEEsdWln34mRaTFk2
         eUpXeAgoiT07KrRybkEyYObwV7ykJLPZ+FLCisYGa9tUMhP7r29Z0aMTmbGgSUrFaFSm
         yJq5tCGg1cQiVjcGoq2YCLrpkIu4xY04GVilu3jgGKFZ3fgW6ag4cDBZQydgHhE2f38l
         WGSw==
X-Forwarded-Encrypted: i=1; AL+hErFWdyEaJ7eUSZS/V9JayksQVTvxDRnVq/hfuWrZy7zeDpE6AWQ3g6wKJR7TimpWFsO1U03CVK9axOqFTG6wOHeeUjye@vger.kernel.org
X-Gm-Message-State: APuU4Z8rYsechxfeAhNE1RNB54hOtwYGp9Znb2U6Yujm/Xn2QsJCqzxz
	LrlMSV2iqtGy5JtE9KCkvIGQdOKIKMrfoZdcBpIhDbfyZtfggBCNBLnV
X-Gm-Gg: AYBFou1wQO79QBCtKAnpZS7zvvhK9H60jGQG4ZDanR8br6+l5w80dSAjNCLGd8YCDJu
	YbP0+jlQGhXSJLzesBcyRecTKOflgNxFrVNJ6MKxPmmLWvHI+sJ9s5RvzppEID+ipYgx7FvYKHz
	LSbP/KQmvnMEcExFigTbdgBn+wXUvHwQu1GM3W02Rrs7ywWb8G73WG4tjgLeQYhAxz/dDihGHop
	iDOChfLfeleyBURVw/wK4QEK9rdyfbHkAufEwVn8AcnpBYdyl64oXZrYtAe2Wjx1u9PLHtJRHPg
	WYNp5R1I9arNfC/4Wqp5KJbdySq4h/HPqaO0U9kbRRdvPR4fKNR0DgzEukLY+ExeY21r8B6fxvt
	Jtza1G+DQvmf+tn1tXIilVHF51H1o80ppcJy9vjGqQt83kODDVDU6lzlsFiSeLl+808+uo0WO5R
	Gqd70wljz6yRZj0N9Js7RD1JTPPgszGn9F/L2Nr0aMduEFclRf16dyjmvubT1F6KNGeUtBJxzAr
	E6JfeBmms1hlHqVRsRNZWDesF/ptHYMFSvxr4W6uOpZmXDLZxFLLdfXhQrzUgSAe53QBwPnq7l9
	g1I=
X-Received: by 2002:a17:90b:1a88:b0:3ac:aa8d:19f2 with SMTP id 98e67ed59e1d1-3b182f6a75bmr2507396a91.62.1794406405675;
        Wed, 11 Nov 2026 06:13:25 -0800 (PST)
Received: from qby-laptop ([2a13:edc0:18:16f::a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17db319bdsm4789970a91.6.2026.11.11.06.13.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 06:13:24 -0800 (PST)
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
	okluar <okluar@gmail.com>,
	Mingyou Chen <qby140326@gmail.com>,
	Nika Krasnova <nika@nikableh.moe>
Subject: [PATCH v16 3/6] platform/x86: bitland-mifs-wmi: Add Redmi mic-mute key entries
Date: Wed, 11 Nov 2026 22:12:23 +0800
Message-ID: <20261111141226.9482-4-qby140326@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111141226.9482-1-qby140326@gmail.com>
References: <20261111141226.9482-1-qby140326@gmail.com>
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
index 013e19395d71..1f7f2fd5ce5f 100644
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

