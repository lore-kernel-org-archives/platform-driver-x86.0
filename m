Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793231575;
	b=Z6jdQwSXJrDBFpHeZjeiy465hQI4Mzc6GSawFYiDh8a2iOFGYvp3c7jRNQ09Ee5dWD22
	 GpVQLjV8lgfDKyEOqsX7Z4iK0SAw+KwZqU0v00O2VaN0DWy+7ovpUFNAiAJLZtSXRLsCm
	 kXkYeYDRtBRH9DRj3xzYKcSEovRuyAMcNYEkBTRi9PKr9WUNIiJw4wZEGcowcas4WJHNx
	 sAVNeq018S3wNSdrGrd5+ft81v3jiWDz8XXWQAnFW8bth1bORa7xWD/CkR5Pvntb84dZg
	 z16z5yZmocrdA38YSxT8ODXub7PrkxWIfOmutrQU/nsFpDBuiGq51hg+j6YZ74Lzhew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793231575;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=NShZ2F0kBjLdK/kOL2KImL5dsxE3V0Ajk4CzI2p8lPA=;
	b=smMe2367P7niU+S2wkAR67/jp8wJ6OWxTk62DLs994L/L7ETKbker9UU28nLn8rknMYB
	 rEezoFFuN2sPysn3JEUYEjtmZbqqpB1YQjud+qxjIkE8RjwE3sYhHvmgenVc85t2TKCOm
	 7VjmZ5lpVp4FEGweVBmLDQzgFu8PX3LwMLqi1n/HQEUlo42x5To9SKhqQY5RDD+mFmGzF
	 bpU1aGweyzw8cnZ9xvXy3ZLURSL8WoOyoa+KYz9bIgcEtZDeSckmgjHodR0rEGQJiquVw
	 XDEToCS1c0VbAsNmAiNSUGV2OjO3DggJQ6ane+9SejOGE0aUX08Ddbb3+g8WNCVAwNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ObkCEo3A;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F163B606A33D
	for <platform-driver-x86@vger.kernel.org>; Wed, 28 Oct 2026 23:52:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F163B606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ObkCEo3A
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so2092115e9.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 28 Oct 2026 16:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793231573; x=1793836373; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NShZ2F0kBjLdK/kOL2KImL5dsxE3V0Ajk4CzI2p8lPA=;
        b=ObkCEo3ApCzCdBf4QLwsQw/gIczNDklONgJYDnqaoOVsGgVKSXJd1tmG+Fb9fp36Xf
         IehrQMgYCyhhPhaLmhhcKSOrjNJvduh5BBlwvzyJWINxNfc4D4egOaL+ipRrR4BMopOo
         pDXhxZhRFRaST0XknNmt7hs5S80V8oJkGKD6Nnwh5WxsPB3iaqnSqeXqLWT+gv8ud4U6
         h8k1gtTDdl9XqbTz4X42aMDBoVrbWk+L/OlKYbvkBgloVrKIgN0DDv91RCKwfpgmG3RB
         P/li0F84zo5DTVY80qFPH+ZeihHTt9xqd6jLQ9QLdb+IMVnNAtK9gGe1YhG8vuU1LsuR
         wQZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793231573; x=1793836373;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NShZ2F0kBjLdK/kOL2KImL5dsxE3V0Ajk4CzI2p8lPA=;
        b=C1KZ/PYQRz2VzhJmztKF669O4o572vPL9bMMDzP+uL4+RoSnyB2CM2mDnVNtltlMcd
         F0I3HpeJeeeXxbqZ8zlbLAzFgkaE5Gj/0UZHtpaGDJ+GB6kBrNNWJtqDakvAMWTgLtq8
         3d132/Kq9eAQ1Uja3hgoHwzs0ge8JEQYfjqLe1rinyfjiINdst3b2WKo7rBuuofHl+gw
         hzc33xA3TGPBwyEIiU2ZLr2+wJJbxN04ycAs+DqJGYJ6pa0tCLPUvFC5S4CVnlifV+KE
         Fi/VOwsZhCQZVJe57NTdq8Lx6fiH4fOah4LFUW/Zzxd8fDNS56u8ZCKexl64P7YbpY+y
         tpQg==
X-Gm-Message-State: AFq9FYJiDm2wwATBtcozLL4xKH4hTECwGPvtSR7s3mXTK7csV+1+NrpJ
	/5z60kt6d7yKy/AlfTO80avM9cLNLO9wJzI86CElzVKiyjziB9yP5niNl13gY/Do
X-Gm-Gg: AYBFou2F7rIwDhmZfaXkge9IpLKpCJn60ZzxggFGJCjgXLnUOLTNBMBB3QDBPLDDQfA
	LLuqojBCnJYeCma/Wc0pGwHxaxopy/SF1sleOkAQjEfq+IhOXhPErr3Odnv/GADIRsJwP2vBXgK
	88sxHT8ybUFzsXBzzxLZP1PicCnJFK9XQZqgspkGY/tkZBr5ajdiu7zpBDxa5qDglKyke5XWu2t
	/159nWX1XxY92/gnIDYQmGIPHelFpVRvXybgC2dQhUccbgwl+01LOaNUJRHgjzhkkONxHK6Z/df
	qnOW59T57jyXHu/QgoJxJmIP5tEK7uh0++8OXGVvLRmUP3de4W4nCqHEiLkVneeRHXAXVPUTklg
	Z/8piOk+CNsIiZab+KppXD2JAu+CU70BtpStMevKFhNKwuOE/34U0kw4qWjv0vhJ2u5zRl6Mh/K
	51W7SOVqTrSQkwO+ivIkpdyzxoFA/Z3AH5Zy2SUBNdVqllmScqwQJ0w3sl+UAl0nStknRhVrnMy
	yHIf9pv15Jr1wyq5VaIvAbgHjdps5oQyGOJd0VWX+4tIsyrvKt5ON4Z/1hbBwQowt2GnxKz55bC
	SqEbrbOz2YVSyt4w8oNblY4M+FM=
