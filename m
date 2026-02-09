Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A26A130F546;
	Mon,  9 Feb 2026 18:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770661215; cv=pass; b=BMeavfOlBQUSkN5/dRTthvQEoYZee2kYKtLZ2Dn4jR27yXderpaTO0bETtqDgNc4U0+XBA/hV/ZP1v9JyQ2mkr0RGIoYr4QD4nyF03I1Y90vkxk2258Uqd5fx9cuKxQt6jvdUkiDyPznRHwW5e+5B2YcdNi+swPc1GybQC3ga34=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770661215; c=relaxed/simple;
	bh=du17CnDOkgnYRDFegpxvnpssnlObA7oWB9wdLLwLL6I=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=R5Lqpy9VGf5BaVa2I4nlLac0WRpPUSyDaJqXI2lFUJbgn3+wPoCtVKCRaDsHg1Y1a2KVkw2Y8c7OXPP4Ici+psv6uvMlGxkx2AYBuy61nu4IiLH73NWsuqwTMgkQzh9PjhooWwOWFS3bFEtdO5l5NrmsesSnYRkJ5Jau8qNwqKs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=Fn4wnKso; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="Fn4wnKso"
ARC-Seal: i=1; a=rsa-sha256; t=1770661190; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=W0c4PsQRMjK+gnYeiMdp0PcQ5DGlGBoWdb1XU5zIyoE6yHaZvND68mvBTf4tyxoAT2nagnaBh6KxG8t+RP2FV+7UOD5oOztLfNN/xvh8q2JiH6vaoNkI2EtUOvLmcxkz+3+qSxucYF2EBb9Pmyqb3jSnDFvrPTRpjTPX/pzorPI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1770661190; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=SSV3QduBpReGICdYxIUKFYDd9+d9A4FSC1E5auajY9g=; 
	b=GFo7vcKj2mHkyYXn4UVMukI/CpgFai5ariNL4+ao3pqBukK4IYBAfiAUh+ARZ8+f6kwlvoYb0HhZw7rsYdvnEYvXc6FgU0MkBc5NpwDh6Gm47F1mwnmAIm69bwdsAlZGaJMTBrDeR+NVWYkmxVt8K5HKIBEL5lm6qMzFkDrsLRs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770661190;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=SSV3QduBpReGICdYxIUKFYDd9+d9A4FSC1E5auajY9g=;
	b=Fn4wnKso9UqzNHqhtAlp8VibcGA/Rdn/evpiCzfJ++6hEK9yiTrpCjvUmc7OOM5H
	j+vi5m8DlkQ60F99kYteKDBkyA2WsFz31zt4xMd6IDs4RVIhnNvG2pfsHcIA4L9WIrT
	/VDDXuhPCXr2/UPRjafNZk2bNrffrvOQvzGS1lH5bnIeC5qCdlsDrwHU5a3L30U+XiK
	j60YpQYw8L/1CU+bX/OmnRsRtB/ql73mvCNeD9pIych7SlUKEtH0AZaIK3KS8j8LCBy
	IfcN+p0sSmB1clYfuIGUpaABLmRLaB5HdYU00I7vHf81a2umWV732l7lzgak9P6hKr+
	/LKN+4zWbg==
Received: by mx.zohomail.com with SMTPS id 1770661188149459.6853207474702;
	Mon, 9 Feb 2026 10:19:48 -0800 (PST)
Message-ID: <69b9a9df97f4d10e2d11d6b0eb81bbf41fb4cbde.camel@rong.moe>
Subject: Re: [PATCH] thinkpad_acpi: Add Auto mode support with dynamic
 max_brightness
From: Rong Zhang <i@rong.moe>
To: Mark Pearson <mpearson-lenovo@squebb.ca>, Hans de Goede
 <hansg@kernel.org>,  Vishnu Sankar <vishnuocv@gmail.com>
Cc: Henrique de Moraes Holschuh <hmh@hmh.eng.br>, "Derek J . Clark"	
 <derekjohn.clark@gmail.com>, Ilpo =?ISO-8859-1?Q?J=E4rvinen?=	
 <ilpo.jarvinen@linux.intel.com>, ibm-acpi-devel@lists.sourceforge.net, 
 "platform-driver-x86@vger.kernel.org"	
 <platform-driver-x86@vger.kernel.org>, linux-kernel@vger.kernel.org, Vishnu
 Sankar <vsankar@lenovo.com>
In-Reply-To: <255c1844-4992-4a7d-9519-39071a208a98@app.fastmail.com>
References: <20260203232219.11683-1-vishnuocv@gmail.com>
	 <30354f74-91c0-4fd6-82b1-15f79ae7a60f@kernel.org>
	 <1dbfcf656cdb4af0299f90d7426d2ec7e2b8ac9e.camel@rong.moe>
	 <255c1844-4992-4a7d-9519-39071a208a98@app.fastmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Feb 2026 02:14:41 +0800
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-8 
X-ZohoMailClient: External

Hi Mark,

Thanks for your reply.

