Received: from mail-106116.protonmail.ch (mail-106116.protonmail.ch [79.135.106.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874124156DD
	for <platform-driver-x86@vger.kernel.org>; Mon, 20 Jul 2026 12:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784550221; cv=none; b=OpdNdGjXkGkMnXOPmcfxlkwoQxxHW/k9ubm8ypvYLkOJtKSewles4W/bNFpt4lIrmsdFmk4JYivrJg26hZZbtuytveR6UyKFtRQol0wznTzvdNL+38BiiO8EATK9HAMHC7+YQrTLOtrOtX/Z9PHxUSqwCU7fp7T+T64hL7vOUQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784550221; c=relaxed/simple;
	bh=ivja1mjH6Hef60Py77qH+mfmF5BMTbrZAg7iONyhjws=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D2+PbEBax5+muo7rtVRSedvPYUed05MmWr3B62raKgvdg3hAR8uUg4BQn3EvmOX9FfFsqV4EvMbeNeqk7kaYSnUdHvFjxzxwkQz434iVqtGQGvLqAjQ5TOQiTjS+SnjJ36txsb169zt10H3nTiMgFha3AjM+qNwT04gqG83Qywc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=berg.pm; spf=pass smtp.mailfrom=berg.pm; dkim=pass (2048-bit key) header.d=berg.pm header.i=@berg.pm header.b=nhgnS8Q0; arc=none smtp.client-ip=79.135.106.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=berg.pm
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=berg.pm
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=berg.pm header.i=@berg.pm header.b="nhgnS8Q0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=berg.pm;
	s=protonmail; t=1784550208; x=1784809408;
	bh=KLlnRZuoE9KiDVHowx8tPQAjTRYPMC37zV4OZ5JfM0k=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=nhgnS8Q0r7teTYObba6C4lA3rQ2Eb8kj0a83NX4Iad2cf18lkIDfrzxzMp/R2+1N3
	 88tbFNw0V73yhmmig8RTJ/vxGJRs9CrZpa1MlrwjBIhZdE0xflZQoBvN4YGVMDh/xE
	 yhPHnt3jS6XQshwzgaPn1WzeQ1cJtkqSE2qeWHU5595hU8OlsSJN9WcCIdpMqUS35i
	 M8f/Ka2QEtniCchqmrRuaSMbEIfxSXFpSnbb7nT9anq3wpV/SFGiJqiivP4SibebN0
	 4vZTvGYXtxKFFmNIh1gfDFZ24e4aq4V4aj4vR2bJEqltZQvtPxnP9NbAVTlxqTcobj
	 Apu2AVK9BOYWg==
Date: Mon, 20 Jul 2026 12:23:20 +0000
To: Hans de Goede <hansg@kernel.org>
From: Jakob Berg Jespersen <dev@berg.pm>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Daniel Scally <dan.scally@ideasonboard.com>, =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Tooraj Taraz <tooraj.taraz@yahoo.com>, "Joseph V. Lavigne" <jlavig88@gmail.com>
Subject: Re: [PATCH] platform/x86: int3472: handle GPIO type 0x08 as a power regulator
Message-ID: <wWCJgdk1-0MrfeN6bRValpATGnQ4BcEzShHI5qI7Nywi6LWcYiq9BDKaaaH5Y0SmHJl2IlGNepOmbjVkwr0APh4dA1fzX7M9VCWZM6XR_-w=@berg.pm>
In-Reply-To: <760d53df-7353-4f6f-b946-a3b76a09e503@kernel.org>
References: <20260719-sp7plus-int3472-v1-1-521a43f5c191@berg.pm> <al1I_A0AiKXpHKfN@kekkonen.localdomain> <760d53df-7353-4f6f-b946-a3b76a09e503@kernel.org>
Feedback-ID: 210104851:user:proton
X-Pm-Message-ID: 1327328da961de2628a6df74dd2779894c19e29d
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


On Monday, July 20th, 2026 at 12:14, Hans de Goede <hansg@kernel.org> wrote=
:

> Hi,
>=20
> On 20-Jul-26 00:00, Sakari Ailus wrote:
> > Hi Jakob,
> >
> > Thanks for the patch.
> >
> > On Sun, Jul 19, 2026 at 08:15:12PM +0200, Jakob Berg Jespersen wrote:
> >> On the Microsoft Surface Pro 7+, the rear camera's INT3472 device
> >> (INT3472:01, sensor INT347A / ov8865) enumerates a GPIO of type 0x08
> >> in its _DSM which the driver does not recognise, so it is left
> >> unmapped:
> >>
> >>   int3472-discrete INT3472:01: GPIO type 0x08 unknown; the sensor may
> >>   not work
> >>
> >> The DSDT shows this pin (0x0100AF08, pin 175, active-high) sitting
> >> alongside a normal type-0x0b power-enable GPIO: it gates a second
> >> sensor power rail. Because the type is unknown the rail is never
> >> enabled, the ov8865's "dvdd" supply resolves to a dummy regulator, and
> >> the sensor never probes.
> >>
> >> Map type 0x08 for INT347A to a POWER_ENABLE regulator with con_id
> >> "dvdd", the supply the in-tree ov8865 driver already requests, so no
> >> sensor-driver change is needed. ("dvdd" rather than "avdd" because the
> >> type-0x0b power-enable pin on this INT3472 is already registered as
> >> "avdd".)
> >>
> >> Type 0x08 is not in the driver's documented function list and is not
> >> otherwise handled by mainline; based on the sensor's supply set and th=
e
> >> con_id that brings it up, it appears to be the DVDD (digital core
> >> voltage) rail, the counterpart to the existing DOVDD (0x10) type.
> >>
> >> Related out-of-tree work approached the same rail by adding a new "pwr=
1"
> >> supply instead of the sensor's existing "dvdd" (linux-surface PR #1867
> >> for the Surface Pro 9, PR #2201 for the Pro 7+ ov8865); neither was se=
nt
> >> upstream. Mapping to "dvdd" keeps the change contained to int3472.
> >>
> >> With this change the SP7+ rear camera probes and streams reliably,
> >> validated by over a month of use.
> >>
> >> Link: https://github.com/linux-surface/linux-surface/pull/1867
> >> Link: https://github.com/linux-surface/linux-surface/pull/2201
> >> Cc: Tooraj Taraz <tooraj.taraz@yahoo.com>
> >> Cc: Joseph V. Lavigne <jlavig88@gmail.com>
> >> Signed-off-by: Jakob Berg Jespersen <dev@berg.pm>
> >> ---
> >> 0x08 is left as a bare literal rather than a named constant here; if
> >> its canonical meaning is known I'm happy to add e.g.
> >> INT3472_GPIO_TYPE_DVDD and/or handle it generically like DOVDD in v2.
> >>
> >> This is my first kernel contribution, so please bear with me on any
> >> process mistakes.
> >> ---
> >>  drivers/platform/x86/intel/int3472/discrete.c | 13 +++++++++++++
> >>  1 file changed, 13 insertions(+)
> >>
> >> diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/p=
latform/x86/intel/int3472/discrete.c
> >> index 115bb37577a1..98c7b9bc393f 100644
> >> --- a/drivers/platform/x86/intel/int3472/discrete.c
> >> +++ b/drivers/platform/x86/intel/int3472/discrete.c
> >> @@ -164,6 +164,19 @@ static const struct int3472_gpio_map int3472_gpio=
_map[] =3D {
> >>  =09=09.con_id =3D "dvdd",
> >>  =09=09.enable_time_us =3D 45 * USEC_PER_MSEC,
> >>  =09},
> >> +=09{=09/*
> >> +=09=09 * Surface Pro 7+ ov8865 (rear camera): type 0x08 is an
> >> +=09=09 * undocumented sensor power rail; left undriven the sensor
> >> +=09=09 * stays in a failed power state. "dvdd" rather than "avdd"
> >> +=09=09 * because this INT3472 also has a type 0x0b (power enable)
> >> +=09=09 * pin already registered as "avdd".
> >> +=09=09 */
> >
> > GPIO type 8 is in fact "POWER1" (type 7 being "POWER0"). This hasn't be=
en
> > seen anywhere yet so support for it hasn't been added either.
> >
> > I understand the POWER_ENABLE GPIO is for executing the entire power
> > sequence and isn't expected to be found with the other regulators, henc=
e an
> > apparent conflict here wouldn't be an issue.
> >
> > I think for now we could map type POWER1 (8) to "dvdd", however not usi=
ng a
> > quirk but doing it for all devices, like mapping POWER_ENABLE to "avdd"=
.
> > That'd leave mapping POWER0 to "avdd" for later. The GPIO definition fo=
r
> > POWER0 could be added in any case.
>=20
> I was wondering what the internal Intel headers said for type 8, so thank
> you for clarifying that that is called POWER1. Adding a generic mapping
> of POWER1 to "dvdd" instead of using a quirk sounds good to me.
>=20
> Regards,
>=20
> Hans
>=20
>=20


Thanks both, and thanks for the POWER0/POWER1 naming.

That approach makes sense to me. For v2 I'll:

 * add INT3472_GPIO_TYPE_POWER0 (7) and INT3472_GPIO_TYPE_POWER1 (8)
   definitions,
 * map POWER1 to "dvdd" generically in int3472_get_con_id_and_polarity(),
   dropping the INT347A quirk,
 * leave POWER0 defined but unmapped for now.

I'll retest on the Surface Pro 7+ and send v2, with a Suggested-by:
trailer for you, Sakari, for the generic approach.

Thanks for the quick review.
Jakob
