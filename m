Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793549919;
	b=DyulXuaPS4VCOBaMMhonfbmZxDyHwe2p1g0+kU7liv4W0nz1B1BKffjuMRynMXJ6B8bM
	 ewcsMaRJ8jz30KhtOTjblz+kHIToXngUYbxPK9Bs/40FjgTIGViWj99mjBZHAjV0mfBFB
	 zG5Br7nAjM0a9uGid6tThOI5TZFeme6nafvxo+W87+cs1CtY0PDagdk0O9inK+knw2/+l
	 +aJMoL3E9Nw2SXhn6a1rHm83SS5R6obH+LQ9wHHhLNvvsS8VGEvLX4On0FwBrvV8Jnpvl
	 LCwPm9Yl9lxEc+cezNAJvuuXzWPOer0Z5IEIImcVbd9JodhN3Rt8OXp4YaxIQj2hYZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793549919;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=KD97VjyXdQClOVo1RSdQ9q1bT41yOQD/nN6rmJRrC9s=;
	b=RN1Hu2YvS/NUPXjKw9xo7Ls6Wvu7jlTFOWGqeEC/Benbf1f2/ulqi18hEcjAgpO9ohp3
	 tcnPXNfEFUUV283TJ3v+hMc+8d7adjfaVANclQkRcLV/6bUH7v5owpP0BeBUNxucjF/UB
	 RwQW9R83acmv+sUXq1tX2drk/CldAEa1elNBF34TYwgFcxAoAbQ3E0TKp83Xivn2N6tDL
	 IjGEWQ9I8H+IGizGSbf5YT0AWg8bXdQ7RN00l/2Khj6jnmcYpFuBkm2XxF2ptc0hBvAnB
	 v4FdnY5uVBTjBoPQoGIPS08GYq8tf+BvKjeI6vqmiTwIW6wH5jl+/Q/2GPjFjlL90fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=miget.com;
	spf=pass smtp.mailfrom=miget.com;
	dkim=pass header.d=miget.com header.i=@miget.com header.a=rsa-sha256 header.s=google header.b=J0VtC2JS;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1913F606A32C
	for <platform-driver-x86@vger.kernel.org>; Sun,  1 Nov 2026 16:18:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1913F606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=miget.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=miget.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=miget.com header.i=@miget.com header.a=rsa-sha256 header.s=google header.b=J0VtC2JS
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c423b145922so291664466b.3
        for <platform-driver-x86@vger.kernel.org>; Sun, 01 Nov 2026 08:18:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=miget.com; s=google; t=1793549917; x=1794154717; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KD97VjyXdQClOVo1RSdQ9q1bT41yOQD/nN6rmJRrC9s=;
        b=J0VtC2JSILMBXs6fmWROB0jUpEzC71nU1KVw1y/1qF1LVDBcgCnrMVBrW+BouYpAq0
         rhVlBbiSVie+KkvABkZ7QNSs9vzOtGnPcKgb9uWNpVDjjvdw3W5bZPOBpuP4ZBdLJLiz
         qIPLK3JEkltOwbv39LNqL+OeUV7Mkd1w8ObHA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793549917; x=1794154717;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KD97VjyXdQClOVo1RSdQ9q1bT41yOQD/nN6rmJRrC9s=;
        b=GsTfibf0A9aoLByUa9TO7xAzIg9xs1k/lCXigGSjPgy3nE9dWJEW4iCVKD9Q9bvbTy
         a6kugbsHOkVdtTlF3ytkHLPjnpsyBVWbuBcgcMhcq4tVb7eZ7QuJuMldr1qPHkwjPiZD
         du3xg667BlhlLuGlTQuKmrPCjOZ5/DYIr7MW7jKw+QtbWR6nVewBcjEgEMlW9ua7CDdN
         yOvcegnJ38CTfwMD5NGH2G1JpJY1IEA7vXCtCsNPf0OwSvRvR4aU53SYmneKEMLzN8uU
         RZkoNo4GxwBwYsVnEzI5QNpNuxPV1DRu+iwopT/hd+qh/hw6F+86LLZFpWHOdcO9V9nQ
         IkJQ==
X-Gm-Message-State: APuU4Z/IjIBdI0rJ8skK/RWq+c1JMvVPS5R+iIjyc9wpXKp4pROxB7sZ
	ksHInFDuu3/NcRXiotuCPLCCohacVFvebG7BnDPbVfFBc+wDISXnqUEd4TsDIvoCLUk=
X-Gm-Gg: AYBFou1WdfI2j0L3JfjcM7WBd0q5ARo0deQJDnm/YQkA4Pk9fRci/DV9Bgnvhm/C2sq
	OmR1C4zwKo1c5VXeyuVdMHF3MdgcfWZxSq1XmUin+SCcBTqklDsmX53lQBQXCsWlv22W/a/kUKz
	OmYQuZHXLhegl+uriSoDiMpblc0L/twIWeU2yTcXUFC3WL5TVwpWN7C6B9ZwFv0xe9GH7ch5uo1
	MRM6Wk/jgaew7C6kjGKJ8xnRAN79l/TL38/fBn7eBhTjiRWrkx1ekBs9QBgHZQMNbR/HwhMiPvq
	hLuNH0jQxxZcbd0hl61KRinEEU2ECPyuepCx+U95AI/viyblh17lmr8N0A85U9QGwHmzQwxVqxw
	VBg+rKt7AjzbxA2aKPqLiu/S9cJJH1w7dHenZLlysrFLV6vjVn4afuJcn2cqCzzmnh8t/xL8nbc
	u/f5CRH+aNLTpfAyyd7vUoKCOLzuHpCtj1dTXUpTvNBrgEw2unnc4HzbotN80ED3zo4GtB74ZXf
	omFoI+r14cu3/+1axYPIPsVxY71hStVh8gzdOG4qVHeJsN8hayxjJr1CwKV0GkVreIONnQzHRsm
	39w5YrSY0iyOgpFABmeQJrKymxfsxJi16JOJCV6W8MFkokg/c1a1xmGVxuMgWA8//PjluaUhoUP
	of+3MG2rcnbAvH7Q9Yb5lO+HDvG+a
X-Received: by 2002:a05:6402:c514:10b0:6b3:c74e:b287 with SMTP id 4fb4d7f45d1cf-6b4d4c70be6mr3682070a12.22.1793549917477;
        Sun, 01 Nov 2026 08:18:37 -0800 (PST)
Received: from xia.tail836dc0.ts.net (user-46-112-84-13.play-internet.pl. [46.112.84.13])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4ec9fcac9sm2200155a12.18.2026.11.01.08.18.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 08:18:37 -0800 (PST)
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
Subject: [PATCH v3 4/4] platform/x86: bitland-mifs-wmi: Cycle the platform profile on Fn+K
Date: Sun,  1 Nov 2026 17:18:14 +0100
Message-ID: <20261101161814.1325847-5-chris@miget.com>
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
    Sent on its own earlier today [1]. It is now part of the series since
    it changes the TM2424 quirks entry from patch 1. Retested with v3: three
    Fn+K presses from balanced step performance (0x04) -> low-power (0x02)
    -> balanced (0x09).
    
    [1] https://lore.kernel.org/all/20261101144100.1043263-1-chris@miget.com/

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

