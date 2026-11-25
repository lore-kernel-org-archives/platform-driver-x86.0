Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795648891;
	b=SxNua6aCx+XXgpnSa/TS4pVgq0BaxG/HH8M4bD72r0iKp5h2r0KH/0JVT04wVB5VblKk
	 lPzKBGIuIc9mfnIjMT5OgIvDN7Q2TiOAzWdVdZiQIwGeRyrWb/QBloLeG/kkZRtn2qS9O
	 tJVaihZsBE24mis+GjePBzhsFWkS+1L5SnKfK9L3P/lspyOKEHXI44rLukDwtxzb3wMRd
	 KcPRZ4OGIcfjQ560Qf3mVznhdpb7OpN+bmXSGRLW9i6SUy+n5sbGy3DmgDqBBnoAUVkp4
	 X5nM5//f78H1gVtWy8PJ88JrtdMwYUqTS26z7Zb6AzeK31ndOnjHnOCn7elgkIHRaPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795648891;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=ieM/zGjAJfO25gu9xPPDqiP6cWuU8YtOHXUXjTS+m5g=;
	b=fbnCUOcbWK4YYLRxJFirAaNABO3JpA6PZeTzb+C50Q3uOhQA/Mi8EaoLlJbnwTdBBxOS
	 DB5dnY4lUo9C6nypgrCb8h+gQEYjzx1xieZZSHzXM9ktZGOjunxE8SZMyYZQMoOa9PHip
	 x+OL8QMxkPYcNQcIHCQUmFPOmlKDVNEbd/rVoc1lGeivsRKIDI/ZGUQRdBJfDlDqz0vHQ
	 9N91aoTG2PIXrNz7yVWDjMsrZTiCxS5PQApp0C13j5nD/9SSGQ5Y51Vj7m6KtJ5qXyVIj
	 DDuK+hz6TECT60g7t4AH6q1oHuXl16X41/VEomI0NYF1UuGtZK29f2EWiyGQ7RjETYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SFwHknwy;
	arc=none smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2494D606A321
	for <platform-driver-x86@vger.kernel.org>; Wed, 25 Nov 2026 23:21:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2494D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SFwHknwy
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8ca6a12efd9so2175670b3a.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Nov 2026 15:21:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795648890; x=1796253690; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ieM/zGjAJfO25gu9xPPDqiP6cWuU8YtOHXUXjTS+m5g=;
        b=SFwHknwy2mjAC0b91bU6teeBekkRM8TT4E/yFlRKc2+bdwfpCgI+zxVOtchjaFS+o2
         WOTAc8+ihaQVD3/egNc5atu5Jz/7zGUUl57DY8TZe3bQAd7Hs12jRhp3EGmH3++KYlB4
         wEc2PgfxtZQbwX/Blvm0nN/YHH5m/dy+P3Ir61+l9FX985ouxxxVAV4c+Njd+xL38xSt
         0l1bMwSr4gqJqqtlhUoeEoN3pzzoMax7XZvS7fm5yOthLhM3+0n3OEP72pyJMupb1wwn
         9AAbAfRUw9RrhmB1Wc95FcJ8AL5vL9AHy3m0Tadu6GmDEI4lcjpknIidVRIN3iO6zP60
         A+Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795648890; x=1796253690;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ieM/zGjAJfO25gu9xPPDqiP6cWuU8YtOHXUXjTS+m5g=;
        b=POxsHmqch6y5Zz7785mRYWxfFSW8n1Z6DsAHV0gfXoWfh+RLTRU3yGQSxN0gsj+33S
         U5IdTnAx+3qrZmfJpE64iVfKGSmYUj+/00BIWKA/27ZvJdfuoGMBPr75V4zwlZhrtQwh
         TvYUdp7KTybeRX+sTfC2tCmUBNjKAyfCnUZKsqVNN4SmJwtlM3Essy3cJPZ9N51FoaiB
         3r8waeSKMsRviSnxNq+ziGoJub7FM4fNSnM2LlgjE+gfc/IXTB2u5G324cRRjaGeVXdO
         3B59cWetQZ15jT99zZwYW98cSBMyLXsd8LUPnjq56JaFIVkSMw/H3MzlG3HJfR2SXyyy
         Ve4A==
X-Gm-Message-State: APuU4Z8/BMjOBebjPgy5KSEzDKabZ58bEwJKUHX88ay7GRRFLNOn215R
	/n4W8OvG/mxpX05Yf4qOkCWaqaDhtGGpXhMayDdKIr/ydE0/3bPRyh8R
