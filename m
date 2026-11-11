Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794416674;
	b=rvQjTfS7HC8Vm7IFcsu8PCtafRf4U3KxemPlCvemh87QTHbJJIC+lhAei0iqeXHWxp6S
	 CkUDcuvIx9y9CcsvRs1Lrk57H06yfCQ7cPy6H/AbrP3ESIsIYjlsCpwEvysenZTmaGWiV
	 yeUPkYS0W0eSdTeDiApMXdWot9CUVgwTZLDxv0x7EKCpsdqKSYGRZvByv8HNruevLHafU
	 JEnduL2H6E5ClbSbpBUJgU8PdaEEM/SBQWn0urHlUVeXdM2Z7tc809kivR9UuXCcF6Ttn
	 Rv4W2dCKVCTdpQVVminprlbDcQGHRk/muepugwValakfiTuMNvxO7wlEaBQHU9acSQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794416674;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RolEAT4+t6FcylhdOYbXrrJ6X0Zl+7zwEfQ3Dec59yI=;
	b=sydF81ABbLCe4LDNtTkZ+5mcviLKWGcvYCQjzBGJ6ac6Pi1uPsDuNN2knmYAVnOwv2Ga
	 U/fvcmacsR/bJmFqCEXo+kMJv5MNKFbblih67PtpB5GxBFHTNHWKRoMMijU5T97Add+i+
	 9P/iFfoB/f1kXjwZrnebcXkZkmkTbC3k0P0UwqlP2m9/iUbGVHfP4+2NFnkWYEETes/bA
	 166C28x+SfRejxWUmQAnnDXMji+woWZewilOpgvbSOezi0iGOogbWOVON8Q97MnfeGjIU
	 msipPrjs6wRSo0JAyUP7wEvFljPjngD7oqFQSaZC9XNET/hODvuSuTMePlu8vJKiakw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=miget.com;
	spf=pass smtp.mailfrom=miget.com;
	dkim=pass header.d=miget.com header.i=@miget.com header.a=rsa-sha256 header.s=google header.b=BPNAVtcV;
	arc=none smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F516606A8A4
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Nov 2026 17:04:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F516606A8A4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=miget.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=miget.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=miget.com header.i=@miget.com header.a=rsa-sha256 header.s=google header.b=BPNAVtcV
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b571979178so4536271a12.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 11 Nov 2026 09:04:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=miget.com; s=google; t=1794416672; x=1795021472; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RolEAT4+t6FcylhdOYbXrrJ6X0Zl+7zwEfQ3Dec59yI=;
        b=BPNAVtcVa4TF0xfgsmzPm9h7etfER7IUsXNjJ7yc7ShID3+mCKHoNhCde1Ks1DEnkW
         2rtVawodx5A/MoERBlgBXviG+w8JthaTk7dW8+SnfqSZETz0UtfV2UV0g/LYz8NkH03T
         zLOMrWqffgrq8k50vPEk/yNHIxKkl0Ttu95WI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794416672; x=1795021472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RolEAT4+t6FcylhdOYbXrrJ6X0Zl+7zwEfQ3Dec59yI=;
        b=IP8d8gVDA3bBvzXog4acJSTkdtGQo+p95/bYi+Y5HardNF53EVWCbw2Cz1Tb+r2QH0
         G6+2i5mSG8FArX2hxOX0Y8yANTSv13l/1JlKjU84ybgWup//6vW626B+OYFCvSlPVDci
         uDpW5dE344Vr+EdNNJrP2Sv2J+kCeWxwVluGJwMoLYFI0Zg5I7MiUZ7fq7z8QOR5n/RZ
         CRE4IR+QYuyD2gdLxTxEoLcZRfIjtnTGebEo/zWQqse/vxN/QwfyJc9qcbhfN16pwzMq
         4jRvB/SNKJS+3VdNg3jp241u3ZRcj+TNdojC/wrJIEbs2c0Lai9rfl2efOxUqacXuR1n
         3z1w==
X-Gm-Message-State: APuU4Z81qqrdSvczVfxqK9lh6aqbj+Cz76VJIz7hlnNllLkfM10d9YZL
	fA0qzbyEj93S1/ZPRsTwYIB8SIENGEofxIwJM/zqEaFcC9DNJYWFXi3aI1QDR3FYY2c=
