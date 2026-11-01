Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793549907;
	b=aTvq8mT28mpwMPXWpp+WWdDkRsa42dK757p+701lVkFR9HbcZWtBpJ8RyoCRzOOw2xf6
	 13EKeMecOUV0uJAJjfp6bBs5kzALowQazTrJcVt4j3my0PLQSiyIdFF+qf9DAfFuymYco
	 t7HTwHchgydEMECTrbXOzQmOHoLNClyW5hRWUJj4CpJaM7Q3MeWLpaenRHMMwFKt8vtK/
	 VRpr53xTbby/xrIbOBSxcvw0h4jjOzHFSEb6pXKntkQMop+I7pIim0yVUBoca8jLiyA/y
	 jYt3yzSnsmMmPUeabPF+SWpl35okOhCdA4XdCZNQHcZhR8ESwpNpbpRxbBOr7itOP0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793549907;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ZI698W0fRQsxdduD1r1rY3wNAMAW/QlO4rXfvkEsq24=;
	b=jjk4urnQyBTNMjOwJecg78XwLMB8pS0z4eOQ5mm6odnDdRpCaGgfR2L/KuiYi/5D+avb
	 fPrDyB7t8yhBkmL3FoUVOorJl4rLTI9VpEPsTMyaJLn5skSdSgE2lrPd/fizvVKeKmFPN
	 WZyz01WD90Q13C0VEiDC325KUjkTEEcNrXPweCkdPxZjQGwf8CGISVJ9T/Z3AlrKnIiPM
	 mwYmRpkhLQl4Tnb1ngidfEBc05OBcrXm+RR8sJ3I8lXWJAFRLLHmAd2k7++DOU7DCZ5cH
	 oShkEGVqZAjFkicspL9G7DRsIcx6+1DbfwV7RLENWWGvkImAx2nNFjluFcmJaXqV5lQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=miget.com;
	spf=pass smtp.mailfrom=miget.com;
	dkim=pass header.d=miget.com header.i=@miget.com header.a=rsa-sha256 header.s=google header.b="WDH/N4vB";
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40641606A326
	for <platform-driver-x86@vger.kernel.org>; Sun,  1 Nov 2026 16:18:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40641606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=miget.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=miget.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=miget.com header.i=@miget.com header.a=rsa-sha256 header.s=google header.b=WDH/N4vB
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c169ae1cb26so528299466b.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 01 Nov 2026 08:18:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=miget.com; s=google; t=1793549906; x=1794154706; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZI698W0fRQsxdduD1r1rY3wNAMAW/QlO4rXfvkEsq24=;
        b=WDH/N4vBD28xeG9eQrBCR5WU/gITayyX8/DSbfD90PekosJBikBD3oRO6nDqLkWS8i
         KOHgWV8iHLoomaHGRWZuclcHUCqrf/QN4EtTDE4SrhUVLnmOXsWUCDC4mZI2NVZVQOg5
         Jhz7euE6Mne6Xqs/zozgz0jRF614qU65LypPo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793549906; x=1794154706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZI698W0fRQsxdduD1r1rY3wNAMAW/QlO4rXfvkEsq24=;
        b=NeLpCQp/9q8JDpOJhaIovFTVPul9qG1cH6dCbticsxMw4h0nkqsp54iaZtMZ1+vU5W
         1kszS8yt2z5Lp1vcszq7cacZtSNbO9l5n+eEnhGpTqEttK+17iuOwcNgwdNWKdYxS8ff
         9G8W1NU5GsDLEE2bHFO5dxgBiJGTmJef3kL/KwBHLjko5K6iEtP4I/uXauSPoz0R2izv
         D7DyzXhlm41RyThABTGvKY0FyJbtfRKF7FM/cSDAl9dDMR5D43NiJvbgwHyqnkLpA38+
         RIYvjV1E+W0k1T/Hce4gSNHH0FasfpnvEW76463uJSDipVrYv/TvGEImjS+Tg/tkJW+z
         LsTQ==
X-Gm-Message-State: AFq9FYI8n4IUBDApF7nXj2BrZUaoVB5oBsogtEYxOelvrMadi+RcdZzr
	qDy9GIRzXHer89Xytr8xbjkwyHXxgA6lpf+BpI7SQkJ8QdtD4GxfEaAPa+2IIpKbkBc=
X-Gm-Gg: AYBFou2sOeLjIYTUhvpM+SW5EecHQPmKq5T+pCJ+n7oCZPJ2yWm3JZKFA/3AZLlH6Lb
	clGjeEmrs6PolA9yqsNcfrYMN/XuusRuVv3XZPXCYoqITQ7N6qKQ9SSZexpf7YOoR47Y1vs4TZd
	xGXTS0uxH72syVWOJOyXMDv1Wjoi4Hf+fzvilVvHH1eAzJrdIOoCGVyCU07ffsy5IKmSO5bMqp/
	0O7rfzkD82f0xo23K4QU4Od4YM9f9cbwruzgkTEL23ZNj+RKZDvhVDKtIaMzkq/H2yn/d01AntY
	fiUo8vnf31nXszBbkLo/9qvJW2RebPAMsP1rtZeSEFu8SU0Pjiis2w5Is6ttA/eBv5Ss7gK/XGR
	G1fRmsyWvZKnTih2yHXCIYXn227s3pa3uQE1i8VL+4/C1BGO9wqQ13jZtf04eVJDlxLiJ6AFCaX
	2k7Dy6ZPty9iwOgXB1orRfXMhaNYGIvOkn7f4kF41AxMLfDmFqO66cRC1OZnUdY8bsBWvsGsVJ5
	bQINmfsczxvpYKCzRONkfOQ1T25fGlS6khUXRsLKMp3VWLFpLI35O4DGWPjjEWtN07g35nqqM+O
	K7WYVSu3leF4ted38HUIM4Lt3qNb8wMSoFvB5uMva4apfMhWR4a6K2L7LL9nZQlzB+Fy+1j01wk
	DXZy84Z2ccmAnUUBnOaQUBKKYUP1/
