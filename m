Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792540327;
	b=2925f3mpbhWWH7r9BqbGccLU2np+YcMtunJOpNK6ZmNwJ6PEA0E6tsoIg19jcYVFUkuq
	 4yxIUFL+oLsWbicxoO5gqpUXC8PnXgFWmKMmGfBFX6VEsl5gbAZMMVakZq+mZxph/FMI2
	 SukYa5/U+gsWGBKjuQjNJU3kJOYFWzl8wWIFPnhywT7vOphnZuCXjamLAH4ls/To1z5IH
	 P4FdOcBp14yRNmNYtl2vsNSPDAAu8mk7B4OyzsgOr4PVaD/wfPSFeCXOo4GIlzPRdUlF3
	 JWa3pZlW+TZ+N4v+GQorWQfXsA3aM5hp8lW08PafvgsIH7ERLeyzbRRoR9QOgbyO78A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792540327;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=s0EDmxFaEkL/j8eAXne0uZ63W5PYdrf9Cumh97hbnw4=;
	b=dwkuBy/8fuJliTwrIRaMF8ESZrH95T86T+frZJNOSmcBdlpuUwBwVSuy5j1bc+GjL1RQ
	 kZkpqFbbhnRIEUmaINJ1VoAvs/pgiroB1v4JLsLIqI8WJ2pjYti1jj5HnbFlCFe9T3cB1
	 +XflXj9qbZuQquDI9+FLKfwlYJGIYICSmOIb4QOnnLBcAVEIvNUpgN4VNFLY2qSKxIZ55
	 ERfmIz0i5jGGqHnsOTuiGDnjdtuz0JvBjnaeO4iwJyunKcCnECgO7uprWhfu8CfHdxgHq
	 QYKpg3SSsaa0q97CWppEyDItxQoQyrQf6d/UmA+LERKKhwImNuhb2Du3h++0Qg8Uywg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=a6jDOqWB;
	arc=none smtp.remote-ip=209.85.221.176
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78BA8606A31B
	for <platform-driver-x86@vger.kernel.org>; Tue, 20 Oct 2026 23:52:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78BA8606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=a6jDOqWB
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5ead5ff47caso69882e0c.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 20 Oct 2026 16:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792540326; x=1793145126; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s0EDmxFaEkL/j8eAXne0uZ63W5PYdrf9Cumh97hbnw4=;
        b=a6jDOqWBsZ3WJxxs7GoVS+nO9gT7sBzwMzsfWYjsLb05yjKdBKUmWDQrPG8LPdoj4d
         RLq0vZRuehpW5Geugsc/u9APfQuWGNWLI7Gc2yumYFvBTZQnoMsUqsGuumKPTZEDNuFN
         mnygSBJpjedrhIee++C0SZNqBFbrtB7p58Jt08emlnASiOtkHW5PFUhn+x353eFq1Tg1
         tSeqx+6a9lV+qkhLceblKgZVCw1MGNQ7Px3dYD1s8255JGwNhW7VCjUaY6IBtSG8rWMe
         CnjXTU8VMQXfvvQNn4170ROWa3VHnMv/DmzLvCbtZXW0Z2p7b92iR65UcoXu5Ic5WpzE
         CCSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792540326; x=1793145126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s0EDmxFaEkL/j8eAXne0uZ63W5PYdrf9Cumh97hbnw4=;
        b=QLYhfeUFFc3pwsKsb73iX10gjeZwMCbkKIC4JC6h3lkoCZc+CbP4ZS3HLpZG3Xa3ly
         +JniTp+M+BZ/kqUlAsTr9YqvvBDLdQPua8HTQAoLFlJs77DezHpGq8ojSWpk1DT+JbYS
         9n1s8m+m3dBXw0LJZowxvAd+ef23p5SwOZmxH7qL4R9tkaHVTvc4kdwj11eaDCwpm1wB
         Cd27LFiyaYtQv/BEUX2GlAU7kUyvAZ7iEBE6KE3Bsezv3WoGf5rMW9oFMz4juJDrUy2F
         Dej6RALxQ+9DLGnWA0jotiaGNJgyKtRaD1lhwyUew2sytebQCpPXOvTDR6CF48yqetNs
         edXg==
X-Gm-Message-State: AFq9FYL9J8blToEtf1tG59xkqmVL6RuV7PuETGzYjzEPv8LVXHXennN8
	9uF9r569Vupc4txl2byAXsLobwpMmy3a/Znurm9gKVNM3/4C7+7ZWmo8MHoNptzJ
