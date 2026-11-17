Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794911484;
	b=esdXrSXoTsGHw3Z2ACSE8F9NVkIpS+/7poi8iWSw5SwYAe2EarTUjc++JH3hSHgUPfs/
	 klJ3nkC/8uvTy1PBK4h8uBrgQCGFdFbY1XLwoG8abslqqARRDmoyN/viGg6rJgliaM6I5
	 RwkfBrztLzgtWCohs/35JRqwE6Zf4QO8TuFKJpDjvLDsx1OilxB34bEGHZpJy0priVRON
	 5qLvbVdf7aD57SpA782sOeQAXqB5RfaYO74w5LZM0MUOKks1ayWH0NobsU+anyx8chBM0
	 ITnwzLHV4svSKwir++cD57LGDs90qw09fDb9+XbkEFoP03ddm9w2BbVAxBZ+V4qUCZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794911484;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=L52Pp9F5WYzGwkkSwn+CCeVr/a7z+958O3ezUPX/7nM=;
	b=Cq6eVzWa5moZLeeqYg/NjdYULlPEdZTwf/S3Acn5n0lbQZZ87f/HJM7+CFAStVncTSoJ
	 fmQcsz8s8WH9Lb2z9uNPYzvdUmjbrHIdcEePn7OQ0QWbBKkTS0BgBiLE00Wex/TZLbO59
	 7HU/pMDzu/LxqUf7QT1+LoMHMAYHXhyV2ksqjy7LMWCMK79xRGUDzAWHqXv7Cv0k+NPvy
	 a/29AZpEsrDu2oOt9QsqItZnbwhUuwC6YQqkHPNyDo6bo/c5PWRCegBfinUhXQaIrEial
	 yJRD49gsZpISHjNAcew+i1Z4llVh/EJY6HsbItar3YELJ81xO+LiDyqBZSFoIozFFaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fpjxiuA1;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 277C8606A8AA
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Nov 2026 10:31:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 277C8606A8AA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fpjxiuA1
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4a357b1c649so495518f8f.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 17 Nov 2026 02:31:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794911481; x=1795516281; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L52Pp9F5WYzGwkkSwn+CCeVr/a7z+958O3ezUPX/7nM=;
        b=fpjxiuA1j0GuHAe2aLk3KqfwWlK8JsqosfEM6uJIZe3Ehh2Hbqvkq7flsoI/6fleZ4
         VGAgewCEXvooTvOTKcWqQvdgpy3vIvepCZdk73/ajldX7TOBqerZ/dpcatzuF+jT7YGj
         dpwtcUK8S8R0YFaQYgJrTDcUsK9CnusUdGEhbkI6S+1VXj3d30BEmGbgQSAPItF77lKw
         1+2661r0jXMORIcM070JWUAFxVdeLrIjvjQ7f+E3hRNROkcPlkDaHMNmtAhNK+87JpIJ
         LKCvtbpSZQsZ8d9jEh+KOcDaesRa8UDBqKg4fT4yV1GFxMagE8QBT5ej1iybH4y+0nyu
         tOfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794911481; x=1795516281;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L52Pp9F5WYzGwkkSwn+CCeVr/a7z+958O3ezUPX/7nM=;
        b=d1Em7H6ElYLCvNhkckHKjdnUzZND6z8YS4i3Xy2jIEWEqEAnwfAja5PFSQ8ruPIxZP
         hJIpqSVkkx72+SstWmYMrWWm3BF22q2CzcVC8RL1yjwm7oH/AU4sY2rRe+8NSH5+F1M8
         tQj4snm0ApySlwuP4788hEj9q+SAHtxj6bVplDSOpzt2mnJ7l6EexGun5aiCYY/tpttr
         JquW8Fwu57g0nQ9wHyqEHxBowapx/oroFhD+W2QwsHXcGBwrPjRKvG9rLUN0VIagiY1n
         t/6/L+r/IZaGNJn0LRrvwCcrsuFpN5nGmvsI7ShNhX6SNyTL6Fm4Yon+oGDmdUFwhzA4
         eFbQ==
X-Gm-Message-State: APuU4Z9tincjicMNM8sp7SzkzCdzRyM482EdpTZWxNJ54njyuSGuEx+T
	wZhJwbuiv17UJT9ciM/sUlhUyGuo73+4ufSR1hPmTHYkw+GCwdJAr+HD
