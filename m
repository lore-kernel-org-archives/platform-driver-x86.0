Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56367333447
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Feb 2026 20:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770668700; cv=none; b=qijMFuCC8Co4kFaeWxqP9FpmWSAtsucYf9Fctb2Se7jeJZLLSFfBCQf5jPe0oWr/255wixX8ilzkzQArhpJGzXPzTWjvtPhTDtwLGd6I92z/vo6GqB9nVFA9texQpXD6cWCwOOi0LoBQKJlsknE6BclWBUF1hAg+iTQbtBdv+cM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770668700; c=relaxed/simple;
	bh=e1leB6+ffci2hZSs2WQN8/Qf5cFjJdGe7DdFGRivLmg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CbFmXgdTCwjzUCeEyYIDwYtu+jU0WqCIlixRTMqXjZQ4T73Snib5r2yk4E8NdFxNCp1JComhQJW1KkkyHny3Zz/j3SO30/T+tw+D+QWtksyUXQj7ySBFL2975Z38J2sT07jerKtLo7F+wrSNTlRf+gjYx++xX4MIkyq1NyXbu5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NP2Mpgly; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NP2Mpgly"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F22E8C19423
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Feb 2026 20:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770668700;
	bh=e1leB6+ffci2hZSs2WQN8/Qf5cFjJdGe7DdFGRivLmg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=NP2Mpglybwwn3LlXSkwC9ee8N/7V+QlHizYFUm3OdwxA86mv/w8uWxX1Halk2wp+m
	 WumDlrh8nNscNG0bmmTTRaE+eQzoB+iFQVv4db2balmnmIISRsyIQwKpyLoFwKFmnn
	 qZDD6ntqk5f7HtQAT44N9Zb9yCLSQpXkCpuR+3tPeOLWekEXPsjh9VR/iTtYyga+wf
	 D/qByLNnRJoIANuwy0ycnWFtUZlr5l1idZfao18igRcJrj0ePOAK6wm0pNk5TtXBWV
	 E5B3v1hCiM0ABO1mWQxpGlr31KWfDG3plbxBzSmvVy5TayD52474ub0LvmybVBpZd7
	 oXD6LGcbB6zPw==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-59de77e2e30so5195376e87.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 09 Feb 2026 12:24:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVZMNY3Q8SQYpeaM0DMTq+vpxw2WmZnoEuYyvj7g5GJrrHjEDUmG2BVKabBhUj4QczVw3q9uIeYGay4GoB++k2xHHnU@vger.kernel.org
X-Gm-Message-State: AOJu0YyRZ4YUqkJe8ttJoqzVP1WtDEp7JX2BKLsqd8zWQXe5ooEdnErg
	Zk8erkWHcj/b5LuXQENFmGycTXIqHjItbDcQrtIxO7+W82bo/cQIYOSDcBsWGJa7GF6RxXbKVHC
	e4m2Y5wsj8MFn5n5fUzfbik7FS+9qQSzmzZ1xcMZzew==
X-Received: by 2002:a05:6512:3c86:b0:59d:e589:c977 with SMTP id
 2adb3069b0e04-59e4515c13cmr3381266e87.26.1770668698538; Mon, 09 Feb 2026
 12:24:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250920200713.20193-1-hansg@kernel.org> <20250920200713.20193-2-hansg@kernel.org>
 <aYkdKfP5fg6iywgr@jekhomev> <aYmV5Axyfo76D19T@smile.fi.intel.com>
 <CAMRc=MeouZAkuzynwUnZd-VsZq1nyEgbv-Bt6tNMXosApF7RDg@mail.gmail.com>
 <a285a632-4a3a-48f8-a34a-db595fa0e477@kernel.org> <aYnqY4KPq2Gqj3Dv@google.com>
 <CAMRc=McfHM62ZxKdn=QDAmpjExDZwtqhpkLU_=1GE27bbMsirg@mail.gmail.com> <aYoOKBMAsTuwHKK0@google.com>
