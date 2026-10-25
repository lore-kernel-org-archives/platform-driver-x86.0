Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792958108;
	b=mYPXlYfUh1KW+ZVdjcKSByVmSRwwkh/k8ICXghia/UPWrebn+ZwipHGcQ9FWux7fDrE6
	 Kv7QQqPHSY3adovhZcQFzuC6MdT7PNoQ8KUtIiKFW4a+z5Lg8zUhv5vwOpZTd8DgMp0sL
	 vYq7apix/bmquvb4Ph8CjZQygTL1QJwjmxdD1F0VglyFZi6GlrSp6TQu6+WQxOIAO5VCW
	 KEC50T7yjBMyoZUE9g02EA0IApgurqzeFmgNDOOwBl9uySnatr8TNbvzuU5H6lra75ZAw
	 B+rQj6zFQ2vmXuHdSRUM+qv4mFLwjftw6rKqLYLczx8upToic0+vdCszEJW8ApQ7d6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792958108;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=YCtinZZLLMBS50Lr0v2EbMBwCzHcQ4oLPsSct33j5+0=;
	b=4Rz9c+nfxA+we2tAAmDMcqVGIZHDTnFiqbDMTO0QLi3zDHFQKrxE7rSzNIW7H5Zorkb5
	 hY/E2K9IbsuZcW/d81JLT1nVvyo3c/QIQlgW2LJh/Z/7NGz6VlBzDn/vXcOp8oH4cmhjy
	 z3sczo8YV+n6AearCv+lVz8Nc/CTxqeJcnufpeJJ+MgCUyzk9gmkvRdK8AJopnpqAk57k
	 qqHr+1HAwBwz7aX5Rb9gAn9N4JUq3lN1GKAqm6FDxDT6WtPFf3IGvnnKhwzebNXdDLjC6
	 ccKk0Ga0YO3WBnSvVOioIdskbnKyT1X+oenUAn65ugkHfWV9BS0Cx4z5NfRLKhyFRbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=miget.com;
	spf=pass smtp.mailfrom=miget.com;
	dkim=pass header.d=miget.com header.i=@miget.com header.a=rsa-sha256 header.s=google header.b=K4ln5pb9;
	arc=none smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 148FD606A320
	for <platform-driver-x86@vger.kernel.org>; Sun, 25 Oct 2026 19:55:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 148FD606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=miget.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=miget.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=miget.com header.i=@miget.com header.a=rsa-sha256 header.s=google header.b=K4ln5pb9
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b3dc272dcfso3021506a12.3
        for <platform-driver-x86@vger.kernel.org>; Sun, 25 Oct 2026 12:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=miget.com; s=google; t=1792958106; x=1793562906; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YCtinZZLLMBS50Lr0v2EbMBwCzHcQ4oLPsSct33j5+0=;
        b=K4ln5pb9ler+wgRksMMbPfU5TRBXnjhlM1VrSUY3WVtQ8S8N4PqGFk4ZfvbXLn1ZMC
         a99x/eIU8+D76mlNneZUuz9nLerciSusO4n+N6MMFwn6o98LpT1gixy1MbSN3Gn+AeSU
         dHr5CVMq1LCpJ07A+h7EUrvM+lm9Gj5W/i4EQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792958106; x=1793562906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YCtinZZLLMBS50Lr0v2EbMBwCzHcQ4oLPsSct33j5+0=;
        b=qPDsXeSQQDgpNc5RZRgkFQntW+VLLD6fVZG8gemHApNM4dcVOTD2KhXnsPUyDUvNPy
         IRVjVYAozQcH/pZvzu7Vz2nCuVyjA3oi/R2RFpIvahS9R+azoxuxmZSn4MHRYI9G/OxY
         M3b0Mp8yyBWXHbp0c39GcQ2M+SGezIpqprrzReco//vPjUCkneuIDD9V52HqBxtBlJ+4
         w7NdD1B1ELsIS9hOJZ4+ys9k5elgKt7BQKS/DJpHZw5s0foyCrSyYTckH1qLJxcHXySv
         I19UCfz4CBfUZSGhm4+UM4y1GyEZvHop5uBZqE5PZ4CJkbR4myWXFh96s+XkGe2yCVCY
         jcZw==
X-Gm-Message-State: AFq9FYLi0WeA8DnUEOBf7510hY7Ihbj38E/k9qBm2n27Fp7A5QucbmQj
	AT/AbG+0K3pP/YWjGOypVUNql8tPs84rUWYXEO5BM9xIv4d7XZTnAn2PQ2ZKvHLq/4A=
