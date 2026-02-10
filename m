Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC00D38944E;
	Tue, 10 Feb 2026 16:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770740232; cv=pass; b=gVSeOj/dmtgfJ61BzIgNcYDchsKgXEX5rxOocaPtf2v6AGoggMqLkxYAgJrDDYq887Z6WK4JXphY5NnD9MG5PkEiakY5z9+NsPvN26tCGYpoCux6TYb9Lj4HIQrfT+4N7g0CmOhcTlHTHNWSOi22NSD1+UtxQFENCvwS1g7b7ho=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770740232; c=relaxed/simple;
	bh=aKP/2WZP7Ta56NLIMU8umTbB3Yqr/yTZG8ZG5GkODQU=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=SYv1b9+W9MTLVadiHEFckxNILCuIIp+9NJAuhSQJM2I75+9DdnyHkTGUwTVCmMGP9QrVRd/uoC/uyJhLqjkFelklffz5IG/TnchB01bd8ka4SrNeqi017a0S7s4Nqs+CEI0uH5DTj7V+GNpJoMCMlhM7wFuOmkt5dFNktZ4OPvM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=HM6M/KD1; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="HM6M/KD1"
ARC-Seal: i=1; a=rsa-sha256; t=1770740198; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=BF8qAX3ch/Y4FTZi26pFKzlsTMNHgToW1eOdHcZXz17fdnJsOwYk5eTGz3wFQnX9qw+AwfnXquigNAqlf0GdRWvj9Z9pPuMOtdR6aiyik7PTiVkKe8+M7SqrqzWK7k3TBNSuVq3aFy1kS7bBnp44mHhaagmgVsOfr9pOdxOQeLA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1770740198; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=844sYbyYQdmzonxoi6kVayi6MHgbozQHvMSKbfPkku8=; 
	b=EmADAGAVRoEGfO0SszuqNJD7ueteK8kF4UcSjkBsMUOhlbqsbYxDC2ULHQ4RgELXHzWf0tCefFuVYnmi4EbUnKq+s23EFwxXIcquMyc+fv1u4vX72Eqq5zRMw3zqoXGhnqYIppL1pK//sT+XQKrpnQuQfqbm3WyOU1B1s8PGw1Q=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770740198;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=844sYbyYQdmzonxoi6kVayi6MHgbozQHvMSKbfPkku8=;
	b=HM6M/KD1upaoKWsZbPAiEXgaeuWuONegy/BEz+RI3voDTcG4cfi/ZeyMCMKxerXS
	epeHRm0Tb87DKj2ER+Phr0VglsgDICEG1+nJwMa8tqgdgvFU/i1rJSAFqUvkVzcobK2
	FYq3aAuXpTRRybebaynCfbLGTTxdBanTj4gs2q/dLWtKQA857+f5jjwKrTA3rgJJMGx
	bua+EqaArfqzC49hPOmM3hNoz2y1gLHeBNbr54t2KtDz3WndOjfl4+pQS8SsK6qqdVU
	Dkvlrq40z/Avwj5I70qHBc9QAnC8h3CnAXmAiNH9rsxrXZOhJxWQNv6IDcc4MncDHfO
	N+fj9e6jQA==
Received: by mx.zohomail.com with SMTPS id 1770740196397555.5700289937164;
	Tue, 10 Feb 2026 08:16:36 -0800 (PST)
Message-ID: <a539da08664a2903420538b75de8dd512344a3ad.camel@rong.moe>
Subject: Re: [PATCH] thinkpad_acpi: Add Auto mode support with dynamic
 max_brightness
From: Rong Zhang <i@rong.moe>
To: Hans de Goede <hansg@kernel.org>, Mark Pearson
 <mpearson-lenovo@squebb.ca>,  Vishnu Sankar <vishnuocv@gmail.com>
Cc: Henrique de Moraes Holschuh <hmh@hmh.eng.br>, "Derek J . Clark"	
 <derekjohn.clark@gmail.com>, Ilpo =?ISO-8859-1?Q?J=E4rvinen?=	
 <ilpo.jarvinen@linux.intel.com>, ibm-acpi-devel@lists.sourceforge.net, 
 "platform-driver-x86@vger.kernel.org"	
 <platform-driver-x86@vger.kernel.org>, linux-kernel@vger.kernel.org, Vishnu
 Sankar <vsankar@lenovo.com>