On Mon, 2026-02-09 at 10:46 -0500, Mark Pearson wrote:
>=20
> On Sun, Feb 8, 2026, at 3:58 PM, Rong Zhang wrote:
> > Hi Hans, Vishnu and Mark,
> >=20
> > On Sun, 2026-02-08 at 11:54 +0100, Hans de Goede wrote:
> > > Hi Vishnu,
> > >=20
> > > On 4-Feb-26 00:22, Vishnu Sankar wrote:
> > > > Dynamically detect keyboard backlight capabilities and set
> > > > max_brightness correctly (2 for old models, 3 for new models
> > > > with Auto mode).
> > >=20
> > > Thank you for your patch.
> > >=20
> > > If I understand this correctly, writing 3 as level does not
> > > make the backlight more bright then writing 2, but instead
> > > it puts the backlight in some auto mode ?
> > >=20
> > > If I've that correct then  userspace should keep seeing
> > > a range of 0 - 2 and the special auto mode value should
> > > be reported / be made settable through a separate als_enabled
> > > sysfs attribute under the LED class device. See:
> > >=20
> > > Documentation/ABI/testing/sysfs-platform-dell-laptop
> > >=20
> > > You can add extra attributes there by setting the groups
> > > member of the struct led_classdev, see kbd_led_groups[]
> > > in drivers/platform/x86/dell/dell-laptop.c, except that
> > > you should use a .is_visible callback to only show this
> > > on hw which supports it and you only need 1 group with
> > > 1 attribute.
> >=20
> > When I implemented "als_enabled" for ideapad-laptop, Mark Pearson
> > suggested it'd better to introduce "something similar to
> > LED_BRIGHT_HW_CHANGED"=C2=A0rather than using custom attributes, as "th=
is is
> > going to be a common feature across multiple vendors it might need
> > doing at a common layer". Also, auto mode can be activated by HW as a
> > result of user input, so we need an approach to notify userspace just
> > like what LED_BRIGHT_HW_CHANGED does. More importantly, the read value
> > of the brightness attribute becomes nonsense when auto mode is on. This
> > matches the semantic of hw control trigger.
> >=20
> > I agreed with Mark and had a proposal of allowing HW to initiate a
> > transition from "none" to hw control trigger and vice versa. See the
> > thread in
> > https://lore.kernel.org/all/08580ec5-1d7b-4612-8a3f-75bc2f40aad2@app.fa=
stmail.com/
> >=20
> > I hadn't push it further due to other things taking the priority,
> > though I already had a PoC back to then. I quickly rebased the PoC with
> > some cleanups and put it here for preview:
> >=20
> > https://github.com/Rongronggg9/linux/tree/leds-trigger-hw-changed
> >=20
> > I will find some time to refine it and send an RFC series.
> >=20
> Hi Rong,
>=20
> Thanks for highlighting this (have to be honest - I'd forgotten we'd disc=
ussed it).
> I think my suggestion may have been understood and I wonder your approach=
 is more complicated than needed.

If there is a mechanism to set the brightness on specific events or
conditions, it is a trigger. If the trigger is controlled by hardware,
it's a hw control trigger. That's why I propose using a private hw
control trigger to represent this to make it semantically correct.

> I was thinking we add a new flag to the led_classdev. e.g
> #define LED_AUTO_BRIGHTNESS         BIT(26)

Implementing it this way is still complicated as far as I can imagine:

- A new attribute to expose the capability as you've said.
- We need to extend brightness_get/brightness_set[_blocking] interfaces
to accept/emit a special brightness value to represent auto mode.
- We should handle brightness setting requests from usersapce and from
led triggers separately: the former can put the LED into auto mode
while the latter cannot.
- Deprecate brightness and brightness_hw_changed while introducing new
attributes. We can't extend existing attributes as I will explain
later. That's the most frustrating part :-/

And this approach becomes a bit weird if a future SKU comes with its
auto mode tunable: you will have some device attributes which are only
meaningful when auto mode is active. This is all because they are
fundamentally trigger attributes in the first place...

> Then the platform driver can set this flag and in led_classdev_register_e=
xt we'd handle it appropriately to create a sysfs (e.g. auto_brightness_cap=
able) node so user space knows auto is supported.
> Other than that:
>  - When the brightness is read and auton is being used - return "auto" in=
stead of a value. Hopefully that doesn't break anything for user space?

It will likely break something.=C2=A0We can't extend an interface with new
data types.

For example, existing userspace programs may have being using these for
long:=20

- POSIX shell: [ -eq, -ne, -gt, -ge, -lt, -le ]
- Bash: let, (( ))
- C: atoi(), atol(), atoll(), fscanf(), vfscanf()
- Python: int()
- Regex: [0-9], \d (PCRE), [[:digit:]] (POSIX)
- ... And more similar things dealing with integers

I think it's not worth deprecating the existing interface just to
introduce something that is not fundamentally "brightness".

>  - When the brightness is set, you can use a value or 'auto" as you desir=
e (Documentation would need updating to allow this)
> Really I was just looking for a way to advertise to user space that a aut=
o option would be supported :)

That's my goal too.

I admit that my proposal is complicated and may need a lot of time to
make it into its right path. It may even be rejected by LED folks. But
it's the best approach I can think of considering our requirements on
the interface:

1. It shouldn't break any existing interfaces.
2. It's exposed to userspace for getting or setting its status.
3. HW status transition should reach userspace (similar to
LED_BRIGHT_HW_CHANGED).

I will see if I can finish my RFC patch this week or next. If it's
rejected probably we will have to continue on "als_enabled"...

Thanks,
Rong

> Mark
>=20
>=20
