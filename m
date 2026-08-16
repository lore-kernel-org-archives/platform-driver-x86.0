Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 509D537C108
	for <platform-driver-x86@vger.kernel.org>; Sun, 16 Aug 2026 00:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786839147; cv=none; b=R+eXjTuallyTfQX4Uj1xKaxj4n0wjl6LcGzEufQqTAVtbom2gLIOs2LX0gcuqCRjVT4avF/poP4vjkQcGwLi1G5f/Mqj6pYWw5yOeBqH9/bc5XeNQNW+oOPSSosqXLb84OJ7A35q1HsnJWpZCtUPlBYt1uZeelGTgTkw6xcfpPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786839147; c=relaxed/simple;
	bh=fCV+2yJC4cZrnJl1H1PmJvR+PHD59988Urbd1y2vbjM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AjzKlSBd9MSMaeLmujY9w4ZVy7nNvJyRKZ/UKDIkpTBZ0GvgAbkPqWptlPgfFNOfbvYWAZwsXPNb6GPdnjVawo9pVdwTESwA/kTkWa7CAe+1MmLqB3TgbOMvkJHFwtsXoGRi73pXcZUAIZqQHb+KGOgu4+rQ7dvTF6LEqipegqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hv/Guei+; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hv/Guei+"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-381c51fde6bso2728137a91.2
        for <platform-driver-x86@vger.kernel.org>; Sat, 15 Aug 2026 17:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786839143; x=1787443943; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TFReB0FpblksjxyfEVt8Xa+UaQs+LIPFGRM0Eqvgr6U=;
        b=Hv/Guei+fXxGRZsHvVnwGlcyiFpRJQXSyCcN/Dr6G1Tla4qL5qKuUUU9r302S7LB5A
         xzmQ4tHDTBWucKOIP6mo4QUNgxaPeNEcLrfAqmUZd5Gynekl6oDGKuyMhvtw2lPKwCdQ
         0BaiiYGh15d7M3MonOwN7iOe2I9WrPIx/eFvxQ1TDDqrE2sfuR6mLexlOLmmk4xZioJh
         l/vZ/ugGlcZu0MBBpeWwX4GzQ5HJmmKMkyWAKP/tr2cQL1vfCBRkFkVRwLqcdTpBksr6
         h5k/DOoGQXHV+pS88lsmmmWfd6yX6xq7DLXWJAny5aRQa4ABx2gXtmVVuSOyz7gmKDCN
         DcLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786839143; x=1787443943;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TFReB0FpblksjxyfEVt8Xa+UaQs+LIPFGRM0Eqvgr6U=;
        b=W5jgCSOU0+pHBlOsbfPfLolQR+QIbVp6zA+LPAqYf2Ql4FSw6xz73hyBlOZAQCQwAk
         62AvMfC5V+5UCLtRYe2yVu5YzH4SC0EurvTFo59Q9navLZ9Hz+c9RXOR6eSK6r4HH8Ig
         Sxmz5cA4MO4EIyh0jS+b2MWBYoaxTaxjGhrDsUEDnZNrf5yeR0zIj/618T+4qN01M9oF
         KR10XoXcxH1waOnUObENguY5my1adES+LHCZX0Ecksx1NLzrGOaQeH757+dB+mXKsr9t
         oLl/aSAz7zYXTS0TB20ZDmRFKYxHaCzk7+WN7O6IhoPkE+OubVnZjV6P33qFpyJN+Ngf
         A0QA==
X-Forwarded-Encrypted: i=1; AHgh+Rokl+g3afweJgxvblLkLvzvmGWTRipz2C4O67NR868PbJtNtsIxqBzA3I72dUU3tM57fzk1l+4fJYiPs6NCnmVP2ajx@vger.kernel.org
X-Gm-Message-State: AOJu0YwFhsqadKMk4/P/byMkvCJBdoE0nwtJX4z91NIePtQVg0DuWAt6
	/ukFdqi7292wN1fYKgeiNZ0yoKHvlhO7qEXmcrPWZAeAG7KeUeT/9EM/