In-Reply-To: <79e768d8-5c09-4d77-8172-3f43fe5ba0fa@kernel.org>
References: <20260203232219.11683-1-vishnuocv@gmail.com>
	 <30354f74-91c0-4fd6-82b1-15f79ae7a60f@kernel.org>
	 <1dbfcf656cdb4af0299f90d7426d2ec7e2b8ac9e.camel@rong.moe>
	 <255c1844-4992-4a7d-9519-39071a208a98@app.fastmail.com>
	 <69b9a9df97f4d10e2d11d6b0eb81bbf41fb4cbde.camel@rong.moe>
	 <1acdc04a-e692-4ea6-8580-13f0b6d24f44@app.fastmail.com>
	 <79e768d8-5c09-4d77-8172-3f43fe5ba0fa@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Feb 2026 00:11:27 +0800
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-8 
X-ZohoMailClient: External

Hi all,

Thanks for your insight.

On Tue, 2026-02-10 at 11:31 +0100, Hans de Goede wrote:
> Hi all,
>=20
> On 9-Feb-26 19:44, Mark Pearson wrote:
>=20
> ...
>=20
> > Yeah - that's fair. You're right - we shouldn't change the brightness f=
ield.
> >=20
> > So, how about adding two sysfs nodes to the LED class?
> >  - auto_brightness_capable - indicates the LED brightness can go into a=
n auto control mode
>=20
> There is no need for this, the mere presence of
> the "auto_brightness_enabled" sysfs attribute (which can
> be in a sysfs-attr-group with an is_visible callback)
> is enough to indicate that the backlight is auto
> brightness capable.
>=20
> >  - auto_brightness_enabled - indicates if the LED is in the auto_bright=
ness controlled state or not.
>=20
> This is for auto-brightness based on an ambient light sensor
> (ALS), right ?
>=20
> My vote would go to use "als_enabled", just like is already done in:
>=20
> Documentation/ABI/testing/sysfs-platform-dell-laptop

In my previous reply I said 'if my proposal is rejected we will have to
continue on "als_enabled"'. But after some consideration, I have a
major concern about its naming: extensibility.

More and more devices already come with a human presence detection
sensor (HPD). Suppose that a future device implements auto-brightness
based on its HPD, the name will be irrelevant and we must introduce
"hpd_enabled" then. Userspace programs must be rewritten to handle
both.

Mark, do you think such devices may appear in the foreseeable future?

Another concern of mine on the approach is that it may lead to chaos if
a future device implements auto-brightness based on multiple sensors.
In this case a well-defined interface should have an aggregated
attribute^ simply representing whether auto-brightness is on or off.

For this reason, a sensor-neutral name will be better if we should
stick with the device attribute approach.

^: A private hw control trigger is like an aggregated attribute while
it can provide trigger attributes for fine-grained control.

> adding new sysfs attributes to a LED class device although
> possible is a bit frowned upon though.

Yeah, That's one of the reasons why I made that proposal.

> In that sense using a trigger is better because it more
> closely matches how the LED class API is supposed to be
> used would maybe be better.
>=20
> So I've gone and re-read Rong's trigger proposal:
>=20
> https://lore.kernel.org/all/a90584179f4c90cd58c03051280a6dda63f6cc1d.came=
l@rong.moe/
>=20
> Rong, previously you also went a bit further with implementing this
> already which you described here:
>=20
> https://lore.kernel.org/all/8a132e7473655ca0119af10339c63beb4df7c201.came=
l@rong.moe/
>=20
> One of the problems you encountered there is what to do if
> the user actually set a trigger themselves and the EC moves
> between fixed-brightness-value <-> ALS .
>=20
> My first idea was to just always override the trigger with
> the special ALS trigger or none.

My PoC does the opposite, see my explanation below.

> But thinking more about this this is wrong. E.g. there
> are triggers which turn the backlight on when user input
> is detected and then off after a while, which would be
> a perfect reasonable thing to use together with a kbd-backlight.

Yes, that's why my PoC intentionally does nothing when an other trigger
is active, effectively allowing the active trigger to override the ALS
trigger. See led_trigger_do_hw_control_transition().

> Thinking more about this triggers are typically for deciding
> when to turn the LED on/off not for controlling brightness

The trigger "pattern" can control LED's brightness.

> many of them actually allow still writing the brightness
> sysfs attr and then when the LED should be on according to
> that trigger, the trigger use the last written brightness.

Thanks for the information! I didn't know there are triggers behaving
like this before.

> Looking at things this way ALS is not really a trigger, it
> is more of a brightness control mechanism.

IIUC, being able to control something that is not capable for a general
purpose LED trigger is the reason why the private trigger interface
exists.

