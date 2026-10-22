Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792681886;
	b=YuoaBRjBkJT6/9tllMIl+kYU79OyzhyRiDA+v7ASiOR43N58cxDOI9SCJq/6HL66Tjk4
	 O647nsmZoK7pJd6/AWWykYMeOQ3N4jVl3D7CLPcl5r19kAZJcDbu65kGMdt6Be/Bte3fv
	 t0SUDdJo+rnCJf/Qd6ulbLj9LuwxUyNU3J1a7dH6doTD0TqViRLfVWbXsriXu2oiCoaRt
	 GSRvnvpKjsYB4YUus3Ye76iXm7tsoOsNVXolEFJ9oMZGzu4levCu0EmRpdzDsKGCS+/Zu
	 gl7XsSvpXDlSLW8VR/dF/J9cXASuPcmSUqhM5h9NjE2VJBW4DPGFUAi6rof7TikEILA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792681886;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=Up9OgzZdXn0OpyLeDZsMae8XfqyIOwfdXw6t+Fzm1OU=;
	b=KBfYjJVUczYlQs1SRMuO4li3ULv0M5peV5uzGMoW/LRWje546yCtE4L0cnMTnN7bj67B
	 bhUKMZ8qX9TEG20q3+M/reM5kNNadzRDI6u9gk57emSqZPrQ7bQJk/zC9Qu/YeQqxW4kp
	 ukCyzZcITA2+KSWw7eHaM7YA+r7xQZrxriH4J/CVwMpRC4x+ouDTtB+WpxJanISutCqlP
	 5VL4kiSVTSOcgfaoAShcg7UCaRMN2iK+pcKok9f09iozfCr5rXJNOHMiAd3RKwyf4CZeQ
	 vrOCbI7UKLoVgOGiye7WEAYUT6LF05XVtpigEX88gCVUypCbwC4XAunr0dNX8/z/9qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=m+0MFfXW;
	arc=none smtp.remote-ip=209.85.217.54
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA1160A6F4B
	for <platform-driver-x86@vger.kernel.org>; Thu, 22 Oct 2026 15:11:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECA1160A6F4B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=m+0MFfXW
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-7cc81984fceso667206137.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 22 Oct 2026 08:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792681885; x=1793286685; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Up9OgzZdXn0OpyLeDZsMae8XfqyIOwfdXw6t+Fzm1OU=;
        b=m+0MFfXW5KpX/LpHeGbIe52I8bexCwVEk8YmpbqW84k4EmIznjDg/mRcIinFcpMs81
         CLRY44eWQ1fi4939MsKalrztMAwfaZnsi0TDoaXvXbfnKh+WfPoK2d3Cc6aQT1fBNbrn
         Qgrd2+0e/4+d9ia4mEeEJ97xfQbQqlkBZJE/b7wOQTdzxvUXHh8Pv1dkSv7xeTQMQ2pd
         K4x+P01lGvtQXXEeym2EFsFt3lxdfkOKSGg56Sa/Ul1tR7jZncHGes6mUjrnGly/0i6A
         k1LisAsd+3cKoE1X+em3r8Qm7Ycco6V093xqwWR6hNh2trOaWF7uagYCxhS8Kh7rZnbP
         Y5PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792681885; x=1793286685;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Up9OgzZdXn0OpyLeDZsMae8XfqyIOwfdXw6t+Fzm1OU=;
        b=z51SKPADnFZDKT4zl667PaqOr4mPy39QWruTnxDAtr+B72isVH+NeYYs2tIjYtBtK3
         3/jos1XonelyFfFq2/UMp5VPAYV+vKEOlxg7i8Q6bx8hqLRr4ErtOdho76dOmxNr0DPo
         nSWN8FYPDI9j3D81gfB3xkHYhxjiHlCH5mFB/dNmZ9RNF00e0ymXJtYJfriGpAZcSLuu
         fr9Ak5KaAHGXp4EPOPlqg2HM7D//K+KpDL9PPRnBdRE4/4AGCNKAsVFcrXqh/fPF2qGO
         flrPoK+ACcl5Z+uIkznkda8ElgHYVX2sJrBBRH230VUkOpyNOj4KzEXKy4LGeauLa1TE
         Lggw==
