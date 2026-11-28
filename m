Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795852358;
	b=dICVNg+A9Zjxl7+dxeCqY6gb49/TEiGq4IS+Ieqd33SFvOzBdtadcf9DfDBxWAgPgw2c
	 BFxaFC8nGlPdxC3sAbRXlefbiRB+k8TdKl/YkeuI/B0nzTY9NVCYvvFe7DZ+FOpLsqAmg
	 iWtFazC53sm/bYt+63uRI27Kbg0SHqZMLOQhxjEwKiFHJSGfG4trklDXVMqOh5Zks/LCq
	 D2F2K0DDGXRbW0aYnOWPHfSwGyT9UuWpktBTmnoMoSp6OKcwSIE8WJWspr5IB2yY601kB
	 ORgoCapcdaxlXzc/P7zQhoZg2UGvdJxBTsHuBPxt/DHjCRCGGgV/0HagPBRQHVwUw6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795852358;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=ZPuz0aqvMOYLLk2Z9FL7zt4DuCqrFJ7GN1kkziqWaY8=;
	b=g+GY3GcWPyFoYQatcN4h3A+4Eo14SQAdq2DasBx071AB2/uEzcftG2paw6G2tMu7xw3r
	 RqKCdpRqt1BEwyp8a3rbzvBGTzfD8Pyv9U8Ib/XCsq4f6HHVHeuwM2laIGJ7duabHmsQU
	 i6QxhvuI0A1yG5Lq7eQJK5dKVpeChtOKK2S5GdHvhUF7Ezag5hx/ECUnUAR594qNc1buk
	 8DpIzcFEnBIIfiWFJBp4gvi6GvOOn+kHmiHfh4APTro1zn+PrtNfxMAg9OqT9RJwqv2Gz
	 SG/IJ5lEL0mdOlnooM5jeRLICXJS/RECzlmXDyoKNzk8+nKiNf1thPIM9weZ1NPBU8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BbyezwKj;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3275606A31F
	for <platform-driver-x86@vger.kernel.org>; Sat, 28 Nov 2026 07:52:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3275606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BbyezwKj
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bb77a462c6so69981465e9.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 27 Nov 2026 23:52:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795852356; x=1796457156; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZPuz0aqvMOYLLk2Z9FL7zt4DuCqrFJ7GN1kkziqWaY8=;
        b=BbyezwKjKHetbW0yBPvFepOzP6bRLylD0c8hEytcXsT7aDXr4hsXJ5qz+slXLtNaCh
         jas3uiMCeNQx/f82HM2LwjLcL8KOWoBL0MhxrH7b/hVRK+tzcn8cF0pLSDSpSMr70lke
         NsTuUOAGpfSkM/osGxk7ldgXq/uFjLPPU6W6+SaPcRnRvoCQ8tY2z4KkjYDb8i/ha1q2
         bRIO03gnb/DBJ+REmac3oQ7+qDxmiB3HxOPPczqKvml/EWrvXpruSdQn0bxnOnRoBFK8
         dQpi1sKfYWvA7ovl70n1AS9MlWiqh3mIiZO3bhItwH0bJB8UVqus/t9AXjxlVwiQ/73a
         xodQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795852356; x=1796457156;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZPuz0aqvMOYLLk2Z9FL7zt4DuCqrFJ7GN1kkziqWaY8=;
        b=UeVyEn89CWOVJQJKOmsE5uOUROJga+ZKzRUhfKDEcn5WDrbrHAKjVc4kyVSjf3UIDN
         Fn0slKrZ7MAEhbAiPoK0HzXYDfpjrEY+R9d2ljOR8doCL+g6HMfcvGBtoshosPgnZwVR
         dT8NgQQT96qhsETMEi/hnZh4FcG4QLAki2q+6MS7A4SR27YzGPIxp1U58QLNu6HPd8Ss
         ibECFXLPm2I6VXTG3bjVjQMQDLnH4u6VRuU0bF3zyeZgyQhRnquGFMBsQuAp0o4Sz8py
         lHp6CRtruVizB03Z2SqIqv89UmEz4KavH/6q1rkgpNP/MWBu9PHChOWEOksy6YCrEvxp
         beiA==
