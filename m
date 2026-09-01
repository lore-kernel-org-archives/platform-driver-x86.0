Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD9634DB72
	for <platform-driver-x86@vger.kernel.org>; Tue,  1 Sep 2026 06:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788244436; cv=none; b=eoIjW62moQK6YZDUUR2dGnJBNBlUlS6WSUl92KZeFxB2vlJ9vRYFVPiavtOVXfyh/b+urUUkmdwfcJr9q0JxiZv/85E+gxTUY0vN+C43IUizjhFIsrmi8gUwp+NbppcQzC8ixCb0pl0t8NkfPxfh0slgUvnOvXB8/3FoD1vTSB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788244436; c=relaxed/simple;
	bh=SKiKdv5J0a9yKd1F/BXWfqXIuTSXai4BQt2mltfVBVs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YEmo4UUU6u533DRzcPpQv95c846xc+7VZ/lP1l0aOArdDNxi8mBndCZN7U8pTBm9JL2oAynvDsh5kuwrFxttwJFYEQjLmZ7MdPsx/ec5KcCVrTE3elM3UgOcsdYRvJDZ1VQUOq1NJiCrpCpaZ3+Z+0qvUIHZkZf0WgBsAQ1s3eI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HuXifJc4; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HuXifJc4"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49b9320423cso42990215e9.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 31 Aug 2026 23:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788244433; x=1788849233; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jC4Jgo3RleAZFIkAun3yFJqVYOX6VIQqPfa9Zm+C37M=;
        b=HuXifJc4wpBBKBpN4el+2b2KEIPMzSGZO3F9HUkhhBq4b/nfLUAUR07xxg29QFc07C
         KpgsbPvI5Uf2T5dSvj4SrvH7lqtXVAy4Hew7tr5J8tMFiWH6ZWbYSffYraaGkeqV+35u
         dVLj90QWJF1gOKK8ZEEaH7qkR0+Ea/fQ9ThPGaBqVGOOc4CkzxF4rMuF5KrPh8ij0pIp
         22GZd914TyZ5TsiQOzyFRlAwvSYbjap5C0DcXmuYTHuNh24mKayt5r3m/zSWrpvtqVg4
         fDIJCKrFmmJicgE6hRUAIP+RaF+eXt11X6nb1xDrsXDDwJsl++SZ0qqqWLiusaduQiWg
         vuyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788244433; x=1788849233;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jC4Jgo3RleAZFIkAun3yFJqVYOX6VIQqPfa9Zm+C37M=;
        b=Wm8aNLEbJMjEYMq92Zc0VH7PgNhrEPn1vxuR61Wtw+debyXjhZEC80Dn4JUPlk1Qab
         ULl8eU6VcjShBqi/Tnv2cUXWUmia0+jScmKENSDvc+gRNiGmr1eOB9RNbZ6hfjRwKNN7
         HNu3N2aA1M8m8fqOfvQ+U+zRoDtmBGuZRq/AWW2lj8kIVunHkMhl2TE9n8WTAoIXbRi/
         naF9TsZTImo1Rlhc/Ve4jF2OxNvby8ldPEz+1MZAVoKF2xtOldqaHwWD+1IHtw5u8GPE
         GxZP5ybAiwFGGM/hGSkKaMZiH2kVepxtoXvwqpBMrqz1hsBVMRFFl/u+up42hYuntx2u
         cELw==
X-Forwarded-Encrypted: i=1; AHgh+Rr4J8aB3ryOJWsmdLBj2NQpFN8sd04NKEMY/86BosCHsQ8f+VppxX+KBtP4u5KsyRjeVcZSOhC7ClCHMU6ho/QmKYUy@vger.kernel.org
X-Gm-Message-State: AFuF++le5RhYGUV503t+ktNYT06czcMyIrFCdpMtNIuXjZ0V850Nn5YG
	1BSwnakGzqHPNtuu13IPHKoZLxvmFFWTtlf4P4Re8Y6dm8H43vgh02M=
X-Gm-Gg: AR+sD13qrbFhokCyKFpR6MukjB5HAFP1g00BQnZM5iICacqA1xajj6qs5wFjgv4QR7i
	3mdW5BRJwOq22Q3RAET2toyNGBCAElJ1Sfeye33Oz+GkUYpKFCsGDUFaelGMlh0LSd68CkcBE2k
	NxieJjm8dmrIJwLTtPwldkI+hH6tZmE8W9ec/NfAuWJLtSWhxJi0N5+hofpDKmzZ2z4iE1cj+qq
	LZwPiiL3Q/dvhzrKNX0MaPiULvugJyqwH/oLGhObLG0W00zjReLVCBT32dZoTkMNcKBJuCby7do
	p5EzoXsnYzJxQddWSQhWX50JaBJYzAbB4R8BY8Cw09XZuuHPzVewTsPoo+B4u0BG1FD6Qm2WnuV
	uTqZTUhwV/xTR9rpppMPeBNmllc9ar3pHNLCLP7tVx21SmbbZvDuhRz49XwPG5VkKwRBRPEDpIe
	HvRvqZAhsVoAxveDFblgPX/4I7mvffR98qIUXQwIAQQe9eQN40tZOz9dgPh1c8chaDjhkqIGXMv
	+Jw4blzmQuOkOV1s5PRxbiKUGZHeOTheOAp4MzFkeT5
