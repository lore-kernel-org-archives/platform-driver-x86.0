Received: from mail-244119.protonmail.ch (mail-244119.protonmail.ch [109.224.244.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E82D33DAAD7
	for <platform-driver-x86@vger.kernel.org>; Mon, 31 Aug 2026 09:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788168106; cv=none; b=Vj22fDZSZE+vu1D+wXua13htsNUdWejZMgWaqZpN0vvN2CGu09qEFIdWK4Rzq7VaU+FnSB/+bNobpgim7yUq9U0oDPuk5fysVmpXfgj/yL5RYZXsXlyDL3kGeuW6qM9/JPkrirjt3l5GrhX21qHCa0ql9zK7eFQQyvt9DDb54rA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788168106; c=relaxed/simple;
	bh=UEeN7K2KXI/ttH3ws4cBIbiBg8OfS27DqmjeATDsQEw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XCf3SKnuVgz4zg/USUmRCVKiDbejoQZVgEPCzUBRcSgIiLCpCypkYc7Ja4/CgzlJcMB6sFq09rJFKFx7/nX6+Cb/zUjBx89x3fZlHq+vMODf879yL5mRwkpLbvG5k/gNjvnLa4wWZD+2/ko86nzFSErFA+YTLaNahRD/tPlPzSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=berg.pm; spf=pass smtp.mailfrom=berg.pm; dkim=pass (2048-bit key) header.d=berg.pm header.i=@berg.pm header.b=Dw3JvN+D; arc=none smtp.client-ip=109.224.244.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=berg.pm
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berg.pm
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berg.pm header.i=@berg.pm header.b="Dw3JvN+D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=berg.pm;
	s=protonmail; t=1788168100; x=1788427300;
	bh=bo3aaKxAXier+NUIPT2YsAFnTSCOPF2dzGRUxGbpf4A=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Dw3JvN+DZdvLQQo9M9V8ew2sWzBW0egw35/t5Ws1iRkp8M+VonmOBIzyxou/4lynk
	 BNHtmtOrY+A6j9y3G4yb9iHk/KcOn7LM1Io8ztrGVxAqL4BWgk15GA2IIlpiatkYCX
	 b1dUAYp1nsoMXOC8TM+g3ZV4yjJNNZUQ5zMSyL1+aFAgbAo5IuNSXrDX35TdABUPrM
	 vgmnNudlS6c5qQt78cKb5wvIVk46wsFXh2J/SorpuSpHy3TqNBf/cje60xcz3/eiaN
	 XPytcEGKqcNlE5UbRA12+1VzpK/b4zbbXlyq0bQwwvJOtrA91pV6AJdXE7TT6BkTK7
	 xQqjAkgVAqmaw==
Date: Mon, 31 Aug 2026 09:21:34 +0000
To: Sergey Lebedev <lsa.uz@pm.me>
From: Jakob Berg Jespersen <dev@berg.pm>
Cc: Daniel Scally <dan.scally@ideasonboard.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Hans de Goede <hansg@kernel.org>, =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] platform/x86: int3472: support the POWER1 GPIO type
Message-ID: <xwSI6AZy8i6fOp48SxKkCmFiG2NNdkRtidVqaIi0VsczFe_1Kh9UUuamWCuaSrVXpxPO4YdGgNfeWxbpuFns_VUTQfUCEfCTFTD1ARbH9mw=@berg.pm>
In-Reply-To: <20260830134126.70277-1-lsa.uz@pm.me>
References: <20260830134126.70277-1-lsa.uz@pm.me>
Feedback-ID: 210104851:user:proton
X-Pm-Message-ID: 92dc338287ec179c84bfe11563fbed8025f404d6
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Sergey, thank you for testing it on your SP11

Does any of the maintainers want me to send out a v4 of this patch where I =
include a commit message with this limitation related to ov13858?=20

Best,
Jakob

On Sunday, August 30th, 2026 at 15:41, Sergey Lebedev <lsa.uz@pm.me> wrote:

> Hans pointed me at this from a report I sent this morning about the same
> GPIO type on a Surface Pro 11 - thank you, and sorry for the duplicate
> question. I have now tested this patch on that machine, which is a third
> model and, more usefully, a different sensor. Result below, with the part
> that is still missing for this sensor family.
>=20
> Tested-by: Sergey Lebedev <lsa.uz@pm.me>   # Surface Pro 11, INT3472 side
>=20
> What the patch fixes here
> -------------------------
>=20
> Built on 7.0.0-30 (Ubuntu 26.04). The warning is gone and the rail is
> mapped:
>=20
>   before: int3472-discrete INT3472:00: GPIO type 0x08 unknown;
>                                        the sensor may not work
>   after : no int3472 messages at all
>=20
>   /sys/class/regulator:
>     regulator.1  INT3472:00-avdd
>     regulator.2  INT3472:00-dvdd     <- new, from this patch
>     regulator.3  INT3472:01-avdd
>     regulator.4  INT3472:01-dovdd
>     regulator.5  INT3472:02-avdd
>=20
> Nothing else regressed: audio, Secure Boot and module signing unaffected,
> no failed units.
>=20
> What it does not fix, and why that is not this patch's fault
> ------------------------------------------------------------
>=20
> The camera is exactly as dead as before:
>=20
>   ov13858 i2c-OVTID858:00: failed to find sensor: -5
>   every regulator: num_users=3D0, state=3Ddisabled
>   /dev/media0: 0 entities
>=20
> The rear sensor here is an OV13858, and the in-tree ov13858 driver reques=
ts
> no regulators and touches no GPIOs at all - zero `regulator` and zero
> `gpiod` references in drivers/media/i2c/ov13858.c. So INT3472:00-dvdd is
> registered and then never claimed by anyone, and the sensor is still held
> in reset because nothing releases it.
>=20
> That is exactly the difference between your machine and this one. ov8865
> asks for "dvdd", "dovdd" and "avdd" by name, so mapping POWER1 to "dvdd"
> completes the picture for the Surface Pro 7+. ov13858 asks for nothing.
>=20
> The same conclusion was reached independently on the Surface Pro 10, whic=
h
> carries the same OV13858:
>=20
>   https://github.com/linux-surface/linux-surface/issues/2153
>=20
> There they had to add reset-GPIO handling to ov13858_probe() and force th=
e
> regulators on, and describe the latter as too broad for upstream.
>=20
> So: this patch is correct and necessary, and for the OV13858 machines it =
is
> not sufficient. The remaining work is in the sensor driver rather than in
> int3472, which seems worth stating explicitly so nobody expects the Pro 1=
0
> or Pro 11 rear camera to start working when this lands.
>=20
> If it would help, I am happy to test a patch teaching ov13858 to request
> its supplies and release reset - it is the same shape as what ov8865
> already does. The machine is here and I can build and boot kernels on it.
>=20
> One note for anyone reproducing this out-of-tree: the module build uses
> /usr/src/linux-headers-<ver>/include/, not the patched source tree, so
> patching only the tree gives 'INT3472_GPIO_TYPE_POWER1' undeclared. The
> installed header has to be patched too.
>=20
> Thanks,
> Sergey
> 