X-Gm-Gg: AYBFou3uKsqgKO3VLAQ2muJHfLjUiNlCMlMWWorLPBjP5ioE8Osv2RRswtDJoHQZL8b
	ncN8o1Khz6NUxM+byptLYqymNaE9f+c1OEnhVwYHt4KO9RETBvVze0nN/y8uWt/qQMAjSBwvuFm
	Cj9ZZh13aQGQM1NO2W57b2BWa5eq3aPopr5XWt3newncjGjEKyA912ehCZOwjDXEJC1UEK/p8EE
	QIoF01JJ/k4t5019ZzJ91foJSgDYw4o9hN1VWwquQbSLoWkhbi0PKMOy3e7XS5op68M+3LLJZHv
	coeuq9QY5034H8NLYmWY6SYhUg9sw30CY/2+/TxHcxGwoc3jKb8iAKHukjQ4pld1ksMWJwVM+0u
	RW3V5EexlMmKcCpJ1gGhYJ9pTDjUoUqBjqEIrODCtl7gXV0xsTkN/7rpjrxtjHbNctIpbRCE/to
	pVhd2m6cEEWzTiKis2bZ/LxSZyapsiNaqBv3LzsyJhZUogNLW7f0p0UrwbZpUyIOeQjwsNvsYHN
	JVI0x99zd2oP0VRiqM/asEO+JZgD7/S8x6vMy4=
X-Received: by 2002:a05:6123:22:b0:5ea:c120:4514 with SMTP id 71dfb90a1353d-5eaebe26980mr100730e0c.15.1792540326370;
        Tue, 20 Oct 2026 16:52:06 -0700 (PDT)
Received: from tutebook.tail57d09c.ts.net ([2803:9800:a0a8:8014:618c:a663:bfd0:635e])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eae983a9aesm1172772e0c.16.2026.10.20.16.52.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 16:52:05 -0700 (PDT)
From: TuteMthCD <matias.civadda2342001@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	qby140326@gmail.com,
	ilya.gladyshev@linux.dev,
	ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org,
	chris@miget.com,
	TuteMthCD <matias.civadda2342001@gmail.com>
Subject: [PATCH v3 2/2] platform/x86: bitland-mifs-wmi: Fix TM2107 profile handling
Date: Tue, 20 Oct 2026 20:49:27 -0300
Message-ID: <20261020234927.121570-3-matias.civadda2342001@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261020234927.121570-1-matias.civadda2342001@gmail.com>
References: <20261020234927.121570-1-matias.civadda2342001@gmail.com>
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

The TIMI Redmi Book Pro 14 2022 (TM2107) stores the MIFS WMI return
code at the end of the response and uses different profile values:
0 for performance, 1 for balanced and 2 for low power.

Add a DMI entry using the existing quirks infrastructure to select
the correct response layout and profile mapping.

Skip the adapter-type query on this model to allow performance mode
with its USB-C charger, while retaining the external-power check.

Tested profile switching on physical TM2107 hardware.

Assisted-by: LLM
Signed-off-by: TuteMthCD <matias.civadda2342001@gmail.com>
---
 drivers/platform/x86/bitland-mifs-wmi.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
index 522b38e9755e..8c1ec6f1166c 100644
--- a/drivers/platform/x86/bitland-mifs-wmi.c
+++ b/drivers/platform/x86/bitland-mifs-wmi.c
@@ -116,7 +116,28 @@ static const struct bitland_mifs_quirks default_quirks = {
 	.num_profile_entries = ARRAY_SIZE(default_profile_entries),
 };
 
+static const struct bitland_profile_entry tm2107_profile_entries[] = {
+	{ PLATFORM_PROFILE_LOW_POWER,   2 },
+	{ PLATFORM_PROFILE_BALANCED,    1 },
+	{ PLATFORM_PROFILE_PERFORMANCE, 0 },
+};
+
+static const struct bitland_mifs_quirks tm2107_quirks = {
+	.profile_entries = tm2107_profile_entries,
+	.num_profile_entries = ARRAY_SIZE(tm2107_profile_entries),
+	.return_code_at_end = true,
+	.skip_ac_type_check = true,
+};
+
 static const struct dmi_system_id bitland_mifs_dmi_table[] = {
+	{
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "TIMI"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Redmi Book Pro 14 2022"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "TM2107"),
+		},
+		.driver_data = (void *)&tm2107_quirks,
+	},
 	{}
 };
 
-- 
2.56.0

