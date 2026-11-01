Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793544073;
	b=JA4a16/b6JnuBH0Y48Yk3+RsgCl+vChze0LPm5owgC+di5lShc/SvzpaBnbyZ45ktTkb
	 iVFuovOBPGDL6Yd+axnAj4etGspiQiFm8kASoZC7sJrRax/nqqkLmIoY7XC8z4WWY2xA0
	 E4lTntWHwT3fi8+bHtaA46aNCD9iNPG5zBoQBhjKQCGyGACW7ixOAUrad2TZLVWUFbzZL
	 BpQPg8GouDenE3M0FyBtAmXwXoOtbd0gMERpflMjlBZXCOR4oMD1qDwNH082yNby2RmoX
	 kV/ZqvexQ6YGbUg3kCDBS6h1pDOTqn9uJy/2Sj/EEljHc3wpz7eAfmpbbqq+/UoIPHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793544073;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=mnSYrptRMC/FkWaFEkTHqDgg2uSj3h2N3QT8hvMorB0=;
	b=kaFfekpMRAJlpESCRNw0PiwaL8p5qvOOK4hhkKtyfg2Y0DqWGPt0RYa+GJJ/qGfRU0AY
	 seGjpqzmi573w5P9G1N5o28poSpVFL8+ddYz5V2vVqd75D8hTbqP1M3DF7zn/4f6ayZ7Y
	 h0uV0K/u6Pk7EDWT1ipzActOugp8yd0k9qaH8XOn9vEGKyIzhQx7fBBFOA3/tJBPf7NTn
	 Krl2TrHbBQWsEKPQTbKiMzFLU8M2CAo1dZ9fg7Ek8rJTcEtuDoVoLipvegFoAiQlOViDC
	 KIt/UxXwQf/g6kf5XuTuL71MlWOAd8ywOQPP72Ae+OV5XTyDabTtw2a4l6f1k8gum+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=miget.com;
	spf=pass smtp.mailfrom=miget.com;
	dkim=pass header.d=miget.com header.i=@miget.com header.a=rsa-sha256 header.s=google header.b=VD6J8csp;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2401606A324
	for <platform-driver-x86@vger.kernel.org>; Sun,  1 Nov 2026 14:41:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2401606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=miget.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=miget.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=miget.com header.i=@miget.com header.a=rsa-sha256 header.s=google header.b=VD6J8csp
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c38ac26cc5dso352005566b.2
        for <platform-driver-x86@vger.kernel.org>; Sun, 01 Nov 2026 06:41:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=miget.com; s=google; t=1793544070; x=1794148870; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mnSYrptRMC/FkWaFEkTHqDgg2uSj3h2N3QT8hvMorB0=;
        b=VD6J8cspc0NNmny+qbMZvGLxpDGUmpsaX86nfBqAzTmDkZPhljuwy5Mu9euHWOzkPr
         LjbO3mZR7pLmL8IqVpG3y5V+ZXh4nCzB1zbjMmh91Gz6kBgQXjv9tHTWebklnnhML16Z
         lR6gYrvwakuhZUH/WSZisCwWfy+5tRas4dNWo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793544070; x=1794148870;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mnSYrptRMC/FkWaFEkTHqDgg2uSj3h2N3QT8hvMorB0=;
        b=XApAnb6wfLJMw1AVA9cmpPG4t/iMADR2io3AnRAs30IwhtGIP518kTKslke/HV3PoT
         O4ruJF1j5TG68QLfldAGJD/DYvjxhFb3omNZag5JCVlK3zwtrMp/nAiiP4e9q9Uy8no6
         MFIOPkeYYRmd813eP/Cq19/Zs1gIytKZLWIFjTVZ8HKUCFxgqF1xOJhj9T976b35pFWd
         v0KM2yOrmX/8ti07XGR9aYXZDfAWhOQifLHdDogGqBXW2Ql7At0zYAqTKn+Z1tEjlyQT
         GYJVRl2lyseeOH0xSzSubFlP0QUAmm47WgCcnFZYjYgXucC68T6hv7PvvsqcefGgHkkz
         I8LA==
X-Gm-Message-State: AFq9FYI5sq/reqKC7WG+8WzOsor4aBQ62yPF+DfceYNjR7ONeHpHuzX7
	F1x4eP1+Mj3K9Amy42euO+qSVab2iH0oD3TTc/XEqRzo4n0G64iUhCrBVA7IUiLF1uI=