X-Gm-Gg: AYBFou3o7aScWzRSvBxwC8M7KecvxJ5q8EUtSvJfv9IOrXjVZDq8Qi4Dl2LvRHUumRz
	X+/GVjVkDv9pbb4L/qCfDBc72W0dKH3shQ7zZ/STx1jioObHzFvYKuj1uOW7ARVpEiHN6IJK00N
	mht+1rVFT3FxrAi/l3RIgKVIa5ukfPE85Bl6GcPoOp9TCR7HtKp5prD0oL8zUmjgDfHAKf7L1B7
	7Y7JqkO86LBQEcngZazHXhhSNbIl0rN7uTQN+KrQLx4xrwGWbvNVZgve4PAMqYlOQt4/i7wZbUZ
	h6djB/ps0N9Bydm+Tqcha1r29n5wPsCu1Fe31kpxPub2mH4suXk2bJ94ISEHob113fcxY0zO9FO
	NUcTE7X6Zf1azhPgllfruqnFGkvgv1pPL3u4PjJQyCaLY8dbSd07EXiBRb8fbbkiviJWGluldyY
	Iphuz9xUo1pOanMPyH8nL7qNlhOI/NLrW5sn+ktLyICYWFCOw4XDgCLCcdPN7riwhdWp0GruAtA
	yyycUjEfM82PvlgjEWYtSBdyAJWLs7dR4JX0DlYz9vqOgeDuqV7D9ugYMJ3pkjHcBa2UlwHGq+8
	a70FaxKs43Sd+UtJ0ymkJiWp8N8=
X-Received: by 2002:a05:600c:4e45:b0:4a2:e0c:2b0a with SMTP id 5b1f17b1804b1-4bb55a84b08mr272748995e9.16.1794911481308;
        Tue, 17 Nov 2026 02:31:21 -0800 (PST)
Received: from [127.0.1.1] ([85.105.252.11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783965d4sm57712355e9.7.2026.11.17.02.31.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 02:31:21 -0800 (PST)
From: Bartu Alev <bartualev@gmail.com>
Date: Tue, 17 Nov 2026 13:31:06 +0300
Subject: [PATCH v5 3/3] Documentation/ABI: asus-wmi: document TUF keyboard
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
Message-Id: <20261117-asus-tuf-rgb-v4-v5-3-95268035eef1@gmail.com>
References: <20261117-asus-tuf-rgb-v4-v5-0-95268035eef1@gmail.com>
In-Reply-To: <20261117-asus-tuf-rgb-v4-v5-0-95268035eef1@gmail.com>
To: Corentin Chary <corentin.chary@gmail.com>, 
 "Luke D. Jones" <luke@ljones.dev>, Denis Benato <denis.benato@linux.dev>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-api@vger.kernel.org, Denis Benato <benato.denis96@gmail.com>, 
 Bartu Alev <bartualev@gmail.com>, Daniel Pereira <danielmaraboo@gmail.com>
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

Reviewed-by: Daniel Pereira <danielmaraboo@gmail.com>
Signed-off-by: Bartu Alev <bartualev@gmail.com>
---
 Documentation/ABI/testing/sysfs-platform-asus-wmi | 46 +++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-platform-asus-wmi b/Documentation/ABI/testing/sysfs-platform-asus-wmi
index f9825c6150b5c..6aacfc6a42cf1 100644
--- a/Documentation/ABI/testing/sysfs-platform-asus-wmi
+++ b/Documentation/ABI/testing/sysfs-platform-asus-wmi
@@ -238,3 +238,49 @@ Description:
 		Set if the MCU can go in to low-power mode on system sleep
 			* 0 - False,
 			* 1 - True
+
+What:		/sys/class/leds/asus::kbd_backlight/kbd_rgb_mode
+Date:		Nov 2026
+KernelVersion:	7.5
+Contact:	Bartu Alev <bartualev@gmail.com>
+Description:
+		Controls the keyboard RGB lighting on ASUS laptops that
+		expose the WMI zonal RGB devices (the kernel names them
+		"TUF" for historical reasons; TUF models have them and so
+		do some other ASUS lines).  Writes take six positional
+		values::
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
+Date:		Nov 2026
+KernelVersion:	7.5
+Contact:	Bartu Alev <bartualev@gmail.com>
+Description:
+		Controls when the keyboard RGB backlight is lit, on the
+		hardware that exposes kbd_rgb_mode.  Writes take five
+		positional values::
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