In-Reply-To: <aYoOKBMAsTuwHKK0@google.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 9 Feb 2026 21:24:46 +0100
X-Gmail-Original-Message-ID: <CAMRc=MenKFwfT2g2-aUZUsoBdOMaA4m2krJ18Wir=Rwede9JfQ@mail.gmail.com>
X-Gm-Features: AZwV_QiY9PDcPNX8qzDjniYiRylJd_CKj34GQO_D_EjCTJx1lHs1SUxXbIJdtpg
Message-ID: <CAMRc=MenKFwfT2g2-aUZUsoBdOMaA4m2krJ18Wir=Rwede9JfQ@mail.gmail.com>
Subject: Re: [PATCH v4 01/20] platform/x86: x86-android-tablets: convert
 Goodix devices to GPIO references
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Arnd Bergmann <arnd@kernel.org>, platform-driver-x86@vger.kernel.org, 
	Yauhen Kharuzhy <jekhor@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 9, 2026 at 6:23=E2=80=AFPM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> On Mon, Feb 09, 2026 at 10:25:47AM -0600, Bartosz Golaszewski wrote:
> > On Mon, 9 Feb 2026 15:41:54 +0100, Dmitry Torokhov
> > <dmitry.torokhov@gmail.com> said:
> > > Hi Bartosz, Hans,

[snip]

>
> If your fwnode pointer is not a compile-time constant (since you have to
> look it up somehow) you can not make corresponding property entries
> static constant arrays, and have to build them dynamically (or fix them
> up in place after doing the lookup).
>

Ok, yes, as I described below.

> >
> > The device that creates devices not tied to a real OF or ACPI node, is
> > typically responsible for creating the software nodes for its children.=
 It
> > can check if given GPIO controller already exists (gpio_device_find_by_=
label())
> > and if not - just return -EPROBE_DEFER and not create children. If it d=
oes,
> > then it can pass its fwnode to the children. A bit like so:
> >
> >   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tr=
ee/drivers/reset/core.c#n910
> >
> > Just with the lookup done by label and not fwnode.
>
> As I mentioned another email, in case of old legacy boards you do not
> really have ACPI or OF nodes. If they were there then we would need to
> build trees of software nodes, we would simply extend the DTs for them.
>

Adding software nodes to providers in that case is quite
straightforward and the right thing to do. But we're talking about a
different case: providers with real firmware nodes that we can't
access until after the tree is parsed. Which happens quite early into
the boot process. Once done, you could
of_find_node_by_name/compatible/whatever() and reference it already
from a software node. You may not really need the device for that. If
all you care for is a label, then you already have it in the form of
the device-node label.

> >
> > I may have not paid attention to the docs and signed off on it but it d=
oesn't
> > make it correct. The strength of software nodes is that we have an actu=
al
> > fwnode link between devices. If we just fake this link, then why are we=
 even
> > using software nodes at all?
>
> To allow drivers drop hard coded platform data and switch to generic
> device properties. This goes beyond GPIOs.
>

Consumers can already use generic gpiod_ interfaces even if their
GPIOs are set up using lookup tables behind the scenes. There's no
need for platform data.

> >
> > > This is what I wrote to Hans when he raised his concerns:
> > >
> > > "
> > >     I agree it is a bit weird, but this allows to disconnect the boar=
d file
> > >     from the GPIO driver and makes it easier to convert to device tre=
e down
> > >     the road as it can be done in a piecemeal fashion. If you want fw=
node
> > >     actually attached to the gpiochip then:
> > >
> > >     1. You can't really have static/const initializers in most of the=
 cases
> > >     2. Fishing it out from an unrelated subsystem is much harder than
> > >     matching on a name.
> > > "
> >
> > Ok but if we match names then we already have a mechanism for that: loo=
kup
> > tables. I really fail to see how creating software nodes with a specifi=
c name
> > in consumer code is any better.
>
> I do not want to have 2 mechanisms, one for GPIOs, and one for
> everything else. Let's take gpio_keys driver. It uses platform data or
> device tree properties (generic device properties) to describe the
> hardware. I want to drop platform data, and I do not want to encumber
> the driver itself with setting up the board specific lookup tables, I

Definitely but look at what we're doing now: -  consumers just set up
GPIOs for themselves using arbitrary strings.

> want the configuration be contained in board files. I also do not want
> to have to configure all properties but GPIOs through one mechanism
> (software nodes) and then have an exception for GPIOs to use lookup
> tables.
>