X-Received: by 2002:a05:600c:4747:b0:499:dbba:9859 with SMTP id 5b1f17b1804b1-49cdc57bf3emr86849635e9.5.1788244433013;
        Mon, 31 Aug 2026 23:33:53 -0700 (PDT)
Received: from surface.. (84.124.213.91.dyn.user.ono.com. [84.124.213.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce11e0fsm43331585e9.9.2026.08.31.23.33.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 23:33:52 -0700 (PDT)
From: "D. Manresa" <dmanresa@gmail.com>
To: Jakob Berg Jespersen <dev@berg.pm>
Cc: Daniel Scally <dan.scally@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"D . Manresa" <dmanresa@gmail.com>
Subject: Re: [PATCH v2] platform/x86: int3472: map the ov7251 power enable GPIO to "vdda"
Date: Tue,  1 Sep 2026 08:33:51 +0200
Message-ID: <20260901063351.67231-1-dmanresa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <9bjLpqRXj6Hx0eSwnrfYfzQUL9rQwcxzb7uzDdMDhfQUkXmd8vUjOYrWOWHduP7IUZ8rtmnsUxIzX5E3CLVGfXCylvdrZYdmJhkX-O24aT4=@berg.pm>
References: <20260831102306.36610-1-dmanresa@gmail.com> <9bjLpqRXj6Hx0eSwnrfYfzQUL9rQwcxzb7uzDdMDhfQUkXmd8vUjOYrWOWHduP7IUZ8rtmnsUxIzX5E3CLVGfXCylvdrZYdmJhkX-O24aT4=@berg.pm>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, 31 Aug 2026, Jakob Berg Jespersen wrote:
> Tested-by: Jakob Berg Jespersen <dev@berg.pm> # Surface Pro 7+, probe/power-on

Thanks for the quick test!

> 0x009e0903 is V4L2_CID_ANALOGUE_GAIN, and the in-tree ov7251 registers
> V4L2_CID_GAIN instead, so only the front and rear cameras get
> enumerated.
> [...]
> Did you have something equivalent downstream? Happy to send it to you
> or to the list if it would help.

Yes - and so does everyone else, independently, which is the strongest
possible argument for sending it to the list. The linux-surface patchset has
carried exactly that two-line change since 2023: "media: i2c: Clarify that
gain is Analogue gain in OV7251", by Dan Scally (on Cc), in
patches/6.19/0013-cameras.patch. It was never submitted to mainline. Last
week a Fedora user rediscovered the same fix from scratch on another Surface
Pro 7+ (linux-surface PR #2252), and now you make the third. Since libcamera
hard-requires V4L2_CID_ANALOGUE_GAIN, mainline ov7251 is unusable with
libcamera on every machine until this lands.

Dan, it is your patch - would you like to send it upstream yourself? If you
would rather not, either of us can, with your authorship preserved.

> I should say I have not got a usable image out of it here yet: Frames
> come through at the right size and rate, but the content is saturated
> white, and the sensor's own test pattern does not come through either.

That is almost certainly not the sensor: it matches, symptom for symptom, the
IPU6 CSI-2 receiver desynchronisation I reported on linux-media yesterday -
"ipu6-isys: MCD PHY is initialised before the sensor is powered; intermittent
D-PHY desync at stream start (TGL)". The signature: a session starts with the
receiver desynced, every frame arrives at the right size and rate but the
content is garbage railed at full scale (for a 10-bit sensor most rows pin
near 1023 - saturated white), the sensor's test pattern does not survive
either (nothing valid does), and dmesg shows "csi2-N error: DPHY fatal error /
SOT sync error" from the first frame. Three checks on your machine:

  - dmesg right after the white session starts: if the DPHY/SOT errors are
    there, it is the receiver, not the sensor;
  - close the video device and start a new session: on my unit the desync is
    per-STREAMON and clears on the next attempt (~3% failure rate at stock
    30 fps timing, but it drifts with uptime - I have measured up to ~50%);
  - if the front camera is streaming at the same time, stop it first: the
    OV5693 (port 4) and OV7251 (port 5) share MCD PHY1, and starting the IR
    while the front holds the PHY made it fail 22 times out of 22 here.

My IR capture path retries the session start automatically on that signature,
which makes it invisible in practice. Details and the register-level evidence
are in that thread.

D. Manresa <dmanresa@gmail.com>
