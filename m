Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793965393;
	b=WhI31JshmOCi//yZu7Ktkdqv8cfrzTXwgpB4oNTfUe0fctSHtVRynF1C/zbJF3ou34uv
	 oMeH9kXpRwEpOSbvKjEDwcQa8tNsPNdrkURHzBXvs4stXTvAYCQ/dF45PR+9Ds1WDKWkJ
	 r/swqa+AARUzn7yla/m8968Yipa0R7J0AdJWujqnTIjQKN1jrH1j9aSmASWVP8zd+byub
	 XZ/yXXEhjVaTen/Lk/xHeMz+E2yTJTbmaeO3h1gQO+DW0nAWdfvMwC1B5UdUv/UDvaYLp
	 /o5xVR0sN0WEWNxdDWJu/9DNC9LNgTGrExRbd2tOGbj2kN4qXZxgnYhDueFc1kQA2aA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793965393;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vGWDvyTZcD/X4Tcli9Wn0Aq/2+luEsPmy4hQ7ZtpaL8=;
	b=aA9GTgUsX7SWVgvtoL57HgBa1CItCTtOJo7k6ZO271o2c9ev6I9ueTWa+cszomdUvrEu
	 r7D/oTzVG0sf+T+//2aDdfhvq2iFJaiyiIXMzya6mi4ZaldoA4jrzJaYmUNVB7JtphjlA
	 KBrye1kllbp7EVq6Rvc6ztmlkFuwvDI8P/Ljz9DrEvYAJjhf7kDQfarohUVw9KcV/Krk5
	 ApltYZ0xvzwv7L1wzFq8NQixd5guCB7uppt4/5OGrOkZQqf/i4d4tLpV5M6V2oZtRGguS
	 wdCEkO/L8UipIsRmfxWWn2X1BaflyInNrETY0A5jw682LJBOKPgWcjNEm9/OmZhVwhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=miget.com;
	spf=pass smtp.mailfrom=miget.com;
	dkim=pass header.d=miget.com header.i=@miget.com header.a=rsa-sha256 header.s=google header.b=c1KQp4gq;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F2F606EE98
	for <platform-driver-x86@vger.kernel.org>; Fri,  6 Nov 2026 11:43:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87F2F606EE98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=miget.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=miget.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=miget.com header.i=@miget.com header.a=rsa-sha256 header.s=google header.b=c1KQp4gq
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c40f29667e6so79840766b.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 06 Nov 2026 03:43:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=miget.com; s=google; t=1793965391; x=1794570191; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vGWDvyTZcD/X4Tcli9Wn0Aq/2+luEsPmy4hQ7ZtpaL8=;
        b=c1KQp4gqdZGxoOCGa/RfgQZ+zO07LYra6iMg591qnQblSZcT1F0fUywCGO4BdaB/t4
         QqR5qFNTheKqi5DAYz+UmqQdwOE5s9bfohMp0eDs+ecHHCHu16M9wNxeU/VccdoKsarq
         3fapVuynIHn8TZTK2AK6K71YsbnIrlvush6Sc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793965391; x=1794570191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vGWDvyTZcD/X4Tcli9Wn0Aq/2+luEsPmy4hQ7ZtpaL8=;
        b=QqJ3KATVB2YfFejirNJOTmIeEXn29XjDAIdPvMAuIvr8FP5BhRj7ZMABM7jqT4tVKZ
         k6rZnzeot2AEWSq+wugqbW3Z5V9t7cmUsvsEKJoDrSpaVZrYbvsgo7uzPFMFOWsTWo1f
         IPk6db4vsxGzvCCS8HRX7S3MB2P0PDUnwQIjR18r58JyRKGtarHJ5pJm6sHRv2/MgAJ6
         VW8MK8FcJGb4M7e98Q+9thCypvsgbYFzJvmp09RdXIUtqKCFjQLDqnexVg44e7zpb6lm
         R+I/d4gRiSmmwdIDrNKZt9OGhLFhht2FynjOcw8KoJhwaAm8eKQancsFRHRYscvg3dLQ
         bTJg==
X-Gm-Message-State: APuU4Z9Md5lfcxpD1Fx2aFOagCRBXSxpzvEbNvSkwvI/InkAeOAf7l5A
	qxzzyKXu52CAxuUMFVTnVI95QFIv27uDlM8DLQQYc37LIs8ZYAsr4ls9DSgauZ6e7C8=