X-Gm-Gg: AR+sD12/I26+PuDS0KgctAwknMUexX4U4/8n3GH5HWqYOaGowh9y8SAj+ie9pbVahNX
	m5DI5W9aKnyiIGaldCc3okddwmxtOMzuxiHognCvB7pc5p65pQrdxnlrxos0eSaUtkPEcckMVrF
	p2L8ZArJMF7FcT12/sOSALXAaKwqxOOVUg7MAvhns+g4xqhGRGwkQcTWJeeeXpDBECc3YPvATDR
	DHSC8TwLH03XBi7yiC8qARoa0fv5H7xnaq97phDmOuiyY6GC1hZG71AVdasgW2NXsNAvhWIzPDN
	pX1kOO4Cf/2oA+UBWuVl4lgalPXdo31dHQT8qYIiRtAN4l9lTJISL+en7EPiBHnZ7Dy2bgmcC+H
	iQt3SicH1CanTOOwIP518hlBcVm9pbRUPeZe9/3LZ/yMmDoxMdeQcMey/YtC1WxpLXSxsVX2diq
	gWrHOXN+i3wC54dgNy5aSjDRxEn9zJpHvqKkY=
X-Received: by 2002:a17:90b:4d08:b0:37f:c22a:c188 with SMTP id 98e67ed59e1d1-3933b6f0622mr16027893a91.4.1786839142688;
        Sat, 15 Aug 2026 17:12:22 -0700 (PDT)
Received: from qby-laptop ([2a13:edc0:18:16f::a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-394ea96c87bsm7409320a91.4.2026.08.15.17.12.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 17:12:22 -0700 (PDT)
From: Mingyou Chen <qby140326@gmail.com>
To: qby140326@gmail.com
Cc: W_Armin@gmx.de,
	foxido@foxido.dev,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	linux-kernel@vger.kernel.org,
	nika@nikableh.moe,
	platform-driver-x86@vger.kernel.org,
	vlku.milos.fun@gmail.com,
	i@rsplwe.com,
	wolf109909@outlook.com
Subject: [PATCH v4 3/6] platform/x86: bitland-mifs-wmi: Add Redmi mic-mute key entries
Date: Sun, 16 Aug 2026 08:11:26 +0800
Message-ID: <20260816001129.16998-4-qby140326@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260816001129.16998-1-qby140326@gmail.com>
References: <20260816001129.16998-1-qby140326@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the missing Redmibook mic-mute hotkey definitions to the shared
sparse keymap table:
- 0x00002101 (Fn-lock disabled state)
- 0x00012101 (Fn-lock enabled state)

Reported-by: Nika Krasnova <nika@nikableh.moe>
Link:
https://lore.kernel.org/platform-driver-x86/20260531123345.237521-1-nika@nikableh.moe/
Signed-off-by: Mingyou Chen <qby140326@gmail.com>
---
 drivers/platform/x86/bitland-mifs-wmi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
index 8b6476881de6..81dad2b65f4f 100644
--- a/drivers/platform/x86/bitland-mifs-wmi.c
+++ b/drivers/platform/x86/bitland-mifs-wmi.c
@@ -628,6 +628,10 @@ static const struct key_entry bitland_mifs_wmi_keymap[] = {
 	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_RESERVED_1, 1, 0), { KEY_SWITCHVIDEOMODE } },
 	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_REFRESH_RATE, 0, 0), { KEY_REFRESH_RATE_TOGGLE } },
 
+	/* Mic-mute key */
+	{ KE_KEY,    BI_HOTKEY_CODE(0x21, 0, 0), { KEY_MICMUTE } },
+	{ KE_KEY,    BI_HOTKEY_CODE(0x21, 1, 0), { KEY_MICMUTE } },
+
 	/* AI button has code for each position */
 	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_FN_5, 1, 0), { KEY_ASSISTANT } },
 
-- 
2.55.0

