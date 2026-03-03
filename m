Received: from relay13.grserver.gr (relay13.grserver.gr [178.156.171.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3133A425CFE
	for <platform-driver-x86@vger.kernel.org>; Tue,  3 Mar 2026 21:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.156.171.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772572875; cv=none; b=YB1Q8mrGxPWIqg8LMBRlaSYOCyjzUuT35PtzYVqgLTuDO665UjCeAO0iXb8537xzICOr4JczSCjCHTzVsPPVCwkCKFSuDLY40LjAenhVJMTMOIYJCPBDGI4z9vfyiG9BVmhvJ0NwD1EgeBivKYw5YFwd7i66dQ8J+DsoxUm3dik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772572875; c=relaxed/simple;
	bh=0pnTzWtnp0NwgPPPz8yr59HTnJyx6MDpC/R+v0uKMeg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rq9u5UaFd/hmxugqoDEVc1TUcHcYAo90C5c6Txuozbz9YFWWxiNw09yBNegmzTOiP9vj/ezPMYJuQOvmMy0YjflW7QNXclU25EU8BzNQoh7NCNuzq1J3hwCy1hVKt8zAVY1u5QwrZo5QGfkrH7CNF7JmqvHQ/9y7dzCYW9EgEMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=IGcajVGH; arc=none smtp.client-ip=178.156.171.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="IGcajVGH"
Received: from relay13 (localhost [127.0.0.1])
	by relay13.grserver.gr (Proxmox) with ESMTP id 2B7355E90F
	for <platform-driver-x86@vger.kernel.org>; Tue,  3 Mar 2026 23:21:11 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay13.grserver.gr (Proxmox) with ESMTPS id 38C085E906
	for <platform-driver-x86@vger.kernel.org>; Tue,  3 Mar 2026 23:21:10 +0200 (EET)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id C66F81FCF5E
	for <platform-driver-x86@vger.kernel.org>; Tue,  3 Mar 2026 23:21:08 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1772572869;
	bh=bMw9zyvA23yzPySV8Yuh3wGZIviPJDWNWN+3iizd8RM=;
	h=Received:From:Subject:To;
	b=IGcajVGHmfAhPDWBiGeQr5gLPlylW8sDhqM452oja3SEuTA82VyB9qkqz1t6MOPqY
	 ob3FkRPJgAeZcXKzsfDilqvroLVl0TXbj0znIrKj3wSgPlFQG2TftRfesjJEavOnoi
	 q9UllegykSW+GrZg1OcRjWNf03gUtNfCYQ60tzbDPSRLcqKjqeDNcDZtVfPd4BsFSi
	 OCiPFHX4gUL+1kkqBaU/7Lxo5T3H9qsgMbeh/lcyBfAQJXbpqdlcHwveEXSHllFKY2
	 z8wMYWtZ0LkG4Oa5zNT5xP8U33NpUI6JO4ud6dviecutxmYf2UPb//iw72bSHWv76m
	 hOZFqfXddS2vQ==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.216.44) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-pj1-f44.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-pj1-f44.google.com with SMTP id
 98e67ed59e1d1-359a5d8b3f8so45662a91.3
        for <platform-driver-x86@vger.kernel.org>;
 Tue, 03 Mar 2026 13:21:08 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWV+dAYpmm/91Md43y3acoVfCPEywoo0/2IeHMHB3f3AgUCYaUwqRKbAKQ6xvfNRbVbsTzT01Gpa9WpaOXFHd7b9mHL@vger.kernel.org
X-Gm-Message-State: AOJu0Yxaa842VVS4jPDq65wupLaRavYBvSBm2BE8EQIHW9U9eiGNg7v0
	/z5pXaSl+BqjdZf1pXuGRHOt+Nkwi9osTrs7DdPMSqLOsJV7he/sKC+vJ+Ooa22yNWcmaZzB+Ri
	pAPMlkUw/67Imurj1oC0rf+TjTdcgNkQ=
X-Received: by 2002:a17:90b:538b:b0:359:7ae5:89e7 with SMTP id
 98e67ed59e1d1-3597ae5918emr10700521a91.4.1772572867615; Tue, 03 Mar 2026
 13:21:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260303181707.2920261-1-lkml@antheas.dev>
 <20260303181707.2920261-3-lkml@antheas.dev>
 <3057e55a-00f9-4da2-bc10-a6bc19716fdd@kernel.org>
 <CAGwozwFgaRh3m7qAEsvqhLLsbT3ky+4tneLmnz=dE8_UDqOFZA@mail.gmail.com>
 <ab11076f-daf0-4e10-8ae6-e91dfc612a96@kernel.org>
In-Reply-To: <ab11076f-daf0-4e10-8ae6-e91dfc612a96@kernel.org>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Tue, 3 Mar 2026 22:20:56 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwGA=htgzW-UZV7nRfqyS2mzNUm3afqPhZpXyUmWR1M_mw@mail.gmail.com>
X-Gm-Features: AaiRm53vapVGg-BjRmS8qtB7C-QlmPl7tYUjhWKUe-QqFMXpB8B8MyttTQVSycA
Message-ID: 
 <CAGwozwGA=htgzW-UZV7nRfqyS2mzNUm3afqPhZpXyUmWR1M_mw@mail.gmail.com>
Subject: Re: [RFC v1 2/2] platform/x86/amd: Add AMD DPTCi driver
To: "Mario Limonciello (AMD) (kernel.org)" <superm1@kernel.org>
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	Sasha Levin <sashal@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <177257286898.2181848.11439105540033108176@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Tue, 3 Mar 2026 at 21:55, Mario Limonciello (AMD) (kernel.org)
<superm1@kernel.org> wrote:
>
> + Sasha
>
> On 3/3/2026 2:40 PM, Antheas Kapenekakis wrote:
> > On Tue, 3 Mar 2026 at 21:10, Mario Limonciello (AMD) (kernel.org)
> > <superm1@kernel.org> wrote:
> >>
> >> I'll preface this by saying - I don't have a problem with using an AI to
> >> help write a driver, but please disclose that it was done and that in
> >> this case even you haven't closely audited the results.
> >>
> >> I personally would never submit something generated by an LLM that I
> >> didn't audit and add a S-o-b tag to it (asserting I am willing to stand
> >> by the code).
> >>
> >> I'm glad that I found out it was AI written before I started to review
> >> the code, I would have had a lot more candid comments for you.
> >>
> >> There is a lot of weird stuff in this driver that I'm not going to
> >> comment on and nitpick, but I'll leave a few broad strokes things.
> >
> > Of course, to that end, feel free to skip a full review until I get to
> > properly rewriting it.
> >
> > What is the current stance on Co-bys for that? I'm trying to follow
> > the discussion but I missed the news. I can lint it properly next
> > time.
> >
> >  From my perspective, pouring a month into a driver like this without
> > having a firm commitment that it will go somewhere is a bit hard to
> > stomach.
>
> Sure.
>
> I don't need a dedicated tag telling me what tool you wrote it with.  I
> don't care if it was Opus, Gemini or Qwen3.5.  They all can make
> mistakes that need to be audited.
>
> The most important part to me (or any reviewer) is a signal that I
> shouldn't invest more effort reviewing this than you did writing it and
> reviewing it.
>
> My feeling on this kind of RFC this is the most appropriate tag:
>
> Not-signed-off-by: Foo Bar <foo@bar.com>