X-Gm-Message-State: APuU4Z9xqdAcpi9nrPUNA2nIKoDdUiqYpu/31dvv+dcLm+WjSUjkjShh
	qgNeIqh3xOOSuuFUySERXfMgE0OrCXXI5uBUrlYFwFjGaDBfovktB2Kp
X-Gm-Gg: AZFdTZdK6zFkDfR97Mgrb6A/OPygmRednJEk4DuyCEsYX+w2dLYiLPZJNjEl9EK6Rkj
	UUWTHj3HxauojGXNQFQJcX8H2sB6pU/unnRyX+o6FqzI6viPMU0EIaKaAn2slOIpE9jBTgRM1VE
	oNYTlumNNbiLOGENzdqBCweEmGH1aH4DyRx4mfVuf05RL2ZcF0ybGKgWoXrOPere4JNQxS8Up8Y
	SyQC+3YaJ6RxIc6fRFZ0JMm6XmYCwWM3oAIZpHqELZZJT8T8/p68hYhzF9sMnYD150MVvGYu0qk
	Uv4hkAK+zDNKCXWA5wxJ6qCpX24/5sRJi1llzBJq8pL3WsoCGAWVh15hL4fNzJXKRN50g2mtTPH
	zayIfLA4pRrjxtPXv+/j+pIZoRopGdSb+ZZKaCB2iLT9R1MB9mHklg/B/cwyg3kk6Pvx+/cZrxd
	zs9DcZtwGVjbmEI10pRFzDpPV3fPJtu8SOatjWF9Mkj8bgUSewdDFb0G5EBdsHGaI1GINSK/OBA
	KKPdePTPCiPxpObiLg9P4BLAcjb9+/9oriz12AoGH4yF5ZUVuDnIQ7JXu81rtCw7ihs6wcPhrdt
	AukTg4an2OsSaqW1NkcikQXttRIGyFxpMBw5kUNiqJ9nrbKsCm+fUibXOkgYEgoPfDC6i1PA1XV
	B5AQuAKwX6ZBz
X-Received: by 2002:a05:600c:828e:b0:4a2:526b:d40f with SMTP id 5b1f17b1804b1-4bb88785898mr559271445e9.0.1795852355939;
        Fri, 27 Nov 2026 23:52:35 -0800 (PST)
Received: from wlqmpek ([109.245.169.95])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9067846esm538208405e9.4.2026.11.27.23.52.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 23:52:35 -0800 (PST)
From: =?UTF-8?q?Milo=C5=A1=20Vlku?= <vlku.milos.fun@gmail.com>
To: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	qby140326@gmail.com,
	ilya.gladyshev@linux.dev,
	uselessfire@gmail.com,
	=?UTF-8?q?Milo=C5=A1=20Vlku?= <vlku.milos.fun@gmail.com>
Subject: [PATCH] platform/x86: bitland-mifs-wmi: Add Xiaomi Redmi Book Pro 14 2024
Date: Sat, 28 Nov 2026 08:49:12 +0100
Message-ID: <20261128074912.20008-1-vlku.milos.fun@gmail.com>
X-Mailer: git-send-email 2.56.1
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

The Redmi Book Pro 14 2024 (board TM2307) uses the same WMAA method
(SSDT with OEM Table ID XMCC1806) as the Redmi Book Pro 16 2024 (TM2309)
and stores the WMI_FN_SYSTEM_PER_MODE value directly in the EC register
QFAN. NTDP in the DSDT maps it onto the DPTF variable ODV1:

  QFAN  mode        ODV1
  1     balanced    0
  2     quiet       2
  3     Turbo       1
  4     full speed  4

