Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792505678;
	b=gZ9zx9HPhKLargsSQU41bHFdJCGnznW9pW16bTxpGy2N4E27T34UT81pePXq58T3QPf/
	 x4ivYEJ3y8xtcW7e+XF1+gXyIauf0+goB40UO7QdvspMwwba6CuLbr5Pksx6+hpb7a2Vx
	 +q0O3gsmcvFtO/ub9pwGokTdG7trRw4Q5OpnWEobdbrRlbQ/EyWNa7EvEZ5OuKlMhgyY/
	 jJlbHz1XbYCYajMxHty9iBNzNeOrTAqaAQ+51uM067J0UUClkWLZQqapez1gIlqULEnjE
	 lOBFQgqrr7BSAypwc2bgxYqrEefn8qh4p/nmkd0CgPN0UT4K9YKnxXC2GQ0ZJnUXS4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792505678;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=sQFeKDZLpv+uAiBMOa7dMDV/Pt3XjThlBAiwUAdIC5E=;
	b=aiWerkIQfayg7LxM0yDYuWcUkIQ9Ke3i2pHvna4F3YPWjkIcmqfpG+8krpJqaDkqq6zQ
	 dAoY3jznQSxX4mHtASP8gsptAEkjHx6W0MHHHiMBsNjpMtOieoMx2E14GBu5vLqGW4R4Q
	 zYBCxkQMSABa/W1CVHgo9Qb8Cv0AjZHQ0s9Qg2OcwsobcLZzj27imztLRpkIKglq2LKu/
	 rCUfIDZx7PSfhTZ+LqdWXq8zIVS2IAwgXh4N+gS7ezCcmJMGR39V6StddNeaUBktPb8K/
	 oekTbiarpNmv2E6boyNdRj8A6AnbkmVRR01nyF4hWII2lVBeQRs1gAScBuvhkPaQ2fA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OfKQXqCI;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBF63606B260
	for <platform-driver-x86@vger.kernel.org>; Tue, 20 Oct 2026 14:14:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBF63606B260
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OfKQXqCI
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48df4e9d2d4so2123121f8f.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 20 Oct 2026 07:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792505676; x=1793110476; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sQFeKDZLpv+uAiBMOa7dMDV/Pt3XjThlBAiwUAdIC5E=;
        b=OfKQXqCInK3LtSb1jx4q1SvB4vwl6ZrdV9HwES02TbcwjQOZTVufMk2crhU/fXbUGJ
         oELaP5oYO8v25uh3SbUuip0awB/N88AJrABUWQ2vKTKyV/BOGANz6i4/4kXD4n/83PPC
         kimVCL2sYyZaByzeY83hU1Hmi1jL9ePU8OV1bor+4GX23gUCrdQEYBRXpO86dZGzKr3t
         U4b57M6aPC9iM7NOfyvHTgiKjIXei2zpgCYYxhackgw7tGp3jsmodMCH79vP6K+M4K5B
         gMkZ7kpe8NY4TXUDx4Zyu0rBcipV/leUEfwu7JboZw29EiFL1bbAIMNtOo0BgCNDpdjP
         /SdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792505676; x=1793110476;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sQFeKDZLpv+uAiBMOa7dMDV/Pt3XjThlBAiwUAdIC5E=;
        b=z2ZBZgxX8H73DTcsjCsu/CWCj1Z85rZLzqzPoSIfD4Z4iM8rY92SV+RYQQp+VwAMwM
         zQU+Ztm6jprXmNzyw0n4QAUyjS/vNqKaL2r8Mo+HZs7CfjckdDJbpec3kC91CCj2lvRp
         T+U691SHgsKdZ7jMpEFenqSvE9B6w6vx2eVadVFjiWr9vTeH7AJzDrmip72jkMBfoRaW
         WNs2e78E3ThZBrLlqp762uG2VqfVtp8BMGh0e43nhIqSHh5UR4u3VVT3FkG5hNv1RD6j
         je4T0OHLbI01F7ZZfaoFt2Yxvv1Ybk6g90CnISWjFQEn9UOMUiv0ZeSaIQEf3c5809SG
         wQcA==
X-Gm-Message-State: AFq9FYI3beu149Owm82vKcksPpPnMpzPD6/jJqCzbdmiHr3XZR/5fUoi
	51tbWJS4BkJ9tT0pg8OJDTO01+5huh5CfQJuY3yQq1ouWppgisEYZ2O6
X-Gm-Gg: AYBFou1kVEjHV8oc3yVmuoVU0lJwLgp3uU9NArfLjbMQPu54BQxdHoUMccqX/51fsVh
	lkTqOkCciBn8Ah4j9b+eW/WixxufGXiL75MhrHZRY6r4J45EXeVmBJIdHeg0oqh/sGIeCpvKNga
	cioROgnN6W3tnK1e0vtRu90hyOdIh5hmdd9q6q8Jm8lw5g9Xp0EGzYX8JpBMa86xUnZhuVLOb6i
	WhHSLc9Jk9YNt0Ty37LqhTYiCYYtMo1jdO7n0Vutks6BIcLJ1a984DW0MzcaznXPAhgSAMKykUo
	zLwJwIklceos7TcS+rL3qSqy7H8mU9euXB1eSuw5f4lXdiJoGTEIUCA1leqwAFaHuTKrKfFiJTX
	3EknmXcCEg1PWn3NCXFREk5Lsulo1azW95z2OPNRdwyJ+okyaPSI028jg5q5N4Uo5tWRjYcVND6
	O6KPgIWNr3CJZ8sK0A2nd5cQIY5keW6HtqskZq40XcifKRFGfaQ3aYJTvvJNaYRks4gk8YQp/SP
	CKUdeu+yk8kdWBQIySfI5y7s2NDVgxm+TnYrwOVKSrugX6jCR6SQdgFPm3d46pfpwG4I3q9OnEX
	Gk2X2npCqXMFmLrSualkfjLfTO/D/HKtQkQQl3CN85c=