I did test the driver and go through it multiple times for what it
counts, including fixing all of the checkpatch warnings.

> > This driver does not have a concept of platform profile. The devices
> > by definition do not have presets and users of handhelds are
> > accustomed to a ppt slider (where userspace interpolates for fppt/sppt
> > or sets them the same).
> >
> > We could layer a platform profile on top of it by extending the driver
> > more and adding suggested preselected profiles for low-power,
> > balanced, and performance. Then custom unlocks the sliders. This is
> > the approach I do currently when I hook to the ppd dbus protocol and
> > it works quite well.
> >
> > As for custom profile, it unlocks the firmware attributes in other
> > drivers. The only difference in this one is the naming of the
> > attributes.
>
> I feel for this to be viable in mainline kernel it should be easy to use
> by default with platform profile support.

Fair, I can look into integrating this. I already have preset values
from my userspace implementation.

In that case, I'd match the Legion ABI 1-1 including the names,
perhaps drop the time params but keep tctl - I think lenovo-other is
proposing a name for this, unsure if that merged. Although I am not a
fan of the macro soup in those drivers, which is why this is based on
the samsung driver.

> >> IMV - NO WAY.
> >>
> >> Device matches are mandatory.  I'm not letting a driver like this bind
> >> to any random piece of hardware in the wild.  The thermal design of each
> >> system is different.  Each system needs it's own quirks/table.
> >
> > I need to update the comments but this is gated behind the kconfig
> > flag. In order for SoC/unbound to become available that needs to be
> > on. If it is not, as you see below the driver ejects.
>
> I don't even want a Kconfig flag to allow it to bind to something
> outside of the quirk list for any of this.  if we don't have
> authoritative values to use we shouldn't have anything binding.
>
> If you need to add support for a new system then add a quirk for it.
>

This driver does not bind to anything or autoload unless there is a
DMI match. It is impossible to autoload actually, there is no backing
device that can load via rules other than DMI match. The kconfig flag
just allows to force load the driver with no max values after
recompiling on devices that feature the method.

I'd say it's important for niche cases such as devices with an EC like
the Ally and debugging (such as unlocking the limits on devices that
match). I'd rather keep functionality like this on mainline so that I
don't need to carry a patch for it. I plan to add quirks for new
devices.

In any case, by default the exposed limits for devices are always
based on their DMI match, even if Y is selected (the default mode is
always "device"). "expanded" requires a command line arg if EXPANDED
is N, which allows for a very soft increase. And EXPANDED unlocks the
modes, as I am trying to eliminate cases where modifying the kernel
command line is required, as modifying the kernel command line is an
anti-pattern I am trying to eliminate.

Antheas