I agree but given that we use software nodes properly and not as a
placeholder for GPIO chip labels.

> I understand that matching on firmware node is nice and may even be
> preferable in some cases, but I think matching on name has its own
> place given all practicalities.
>

Ok, let's start talking solutions. As I said: I'm really surprised
this only shows up now when that change has been upstream since
v6.18-rc1. I can conditionally re-enable name matching in
gpiolib-swnode as a fall-back with the assumption that we'll work
towards better solutions. I hate it but if it breaks existing users
then I don't see much choice.

> >
> > [snip]
> >
> > >
> > > I think the hardest breakages are here:
> > >
> > > arch/arm/mach-omap1/board-nokia770.c
> > > arch/arm/mach-pxa/gumstix.c
> > > arch/arm/mach-pxa/spitz.c
> > > arch/arm/mach-tegra/board-paz00.c
> > >
> > > If we check out at nokia, it uses drivers/gpio/gpio-omap.c. As far as=
 I
> > > can see it does not even have a fwnode assigned: it either does not h=
ave
> > > parent or its parent is a platform device instantiated by the driver
> > > itself and does not have a firmware node associated with it.
> > >
> >
> > In that case using software nodes makes absolutely no sense and users s=
hould
> > stick to GPIO lookup tables. The provider does not have an fwnode attac=
hed, how
> > can we just fake it in the consumer?
>
> Why not? It allows us to use generic device properties for describing
> everything that we need.
>

Sigh... I'm all for it but we're "faking" a reference as described above.

> >
> > I would rather just attach a software node to the omap controller in
> > arch/arm/mach-omap1/gpio16xx.c and use its address in these board files=
.
>
> That might work, just a bigger change than I wanted to make originally.
>

That shouldn't be too big, I may look into it next week, though I
can't test it. Maybe Mark Brown or Tony Lindgren could.

> >
> > > So in the end name matching allows weakly referencing objects elsewhe=
re
> > > in the kernel for legacy and one-off devices.
> > >
> > > Maybe we should allow for both? Do a fwnode lookup and when it fails
> > > fall back to matching on name?
> > >
> >
> > Isn't it GPIO lookup tables with extra steps and more confusing too? Be=
cause
> > that's how it works in GPIO core: if you can't find anything using the =
fwnode
> > lookup, you fall back to comparing names in GPIO lookup tables.
>
> What you are missing is that it allows to describe everything, not only
> GPIOs, through the common mechanism.
>

For sure but the GPIO label comparison is very GPIO-centric and
implemented under drivers/gpio/.

> >
> > My point is: it only makes sense to use software nodes if we're creatin=
g
> > links between them. If we fake them and compare their names instead, th=
en
> > it's just abuse of the API. It says PROPERTY_ENTRY_REF() for a reason: =
it's
> > supposed to store an address leading you to the actual device on the ot=
her
> > side.
>
> No, it is supposed to store a "reference". It does not have to be a
> pointer, it is a reference to another object. Could be an IP address or
> USB port number, or something else that can uniquely identify that
> object. In DTS it is not a pointer, it is "&node". How it is
> implemented underneath is an implementation detail.
>

This is incorrect. The fwnode reference is resolved - using the
.get_reference_args() callback - to the contents of struct
wnode_reference_args where the first member is the address of the
"referenced" fwnode. Even for software nodes, the
software_node_ref_args structure expects the address of either a
software or firmware node and software_node_get_reference_args() will
fail if it contains neither.

I added the ability for software nodes to reference "real" firmware
nodes thinking it would be enough to solve such issues dynamically. I
see your point about it being more complex than it should. I was
thinking about proper solutions and thought about a concept of a
"future_fwnode".

Something like:

extern struct fwnode_handle *future_node;

const struct software_node consumer_node =3D {
    PROPERTY_ENTRY_GPIO("reset-gpios", future_node, ...),
};

Where future_node initially uses an fwnode implementation returning
-EPROBE_DEFER until after the devicetree or ACPI was parsed and we can
then assign it a proper firmware node via some mechanism attaching OF
or ACPI nodes to the correct consumers (by label or otherwise).

Bartosz