X-Gm-Gg: AYBFou1kvMXpTmRs4TuNozumcyjHYea6qar9PQUORQUeSpXfOJvmMPt9ru2P9MZ9f7M
	iMRKytNMSl9d6BvbTKvdLjtfeTOzKBOFBeb45HWkXw6U4hmPDYVJaJ9FOuRTU8Zx3Huf9J6bjjz
	W3vzIPjkwqyUtUo/eCGBHYE2GHDM61SDcL1hd3RwXmkmjEV9F1oNwG/Y38PocHshoGMJiRLJDDb
	hzYCMog4Z+Lsbgs7Dc7ITNAkhsbkEUz5bJ0vZJgVXY8yAjuOV1rUfV9DbnqqT4TjJZgZYNd+KxY
	Sqewj1KAEL1m/HmCwR2Tg3vn4Up8xV8NVHYqebk2N0/NonHDwO/qZ78lyr1FMWWpFqWcoIV5YNZ
	WkEIYHuBlxswEKVXG3+t7GkCNd4+QSqAmnZXN/Gbif7YlrJ4+tJeQszWXlJg8kZe8iJlsGqcwOc
	GprsdeAmLl1BI7u6DFHucmobMO6372ZRkVAeUMNz52WapEHOWIi+i0fcpB5qU+4mRayzXzf7FUu
	OmR1zd7sskWssuqQJikl8y2I96Vyvl9vewJRZ11hDoQl9KKvjfw07ZrYVUtZ0psC+cn20NILCk=
X-Received: by 2002:a17:907:2da5:b0:c33:ca5e:8ddb with SMTP id a640c23a62f3a-c46bde088d3mr598807966b.28.1792958106466;
        Sun, 25 Oct 2026 12:55:06 -0700 (PDT)
Received: from xia (user-46-112-84-81.play-internet.pl. [46.112.84.81])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd4ea620sm238279666b.23.2026.10.25.12.55.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 12:55:06 -0700 (PDT)
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
Subject: [PATCH v2 1/2] platform/x86: bitland-mifs-wmi: Add Xiaomi Book Pro 14 quirk
Date: Sun, 25 Oct 2026 20:54:55 +0100
Message-ID: <20261025195456.43414-2-chris@miget.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261025195456.43414-1-chris@miget.com>
References: <20261025195456.43414-1-chris@miget.com>
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

The values were identified from the WMAA method in the firmware's SSDT
and by setting each one and reading the sustained package power limit
from intel-rapl-mmio on AC:

  0x02  18 W
  0x03  37 W
  0x09  45 W
  0x04  58 W
  0x0a  18 W

Map low-power, balanced, balanced-performance and performance to 0x02,
0x03, 0x09 and 0x04. 0x0a is only entered through the firmware's own
mode cycling, so report it as low-power without offering it for SET.

The machine is USB-C only and WMI_FN_SYSTEM_AC_TYPE is not implemented,
so skip the AC type check.

Signed-off-by: Chris Taraszka <chris@miget.com>
---

Notes:
    Tested on the Xiaomi Book Pro 14 (TM2424, BIOS XMAPT4B0P0A0A) with this
    series on top of v13, backported to v7.3, on AC: all four profiles set
    and read back, and the firmware mode (EC 0x68) and PL1 follow:
    0x02/18 W, 0x03/37 W, 0x09/45 W, 0x04/58 W. These match the values
    first measured on BIOS XMAPT4B0P0909. s2idle suspend/resume from
    performance restores 0x04.
    
    On battery, balanced-performance and performance are refused by
    bitland_pp_check_capability(), although BIOS 0909 applies 0x04 on
    battery. This patch leaves that check as it is.

 drivers/platform/x86/bitland-mifs-wmi.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
index a4c341ffbb9b..73be63146fd5 100644
--- a/drivers/platform/x86/bitland-mifs-wmi.c
+++ b/drivers/platform/x86/bitland-mifs-wmi.c
@@ -116,7 +116,28 @@ static const struct bitland_mifs_quirks default_quirks = {
 	.num_profile_entries = ARRAY_SIZE(default_profile_entries),
 };
 
+static const struct bitland_profile_entry tm2424_profile_entries[] = {
+	{ PLATFORM_PROFILE_LOW_POWER,              0x02 },
+	{ PLATFORM_PROFILE_LOW_POWER,              0x0a, true },
+	{ PLATFORM_PROFILE_BALANCED,               0x03 },
+	{ PLATFORM_PROFILE_BALANCED_PERFORMANCE,   0x09 },
+	{ PLATFORM_PROFILE_PERFORMANCE,            0x04 },
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

