Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF0E2BEC55
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Feb 2026 15:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770652229; cv=none; b=HnwwobSgP99clwuTRG8E1rvbMRE0QMcvDkV0pzh0RqhEKoqCilunzWaV0OYepZovvBRLzwuDSk1CCsKOYleoNau4GVQCwT1w4UmvJGLTJxOIFmJubcSYb/zJpDr6SSN9IcxY5JjgjS2UCKEl515YUU0lY8/or//42z5DuYehBUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770652229; c=relaxed/simple;
	bh=vMgCSPFMuPYOZJ+4h75RQajyo22Akp7iye1WtO+9RrY=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j6YxZWkSu0y/8qqVemTifd0m1xxPhv7rria+ZM6jPKv0Lqge/MKz9ORcMMRdR1n5R41vI63AbMrtL8S/WF3LI/kynNh5M5XhbhICnnh8lxdYpsCAPuE4MQKT54fufvdHMpMWusO5C/WWNVs2Ofog+UpDL2F0+bO4348/VcaTDws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NY+cdRnQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NY+cdRnQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 893FAC19425
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Feb 2026 15:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770652229;
	bh=vMgCSPFMuPYOZJ+4h75RQajyo22Akp7iye1WtO+9RrY=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=NY+cdRnQKRmLLQn3enZpUxiOi9QsncOmoTcyVHUQY8ZuZSorAljthrnkc/8wIvAg2
	 bkE1PD0fIIiudpxFbejAoZmmS1+MpF6kO8c94re4VKdMmubvO5oyr2Tx2ysBqEHs1J
	 WNAWRDle0PQmNKzt6yXpPj5K5AiO6OGtJV0OYRF7GxWH85KpesZzkao7SPBvy8Ye8f
	 8695Fsqz78B+GqXq/0zqfiiQwNEyqHYTCaNqsizOU+8ccGoE2IFFmvsJWWe0q6wNqk
	 n43ULeKtZvCYl0HKSKBQagICyOz+v4R5F5YoL+/RHQAj3YEjQRYmeOBJI/WqC+Rup/
	 ii1ach+GHmI3Q==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-385c23b88e8so42557481fa.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 09 Feb 2026 07:50:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVu3bFfTtKa6ZGt+m1jwvcGQ19SSDkM2bKL2xhiCqS4KMpPUD2JPK+Ent0OHF1L5QlVYzASj/bmU942gEqxQox4DAiW@vger.kernel.org
X-Gm-Message-State: AOJu0YzcedN/VRlsuQIP5YG/YWKZRKNAZGnzFW1xkFWNNrJvS5anH/Ou
	OThIZYWbYEa/4aYSl3Jbl6ZhXB3yogFLZtR5OFhw3jYx18+atam2ake+lSlyFO1x8/9OQ/JJpp1
	8ecLyyrc6mlDSnDFtEhD6K4HQ2X7DlhZWI+4+aeqL3g==
X-Received: by 2002:a2e:a58e:0:b0:37f:cac3:c25b with SMTP id
 38308e7fff4ca-386b6958270mr38046261fa.28.1770652228088; Mon, 09 Feb 2026
 07:50:28 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 9 Feb 2026 09:50:26 -0600
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 9 Feb 2026 09:50:26 -0600
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <aYnqY4KPq2Gqj3Dv@google.com>
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
Date: Mon, 9 Feb 2026 09:50:26 -0600
X-Gmail-Original-Message-ID: <CAMRc=MdDiPaSBRZKXDODv3iOqZMcK2xacsgBqjek=O0SLyvpag@mail.gmail.com>
X-Gm-Features: AZwV_QiA6ipn3dGiY-tufdJVG0LJgwVxvG_cjDl8EbiEIdsQ4nckp7GWLzWSluQ
Message-ID: <CAMRc=MdDiPaSBRZKXDODv3iOqZMcK2xacsgBqjek=O0SLyvpag@mail.gmail.com>
Subject: Re: [PATCH v4 01/20] platform/x86: x86-android-tablets: convert
 Goodix devices to GPIO references
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@intel.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Arnd Bergmann <arnd@kernel.org>, platform-driver-x86@vger.kernel.org, 
	Yauhen Kharuzhy <jekhor@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 9 Feb 2026 15:41:54 +0100, Dmitry Torokhov
<dmitry.torokhov@gmail.com> said:
> Hi Bartosz, Hans,
>

[snip]