X-Received: by 2002:a05:600c:621a:b0:4a2:10f9:37db with SMTP id 5b1f17b1804b1-4aa871e8be0mr25693755e9.7.1793231573393;
        Wed, 28 Oct 2026 16:52:53 -0700 (PDT)
Received: from [127.0.1.1] ([85.105.252.11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa80f04785sm23669055e9.4.2026.10.28.16.52.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 16:52:53 -0700 (PDT)
From: Bartu Alev <bartualev@gmail.com>
Date: Thu, 29 Oct 2026 02:48:52 +0300
Subject: [PATCH v4 2/2] Documentation/ABI: asus-wmi: document TUF keyboard
 RGB attributes
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-asus-tuf-rgb-v4-v4-2-0d3b877d2c30@gmail.com>
References: <20261029-asus-tuf-rgb-v4-v4-0-0d3b877d2c30@gmail.com>
In-Reply-To: <20261029-asus-tuf-rgb-v4-v4-0-0d3b877d2c30@gmail.com>
To: Corentin Chary <corentin.chary@gmail.com>, 
 "Luke D. Jones" <luke@ljones.dev>, Denis Benato <denis.benato@linux.dev>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-api@vger.kernel.org, Denis Benato <benato.denis96@gmail.com>, 
 Bartu Alev <bartualev@gmail.com>
X-Mailer: b4 0.15.2

The kbd_rgb_mode and kbd_rgb_state attributes predate their
documentation: they were introduced as write-only interfaces and never
received ABI entries.  The readback support now being added makes the
omission visible, since the read format is part of the interface.

Describe both attributes, their positional write formats, the write
verbs, and the readback form.  The attributes are gated on WMI device
presence rather than on the laptop model, and userspace tools route
several non-TUF ASUS lines through the same devices, so the
description says ASUS laptops that expose the WMI zonal RGB devices
instead of claiming TUF models only.

Signed-off-by: Bartu Alev <bartualev@gmail.com>
---
 Documentation/ABI/testing/sysfs-platform-asus-wmi | 46 +++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-platform-asus-wmi b/Documentation/ABI/testing/sysfs-platform-asus-wmi
index f9825c6150b5..23e5f265f722 100644
--- a/Documentation/ABI/testing/sysfs-platform-asus-wmi
+++ b/Documentation/ABI/testing/sysfs-platform-asus-wmi
@@ -238,3 +238,49 @@ Description:
 		Set if the MCU can go in to low-power mode on system sleep
 			* 0 - False,
 			* 1 - True
+
+What:		/sys/class/leds/asus::kbd_backlight/kbd_rgb_mode
+Date:		Oct 2026
+KernelVersion:	7.4
+Contact:	Bartu Alev <bartualev@gmail.com>
+Description:
+		Controls the keyboard RGB lighting on ASUS laptops that
+		expose the WMI zonal RGB devices (the kernel names them
+		"TUF" for historical reasons; TUF models have them and so
+		do some other ASUS lines).  Writes take six positional
+		values:
+
+		    <cmd> <mode> <red> <green> <blue> <speed>
+
+		cmd is 1 to save the setting to flash or 0 to apply it for
+		the current boot only.  mode selects the animation, 0 is
+		static; mode 9 and modes 12 and above are sent as 10.  red,
+		green and blue are 0 to 255.  speed is 0 (slow), 1 (normal)
+		or 2 (fast).
+
+		Reads return the current hardware configuration in the same
+		positional format, except the command word, which reads as
+		n/a because it only applies to writes.  Reads fail with
+		-ENODEV on hardware without readback support.
+
+What:		/sys/class/leds/asus::kbd_backlight/kbd_rgb_state
+Date:		Oct 2026
+KernelVersion:	7.4
+Contact:	Bartu Alev <bartualev@gmail.com>
+Description:
+		Controls when the keyboard RGB backlight is lit, on the
+		hardware that exposes kbd_rgb_mode.  Writes take five
+		positional values:
+
+		    <cmd> <boot> <awake> <sleep> <shutdown>
+
+		cmd is 1 to save the setting to flash or 0 to apply it for
+		the current boot only.  Each flag is 1 or 0: boot, awake
+		and sleep enable the backlight during boot, normal
+		operation and suspend, and shutdown keeps the backlight lit
+		while the machine powers off (S5).
+
+		Reads return the current flags in the same positional format,
+		except the command word, which reads as n/a because it only
+		applies to writes.  Reads fail with -ENODEV on hardware
+		without readback support.

-- 
2.56.0

