Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795537555;
	b=JeN6ivEDrBFzikPs2/s5vEfNA0ub4QhStdesIs+7ZDprKQAYtmpXoLdHqNo+kgdVFjcL
	 IUYSsXrPPLpCdq79ttQBGRHbhBoZ9U9HsyfLqjW5jjcMs3GG7r1q9vuuAYULgBEiRmjSz
	 /wBC9JPLkDyO77n3PDQkBPQ0BmnpFqhx3ftHiBYBl3r6jSe0AQdSaef2WhxdowMWvUaPB
	 NPxZnu6Dlddf/fUKrFoSQ0LznAeL0TM4sG2tJKK+SM8Islac+8Zd2Iko2cYNAza4SLNlR
	 8cvuRmylDoYShh9U8kL5Kzdu3GB97TrVJudhbfM3w0IWH+YEQ2b8YchgcpZ7FBJ0KKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795537555;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=L0W8i1OS9SDCjc0+NVBmFTnmWDDq5TW8bbBOO//Ub9A=;
	b=C6MEOLBjnxjjqGoEwpwyBzvrCTi25upbowpgkwIZNoRRqFEEJg8CqBwzKlfgNmSjndHQ
	 aD8St98/sXD+yabhlnhdBWPOP8wy/WctjFn/NePd1vqGGkfuoGezaDaJwnZDzoMTWtmEM
	 JczTVBPrdAzy2EGOAzZp9WXIKno2ybZ8jL+IK2v1tGKApHgOQSXQUWYW6j1X0lsJbEA8i
	 aGLwUfn+O7lrvi1cZVJ7XHhzVwIOGv34U2e4DSLIU1XeAWrybViUou5LwrcZx42AjPHNH
	 3HAmVi/D4m55UoKnKCcMtXHPrVZd3yUXlCs8afHOIDhrkgPZGCQFNVABlvcPEiArx9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0um4QUfh;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E9A4606A321
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Nov 2026 16:25:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E9A4606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0um4QUfh
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-38644aedba1so7293824eec.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 24 Nov 2026 08:25:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795537554; x=1796142354; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L0W8i1OS9SDCjc0+NVBmFTnmWDDq5TW8bbBOO//Ub9A=;
        b=0um4QUfhUqDYcZfPs04H920dlZzpbp/AAE5iwVqMT0bmbB2EE27lEig3AIP5n84TKV
         lo8E/TxzZrvYYBHGPowWFei99BNpC7HfqfDl2ukyqg2pypBreTUQE22wC8D2cMsyt0uO
         aR/UeOvT0XMn4jyc8uDqFAsIqj53UmS2HzVgEPYOGHQ7RrZ9aiZxFeFYvuh+Uvam5iD4
         Yr7JRmxFGAUiEyEOKSlCwnsjmCpNDvqSQXsflIf03Ryw0BfMuYtIQSeEVYiY0qWWtZe2
         O9rHIAGYU9c7EakK5NdbzPZiAjxHwPH0LzqCseDZL5WhoSdo662yR0K53eRv2R5GFiYV
         YuZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795537554; x=1796142354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L0W8i1OS9SDCjc0+NVBmFTnmWDDq5TW8bbBOO//Ub9A=;
        b=TMsXJOjyY5Nscc9yo12HpyMKGs5AkWAlmcSFaZDh0rKcBRLAR1L1c2SfYHBxJEfcGZ
         PlJh0uRLnQCmSppn+JatvbAwBqgEx/zF00wVy0LgYoWNlPRq496DCwJ3zOPlf66WdXjU
         POPMXoeV4Ep5q70qCy1xm4s3+CsInC0Y9Qu3BYjuOJ+co+4MPCZTZyXJmdRopEXJ+KVj
         l36crECmoUkFYvTnnznHEBQJSvLnpxLxa424hVKPf9NiwYgl/2NgkJ+78tjIKN8dyJo9
         KjG9skO1Vwj7bVd16+ZPnAqvWNQWhB5MQgFXLeqO312DjmhlRHeUWDjsE4OLhP098w8V
         yawA==
X-Forwarded-Encrypted: i=1; AL+hErH9/lou4jtIGIk7eDUPobj5/DLZzba+cjBb63Dv9z+uf5YIKwtYzej5xr5GaQkioiYatd8BTNfYCuE/cbO13j7vyCUv@vger.kernel.org
X-Gm-Message-State: APuU4Z9R4VzAmiMH5UQEisHXTySM/F+5LTrIqccGy/HLDaSwV6q2JuiF
	tiO+I3GlNiF4+cxdpHeVmgS6l7wkwtV0ABawQoVzok0vnkXOTcX/91eVfpOE4BkYzv8=