X-Gm-Gg: AYBFou0F9saUKIReFtdt5LMRXlSbTEXDzceKhBGxdacNxM8u/2qgxX2KQi2h10vZd0y
	+LzxmKMAVcBzzMBhZPJRVGJTtmjWnFD1MRYh5pQmV7NVYmdpbSVE3iE10Mjgehn/Dq5k8K0y7lP
	Ri0ZcWrDGR+bMolixcUn2lYHt3NFhdleKLkRl9TkehvfMk6QWouxxQaBlr4xgbqaWkw9tyc++5L
	INEhYsZqyQ+FQBxErPUMINc2BeUhkMicdlxSGxUh+C4WvNA86Ejd0Vie93Jww9rKO2JI0J2Yuww
	WdKGxtDWh3VJ9FyqQCiHQ8Bik326OGvfC52dj2smCZlJWPomAMdvjI4sZGdB9DQMy9BJFLJZjs9
	rQTulFXz/gaFDY8mSJDKvXfde2mI9lFkcaZ90ENGqhOX53dp7nmAfTh69DkPH6CgKcwySV4gKmk
	IMe/YdNrVJ0cihmZ7LM+Q5VYqFDdZUziSRq3aRe7bU4e8q6gKMvbDOzgWtuoeipouAWrn47klaf
	yzal/8R0n4Gtj3tT2Wk6FNDYhi+Hd879bHxCNtdLCUPJuMqVteTDblSk28vowtR56cMHR68adK9
	o3zW9Cnox9h7dp7YTEDgpIewaxEVcdrKG4qnH6hqVPv2k9wAWLwfV4RhgdQFQEMaaMb2Hw2kQv4
	3Lv0T
X-Received: by 2002:a17:907:868a:b0:c40:231:6eab with SMTP id a640c23a62f3a-c4ca7a4e651mr602881766b.16.1793544070508;
        Sun, 01 Nov 2026 06:41:10 -0800 (PST)
