Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793965394;
	b=Y/kXf1TGkUOHS9tAPnvVKMJvaYb32XAYIi2GYYV34Fvu2yfdyJXbULOdMHBwTv4zGozc
	 XS7mn/V6PTGbIq2P8uM6mXSlmOb5TDUIs0ytVWh8SU0JdUAjRTbIVgYBSVjQbjAomIEuR
	 IsFWF2Zz6JYVKY+JFcwCbs4NH5Y315Z12ujtaw+FymtRDouVk8ewFTd2w7AuBXYzXjgji
	 jrlfw5caePr78CSh1GnU8OEdJB6YExQi/3wwcZNXCSS41t1DFpKf7+go1ifZU8av1YCC0
	 AaZr285ovfhReioC/UbPuLXk+PYhzTA4jECTMH27yeRD3NGeGJQU/b3AAzx4V8K+gcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793965394;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=VvltagtRFlSaR5juyoaIfz6fk6xoC7R6iygJelqiFGo=;
	b=wmRqSRQOaV8g+nnSUnXIgxlJgSpDCVvfBleaOGfSbCRwZUdz9P0WE4jDuw+gyYxFGgH+
	 m6895xOYJc+1fn6MIBNPXt+w0+hqDyBRq5vZX9Sa66Izl/GSUMLQgmlp/yfaZ9UcrQbC1
	 Y8GoVtix4Q3KdT2pPInskwc4PsgvO0hlFl4nAnlGASe2V2aOcWeJyq82HXfqQIkDv84vA
	 gymPkF2bhQHF3m96Vk3poHmCrydsQ3vUEGSPaAm+q6bOoLzi3JWXKQpqeHYYyTM1snAi4
	 xm5whKcf5UnU3RbrxjEqNZprJqZ46yid6tX/ex/yYV67+00ZZsROGsijJkwbmSe+NjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=miget.com;
	spf=pass smtp.mailfrom=miget.com;
	dkim=pass header.d=miget.com header.i=@miget.com header.a=rsa-sha256 header.s=google header.b=D60vlBkY;
	arc=none smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1B20606A33D
	for <platform-driver-x86@vger.kernel.org>; Fri,  6 Nov 2026 11:43:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1B20606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=miget.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=miget.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=miget.com header.i=@miget.com header.a=rsa-sha256 header.s=google header.b=D60vlBkY
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b566cf56c1so522261a12.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 06 Nov 2026 03:43:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=miget.com; s=google; t=1793965392; x=1794570192; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VvltagtRFlSaR5juyoaIfz6fk6xoC7R6iygJelqiFGo=;
        b=D60vlBkYuKtEqin4bZZJ/HOxOok5oZjszT1y2CO6FHmh17Sun87rGX71po82rRLn+q
         lwj2La/3xfeoaLT+qk4l5qT6xZrwmbjGZccMDYwzdu/0xPiJWqIhlxWdE+8Y2NXbViRE
         o7vqDjtn44xmPj8WU/wUPOtrdU3DV1ii5wqF4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793965392; x=1794570192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VvltagtRFlSaR5juyoaIfz6fk6xoC7R6iygJelqiFGo=;
        b=F22y9/qqT1kwg44DSsowE67Z/ZaBQC84Q8L/3EVMi+BmQFeDmkcDKv2rQ6bEnqam7b
         VPC6DY+IEvTeLn2sSFHyQ6YEFQNjzAWCY/GmqNn3tDDhCpv5bxiE6OxXcqe/7V2LPqGl
         /tBIcppKVcwq8UEcqjpKOQykdtCSbdMsooiOSsWErN/G72nE+OoJvf7R8tkkV5ZPkZ1V
         NSrxObjPbxS06IcErqOO4yYf64HH/EeaYpNq2BrQftrB8SOrYtTVEQHSnbgUwsFaHUID
         2mS2E28P+eRZAMUdv2B0j/CdQjbZTQFXGhtWUmwAOiRAXWqM0EVT36D6wuoNMVt1y8yb
         X6dw==
X-Gm-Message-State: APuU4Z9wrtWrfTvJRBKcYml/WviwHHGTQxO0q1Wsm3ig552gj1+B8oaK
	3rxWaM71sLnTeLM1HQEsaqxqqa/Qh1U1AyrOk0oRGp5/aS5cTkoXozjQ+EO41D9WlO0=
