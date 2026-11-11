Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794416671;
	b=HkWDJnf32sAPXMdbpgD5iX318456k8IfzK6AgADRHK51WX/uSNwVRjh/ZK/e5BtbAyZd
	 Z+AT61j0wSIv9Z1DMzIePVRWauZ9c8cm3RfzxJkmnqZJ3+osojfpsOFFSJjmyMCU7uFQD
	 PUA90HqL3/YAFjybln6bGZrSHgdkZM2jr82JSFp0Qim4KoSfxRCs85XG38w0VEWwFxICR
	 JtQJHwEzVKqEdcC22Gt+14MLB2DXqU3QJL/VuxpJ6GbWOsDlMjWmZrbYAvHtKcZ9mB0LI
	 KcAvzH65K6DhgoqAwSMlHSM2xbCAqDA9hiZywnDYOMQG6DXotcwPkty/ouXCOu0/Hjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794416671;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zMPBVjm1yB04eHApflLbxv5is5lkBlZs5VoUj6BquWo=;
	b=VcX2zXyhIectl5kVaQRarrg5UPxBrINUGg+xwOAKPAmvw5VX24bxyXPsCixyY2vCpVPZ
	 rsvE14AEm8czPzNd9sQ1MNnDgcDZkSApcF4oJGop3WZdZPh+JcewvlaZpSu40/uTa482F
	 Yx2SdatfiqOnMsnUW1AYDDaSGo03aQ9GG7MU18/SSBpf8iau2rujkcF5Bp8wXrqAB4h4L
	 mF+MD8ON4OX0Yw1u0ZLC6EOAATl1KnRMCEDqbHG/jIuFwm16tA6y9ujsm6TpMycEiJTcF
	 /z/n+8KPBqm0c9hAohWxZsLMqiejM9ydF76tcT8Y57cuE3wu9MOSKYuHPJF+4QGIy+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=miget.com;
	spf=pass smtp.mailfrom=miget.com;
	dkim=pass header.d=miget.com header.i=@miget.com header.a=rsa-sha256 header.s=google header.b=LuThJJ4x;
	arc=none smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F45606A88D
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Nov 2026 17:04:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84F45606A88D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=miget.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=miget.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=miget.com header.i=@miget.com header.a=rsa-sha256 header.s=google header.b=LuThJJ4x
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b6e8b6d424so5006690a12.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 11 Nov 2026 09:04:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=miget.com; s=google; t=1794416670; x=1795021470; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zMPBVjm1yB04eHApflLbxv5is5lkBlZs5VoUj6BquWo=;
        b=LuThJJ4xftzwIu1/vST1ZFUajY9pjzoD5bIyN/7qJVjfGwPoUoMAc+ICExyBqEfr6B
         tjsLdoLL9MC8XyMu4p44DcRjZ6YkCqntpRMWc7GFLOSqthUvKTHnxLjAjhA6bjpE6LLP
         N7oN0XzS5b2WzCzRDrfCYjZADs+w1ePhOmmw4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794416670; x=1795021470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zMPBVjm1yB04eHApflLbxv5is5lkBlZs5VoUj6BquWo=;
        b=GmyP3wPt1S47ffY8HNovBK57vVu3qrM+s1KitxfFd6OqNjrsw8y78fSQbfX/1vX0am
         FAoGNeQUQpHCdIzEXMh9dR8ovSh8MG8Y4KSQtemiaCctpFx2eM/Rd4UhGL7zjmrQgjWg
         pQZrFI+gCkcbF5KWQSPahMnR/lzrskY4AmX1wNLMyGHodmIOm0h1d6nrGHhveAA52yae
         Ab2KvXHB7qsrvFmsf0Hz58Hadll+jKRV2fiZthoM3u1fcsbi87qVm9rLR0KSEUY4WbYB
         MZup5uM2/43E+weFgD4AmkjWLdc1o6AjmZXRNAdD6sXcxcFMqHuwFYWItaXyLTc2Hrky
         LhqQ==
