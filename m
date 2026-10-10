Received: from mail-4323.protonmail.ch (mail-4323.protonmail.ch [185.70.43.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E332E33F588
	for <platform-driver-x86@vger.kernel.org>; Sat, 10 Oct 2026 08:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791619332; cv=none; b=Q+6jGH8KNrzkkJXIwM2uN0Ii5iywg9m5tbGPDvtE/alPvBQj+1MIlqTZCkFZl7ttLX1Lss987vbfmSjS9+tnsgIeeOWoryfZAjGY8z4YzVkIoc8m5gatb5LTYeBrW/SuYJkzi/57JSJAIlA9c04N64Y1ch8zgVDmXuqTnIioKrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791619332; c=relaxed/simple;
	bh=1iNm0gD4JZpQNgpNgc6CPJoa3+agOCU2DAeYLJQvsKw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=E6PdINX/I0fMqNNQt/KDcIfWoCXORz7z7W1ZlP9beFfpWRoKL0pEerk1udgOxDsc+hRqi0Edml7Q/YRy5BoCkc3pEpicQpsr4g0O7NUHLiriXu+QTpb7nVpNO56abg33KufKCsCAiKxbPen5mehD+qZ+9eM5AC3O7n/xdhUBwxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cohunt.app; spf=fail smtp.mailfrom=cohunt.app; dkim=pass (2048-bit key) header.d=cohunt.app header.i=@cohunt.app header.b=fmV7eOAs; arc=none smtp.client-ip=185.70.43.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cohunt.app
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=cohunt.app
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cohunt.app header.i=@cohunt.app header.b="fmV7eOAs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cohunt.app;
	s=protonmail; t=1791619321; x=1791878521;
	bh=YrIz78TRvuSe9iB5ZaSVi24QzCijOQm8jbMInELzL98=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=fmV7eOAsA1JPkXVJqBy6zKVKnZQsclQV4px/MQImXzbX5L9W4QObf5cqiKJQe4kWd
	 5OnzTfntJ8vZ9B8dH4CqqekdPYYcN/lxcvwljnr8IOdEMrycSPZeZW2FR+eCHe9vkd
	 Tsmc0Orl/Dw3QyaaJ81eLrq5j5814GPG7bnKHd6jv99Om6gcydkxqL5kRLDF0fT+tQ
	 O6Y751GAo97UYrzmZQJ5/gw5lPalLW4BY3IJs1FMfwTPreZwXQBa34PBv1y46kxFQf
	 w5Yj8EuPxH0C54HYaIIL5fO3Qt7lvfv64XNOVWXos1HeVEu4OfQTvNzhh5ZSbJg5bh
	 /wxPrQr4R3riQ==
Date: Sat, 10 Oct 2026 08:01:57 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>
From: diamondback <diamondback@cohunt.app>
Cc: Alexander Patrakov <patrakov@gmail.com>, Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, platform-driver-x86@vger.kernel.org, Linux Media Mailing List <linux-media@vger.kernel.org>, Sahan Nissanka <adee.sahan@gmail.com>
Subject: Re: int3472: GPIO type names disagree with Intel's Windows driver
Message-ID: <lVgzYFlB_DT3TKJryx4Et9QF3-oqL7pSNP37e4tUENOuzf7sLRLshnvAkcz1jYpd6NCOqlqowIFv1Di9Ddo2Io1_K3HC5gjylmd-kuDLJv8=@cohunt.app>
In-Reply-To: <aslsXPVJIuYRrgKv@kekkonen.localdomain>
References: <CAN_LGv0qkxARw4bxO8K-1hUkWNg2ts6q50dooCB5UM5en=bo0w@mail.gmail.com> <d9a37aff-3b4d-467c-825d-5473b4c1bbb4@ideasonboard.com> <CAN_LGv0nBTkVmxbuK+_O1v5Z_OZqQz5LgEZdL1_37otsei36fQ@mail.gmail.com> <aslsXPVJIuYRrgKv@kekkonen.localdomain>
Feedback-ID: 140204222:user:proton
X-Pm-Message-ID: 60d033a518ee166797fb3eeff3129473157ec720
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Saturday, October 10th, 2026 at 12:36 AM, Sakari Ailus <sakari.ailus@lin=
ux.intel.com> wrote:
=20
> The GPIO naming in Windows drivers is also an abstraction while Linux
> drivers typically use datasheet names of regulators, which are sensor
> specific. The handshake GPIO shouldn't exist with the regulators so it
> should be possible to map the rest independently of that. Changing the
> default mapping would also be possible, in principle, but that'd still
> require ensuring all sensor drivers still get the required regulators. I'=
m
> not sure it's worth it.

Answering Alexander's question to me from the first mail:

On 09/10/2026 04:06, Alexander Patrakov wrote:
> Leif, do you remember what it was based on, and which other GPIO
> types that machine's INT3472 reports?

It was based on inference. My notes from February only say "likely
DOVDD": the ov5675 driver asks for avdd, dovdd and dvdd, 0x0b and 0x12
already had avdd and dvdd, so 0x10 got the remaining name. v1 already
called it DOVDD; Hans only asked me to drop the OVTI5675 quirk entry and
spell the con_id "dovdd" instead of "vio". In hindsight, my commit
message should not have stated it so concretely.

What the Fold declares (from _DSM and the BIOS pin fields):

  INT3472:00 (\_SB.PC00.DSC0), all sensor-on value 1:
    0x00  reset    pin 335
    0x0b  PowerEn  pin 140
    0x10  Avdd     pin 164
  INT3472:01 (\_SB.PC00.DSC1): no _CRS, zero pins.

No 0x0f, 0x11 or 0x12. And a correction: that INT3472 is not the
OV5675's. The OV5675's _DEP names only the IVSC device, it uses dummy
regulators for all three supplies, and the supply map shows both
regulators going to the IR sensor:

  INT3472:00-avdd -> i2c-SMO55F0:00.avdd
  INT3472:00-dovdd -> i2c-SMO55F0:00.dovdd

So 0x10 on the Fold is a VD55G0 pin, not an OV5675 one.

I can confirm the table from the same package (iactrllogic64.sys,
same sha256, 22 entries at 0x21c60, 0x10 =3D Avdd). The same names were
also posted on this list in September, so this is the third sighting.

Dan's suggestion makes sense to me, the Fold is a good test unit: it
declares 0x0b and 0x10 for the same sensor, so renaming 0x10 to avdd
across the board would make INT3472:00 fail to probe here (-EBUSY).
Happy to test whatever you send.

Leif