X-Gm-Gg: AYBFou1Q+wgfb7mZIfa17ZIBx+4vRRVKvy7I/JUdguNFF6mF55MYj9dF4bUcysw9Ji7
	Pa1FZ7kks/9Ns0xTRoA4QrDV2uvnIlzzzKR5NRoFf+kw7GXLXvqg+Bs4kI6G01kHsboyR2n6K84
	YZGNdsDcJ8CRP5I0tAGlAWDr5nzaZ5LfOVt2mQF9LYS4S7Oc/XkRFGuPAYIG+tnvsflkVX6X9H2
	OIJ3j/rwJahBLL868V5QwYVOnHG6encIcSVl7BN+BcZDwXqQx+C/IWNhzlL022uOqrC8QcULcaT
	XLiTQYl5eUgb/uiUUJq4osu4G+TKo3BA78xwylpcOX12CFPoAMZOYOxpqLEVxXTnBDbiOZyrrOC
	qtrvpIffZe2C5QZ8XKhG/St0fFCKYx3iSMJ1PsQKfpwO44DVRYf3tAXk4pOI4TyNj2B0uEdPoIY
	YlppP/twkBEjwHp/o92tLlnFwGxJT9wDOptFgP5URu/kY37SjjdsorbLR8JS+a8JKPnFn/wOhMN
	S1215F5QuHZiiG1bEpz7mqPvl355+7JZHPhLexxCnlFZp4QZU/nQWpTWaCRcs2DZonpUarDBSSf
	et/kJiExvm96mmsTkuXI0/OwViBR0nOS6HNrfcmtP3jsaxI=
X-Received: by 2002:a17:907:2d88:b0:c21:9b4b:2690 with SMTP id a640c23a62f3a-c4d34a71f0amr201745966b.17.1793965392124;
        Fri, 06 Nov 2026 03:43:12 -0800 (PST)
Received: from xia ([83.142.187.210])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d356e7035sm71377866b.80.2026.11.06.03.43.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 03:43:11 -0800 (PST)
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
Subject: [PATCH v4 4/4] platform/x86: bitland-mifs-wmi: Cycle the platform profile on Fn+K
Date: Fri,  6 Nov 2026 12:43:00 +0100
Message-ID: <20261106114300.936782-5-chris@miget.com>
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
    Unchanged since v3.

 drivers/platform/x86/bitland-mifs-wmi.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
index 4d02cd9e8a6b..84d1223d0ec6 100644
--- a/drivers/platform/x86/bitland-mifs-wmi.c
+++ b/drivers/platform/x86/bitland-mifs-wmi.c
@@ -100,6 +100,9 @@ struct bitland_mifs_quirks {
 
 	bool return_code_at_end;
 	bool skip_ac_type_check;
+
+	/* Fn+K sends WMI_EVENT_PERFORMANCE_CYCLE and leaves the mode to the OS */
+	bool cycle_profile_on_key;
 };
 
 static const struct bitland_profile_entry default_profile_entries[] = {
@@ -126,6 +129,7 @@ static const struct bitland_mifs_quirks tm2424_quirks = {
 	.profile_entries = tm2424_profile_entries,
 	.num_profile_entries = ARRAY_SIZE(tm2424_profile_entries),
 	.skip_ac_type_check = true,
+	.cycle_profile_on_key = true,
 };
 
 static const struct dmi_system_id bitland_mifs_dmi_table[] = {
@@ -169,6 +173,7 @@ enum bitland_mifs_event_id {
 	WMI_EVENT_MIC_MUTE		= 33,
 	WMI_EVENT_RESERVED_23		= 34,
 	WMI_EVENT_OPEN_APP		= 35,
+	WMI_EVENT_PERFORMANCE_CYCLE	= 40,
 };
 
 enum bitland_mifs_event_type {
@@ -217,6 +222,7 @@ static BLOCKING_NOTIFIER_HEAD(bitland_notifier_list);
 enum bitland_notifier_actions {
 	BITLAND_NOTIFY_KBD_BRIGHTNESS,
 	BITLAND_NOTIFY_PLATFORM_PROFILE,
+	BITLAND_NOTIFY_PLATFORM_PROFILE_CYCLE,
 	BITLAND_NOTIFY_HWMON,
 };
 
@@ -869,6 +875,10 @@ static int bitland_notifier_callback(struct notifier_block *nb,
 	case BITLAND_NOTIFY_PLATFORM_PROFILE:
 		platform_profile_notify(data_ctx->pp_dev);
 		break;
+	case BITLAND_NOTIFY_PLATFORM_PROFILE_CYCLE:
+		if (data_ctx->pp_dev)
+			platform_profile_cycle();
+		break;
 	case BITLAND_NOTIFY_HWMON:
 		fan_info = data;
 
@@ -1015,6 +1025,7 @@ static void bitland_mifs_wmi_report_key(struct wmi_device *wdev, u32 payload)
 static void bitland_mifs_wmi_notify(struct wmi_device *wdev,
 				    const struct wmi_buffer *buffer)
 {
+	struct bitland_mifs_wmi_data *data = dev_get_drvdata(&wdev->dev);
 	const struct bitland_mifs_event *event = buffer->data;
 	struct bitland_fan_notify_data fan_data;
 	u8 brightness;
@@ -1043,6 +1054,15 @@ static void bitland_mifs_wmi_notify(struct wmi_device *wdev,
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
-- 
2.56.0