X-Gm-Message-State: APuU4Z9rjJaAvZnoTgVBEXcGxq8gt1fM2/sbT8H/toFcCv9sJHUFW7kL
	bJOrT8w9pVT9VPneMA8oODt+MUBsgvqpalQ7f5cypKUIkoVyODv5JRSnd5DfJHj9yvE=
X-Gm-Gg: AYBFou2hL/TsG4BcZjCgKpgyL6MQUaY/zFdr22pG+KE+no397dz4Kh2u23MWhxQYNdA
	Ll2pgJaUUkMD6cRZ6Z6nPj8x9vIphqZ/JDXi5MWaBRVT7+QjsDe2ucBq/M6SXCTGUv9iFs5sEr7
	/8AEDDWLFsnv2y6WbK8wrqqq9sjV3SE0UmA6F6fOjz0YXraTxdVGr/3dbfgq0mmXH8VylB6zquX
	V58TjpdrB1SOZydEikFaxV2dPm5dCmNDrjmw4GFEDOMfYLb3IWOJ3B1aQL2B4I8vsmKlSfu363R
	AgocECPOxKrAuJaPEefV4/+3C2Y+p4qwZDc2ahAkw1yx/GD5z6PXDCxrdyAvVDBltghAQkgO4DX
	zIp8PYttvWCH6YCq6XglYZIbhxW38SwVnaJV0I/9j5Z951dPdfvgbcqNz0tSx1PLE4qT9DopkrJ
	+SZgmi/eV1Un6TSgLPeHOPzxpqEX1mDPYva+yoMhMJY9oKM8Ma2uoMffVM+xG4IoBXseTs0c9zm
	cyFw/M+Kz8UeK7u3V0K0RECB1qAoOqrM5bn4BvUQ1r1X2nm4oP+urY0V41imD/esd5p42tvdS90
	TBb729gLo86F1779aKSa6BHxy1TDEqN77H9ITL1dZKJ+qZih/3+b522R9xUa8JTO/CZKj5BAPSB
	6+wqS5DnXyuJnOodt5RSv7X5UErYP4k8ZPb3L
X-Received: by 2002:a05:6402:4546:b0:6b5:6cd3:fd8a with SMTP id 4fb4d7f45d1cf-6b7773f4865mr2011972a12.10.1794416669480;
        Wed, 11 Nov 2026 09:04:29 -0800 (PST)
Received: from xia.tail836dc0.ts.net (user-46-112-106-110.play-internet.pl. [46.112.106.110])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7834cdc23sm871660a12.12.2026.11.11.09.04.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 09:04:29 -0800 (PST)
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
	Yun Wang <7z0423arsenova@proton.me>,
	Oleg Rybalov <rybalov.oleg.dev@gmail.com>,
	Chris Taraszka <chris@miget.com>
Subject: [PATCH v5 3/4] platform/x86: bitland-mifs-wmi: Add Xiaomi Book Pro 14 quirk
Date: Wed, 11 Nov 2026 18:04:05 +0100
Message-ID: <20261111170406.1634428-4-chris@miget.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111170406.1634428-1-chris@miget.com>
References: <20261111170406.1634428-1-chris@miget.com>
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

Reviewed-by: Mingyou Chen <qby140326@gmail.com>
Signed-off-by: Chris Taraszka <chris@miget.com>
---

Notes:
    v5: add Mingyou's Reviewed-by, otherwise unchanged.
    
    Tested on the Xiaomi Book Pro 14 (TM2424, BIOS XMAPT4B0P0A0A, H484)
    with this series on top of v15. Firmware mode (EC 0x68), DTT OEM
    variable 1 and PL1 a few seconds after each set:
    
      AC       low-power    0x02  ODV1 2  25 W
               balanced     0x09  ODV1 0  45 W
               performance  0x04  ODV1 4  58 W
      battery  low-power    0x02  ODV1 2  25 W
               performance  0x03  ODV1 1  58 W

 drivers/platform/x86/bitland-mifs-wmi.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
index 4bbf38651ed7..c25b4e4c9b3c 100644
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