X-Received: by 2002:a05:6000:186e:b0:48d:ee0d:8b3d with SMTP id ffacd0b85a97d-48e07f9d49fmr25091594f8f.28.1792505675613;
        Tue, 20 Oct 2026 07:14:35 -0700 (PDT)
Received: from archlinux.cern.ch (ppilicho-1.dyndns.cern.ch. [2001:1458:202:228::101:227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d80f9cdsm6256287f8f.11.2026.10.20.07.14.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 07:14:35 -0700 (PDT)
From: Patryk Pilichowski <pat.pilichowski@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Patryk Pilichowski <pat.pilichowski@gmail.com>
Subject: [PATCH v2 1/2] platform/x86: msi-wmi: Sort scancodes numerically
Date: Tue, 20 Oct 2026 16:14:26 +0200
Message-ID: <20261020141427.1580282-2-pat.pilichowski@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261020141427.1580282-1-pat.pilichowski@gmail.com>
References: <20261020141427.1580282-1-pat.pilichowski@gmail.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The scancode enum is grouped by model, so the values are not in order
and are hard to follow. The grouping is not meaningful either, as the
same event codes are used across MSI models.

Sort the enum by scancode, give every entry an explicit value and use
lowercase hex.

No functional change.

Suggested-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Patryk Pilichowski <pat.pilichowski@gmail.com>
---
 drivers/platform/x86/msi-wmi.c | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/drivers/platform/x86/msi-wmi.c b/drivers/platform/x86/msi-wmi.c
index 05c35133a1b3..5369ac28f4c5 100644
--- a/drivers/platform/x86/msi-wmi.c
+++ b/drivers/platform/x86/msi-wmi.c
@@ -33,25 +33,22 @@ MODULE_ALIAS("wmi:" MSIWMI_MSI_EVENT_GUID);
 MODULE_ALIAS("wmi:" MSIWMI_WIND_EVENT_GUID);
 
 enum msi_scancodes {
-	/* Generic MSI keys (not present on MSI Wind) */
-	MSI_KEY_BRIGHTNESSUP	= 0xD0,
-	MSI_KEY_BRIGHTNESSDOWN,
-	MSI_KEY_VOLUMEUP,
-	MSI_KEY_VOLUMEDOWN,
-	MSI_KEY_MUTE,
-	/* MSI Wind keys */
 	WIND_KEY_TOUCHPAD	= 0x08,	/* Fn+F3 touchpad toggle */
-	WIND_KEY_BLUETOOTH	= 0x56,	/* Fn+F11 Bluetooth toggle */
-	WIND_KEY_CAMERA,		/* Fn+F6 webcam toggle */
-	WIND_KEY_WLAN		= 0x5f,	/* Fn+F11 Wi-Fi toggle */
-	WIND_KEY_TURBO,			/* Fn+F10 turbo mode toggle */
-	WIND_KEY_ECO		= 0x69,	/* Fn+F10 ECO mode toggle */
-	/* MSI Claw keys */
 	CLAW_KEY_VOLUMEDOWN	= 0x21,
 	CLAW_KEY_CENTER		= 0x29,	/* MSI M-Center main menu */
 	CLAW_KEY_QUICK_LONG	= 0x2a,	/* MSI M-Center quick access long hold */
 	CLAW_KEY_VOLUMEUP	= 0x32,
+	WIND_KEY_BLUETOOTH	= 0x56,	/* Fn+F11 Bluetooth toggle */
+	WIND_KEY_CAMERA		= 0x57,	/* Fn+F6 webcam toggle */
 	CLAW_KEY_QUICK_SHORT	= 0x58,	/* MSI M-Center quick access short press */
+	WIND_KEY_WLAN		= 0x5f,	/* Fn+F11 Wi-Fi toggle */
+	WIND_KEY_TURBO		= 0x60,	/* Fn+F10 turbo mode toggle */
+	WIND_KEY_ECO		= 0x69,	/* Fn+F10 ECO mode toggle */
+	MSI_KEY_BRIGHTNESSUP	= 0xd0,
+	MSI_KEY_BRIGHTNESSDOWN	= 0xd1,
+	MSI_KEY_VOLUMEUP	= 0xd2,
+	MSI_KEY_VOLUMEDOWN	= 0xd3,
+	MSI_KEY_MUTE		= 0xd4,
 };
 static struct key_entry msi_wmi_keymap[] = {
 	{ KE_KEY, MSI_KEY_BRIGHTNESSUP,		{KEY_BRIGHTNESSUP} },
-- 
2.56.0

