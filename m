Received: from mail-06.mail-europe.com (mail-06.mail-europe.com [85.9.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE044AD4AB;
	Tue,  8 Sep 2026 10:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.9.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788862098; cv=none; b=YeHP3v+NFzRF8mgoodp76L+uIYbb9PzhdT6GhYQbjkOtHbz4NyMgRenYTrNSiXh2XraZS+ZATcLkaccEdS2i1ba4V7PW81RWPy6FWMSwaTL1f9++eHpcYs8mQMtIAmXtZLhqNA/b9agTjiRwCZBz3DmZPnqKCXucJFm06zxGKlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788862098; c=relaxed/simple;
	bh=ArU19skjGemn5Kt0JsnHE6iIpOM7oK7+eJHAy/cUnL0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=La58znol/7saNDB3zB00mdALarmR9iCQ8m4I6oFAsNk4zJSJPL3OhWIaR5Cmf60gj6IWOsfH1wvBCBoHSWbg05S4LhIviY1P1VklXyb3frjFc/QOEewWZXQd9NBtk0s5uvI6Gif4vvSBXpfJgHce5gAHU1Yzc2SMFaSarre3JwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=ZhoqJHt2; arc=none smtp.client-ip=85.9.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="ZhoqJHt2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1788862084; x=1789121284;
	bh=eu7PU/jv5+AF5sCTeIdS1tfupIVaFgFC0UhqmUgTDFA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=ZhoqJHt25OPTGUIL5pgbZM7F9YEpde9MjJ8aTwgSnx8BCTf2+OxGvj0IO0Xu5ZQcf
	 kHk56/hEPgvo2623yHMm6ywL+adWwboeQO9qduPTABTWDJ9dQ3QLzi9ubU2I4Iw5v7
	 ubamSI+Iu2nvIO70DvwsLGi//yIxZ1U2R1fBBxeaD2q8MV45KHlnd9o/Pa9Txcnq6I
	 HiJq7i0D2EKGcqBGu2fvM3uIWhGFpzISyVbAExe9roUvC27unxrgoRo02Ps72Hr9VO
	 JIEvSkLuk/SL8RY9WrFv/Bznn7TF6f0dP0Y2GHnaej4NDj3uV1g+wYQPdMaYsupy1z
	 baiGBiGn2M3OQ==
Date: Tue, 08 Sep 2026 10:07:57 +0000
To: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Peter Marshall <pm@petermarshall.ca>, Sylvain Petinot <sylvain.petinot@foss.st.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Hans de Goede <hansg@kernel.org>, Daniel Scally <dan.scally@ideasonboard.com>, linux-media@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] media: i2c: st-vd55g1: Genericize driver and add VD55G0 support
Message-ID: <20260908100751.48357-1-lsa.uz@pm.me>
In-Reply-To: <f164cbf4-04a6-449f-bec1-ea6bc40c4306@foss.st.com>
References: <20260907205908.21303-1-lsa.uz@pm.me> <f164cbf4-04a6-449f-bec1-ea6bc40c4306@foss.st.com>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: 2a79c0329f56cf5abcfb5177660a017280036592
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Benjamin,

Yes =E2=80=94 it is a fork of yours, and Andr=C3=A9 says so himself in the =
header he
kept:

  https://github.com/AndreGilerson/linux-surface-kernel
  branch v7.0-surface-devel, drivers/media/i2c/vd55g0.c

  // SPDX-License-Identifier: GPL-2.0
  /*
   * Driver for VD55G0 global shutter sensor family driver
   *
   * Copyright (C) 2024 STMicroelectronics SA
   *
   * Adapter with small changes by Andr=C3=A9 Gilerson
   */

Against your master it is 127 changed lines out of 2114, and all 59
vd55g0_* function names are the same set =E2=80=94 nothing added, nothing r=
emoved.
vd55g0_patches.h differs in four places: his attribution line, uint ->
unsigned int, and two structs made static. The firmware arrays are
byte-identical, cut1_patch 6868 bytes and cut2_patch 260.

That last point matters for this series. The blob I wrote to
/lib/firmware/vd55g0-cut1.bin to get past the missing-firmware failure was
taken from his header, so it is your firmware, published by you under
GPL-2.0 in your own repository. Peter's driver needs those bytes and
cannot get them from anywhere in-tree; you are the one who can say how
they should reach linux-firmware, or whether VD55G0 should keep a built-in
array the way VD55G1 does.

What the 127 lines actually change, since it is a fair summary of what a
laptop needed that your driver did not have:

  - ACPI. Yours is DT-only; his adds acpi.h and an ACPI match on SMO55F0.
  - Supply names. Yours asks for VCORE, VDDIO and VANA. His asks for avdd
    and dovdd, two rather than three, with the comment that INT3472 on the
    Surface Pro 11 provides GPIO type 0x0B as avdd and 0x10 as dovdd.
  - SGRBG aliases beside the mono formats, commented "allows IPU7 Bayer
    pipeline".
  - illuminator GPIO handling.
  - an unknown revision warns and continues instead of returning -EINVAL.

The second of those explains something I reported yesterday and had not
chased: on this machine Peter's 4/7 leaves `supply vcore not found, using
dummy regulator`. His mapping gives the SMO55F0 GPIOs the names your
driver wants, while the machine's INT3472 appears to describe what Andr=
=C3=A9
named avdd and dovdd. One of the two mappings does not match this
hardware, and I have not established which =E2=80=94 I can measure it here =
if that
is useful.

Two things I should retire from my own report, having now seen the
off-list exchange you added back. Peter had already withdrawn the rename
on 4 September, so the libcamera breakage I raised - the sensor-properties
and helper lookups keying on the entity name, which vd55g1 machines have
today - does not arise in a v2 that keeps the name. And the metadata point
you make to him is the same one from the other side: unknown to libcamera,
the sensor streams but on defaults.

What is not retired is the firmware. Nothing in the exchange touches it,
and it is the one thing that stops anyone but Peter using VD55G0 at all.

For contrast rather than contradiction: he reports the sensor is not quite
usable on his Surface Pro 9 because of IPU6 stream problems, short lines
and frames cut off when the CPU idles. I saw none of that on IPU7 - it
probed, bound and registered, and streamed 60 frames at 30 fps. Different
bridge, different result, which may be worth knowing when the two are
compared.

I should be clear that I am not speaking for Andr=C3=A9. I have written to =
him
separately about upstreaming his IMX681 driver, he answered that mainline
is his goal, and he is away until 28 September. If you want to reach him
directly his address is in the MODULE_AUTHOR line of that file.

Sergey