X-Gm-Message-State: AFq9FYJZxygxO48P92nijPeWpPP7S3vgnLcn+QOvAg3RRFqUu39sdbKA
	a7d5GPOa2Yg7Bi3G+mHbftHIXE9gwLvi/a9NVSV108F6NleNsxQknTeqprqUJGbN
X-Gm-Gg: AYBFou3Mg3biSr66jIIkPi8Lb1nV6HoVPIoRdq7UPmaetWAJwZVT6v9IcbhccTVUIfq
	xhV+95kuKrvhZF0ve7WKtjRe69MgFPhOvNrawEXbSeTaWKxMAnMX3bo99OHAma2uWOtsVDp9NP6
	mSb97Uf1Z1MLHZ38XBrIaAIXOgmCPd+/4EXF7fZ43lEf95rQ2bWvRQjKOffjA3avmRMZay3uIP+
	uDjhfT0ph6h1/spdxL2raWkAPyaHp7ZMBdFVeFy54fHobcgK6/yMD9mfbuMd3pz+f4Utszzv+75
	6qrtoSogDTrNCmew5RGKtWBU99aFGB1uyYKaK0XhznQmQWSzR3aj9WjUbGaCvtc7T8NzN1Q35a9
	+FN5wZmpBgxaF5BK3sn1iW/NfOeq1bzfROSfuIgamSISXhTRbhyrgrziSQZqtWFDl9ZH3Da+a2j
	tuGXCfzmOmJyLO21znkMpDO1n5TbeODVMSWTf3d/bPXsLZr3bjJNzKfXhyK6UENRIIIE5EcZc9x
	B72J5kBwTsk42rovXt98VUyeqy0mUGkqCWyYy1yiSi85pF4DjMGff7EtfYsxaotgTA=
X-Received: by 2002:a05:6102:c49:b0:7cc:8074:9355 with SMTP id ada2fe7eead31-7cc92472c56mr1793152137.1.1792681884722;
        Thu, 22 Oct 2026 08:11:24 -0700 (PDT)
Received: from tutebook ([200.68.111.212])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-990d10439absm6479817241.5.2026.10.22.08.11.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 08:11:23 -0700 (PDT)
From: Matias Civadda <matias.civadda2342001@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	qby140326@gmail.com,
	ilya.gladyshev@linux.dev,
	ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org,
	chris@miget.com,
	Matias Civadda <matias.civadda2342001@gmail.com>
Subject: [PATCH v4] platform/x86: bitland-mifs-wmi: Fix TM2107 profile handling
Date: Thu, 22 Oct 2026 12:02:21 -0300
Message-ID: <20261022150221.26879-1-matias.civadda2342001@gmail.com>
X-Mailer: git-send-email 2.56.0
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

Signed-off-by: Matias Civadda <matias.civadda2342001@gmail.com>
---
This patch applies on top of all patches of Mingyou Chen's v13
series:
https://lore.kernel.org/all/20261021123414.25516-1-qby140326@gmail.com/

Changes in v4:
- Rebase onto Mingyou Chen's complete v13 series.
- Drop the separate payload copy fix, which is included in v13.

 drivers/platform/x86/bitland-mifs-wmi.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
index a4c341ffbb9b..59b930ef8729 100644
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
 

base-commit: 893018d51f27ec0449155b0afe371aaf65380630
prerequisite-patch-id: 99b10cd2b70d630ab65d8a8bb02c1d4bf89b1a63
prerequisite-patch-id: 27db041f827872b8be142c310a14c79962154bd5
prerequisite-patch-id: 74fc3298fa3dceb2224dfc3d2ae4cc6d4be61c01
prerequisite-patch-id: 2bbb1371b506f5a07a1e6e69d34217195cd5ffcb
prerequisite-patch-id: b88e60d7915ad055b67478359bd9c6c9482d8433
prerequisite-patch-id: 2fe8c043993034f1a2cde98b1b2e299987d5ac7f
prerequisite-patch-id: fbf70405992dfa75ed02026d97aa16e1644fbd42
-- 
2.56.0