X-Received: by 2002:a17:906:7093:b0:c4c:b683:363a with SMTP id a640c23a62f3a-c4cb6833696mr238324666b.20.1793549905728;
        Sun, 01 Nov 2026 08:18:25 -0800 (PST)
Received: from xia.tail836dc0.ts.net (user-46-112-84-13.play-internet.pl. [46.112.84.13])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4ec9fcac9sm2200155a12.18.2026.11.01.08.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 08:18:24 -0800 (PST)
From: Chris Taraszka <chris@miget.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mingyou Chen <qby140326@gmail.com>,
	Ilya Gladyshev <ilya.gladyshev@linux.dev>,
	Armin Wolf <W_Armin@gmx.de>,
	KentoNion <kento@kekto.ru>,
	Matias Civadda <matias.civadda2342001@gmail.com>,
	Chris Taraszka <chris@miget.com>
Subject: [PATCH v3 1/4] platform/x86: bitland-mifs-wmi: Add Xiaomi Book Pro 14 quirk
Date: Sun,  1 Nov 2026 17:18:11 +0100
Message-ID: <20261101161814.1325847-2-chris@miget.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261101161814.1325847-1-chris@miget.com>
References: <20261101161814.1325847-1-chris@miget.com>
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

The Xiaomi Book Pro 14 (board TM2424) implements SystemPerMode with
its own values. Its firmware ignores 0x00 and 0x01, and GET returns one
of 0x02, 0x03, 0x04, 0x09 or 0x0a, so with the default table balanced
and balanced-performance are no-ops and reading the profile fails with
-EINVAL whenever the firmware is in 0x04, 0x09 or 0x0a. The failed read
also aborts system suspend.

The firmware passes the mode to Intel DTT as an OEM design variable.
The DTT tables in its data vault name the modes and set the sustained
package power limit (PL1) for each, by power source. For the H484 CPU
variant (H404 has the same layout with lower limits):

  value  AC                 battery
  0x02   Silent  15-25 W    Silent  15-25 W
  0x0a   Silent  15-25 W    Silent  15-25 W
  0x09   Balance 35-45 W    Balance 32-40 W
  0x03   Smart   36-37 W    Turbo   50-58 W
  0x04   Crazy   50-58 W    no entry

Map low-power, balanced and performance to 0x02, 0x09 and 0x04. 0x0a
selects the same tables as 0x02, and 0x03 gives on battery what 0x04
gives on AC, so report them as low-power and performance without
offering them for SET. There is no balanced-performance mode.

The machine is USB-C only and WMI_FN_SYSTEM_AC_TYPE is not implemented,
so skip the AC type check.

Signed-off-by: Chris Taraszka <chris@miget.com>
---

Notes:
    Tested on the Xiaomi Book Pro 14 (TM2424, BIOS XMAPT4B0P0A0A, H484)
    with this series on top of v15, loaded on v7.3. Firmware mode (EC 0x68),
    DTT OEM variable 1 and PL1 a few seconds after each set:
    
      AC       low-power    0x02  ODV1 2  25 W
               balanced     0x09  ODV1 0  45 W
               performance  0x04  ODV1 4  58 W
      battery  low-power    0x02  ODV1 2  25 W
               performance  0x03  ODV1 1  58 W  (with patch 3)
    
    With v2 on battery, balanced set 0x03 and PL1 went to 54 W.

 drivers/platform/x86/bitland-mifs-wmi.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
index a431d3fef774..63fae12ebd83 100644
--- a/drivers/platform/x86/bitland-mifs-wmi.c
+++ b/drivers/platform/x86/bitland-mifs-wmi.c
@@ -113,7 +113,28 @@ static const struct bitland_mifs_quirks default_quirks = {
 	.num_profile_entries = ARRAY_SIZE(default_profile_entries),
 };
 
+static const struct bitland_profile_entry tm2424_profile_entries[] = {
+	{ PLATFORM_PROFILE_LOW_POWER,   0x02 },
+	{ PLATFORM_PROFILE_LOW_POWER,   0x0a, true },
+	{ PLATFORM_PROFILE_BALANCED,    0x09 },
+	{ PLATFORM_PROFILE_PERFORMANCE, 0x04 },
+	{ PLATFORM_PROFILE_PERFORMANCE, 0x03, true },
+};
+
+static const struct bitland_mifs_quirks tm2424_quirks = {
+	.profile_entries = tm2424_profile_entries,
+	.num_profile_entries = ARRAY_SIZE(tm2424_profile_entries),
+	.skip_ac_type_check = true,
+};
+
 static const struct dmi_system_id bitland_mifs_dmi_table[] = {
+	{
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "XIAOMI"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "TM2424"),
+		},
+		.driver_data = (void *)&tm2424_quirks,
+	},
 	{}
 };
 
-- 
2.56.0