X-Gm-Gg: AZFdTZfTXg8N6PYOs5NWVHoySHuN6c0KFdAx9en34oDuudCEggGTsLuB1xgHiNpZEOn
	wUuYpqiiXTXijCHOtOI/KDVmMR/UAuIriO6dhVRBXI8GpAQ96FpUK/oYUi0NbYxks42GC278l0C
	Lvld6ITaDA7UEK/1uaKiv8zI+7Xb8Cz/pj1r9/kUVtk2/cl+OpLhXUJmCNOVZysuUDG37aVwVge
	H+d3hQhgm4gLnMyqze5cbnWN9f+fvAucsi1o2eZvGxn3Ys2GIaeTXyWJgsaetfjXe61rcsp4FMK
	/7jQmLeuScONW1go9S8ENM2cspix/VR5KXjTT3uLjgndrqfmFeieRbnjn3oCGyQ0QDA4qSV7B9b
	FgYZW3fstPD8z6wTI6/BEYH19kMmMJYtF1h5cVJlfcMTARr67mnVsj/Twv098VMNRmTDpea/iwh
	5eqwW8wGNYmjp7l99m3cLyLUdhwEUVsE0qTMMvHqNGKiVGZzOnQnWlSVzk/y1Ft2+T7Kgke7T1/
	aXQ4TtzoLdYGY9xTKDS3Ug73jCXyUvAM/f8PwTZGKiIz1pEMzdk/ZQ8u/MTixT2FEoeOxohdhF1
	MNMG2ZQmw7xK6JUuo5/0HbhwZyyTYpVHEKQr9Xz2sXMxDoNUgVwvyVMB61zYQMinDZ8UZSwilrU
	Gf27BqCaahlFNRYrdaPHX/wL1t11aBDbYtcianMX26OLQ8pDr75vIprDNAbnoYWoJTydwacJELm
	zOnA==
X-Received: by 2002:a05:6a00:a908:b0:886:773d:a6a with SMTP id d2e1a72fcca58-8c87c199463mr16356756b3a.28.1795648890326;
        Wed, 25 Nov 2026 15:21:30 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c873b25bfasm9864471b3a.46.2026.11.25.15.21.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 15:21:29 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Matthew Garrett <mjg59@srcf.ucam.org>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Darren Hart <dvhart@linux.intel.com>,
	Gabriele Mazzotta <gabriele.mzt@gmail.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] platform/x86: dell-laptop: Fix keyboard backlight and charge threshold handling
Date: Wed, 25 Nov 2026 15:21:06 -0800
Message-ID: <cover.1795648586.git.rosenp@gmail.com>
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
Content-Transfer-Encoding: 8bit

Three fixes for dell-laptop: keyboard backlight timeouts that overflow
during unit conversion were silently accepted, an unread keyboard state
was used at init when the SMBIOS call failed, and the charge end
threshold was parsed with kstrtouint() into an int.

These patches were developed with the help of an AI coding assistant
(Claude Opus 5.5): it reviewed the drivers, found the issues and drafted
the fixes and changelogs. I reviewed every change and I am responsible
for them.

All patches build cleanly with W=1.

Tested on a Dell Precision M4800 running v7.2.15, using the equivalent
backports built as out-of-tree modules:
 - writing 4424214d / 18989323d to stop_timeout set 4m / 2m before
   patch 1 and is rejected with -EINVAL after it; 5m still works
   (v1 of patch 1; v2 is compile-tested only)
 - charge_control_end_threshold rejects -1 and 101, accepts 85
   (v1 and v2 of patch 3; v3 is compile-tested only)
The kbd_get_state() failure path of patch 2 was not triggered.

Changes in v3:
 - patch 3: make end unsigned int and drop the dead "< 0" check
   instead of switching to kstrtoint(); retitled (review feedback)
v2: https://lore.kernel.org/r/cover.1795219225.git.rosenp@gmail.com

Changes in v2:
 - patch 1: convert to a u64 seconds value instead of failing
   check_mul_overflow() on the int, so the unit selection below works
   on the full value; retitled (review feedback)
 - patch 2: don't fail kbd_init_info() when kbd_get_state() fails;
   fall back to level 0 / off mode so the existing code picks sane
   defaults (review feedback)
v1: https://lore.kernel.org/r/cover.1794633179.git.rosenp@gmail.com


Rosen Penev (3):
  platform/x86: dell-laptop: Fix keyboard backlight timeout overflow
  platform/x86: dell-laptop: Don't use an unread keyboard state at init
  platform/x86: dell-laptop: Make the charge end threshold unsigned

 drivers/platform/x86/dell/dell-laptop.c | 50 +++++++++++++++----------
 1 file changed, 31 insertions(+), 19 deletions(-)

-- 
2.56.1