X-Gm-Gg: AYBFou21Cz1Q1hfr9srfO8CNbzNn9n7Qbxn+vKNrnyd9AerjaDkZfKwNT7KgKpovAbp
	sNVrro8PHsgEB45bRF43uMmcebkc9XuDNbH+Qe09SDFDuyPQ8GeFNt7tfYVdXK29+b6h0uYs0CW
	HO/hUn08y2ssb3oHAUsHvdPGkt4X97z3mzxoyltgeR/tceVT1pfYE8rFtgUJ1mahdssVM27vvWE
	8DfkYfw3IUF0sfAdqXvOO8fzLmDe9ZasSjZR5+c58kU73DgY00b5oJlivdduyEV7Wc5UZOpOQOf
	onxiIcFMvDKNzj42jBowFnjllwoZGVqofrfh+TcvDXZOubZSbTfUD9ciwXBNYW2x/W9pobcZsK+
	QlPiJyxme5rIUxiwsi1FoXU1Ol5uqiyWmYVXM11o5qFZgP8pHz+kaShObkIvd3nLeqJV5Gd/9qr
	/iiCz+BeyDDL+qQNyMntLUfX7QGh9KLHezz0y9tTgxvlI2Be8V070XzsPaA7kJqS5w7/KyZObzq
	GTaccIklP3o1p1WBys53gwWTYZ1jHx/kj70ePSSS2sKQLnTGu7P4qAdf02HFJl6n5GTIy56EQ6C
	sB05+PeFTEjZw42ZRB0jFe3YIQ62lCvz/LxArzZ6ZsGwWuc=
X-Received: by 2002:a17:907:7b86:b0:c4c:f85f:aa12 with SMTP id a640c23a62f3a-c4d35538423mr176866466b.31.1793965390484;
        Fri, 06 Nov 2026 03:43:10 -0800 (PST)
Received: from xia ([83.142.187.210])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d356e7035sm71377866b.80.2026.11.06.03.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 03:43:09 -0800 (PST)
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
	Arsenova <7z0423arsenova@proton.me>,
	Chris Taraszka <chris@miget.com>
Subject: [PATCH v4 3/4] platform/x86: bitland-mifs-wmi: Add Xiaomi Book Pro 14 quirk
Date: Fri,  6 Nov 2026 12:42:59 +0100
Message-ID: <20261106114300.936782-4-chris@miget.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106114300.936782-1-chris@miget.com>
References: <20261106114300.936782-1-chris@miget.com>
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

Map low-power, balanced and performance to 0x02, 0x09 and 0x04, and
use 0x03 for performance on battery, where it gives what 0x04 gives on
AC. 0x0a selects the same tables as 0x02, so report it as low-power
without offering it for SET. There is no balanced-performance mode.

The machine is USB-C only and WMI_FN_SYSTEM_AC_TYPE is not implemented,
so skip the AC type check.

Signed-off-by: Chris Taraszka <chris@miget.com>
---

Notes:
    v4: moved after the battery support (Mingyou), so 0x03 is the battery
    entry from the start. The code at the end of the series is unchanged.
    
    Tested on the Xiaomi Book Pro 14 (TM2424, BIOS XMAPT4B0P0A0A, H484)
    with this series on top of v15. Firmware mode (EC 0x68), DTT OEM
    variable 1 and PL1 a few seconds after each set:
    
      AC       low-power    0x02  ODV1 2  25 W
               balanced     0x09  ODV1 0  45 W
               performance  0x04  ODV1 4  58 W
      battery  low-power    0x02  ODV1 2  25 W
               performance  0x03  ODV1 1  58 W
    
    Rechecked on v7.4-rc1: on battery, balanced, performance and low-power
    set 0x09, 0x03 and 0x02.

 drivers/platform/x86/bitland-mifs-wmi.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
index 97dafd510ba8..4d02cd9e8a6b 100644
--- a/drivers/platform/x86/bitland-mifs-wmi.c
+++ b/drivers/platform/x86/bitland-mifs-wmi.c
@@ -114,7 +114,28 @@ static const struct bitland_mifs_quirks default_quirks = {
 	.num_profile_entries = ARRAY_SIZE(default_profile_entries),
 };
 
+static const struct bitland_profile_entry tm2424_profile_entries[] = {
+	{ PLATFORM_PROFILE_LOW_POWER,   0x02 },
+	{ PLATFORM_PROFILE_LOW_POWER,   0x0a, true },
+	{ PLATFORM_PROFILE_BALANCED,    0x09 },
+	{ PLATFORM_PROFILE_PERFORMANCE, 0x04 },
+	{ PLATFORM_PROFILE_PERFORMANCE, 0x03, .battery = true },
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