X-Gm-Gg: AYBFou127rV6s3+gkgcUVlilF3lJ3JaK3aGiWoeYVHzljeF15l2T3y/gtgQnKmKbHFa
	q8IbWqu8Aw3L2vkzpuOGv5tDC5zhW5gNqxmcfw6qZSqw7xqBGdFr/A+KkhvKUnKj7PJjZD6sRrh
	PFgqKGvudB4oK4w08BvG0dI6py/WHG8PNkZd0Qa61veIfr3rNRGDHGNgdk6qR8M68F9nn/iD3bQ
	u4jorolHRFvMA4ws18ALGWqTPZ2t0C3DrRq256GkUu9Ea20AnD+V0sjMmKkPAdm++Psyg/BmyLa
	iEa3eQ4SDsWwn9HiV9qVKYjhXiouRIO1QReOZUJCzF7JAE9iKWJWQ5QaA+8SBNONrZ+a/lHXctd
	7gSCfZIpU0FjZZnforX2oZ+IRVQ8HNShotCosfCJHVv21a0IlOv5C+GefGM6jcqlP+B+btnABom
	TtpytEQ4qoVzHK5m1O8MbCIJOj2q4zIJ2qiAdXU19UudPlF1vW4FBs+HAfEyXxh8Fr4lJD8N4bW
	25Xo1Rhsvs+LMhd43ahFcq+7oF9mhbyFcMnga9lUp5XyA/baXvw+jS4712ct/ALoLgphVecI6sQ
	YJNEKH8c6saXutRYndt713LLoWkTgmpMBDWXAsMR2wam/Hlc/rCi5OqhNTmA+TcD+VKED/cXwG/
	MUMKkerwAdM177rE3q0JAEvJHheQfVUwAFFEu
X-Received: by 2002:a05:6402:49:b0:6b5:74dd:37ec with SMTP id 4fb4d7f45d1cf-6b77733eafamr1637097a12.1.1794416672438;
        Wed, 11 Nov 2026 09:04:32 -0800 (PST)
Received: from xia.tail836dc0.ts.net (user-46-112-106-110.play-internet.pl. [46.112.106.110])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7834cdc23sm871660a12.12.2026.11.11.09.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 09:04:32 -0800 (PST)
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
Subject: [PATCH v5 4/4] platform/x86: bitland-mifs-wmi: Cycle the platform profile on Fn+K
Date: Wed, 11 Nov 2026 18:04:06 +0100
Message-ID: <20261111170406.1634428-5-chris@miget.com>
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

On the Xiaomi Book Pro 14 (TM2424), Fn+K sends hotkey event 0x28 and
the firmware does not change SystemPerMode itself. The event is a
request that the vendor software acts on; without that software Fn+K
does nothing on Windows either, and on Linux it is currently logged as
an unknown event.

Call platform_profile_cycle() from the control device when the event
arrives, so Fn+K cycles through the profiles that all platform profile
handlers support. 0x28 is not used for anything else, so no quirk is
needed.

Suggested-by: Hans de Goede <hansg@kernel.org>
Signed-off-by: Chris Taraszka <chris@miget.com>
---

Notes:
    v5: cycle on 0x28 for every model, without the quirk flag (Mingyou).
    
    Retested on v7.4-rc1, on battery: three Fn+K presses from low-power
    set 0x09, 0x03 and 0x02, each followed by a single 0x16 from the
    firmware.

 drivers/platform/x86/bitland-mifs-wmi.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
index c25b4e4c9b3c..d8341683819e 100644
--- a/drivers/platform/x86/bitland-mifs-wmi.c
+++ b/drivers/platform/x86/bitland-mifs-wmi.c
@@ -169,6 +169,7 @@ enum bitland_mifs_event_id {
 	WMI_EVENT_MIC_MUTE		= 33,
 	WMI_EVENT_RESERVED_23		= 34,
 	WMI_EVENT_OPEN_APP		= 35,
+	WMI_EVENT_PERFORMANCE_CYCLE	= 40,
 };
 
 enum bitland_mifs_event_type {
@@ -217,6 +218,7 @@ static BLOCKING_NOTIFIER_HEAD(bitland_notifier_list);
 enum bitland_notifier_actions {
 	BITLAND_NOTIFY_KBD_BRIGHTNESS,
 	BITLAND_NOTIFY_PLATFORM_PROFILE,
+	BITLAND_NOTIFY_PLATFORM_PROFILE_CYCLE,
 	BITLAND_NOTIFY_HWMON,
 };
 
@@ -869,6 +871,10 @@ static int bitland_notifier_callback(struct notifier_block *nb,
 	case BITLAND_NOTIFY_PLATFORM_PROFILE:
 		platform_profile_notify(data_ctx->pp_dev);
 		break;
+	case BITLAND_NOTIFY_PLATFORM_PROFILE_CYCLE:
+		if (data_ctx->pp_dev)
+			platform_profile_cycle();
+		break;
 	case BITLAND_NOTIFY_HWMON:
 		fan_info = data;
 
@@ -1043,6 +1049,12 @@ static void bitland_mifs_wmi_notify(struct wmi_device *wdev,
 					     NULL);
 		return;
 
+	case WMI_EVENT_PERFORMANCE_CYCLE:
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