X-Gm-Gg: AZFdTZcLI4QQKT/eFaZrrp6jhoHXPXB+aCEXlfSZF7p0stIyrwrVuVtZtgEUPSx/q4Y
	po2AkuoZTWLcAAJ0suHs9x3bCrhnz8oxuXaZsUGPepOYvwKCGicZeFYf/JhrjClWI08jhJqHdLa
	EA9pwxMAOE0beh8MfzxMn6Bt6VnfkevZlhd1r7PyZ9MOIYBaobaJuB6c3DpTXN5SlpeRs6jEKGR
	+uVr9hcJ9fY85o7uXDgvPz8tdva3EvjaplAi8B5flXh3oaYS0EHK9FMmw1t/vOYRVN6hI3nNX59
	sUA+is6oLDIeLE+NkxZgI6MrvfJy5ZxRwKt2Shs5VwbE6PgN6K1vf45AC/0uOT0kgMvXi2i7za5
	7vpQECxV5gN2rTaJDyUkylQF6i0vOMaL3+1PzKzz2y8FvkKgvILLP2EQoUZ0wBRYcWly6D5CmqV
	t83cfcYt193MHnhWBkMbojZ26j+fWXFAV8cdf6Q1EL4x00KG1oBu1MmwBcv4udGJxuiTOZkR3yX
	5h7fjL53q/BRv3208sGECsSMI1xnD7C7vA7/T49qgnVCyF6+BR61z+qqmdXi57kmjgcPnin5G7g
	/w9Pev11K4gPd9SeFrhtlpenLOMDuj7fnyU=
X-Received: by 2002:a05:7301:f02:b0:378:7434:a526 with SMTP id 5a478bee46e88-3856f8519d9mr15236084eec.14.1795537554005;
        Tue, 24 Nov 2026 08:25:54 -0800 (PST)
Received: from arch ([2605:52c0:1:507:9873:d4ff:fe61:a965])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c371esm45549014eec.23.2026.11.24.08.25.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 08:25:53 -0800 (PST)
From: Zheng Shuyang <yhshzh0@gmail.com>
To: Fuwei Xie <12313607@mail.sustech.edu.cn>
Cc: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	=?UTF-8?q?Eren=20=C3=96zen?= <erenozen@protonmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 0/2] platform/x86: huawei-wmi: native Turbo profiles with capability detection
Date: Wed, 25 Nov 2026 00:25:48 +0800
Message-ID: <20261124162548.55861-1-yhshzh0@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <69C3BBDEF214121E+20261118161311.17252-1-12313607@mail.sustech.edu.cn>
References: <69C3BBDEF214121E+20261118161311.17252-1-12313607@mail.sustech.edu.cn>
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

Hi Fuwei,

I tested RFC v2 on an HONOR MagicBook Pro 14 (2025, Mainland China SKU C233,
DMI: HONOR / FMB-P, Intel Core Ultra 5 225H, BIOS 1.16) running Arch Linux
(kernel 7.3.5-arch1-1, power-profiles-daemon 0.30). Both patches applied
cleanly to v7.3's drivers/platform/x86/huawei-wmi.c and built as a module
without warnings.

Test results:
- Capability detection found \GTUB and \STUB and registered platform_profile
  ("balanced performance") without altering the active mode (remained
  performance / GTUB=1 across module load).
- Writing "balanced" / "performance" via sysfs and switching via
  powerprofilesctl (balanced, performance, power-saver) updated GTUB and
  flipped Intel DPTF INTC1042:00 odvp1/odvp2 as expected.
- Fn+P updated both /sys/firmware/acpi/platform_profile and
  power-profiles-daemon 0.30 (powerprofilesctl get) immediately, with no
  "Unknown key pressed" logs for 0x02a0/0x02a1/0x02a6. (Unlike Eren's
  tuned-ppd observation, stock ppd 0.30 followed Fn+P right away.)
- Unplugging AC in performance mode dropped platform_profile, ppd, GTUB,
  and ODVP back to balanced.
- s2idle suspend/resume preserved consistent profile state and switching
  continued to work afterward. Existing features (battery thresholds,
  fn_lock_state, micmute LED) and module unload/reload were clean.

Regarding your questions:
1. Capability gate: On this HONOR Arrow Lake unit, probing \GTUB/\STUB
   worked out of the box without any DMI allowlist.
2. Keeping 0x2a6 in the refresh path: Strongly yes. On FMB-P BIOS 1.16,
   0x2a6 is also emitted when a mode switch is rejected (on battery or
   below 20% charge). Moreover, writing "performance" to platform_profile
   on battery returned 0 in ~0.8 ms because \STUB writes CRWM=1
   synchronously and the immediate \GTUB readback at 0.9 ms still sees 1;
   within ~50 ms (observed at 51.8 ms) the EC asynchronously reverts CRWM
   to 0 and emits 0x2a6. Having 0x2a6 trigger the deferred refresh is what
   brought both platform_profile and power-profiles-daemon back to balanced.
   (Note: BIOS 1.16 can also emit 0x2a5 for TBF2-restricted transitions.)

Tested-by: Zheng Shuyang <yhshzh0@gmail.com> # HONOR MagicBook Pro 14 (FMB-P), BIOS 1.16

Thanks,
Zheng Shuyang
