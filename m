Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch [109.224.244.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08373B0AF5
	for <platform-driver-x86@vger.kernel.org>; Sun, 30 Aug 2026 11:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788089279; cv=none; b=tCDN3fevV/sXIb8xLgzPl0vwFbDTD8RP+fI2hkEtEgWe0kZZoKvMis6v06XX2tCMGjKreX3lUpvLX5nDtpXyk/DrZBXDvpUd38K7etecnIQiuHt2MkjFNTi9m24QtOQag4d6BMNkSU/NwFEjvburaaeP0aBdRfe1WsNe03Sr4GU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788089279; c=relaxed/simple;
	bh=PjPOOTuBeoi9Xq4TdOM0L51B85dDpN9y7t1C9i4JiII=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=KeGPb9iOTl6Np/KlGWpqXvQAiZiaLU5+xkcFvtYo/7/vW6F8grgVQuqR8wVgD9+BqGc0EthlcYf8scFA4jIIMN+GWR3pVV6rHv8Q0gU5VIjFIzmnKxmk1kE9CRv/JPj/QkagLwCRSElIVAOnvPvKppXY9dOEEdvb6mIipzHJfMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=i5mF63jp; arc=none smtp.client-ip=109.224.244.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="i5mF63jp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1788089267; x=1788348467;
	bh=rUOw5WDPPCtivdaFHxvTS3NsDJPXEHvp5BBpHjmcdcA=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=i5mF63jp6fkdOnHUvVUIkXoDARr2BxA2xGpvDOGVsH854zRkZC+LhbOkZCwoZ/rHc
	 44Jd8j4T25nR15kYC19R9iIrvwNi4tzJLmvmFYJ7OWSzUMUzH93IK9v2yfdwBI3nRn
	 eHUj/5YrzuHaLvM0uAyRZl4rdT8aLpkmu66XAi+LDEeXOAB1WV3XQDLEoVHCJlahRU
	 KjQN29kyY00tBajGJt5LbVJdZYKhEar2H6eHtGTaxZZvjV8zg1PBNwi1G0xOT9LBRq
	 qK4qDR7sdW/uq2DjjHYglFmLpRxaa0LkM++Zt5F2p4yj3rRNmsgNnqc/XKM0C8EEU7
	 cPFHOnsMZxaag==
Date: Sun, 30 Aug 2026 11:27:43 +0000
To: Daniel Scally <dan.scally@ideasonboard.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Hans de Goede <hansg@kernel.org>, =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: int3472: unhandled GPIO type 0x08 leaves the rear camera dead (Surface Pro 11, Intel)
Message-ID: <20260830112736.85573-1-lsa.uz@pm.me>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: 855f0ce254b2a3682a46683ef7bdd538b32d8d34
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello,

On a Microsoft Surface Pro 11 for Business (Intel, Lunar Lake) the rear
camera does not work, and it traces to a single unhandled GPIO type in
int3472-discrete.

  int3472-discrete INT3472:00: GPIO type 0x08 unknown;
    the sensor may not work
  ov13858 i2c-OVTID858:00: failed to find sensor: -5
  ov13858 i2c-OVTID858:00: probe with driver ov13858 failed with error -5

The result is 32 /dev/video* nodes and a media graph with zero entities.
The IPU7 itself is healthy - firmware loads, CSE authenticates, the device
reaches secure mode - so the failure is entirely on the sensor-power side.

Reproduced on 6.17, 7.0.0-28 and 7.0.0-30 (Ubuntu 26.04), and the switch
in drivers/platform/x86/intel/int3472/discrete.c still has no case for
0x08 in 7.1.0-rc7, so I do not believe this is already fixed.

What the firmware describes
---------------------------

The DSDT declares three INT3472 devices. Decoding their _DSM returns with
the driver's own field layout (type =3D bits 7:0, pin =3D bits 15:8):

  Device (ICL0)  -> INT3472:00, the rear sensor (OVTID858 / ov13858)
    0x1000070B   type 0x0b POWER_ENABLE   pin  7
    0x10000500   type 0x00 RESET          pin  5
    0x1000060D   type 0x0d PRIVACY_LED    pin  6
    0x10000408   type 0x08 <unknown>      pin  4    <- refused

  Device (ICL1)
    0x1000200B   type 0x0b POWER_ENABLE   pin 32
    0x10000810   type 0x10 DOVDD          pin  8
    0x10000900   type 0x00 RESET          pin  9
    0x10000A0D   type 0x0d PRIVACY_LED    pin 10

  Device (ICL2)
    0x1000170B   type 0x0b POWER_ENABLE   pin 23
    0x10001600   type 0x00 RESET          pin 22
    0x1000250D   type 0x0d PRIVACY_LED    pin 37

ICL0 is the only one of the three that declares a fourth GPIO, it is the
only one carrying type 0x08, and it is the one whose sensor fails. I would
not claim that proves causation - the driver returns 1 for the unknown
type and carries on, so POWER_ENABLE, RESET and PRIVACY_LED are all still
registered - but it is the only resource the kernel declines on this
machine, and the sensor then does not answer on I2C.

The question
------------

What is type 0x08 meant to be, and should discrete.c handle it? If it is
another regulator - the shape of ICL1's DOVDD entry suggests the encoding
supports several - then adding it may be all this machine needs. If it is
something else, I am happy to be told what and to test whatever you would
like tried.

I have not sent a patch because I would only be guessing at the semantics,
and guessing wrong here means silently powering a sensor rail for the wrong
reason.

What I can provide
------------------

  - full acpidump / disassembled DSDT for this machine
  - any debug patch or instrumented build you would like run; the machine
    is available and I can rebuild and boot kernels on it
  - dmesg at any log level

Two adjacent facts, in case they matter, though I am not asking for
anything about them here: the front (SONY0681) and IR (SMO55F0) sensors
have no in-tree driver bound at all, and intel_ipu7_isys still announces
itself as a staging module.

  Machine: Microsoft Surface Pro 11 for Business (Intel Core Ultra 7 268V)
  DMI SKU: Surface_Pro_11th_Edition_With_Intel_For_Business_2103
  Firmware: UEFI 17.100.143 (2025-11-19)
  Kernel:   7.0.0-30-generic, Ubuntu 26.04.1 LTS

Thanks,
Sergey Lebedev