Received: from xia (user-46-112-84-13.play-internet.pl. [46.112.84.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabec09fcsm280158866b.71.2026.11.01.06.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 06:41:10 -0800 (PST)
From: Chris Taraszka <chris@miget.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mingyou Chen <qby140326@gmail.com>,
	Ilya Gladyshev <ilya.gladyshev@linux.dev>,
	Armin Wolf <W_Armin@gmx.de>,
	KentoNion <kento@kekto.ru>,
	Chris Taraszka <chris@miget.com>
Subject: [PATCH] platform/x86: bitland-mifs-wmi: Cycle the platform profile on Fn+K
Date: Sun,  1 Nov 2026 15:41:00 +0100
Message-ID: <20261101144100.1043263-1-chris@miget.com>
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

On the Xiaomi Book Pro 14 (TM2424), Fn+K sends hotkey event 0x28 and
the firmware does not change SystemPerMode itself. The event is a
request that the vendor software acts on; without that software Fn+K
does nothing on Windows either, and on Linux it is currently logged as
an unknown event.

Add a quirk for this and call platform_profile_cycle() from the control
device when the event arrives, so Fn+K cycles through the profiles that
all platform profile handlers support. Models without the quirk keep
ignoring the event.

Suggested-by: Hans de Goede <hansg@kernel.org>
Signed-off-by: Chris Taraszka <chris@miget.com>
---

Notes:
    Tested on the Xiaomi Book Pro 14 (TM2424, BIOS XMAPT4B0P0A0A) on AC,
    with Mingyou's v15 and my two TM2424 patches, loaded on v7.3: four Fn+K
    presses step performance -> low-power -> balanced -> performance ->
    low-power. The bitland and SoC Power Slider handlers and SystemPerMode
    (EC 0x68) follow each press within a second, and power-profiles-daemon
    picks up the change.
    
    Depends on Mingyou Chen's v15 "Merge redmi-wmi into bitland-mifs-wmi" [1]
    and on my "platform/x86: bitland-mifs-wmi: Xiaomi Book Pro 14 support"
    v2 [2].
    
    [1] https://lore.kernel.org/all/20261028112742.674847-1-qby140326@gmail.com/
    [2] https://lore.kernel.org/all/20261025195456.43414-1-chris@miget.com/

 drivers/platform/x86/bitland-mifs-wmi.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
index a72569d810e3..8a994f5b089e 100644
--- a/drivers/platform/x86/bitland-mifs-wmi.c
+++ b/drivers/platform/x86/bitland-mifs-wmi.c
@@ -99,6 +99,9 @@ struct bitland_mifs_quirks {
 
 	bool return_code_at_end;
 	bool skip_ac_type_check;
+
+	/* Fn+K sends WMI_EVENT_PERFORMANCE_CYCLE and leaves the mode to the OS */
+	bool cycle_profile_on_key;
 };
 
 static const struct bitland_profile_entry default_profile_entries[] = {
@@ -125,6 +128,7 @@ static const struct bitland_mifs_quirks tm2424_quirks = {
 	.profile_entries = tm2424_profile_entries,
 	.num_profile_entries = ARRAY_SIZE(tm2424_profile_entries),
 	.skip_ac_type_check = true,
+	.cycle_profile_on_key = true,
 };
 
 static const struct dmi_system_id bitland_mifs_dmi_table[] = {
@@ -168,6 +172,7 @@ enum bitland_mifs_event_id {
 	WMI_EVENT_MIC_MUTE		= 33,
 	WMI_EVENT_RESERVED_23		= 34,
 	WMI_EVENT_OPEN_APP		= 35,
+	WMI_EVENT_PERFORMANCE_CYCLE	= 40,
 };
 
 enum bitland_mifs_event_type {
@@ -216,6 +221,7 @@ static BLOCKING_NOTIFIER_HEAD(bitland_notifier_list);
 enum bitland_notifier_actions {
 	BITLAND_NOTIFY_KBD_BRIGHTNESS,
 	BITLAND_NOTIFY_PLATFORM_PROFILE,
+	BITLAND_NOTIFY_PLATFORM_PROFILE_CYCLE,
 	BITLAND_NOTIFY_HWMON,
 };
 
@@ -792,6 +798,10 @@ static int bitland_notifier_callback(struct notifier_block *nb,
 	case BITLAND_NOTIFY_PLATFORM_PROFILE:
 		platform_profile_notify(data_ctx->pp_dev);
 		break;
+	case BITLAND_NOTIFY_PLATFORM_PROFILE_CYCLE:
+		if (data_ctx->pp_dev)
+			platform_profile_cycle();
+		break;
 	case BITLAND_NOTIFY_HWMON:
 		fan_info = data;
 
@@ -921,6 +931,7 @@ static void bitland_mifs_wmi_report_key(struct wmi_device *wdev, u32 payload)
 static void bitland_mifs_wmi_notify(struct wmi_device *wdev,
 				    const struct wmi_buffer *buffer)
 {
+	struct bitland_mifs_wmi_data *data = dev_get_drvdata(&wdev->dev);
 	const struct bitland_mifs_event *event = buffer->data;
 	struct bitland_fan_notify_data fan_data;
 	u8 brightness;
@@ -949,6 +960,15 @@ static void bitland_mifs_wmi_notify(struct wmi_device *wdev,
 					     NULL);
 		return;
 
+	case WMI_EVENT_PERFORMANCE_CYCLE:
+		if (!data->quirks->cycle_profile_on_key)
+			break;
+
+		blocking_notifier_call_chain(&bitland_notifier_list,
+					     BITLAND_NOTIFY_PLATFORM_PROFILE_CYCLE,
+					     NULL);
+		return;
+
 	/*
 	 * The device has 3 fans (CPU, GPU, SYS),
 	 * but there are only the CPU and GPU fan has events

base-commit: c339f4010dea8b0d754f84ace70cd1b089878ef8
prerequisite-patch-id: 99b10cd2b70d630ab65d8a8bb02c1d4bf89b1a63
prerequisite-patch-id: 27db041f827872b8be142c310a14c79962154bd5
prerequisite-patch-id: 74fc3298fa3dceb2224dfc3d2ae4cc6d4be61c01
prerequisite-patch-id: 254b8455d8a7f56b730e842207d91bd6904a50ce
prerequisite-patch-id: 9708c81da6b4ed6c2d47eb927efcd64ce4ed2ecf
prerequisite-patch-id: 2fe8c043993034f1a2cde98b1b2e299987d5ac7f
prerequisite-patch-id: 36137eee73ea8cee3db81af887f1f0859ef02b3a
prerequisite-patch-id: f0ba644539dc52241b96a74d6e32a6f06241e577
-- 
2.56.0