> So I think the best and also KISS solution here would be
> to go with adding a "als_enabled" sysfs attr to the
> LED class device, which is only visible when support,
> just like is already done in:
>=20
> Documentation/ABI/testing/sysfs-platform-dell-laptop
>=20
> I would also call led_classdev_notify_brightness_hw_changed()=20
> when the EC moves between fixed-brightness-value <-> ALS.
>=20
> Userspace will likely already have a poll() going on on
> the brightness_hw_changed sysfs attr, so this way userspace
> which is aware of the als_enabled sysfs attr can also check
> that.
>=20
> You can then report brightness_max as the new value when calling
> led_classdev_notify_brightness_hw_changed() since the ALS can go
> up to brightness_max, likewise you could also always return
> brightness_max when reading the brightness value while in ALS mode.

Makes sense. If we decide we should stick with the device attribute
approach, I will adopt this in v2 of my ideapad-laptop series.

> The only real question left then is what to do on brightness
> writes. I would do the same as what triggers do here, ignore
> writing non 0 values and turn off the backlight (and thus also
> ALS) when 0 is written.

I have two concerns on this behavior:

1.

IIUC, there is no way for a LED device to determine if it is attached
to a trigger. The LED core does know this, but it won't tell the LED
device driver.

In other words, we can't distinguish trigger requests from userspace
ones in our brightness_set[_blocking] callback, so we have to either
ignore both or none. As a result, we can't ignore anything and must
blindly accept any incoming requests in order not to break triggers.

That's another reason why I made my proposal -- it must become a
trigger in order to be aware of other triggers.

Am I missing something? Or did you mean we should add the attribute to
the LED core?

2.

I quickly rechecked the LED core's code, and it doesn't behave as you
expected. It doesn't ignore non-zero written values when a trigger is
attached to the LED, and it will set the LED's brightness to the
written value despite the trigger (it will be discarded by next trigger
event, though).

When the effective trigger is a hw control trigger, LED core's behavior
effectively disables hw control. Hmm... it seems that this side-effect
has been documented:

   When the LED is in hw control, no software blink is possible and
   doing so will effectively disable hw control.

So in my perspective the hw control trigger approach is semantically
correct here (in an unexpected way).

> Note as for actually allowing "auto" for the brightness value
> (read/write) that would break userspace assumptions that that
> file always contains an integer, so that is not an option IMHO.
>=20
> Regards,
>=20
> Hans
>=20

On Mon, 2026-02-09 at 13:44 -0500, Mark Pearson wrote:
> Thanks Rong
>=20
> On Mon, Feb 9, 2026, at 1:14 PM, Rong Zhang wrote:
> > [...]
> >=20
> > If there is a mechanism to set the brightness on specific events or
> > conditions, it is a trigger. If the trigger is controlled by hardware,
> > it's a hw control trigger. That's why I propose using a private hw
> > control trigger to represent this to make it semantically correct.
>=20
> Ah. I think it will be confusing for most users. They're not going to thi=
nk of it as a trigger (that's my guess anyway)

I guess most users simply tune the keyboard backlight via desktop
environments, so it won't directly make them confused. When it comes to
desktop environments, this is precisely why we want the interface
capable to notify userspace about HW status transition.

And both `cros_ec' and `turris-omnia' have been using private hw
control triggers to represent auto mode.

> > [...]
> >=20
> > I admit that my proposal is complicated and may need a lot of time to
> > make it into its right path. It may even be rejected by LED folks. But
> > it's the best approach I can think of considering our requirements on
> > the interface:
> >=20
> > 1. It shouldn't break any existing interfaces.
> > 2. It's exposed to userspace for getting or setting its status.
> > 3. HW status transition should reach userspace (similar to
> > LED_BRIGHT_HW_CHANGED).
>=20
> Just to check - for #3 do you mean it should report the brightness change=
s when it's in auto mode (i.e. if it got brighter or dimmer); or if it shou=
ld just report it switched in/out of auto mode.=20
> I don't think we need to report every brightness status change - and swit=
ching modes should be user directed so is no different to currently. Am I m=
issing something?

I meant auto-brightness on <-> off, or fixed-brightness-value <-> ALS
in Hans' words.

> Thanks
> Mark

To conclude:

1. My proposal:

Upsides:
- mutually exclusive with other triggers (hence less chaos)
- semantic correctness
- extensibility (through trigger attributes)
- acts as an aggregate switch to turn on/off hw control

Downsides:
- complexity
- needs approval from LED folks
- (I admit both are major blockers...)

2. Device attribute

Upsides:
- simplicity, KISS
- no need to touch LED core
- extensible as long as it has a sensor-neutral name

Downsides:
- must have zero influence on the brightness_set[_blocking] callback in
order not to break triggers
- potential interference with triggers and the brightness attribute
- weird semantic

I am actually OK with both approaches. If you still consider the device
attribute approach is better after reading my concerns, I will no
longer insist on my proposal.

Thanks,
Rong
