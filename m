Received: from relay12.grserver.gr (relay12.grserver.gr [88.99.38.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F16C83CAA52
	for <platform-driver-x86@vger.kernel.org>; Thu, 15 Oct 2026 14:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.99.38.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792076161; cv=none; b=OSB61IpJXulRd7NGxwk3VAM6v/oarfOO6pnp7heTB7MaLs/Dtxnad2tMJ+pxQXiO+KWegwnfLypQmLmx0INNK+3RYWCm5oEc4RhN1uQbqqdsyH45uwLoQbl5cK8y1XNHPC17rnWwq7+AsFs1RtaDIdG0cyt9nsZ9gWlgvhlSMXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792076161; c=relaxed/simple;
	bh=9znLAEBv6FCvwoxh5REz5AUJDRBDOBdh703XNTN1axc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kkjSg3MvxZBuLbDb60U+/x6hfMNXczUDPw5U9o3Mb9/r6mtUdKv5/OMZ8T1ZoQI8TTWRuNNXxnkVA4k7b2pgQtVH/2+Ilt7DL+/NT2vDGcKT1jL6alYMAZ3hgmxQKBTD1y+yTprPcN5Qg23EQZfCnkO0gRraA1LQMeNw4sGrlU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=EOSFiyY6; arc=none smtp.client-ip=88.99.38.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="EOSFiyY6"
Received: from relay12 (localhost [127.0.0.1])
	by relay12.grserver.gr (Proxmox) with ESMTP id D0A3EBC500
	for <platform-driver-x86@vger.kernel.org>; Thu, 15 Oct 2026 17:55:48 +0300 (EEST)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay12.grserver.gr (Proxmox) with ESMTPS id 97B9BBDF61
	for <platform-driver-x86@vger.kernel.org>; Thu, 15 Oct 2026 17:55:47 +0300 (EEST)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 084F41FF63D
	for <platform-driver-x86@vger.kernel.org>; Thu, 15 Oct 2026 17:55:45 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1792076147;
	bh=jojt2yOmt7RVbsHTsnFZoBz7nMboguv3//Y/4rhq5qw=;
	h=Received:From:Subject:To;
	b=EOSFiyY6tYB8syRSd/swPq+ymIgFuVxdIF0fX2aGlWkiZAyRXNFLnGqCrAbWb85mb
	 NQMLAacIWznXVTbhtsCnZTae4m4ip5fr2UOMh+LbRApaxpkwm/0dJ6vFpNIqDs6/YM
	 5v+nT8+N3wZxV6QDfRxIcVwfAT/61OCKerhnV/Z3PvVxj3Nc2jQS3sRxif6w1T5oKY
	 Z0/8wWZiY687uf/k/m38b54kO9ADWuPTbiKzfW1tnu1CIZ09Y8mzhG99mKOC9UZN8C
	 IPfqZMT3ltxz4IGuyV4hMyIgd9S7GpZgWm5EDoKQia/ZAsGPhZkZif1CTtKuFMGnHk
	 P/jaTnTP8wvjg==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.215.169) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-pg1-f169.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-pg1-f169.google.com with SMTP id
 41be03b00d2f7-cc1bc88a20eso1523526a12.3
        for <platform-driver-x86@vger.kernel.org>;
 Thu, 15 Oct 2026 07:55:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AKwUvBz6f69DD4bfnnv+Ay6Z0w12+pN1ByDApv42OBkmArZEaXLOPli0tbO113Tb+FnrxwD/EhU9ZZ9C0oDBCsKSVw81o7FX@vger.kernel.org
X-Gm-Message-State: AFq9FYLmtlAi2guUJG0nrSwf4Eyh7+WYYit6LS2V0HvTUipsdtz+MbYj
	Y16jxGeIK53XxvtwSfmgSSrHeibArnkzwxGR6gt0YUzIoAU011YOHT+hjwr9SqYfCB+NXc2Umfx
	f6E7x2HOg78X4e42e2/NnFsNtOZuUfc0=
X-Received: by 2002:a17:90b:224c:b0:3a8:6a6b:596d with SMTP id
 98e67ed59e1d1-3ab3a9a8d66mr20888022a91.26.1792076143502; Thu, 15 Oct 2026
 07:55:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260309205125.293148-1-lkml@antheas.dev>
 <42275140-ecef-4878-b256-1061060d4958@amd.com>
 <CAGwozwEmENx98qB51D89h59rb2qw66f_TJENd+W41onb5GYhfw@mail.gmail.com>
 <CAGwozwGD7JNuWz2D0AetacX=H95sB=mz0nnssQHs=pvmsEiKaA@mail.gmail.com>
 <f47b3c8e-74ce-4aa5-8a64-a4c9ef12a4a5@amd.com>
In-Reply-To: <f47b3c8e-74ce-4aa5-8a64-a4c9ef12a4a5@amd.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Thu, 15 Oct 2026 16:55:31 +0200
X-Gmail-Original-Message-ID: 
 <CAGwozwGi_hTxRYUEfMGyT0OQtLTD1Dogp_NXXfBzRpT_hV3qFQ@mail.gmail.com>
X-Gm-Features: AclHuK9lGHz4EwgMQvXKVUMYQu4JX8WRPVaKR8w0ACYaBsoUdD4kqVAPzm9SIZw
Message-ID: 
 <CAGwozwGi_hTxRYUEfMGyT0OQtLTD1Dogp_NXXfBzRpT_hV3qFQ@mail.gmail.com>
Subject: Re: [RFC v4 0/4] platform/x86/amd: Add AMD DPTCi driver for TDP
 control in devices without vendor-specific controls
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: W_Armin@gmx.de, sashal@kernel.org, Shyam-Sundar.S-k@amd.com,
	derekjohn.clark@gmail.com, denis.benato@linux.dev, i@rong.moe,
	linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <179207614670.852619.1127712921409413126@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.6 at linux3247.grserver.gr
X-Virus-Status: Clean

On Thu, 15 Oct 2026 at 16:37, Mario Limonciello
<mario.limonciello@amd.com> wrote:
>
>
>
> On 10/15/26 04:35, Antheas Kapenekakis wrote:
> > On Tue, 10 Mar 2026 at 08:59, Antheas Kapenekakis <lkml@antheas.dev> wrote:
> >>
> >> On Tue, 10 Mar 2026 at 03:43, Mario Limonciello
> >> <mario.limonciello@amd.com> wrote:
> >>>
> >>>
> >>>
> >>> On 3/9/2026 3:51 PM, Antheas Kapenekakis wrote:
> >>>> Many AMD-based handheld PCs (GPD, AYANEO, OneXPlayer, AOKZOE, OrangePi)
> >>>> ship with the AGESA ALIB method at \_SB.ALIB, which accepts Function 0x0C
> >>>> (the Dynamic Power and Thermal Configuration Interface, DPTCi). This
> >>>> allows software to adjust APU power and thermal parameters at runtime:
> >>>> sustained power limit (SPL/STAPM + skin), slow PPT, fast PPT, and the
> >>>> thermal control target.
> >>>>
> >>>> Unlike mainstream AMD laptops, these devices do not implement vendor-
> >>>> specific WMI or EC hooks for TDP control. The ones that do, use DPTCi
> >>>> under the hood. For these devices, ALIB is the only viable mechanism for
> >>>> the OS to adjust power limits, making a dedicated kernel driver the
> >>>> correct approach rather than relying on the out-of-tree acpi_call module
> >>>> or ryzenadj.
> >>>>
> >>>> The driver provides two layers of control:
> >>>>
> >>>>     * Platform profile integration (low-power / balanced / performance /
> >>>>       custom), with per-device preset tunings derived from thermal envelope
> >>>>       data. Selecting a non-custom profile applies values immediately and
> >>>>       locks the individual tunables to read-only. The default profile is
> >>>>       "custom", leaving the device at firmware defaults until userspace
> >>>>       explicitly selects a profile.
> >>>>
> >>>>     * Four firmware-attributes tunables (ppt_pl1_spl, ppt_pl2_sppt,
> >>>>       ppt_pl3_fppt, cpu_temp) that become writable in "custom" mode.
> >>>>       Values are enforced against per-device limits (smin..smax), with an
> >>>>       "expanded_limits" toggle that widens the range to the full hardware-
> >>>>       validated envelope (min..max). A save_settings attribute controls
> >>>>       whether writes commit immediately ("single") or are staged for an
> >>>>       explicit bulk "save".
> >>>>
> >>>> On resume, the active profile or staged values are re-applied so that
> >>>> suspend/resume cycles do not silently revert to firmware defaults unless
> >>>> in custom and in bulk mode. In that case, defer to userspace.
> >>>>
> >>>> Device limits are supplied for GPD Win Mini / Win 4 / Win 5 / Win Max 2 /
> >>>> Duo / Pocket 4, OrangePi NEO-01, AOKZOE A1/A2, OneXPlayer F1/2/X1/G1,
> >>>> and numerous AYANEO models. The SoC table covers Ryzen 5000, 6000, 7040,
> >>>> 8000, AI 9 HX 370, and the Ryzen AI MAX series.
> >>>>
> >>>> Tested on a GPD Win 5 (Ryzen AI MAX+ 395). Confirmed with ryzenadj -i
> >>>> that committed values are applied to hardware, and that fast/slow PPT
> >>>> limits are honoured under a full-CPU stress load.
> >>>>
> >>>> Responsible disclosure: The development of this driver is AI assisted.
> >>>> This includes its writing, testing, reviewing, and readmes. The driver was
> >>>> manually reviewed line by line, but there may still be small leftover
> >>>> quirks. This is an RFC, not a final version. Let's push these tools to
> >>>> their limits and see where it takes us.
> >>>>
> >>>
> >>> I'll tell you where the most immediate limit is.  Humans can't review
> >>> RFC changes that go in daily.
> >>>
> >>> Over my weekend I see multiple copies of the series in my inbox.  To me
> >>> they must have obviously been garbage because you sent them so quickly
> >>> instead of waiting for feedback.  So I'll delete those from my inbox and
> >>> review the most recent one.
> >>>
> >>> That's somewhat tongue in cheek.  I know you're excited for this series,
> >>> but please make sure you take time to gather and take feedback into
> >>> account before posting another series.
> >>
> >> It's true, I've been having a bit of fun. But the series is stabilized
> >> now, I don't plan to send another version soon unless I messed up
> >> something.
> >>
> >> V3 incorporated your feedback/derek's and V4 incorporated rong's
> >> feedback. V4 is minor, it is just nits.
> >>
> >>> Maybe you can pass this to a robot and it
> >>> can give you actionable feedback, but a human sitting down and reviewing
> >>> a patch series in a serious way takes time.
> >>
> >> I'm using this series as a testbed to make some tooling for this,
> >> maybe I will post it soon.
> >
> > Opus 4.6 was something. Anyway. @Mario v4 of this driver as it stands
> > is pretty good for prod. Since then, I kept adding devices and
> > adjusting devices based on user feedback but I did not have to touch
> > the driver otherwise. It has been tested on most APUs and around 30
> > device models now.
> >
> > One thing this driver does not do is AC/DC limits and it would be good
> > if it did. That way presets could be pushed higher for AC but that is
> > only mildly necessary for AI Max platforms. 45W is more than enough
> > for all of them anyway, but we could go to 55W e.g. (after that they
> > saturate so it is unnecessary strain). But the updated limits I have
> > are conservative enough where it is not an issue. I also found myself
> > not using the commit option, so I think it can be removed.
> >
> > The only issue with this driver is that steam maxes out TDP when you
> > disable the TDP slider and as the custom limit is generic for both
> > AC/DC it can strain the battery. This is an architectural issue with
> > steamos manager as before steam used the _default tdp value in AMD
> > sysfs but dropped the notion of default when transitioning to steamos
> > manager. But this is a downstream problem unrelated to the driver
> > where special DC limits could help a bit.
> >
> > This is because I heard you might be working on something similar. So
> > let's prevent some duplicative work. Should I repost a cleaned up V5?
> >
> > Best,
> > Antheas
> By "something similar" do you mean the AMD overclocking driver posted
> recently [1]?
>
> Does that happen to work on any of this hardware?

95F20B61-3D44-41F8-87E1-03CBF94C4E8F returns nothing on my ACPI dumps.
There are functions which contain the e.g., 0x00020026 on a lot of
ssdts but no WMI with the GUID that series provides.

The WMI GUID of those functions is
ABBC0F6A-8EA1-11D1-00A0-C90629100000. If the interface is the same,
consider adding it to that driver.

You may reference to check yourself [2]

Here is what my LLM told me about that GUID:

| Dump | GUID present |
|---|---|
| Legion Go `N3CN26WW` | No |
| Legion Go `N3CN28WW` / `28WW-beta` | No |
| Legion Go `N3CN29WW` and later versions here | Yes |
| ROG Ally | No |
| Ally X | Yes |
| GPD Win 4 / Win Mini | No |
| One Xplayer / F1 Pro | Yes |

So very mixed, and perhaps not an alternative to what this series
provides to these devices. Fine by me to go through

> If it doesn't; sure please post your v5 that has incorporated feedback
> from this thread after the merge window at the start of the next kernel
> cycle and we can review it again.

I was specifically asking about this interface. Not in a rush, just
bumping this a bit so it does not end up getting re-implemented. I
might not be able to fix all of the issues but I will try the best I
can.

It seems this interface is so universal the CPU check might be bogus,
but I managed to collect 99% of the CPUs, I only get a straggler
reported every month or so. So it should be ok to stay.

> BTW I think this version was last posted before Sashiko started
> reviewing patches too.  If you can; please run a local Sashiko review
> cycle on it before posting your v5.

Sigh, if I figure out I will

[2] https://github.com/hhd-dev/hwinfo

> https://lore.kernel.org/all/20261010190543.563161-1-Shyam-sundar.S-k@amd.com/
> [1]
>
>