Map these as low-power 2, balanced 1, performance 3 and max-power 4.
Fn+K only cycles 1 -> 3 -> 2 and never offers full speed, and
power-profiles-daemon maps its "performance" profile to platform_profile
"performance", so full speed is exposed as max-power and is only used
when chosen explicitly.

GET returns QFAN for 1..4 and 0 for anything else, for example a 0 left
by the default mapping, so read 0 back as balanced. Writing 0 is not
useful: from the same 80 C start at the same power, the package cooled
by 15.2 C in 150 s at QFAN 0 against 29.5 C at QFAN 1 (n=4 each, no
overlap).

The firmware also accepts Turbo on battery (QFAN 3 sticks with no
charger connected), so add a battery entry for it. WMI_FN_SYSTEM_AC_TYPE
is not implemented on this firmware, so skip the AC type check as for
the other Xiaomi models.

Values measured on BIOS RMAMT4B0P0B0B (bios_release and
ec_firmware_release 1.11).

This change was prepared with an AI coding assistant (Claude, by
Anthropic), which read the ACPI tables and driver code and drafted the
patch. The values and behaviour were measured on the hardware by the
submitter.

Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>
Signed-off-by: Miloš Vlku <vlku.milos.fun@gmail.com>
---

Notes:
    Tested on the TM2307 on top of pdx86 for-next (61c0dac952b9), built for
    7.3.6 for the hardware test: all four profiles apply and read back as
    expected on AC and on battery, a stale QFAN of 0 reads back as balanced,
    and power-profiles-daemon's power-saver/balanced/performance map to
    QFAN 2/1/3. Builds cleanly in-tree with W=1.
    
    Anton: when we compared tables in October, the TM2309 matched these on
    every point, so the same entry should fit with a second DMI match on
    board_name TM2309. Happy to add it here if you can test it, or for you
    to send it on top.

 drivers/platform/x86/bitland-mifs-wmi.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
index f71c93aff..9bf705d4e 100644
--- a/drivers/platform/x86/bitland-mifs-wmi.c
+++ b/drivers/platform/x86/bitland-mifs-wmi.c
@@ -139,6 +139,22 @@ static const struct bitland_mifs_quirks tm2135_quirks = {
 	.skip_ac_type_check = true,
 };
 
+/* GET reports 0 for an out-of-range QFAN value; treat it as balanced. */
+static const struct bitland_profile_entry tm2307_profile_entries[] = {
+	{ PLATFORM_PROFILE_LOW_POWER,	0x02 },
+	{ PLATFORM_PROFILE_BALANCED,	0x01 },
+	{ PLATFORM_PROFILE_BALANCED,	0x00, .no_set = true },
+	{ PLATFORM_PROFILE_PERFORMANCE,	0x03 },
+	{ PLATFORM_PROFILE_PERFORMANCE,	0x03, .battery = true },
+	{ PLATFORM_PROFILE_MAX_POWER,	0x04 },
+};
+
+static const struct bitland_mifs_quirks tm2307_quirks = {
+	.profile_entries = tm2307_profile_entries,
+	.num_profile_entries = ARRAY_SIZE(tm2307_profile_entries),
+	.skip_ac_type_check = true,
+};
+
 static const struct bitland_profile_entry tm2424_profile_entries[] = {
 	{ PLATFORM_PROFILE_LOW_POWER,   0x02 },
 	{ PLATFORM_PROFILE_LOW_POWER,   0x0a, true },
@@ -169,6 +185,13 @@ static const struct dmi_system_id bitland_mifs_dmi_table[] = {
 		},
 		.driver_data = (void *)&tm2135_quirks,
 	},
+	{
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "XIAOMI"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "TM2307"),
+		},
+		.driver_data = (void *)&tm2307_quirks,
+	},
 	{
 		.matches = {
 			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "XIAOMI"),
-- 
2.56.1

