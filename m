Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 875C326B95B
	for <platform-driver-x86@vger.kernel.org>; Mon, 12 Oct 2026 13:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791812313; cv=none; b=CYytNoKiqzT6f6uhZL7uBdgvm6rlJLaAj04cghf/ae3XpSo9w7VYCii8IKcBNg7kxLi4Wdm1XCEPh2BZP8LCg0IeBAmis8TxxyZTCqXORVdy0i9Io49xWP2BEosPy/nqYfPKO6ZjiIgDTnYhWtdAbeWnGTeVYbutguN1ygEjQ8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791812313; c=relaxed/simple;
	bh=UMUdaa+RTFUQlwy3L1sCKtcHUGO/pFl9CpT6NAu3gTo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iaoyGL1oblHn1u55fEdpyRTyi9/m/MUA3mPGM6Ok/tBUs/EacWpZn5DD80Rrc392+bih/2s8Ud5M7bNqZG/juBx82CHlPtxQILoA+baZwWtvLCUD2GVnga47DPpajCya8Fwt2vNCJtYr8J3BQxYHGBNhF1jrHu9WQ5pfkcUnSiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=brF+DncF; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="brF+DncF"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-38ec1402b05so750424a91.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 12 Oct 2026 06:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791812312; x=1792417112; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AUv+kYCkn2tEB0Tn+6YkUtBsv1Njui8yJ55CrlwNiNM=;
        b=brF+DncFNHmIL1cNrcK/rUmpj/grBlL1LJulqrjm7D/tTPI374r1eLKTUZu2zlDcoy
         5S44qpj9nvRaDhZsLVJMMy6PQQ+3oK3kmORWE28ssz37a7dsFNp081w0imdTJ6AiEXpe
         FP1aFf4rAfxfVxwJshqEHZunbwnsq97OR8xFEecGTB3USh/+5b8ZApSbWDR5h5hyBYTx
         h3sPcJHbHjNd6cZMfaTVTJFonL7rEFQjCfnc2r84fM1g20djRrj6K41usswHIBwoomcT
         Aq9x2WGxJ7VVTf2knHEiz2RhpFl6eA0Z17QPAgKNLtoSMvPC/Hlp4FjGaFVSYK3B3W4Y
         igbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791812312; x=1792417112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AUv+kYCkn2tEB0Tn+6YkUtBsv1Njui8yJ55CrlwNiNM=;
        b=1EgMO0vVg0quLN7X8A6ca0AMi+Rrh+K8THWNLEyqbHcZMZ5fnbQBW7ErzTmB2xfIs3
         fUpUsMonMygEusS4nMZT50olEK1xgz/pi62VUEeuydoDOYYenHkm859nNdgH7uajGsN+
         oBIGSJDL0OUuO6J4BKm6bZBovJvDIFacwNlaXZfgtFcsbGZF/k1Meqo4rc4/u/lVE7AL
         INL6rLTp4KgkgyPhH2pz0GTMDItDMhl5+5AaXp5U4/FQpoNEyBL4bFkmN98GSz8ltgik
         Op2QlWNUzJAp9J6TEZsdV7fwGAriAuuGBOzkUsIFujFyi6PJiZB6KsafLglArMof+cSR
         asFA==
X-Forwarded-Encrypted: i=1; AKwUvByK8+0YhqunX/TxoM+A5oxj7k4psusP9qQEAK6D+avXEgovZUEUV7W4TqTmYLgx3AGs7aBk0UwdWo+5rNeVuN9bgs5g@vger.kernel.org
X-Gm-Message-State: AFq9FYLs6KTlocCCDRmMMDuD/5OSf6AdVGH6ewNM51jfeoGAsPiAi4s3
	fWhWJWeOUhiezZQ5mjq4nE+ybsgBLPsRyUyzQO3uc0nm0aps954Hyyiw
X-Gm-Gg: AYBFou3r8If+5dKucHlbSz+VMMX57gmvaduwGBScARA8A5V/yni6J7JFVvlrJVB+ChK
	eZ2SCGkMGXEUy4k171kKxP7H4wzQJVD+asQBKTnbCgDABOFa6Vcwa7q3DrkK9d0X6HJIcYPcVsx
	zzwkVzbgjA/JyX/GhIIOn+hyuaBj6iYdXafjrRHm1a3moLAZNpgqgx4kJ5HaiPnanaN13YrmPA6
	ZfEUYlK2lGjzFtRg2KNnvM7w2d7FI26lguuKeLHCEm48Ts5QCiz67PUxgUowyu+s9MQ6FARqADQ
	c+Ci18xrHXuC24KXYKZlWqCOPk0kE88x+KIVDsfQRyXKPhj9mhqrMy/rqvDmH4608LItpvq9Evn
	xI7Uhqx3so5covPvYwKOsFiOYxWiWGMSZlGiw7RfxEd80sebCmPTrcqbpk1AVBnmpts4eC9QqsT
	32ri/1BKyVE71TI8ynn7/Bw4F53DyHJkW+alQn/qkMqYYitzixhE3uyuShUBFu9HJXlLSkvR4=
X-Received: by 2002:a17:90a:d2c7:b0:3ab:2d17:51c5 with SMTP id 98e67ed59e1d1-3ab3a32d9b3mr7681545a91.6.1791812311914;
        Mon, 12 Oct 2026 06:38:31 -0700 (PDT)
Received: from qby-nixos-laptop ([20.89.137.63])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab50ce9d98sm14534878a91.9.2026.10.12.06.38.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 06:38:31 -0700 (PDT)
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
	Mingyou Chen <qby140326@gmail.com>,
	Nika Krasnova <nika@nikableh.moe>
Subject: [PATCH v12 3/6] platform/x86: bitland-mifs-wmi: Add Redmi mic-mute key entries
Date: Mon, 12 Oct 2026 21:36:45 +0800
Message-ID: <20261012133648.132363-4-qby140326@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261012133648.132363-1-qby140326@gmail.com>
References: <20261012133648.132363-1-qby140326@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
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
index e240ab733ff1..38843d389827 100644
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
@@ -637,6 +637,10 @@ static const struct key_entry bitland_mifs_wmi_keymap[] = {
 	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_SWITCHVIDEOMODE, 0, 0), { KEY_SWITCHVIDEOMODE } },
 	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_REFRESH_RATE, 0, 0), { KEY_REFRESH_RATE_TOGGLE } },
 
+	/* Mic-mute key */
+	{ KE_KEY,    BI_HOTKEY_CODE(WMI_EVENT_MIC_MUTE, 0, 0), { KEY_MICMUTE } },
+	{ KE_KEY,    BI_HOTKEY_CODE(WMI_EVENT_MIC_MUTE, 1, 0), { KEY_MICMUTE } },
+
 	/* AI button has code for each position */
 	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_FN_5, 1, 0), { KEY_ASSISTANT } },
 
-- 
2.55.0