>> >>>
>> >>> Could somebody advise on how to fix this, or does a fix already exist? I am
>> >>> not familiar with the swnode/fwnode framework but can do some investigation to
>> >>> resolve this.
>> >>>
>> >
>> > I really don't want to revert to the label lookup and string comparison as this
>> > is totally broken
>
> I would start with explaining why exactly this is broken. So far the
> explanation has been:
>
> "
>     Looking up a GPIO controller by label that is the name of the software
>     node is wonky at best - the GPIO controller driver is free to set
>     a different label than the name of its firmware node. We're already being
>     passed a firmware node handle attached to the GPIO device to
>     swnode_get_gpio_device() so use it instead for a more precise lookup.
> "
>
> This is weak. Indeed the controller is free to select a different label,
> breaking the link. This is a weakness of software nodes in general,
> where we do not have a mechanism to validate the scheme.
>

I would even say that if we keep comparing strings, then it's no better
than GPIO lookup tables.

> However switching to matching strictly by fwnode requires knowledge of
> the instance of the fwnode. This may work OK-ish for some drivers but
> breaks for the main intended users of this: legacy board files, where we
> want to specify static mappings and do not want to "reach" into
> individual gpiochip drivers to fish out the actual firmware node.
>

I'm not sure I'm following. We can (and do a lot!) reference static struct
software_node instances before we register them with driver core, creating
whole trees of property nodes. I get that here we're talking about *real*
firmware nodes but see below:

> From the docs that were accepted (Documentation/driver-api/gpio/board.rst)

Quick `git blame`, `git log`, ah, yes, I signed off on this. I guess it's on
me now too. :)

>
> "
>     The software node representing a GPIO controller need not be attached to the
>     GPIO controller device. The only requirement is that the node must be
>     registered and its name must match the GPIO controller's label.
> "
>
> Note that this is different from OF or ACPI nodes because there parsing
> and creating nodes is a separate process. You get the whole graph
> available to you right away, so it is possible to know the exact node
> you are referencing.
>

The device that creates devices not tied to a real OF or ACPI node, is
typically responsible for creating the software nodes for its children. It
can check if given GPIO controller already exists (gpio_device_find_by_label())
and if not - just return -EPROBE_DEFER and not create children. If it does,
then it can pass its fwnode to the children. A bit like so:

  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/reset/core.c#n910

Just with the lookup done by label and not fwnode.

I may have not paid attention to the docs and signed off on it but it doesn't
make it correct. The strength of software nodes is that we have an actual
fwnode link between devices. If we just fake this link, then why are we even
using software nodes at all?

> This is what I wrote to Hans when he raised his concerns:
>
> "
>     I agree it is a bit weird, but this allows to disconnect the board file
>     from the GPIO driver and makes it easier to convert to device tree down
>     the road as it can be done in a piecemeal fashion. If you want fwnode
>     actually attached to the gpiochip then:
>
>     1. You can't really have static/const initializers in most of the cases
>     2. Fishing it out from an unrelated subsystem is much harder than
>     matching on a name.
> "

Ok but if we match names then we already have a mechanism for that: lookup
tables. I really fail to see how creating software nodes with a specific name
in consumer code is any better.

[snip]

>
> I think the hardest breakages are here:
>
> arch/arm/mach-omap1/board-nokia770.c
> arch/arm/mach-pxa/gumstix.c
> arch/arm/mach-pxa/spitz.c
> arch/arm/mach-tegra/board-paz00.c
>
> If we check out at nokia, it uses drivers/gpio/gpio-omap.c. As far as I
> can see it does not even have a fwnode assigned: it either does not have
> parent or its parent is a platform device instantiated by the driver
> itself and does not have a firmware node associated with it.
>

In that case using software nodes makes absolutely no sense and users should
stick to GPIO lookup tables. The provider does not have an fwnode attached, how
can we just fake it in the consumer?

I would rather just attach a software node to the omap controller in
arch/arm/mach-omap1/gpio16xx.c and use its address in these board files.

> So in the end name matching allows weakly referencing objects elsewhere
> in the kernel for legacy and one-off devices.
>
> Maybe we should allow for both? Do a fwnode lookup and when it fails
> fall back to matching on name?
>

Isn't it GPIO lookup tables with extra steps and more confusing too? Because
that's how it works in GPIO core: if you can't find anything using the fwnode
lookup, you fall back to comparing names in GPIO lookup tables.

My point is: it only makes sense to use software nodes if we're creating
links between them. If we fake them and compare their names instead, then
it's just abuse of the API. It says PROPERTY_ENTRY_REF() for a reason: it's
supposed to store an address leading you to the actual device on the other
side.

Bartosz
