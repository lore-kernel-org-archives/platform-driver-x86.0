Received: from relay12.grserver.gr (relay12.grserver.gr [88.99.38.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEEFF35B636
	for <platform-driver-x86@vger.kernel.org>; Thu, 15 Oct 2026 15:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.99.38.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792077228; cv=none; b=b2Xid6K9ssfHaY+egjaG19FPmO3Dm9s/RmH7wkNSQoO8IALYbM214zd3JeDEB8FCt5BwdGIiENqdC0d8sNpBRyJz/4ucn0QHOdLEW3GQeYlANXWwhFQ983XfGmhiplgScabW0r0TV1ddeCbRJ9JPZ/vAv5gURtDinWRB9MToSuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792077228; c=relaxed/simple;
	bh=bz8a03RD3M2L6FJMJe0o92eVBoKcNGOzdNrANua8vgQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OBuGQYxow4fodyTCOgQX8w8lonK1gWcUW9VgtotMsgEkXB728gDsqCqTRiL2qGB6xoWB/x4zWzcvriky88LGAsugoAlpXxpbZJlkrUql1U87EOKGwsdCFxvKGzDf36mhFFwg7cDkCzaqd+H3nEhdZx7Vyg3HjPSyXnJbl159XCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=JLZ3unxo; arc=none smtp.client-ip=88.99.38.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="JLZ3unxo"
Received: from relay12 (localhost [127.0.0.1])
	by relay12.grserver.gr (Proxmox) with ESMTP id 05002BDF87
	for <platform-driver-x86@vger.kernel.org>; Thu, 15 Oct 2026 18:13:44 +0300 (EEST)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay12.grserver.gr (Proxmox) with ESMTPS id C7886BDF7B
	for <platform-driver-x86@vger.kernel.org>; Thu, 15 Oct 2026 18:13:42 +0300 (EEST)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id F27EF1FE227
	for <platform-driver-x86@vger.kernel.org>; Thu, 15 Oct 2026 18:13:41 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1792077222;
	bh=NGLv403FQKRusajcfrFXHuqoCCEn2X3hTUJrwsbKzDA=;
	h=Received:From:Subject:To;
	b=JLZ3unxoQFWEqIBIzApixl254Q+MIMIzNEFpzcHAUHze0CASj3jROWbZWi8dZgs5s
	 OVZBt9yCvE9uzJ9owgPqhcSyYFtuTmw//WH9Dx5eBDXWriDxljMxwcFI/XETEiebdG
	 ptfMO02IwUZyoCkKBvYtD90AO2qYAFYw4Va7Fz582gdXNYGts2dM2hZ/fX6lR0S2SE
	 CKkiA/5wl4PyMYk5eo6SMDU85p6ghiAxljFvoLA6cjdEv9lC+st+x5dnzQxbKqMTks
	 yPN1px9jVl/wz5dvyey1v03H2L4JqhJCVe/yFf77rRr4WkORfDjsPRi7oGbiRfKtWt
	 4h7zst3615G+Q==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.214.181) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-pl1-f181.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-2db80fcdf8bso31708745ad.2
        for <platform-driver-x86@vger.kernel.org>;
 Thu, 15 Oct 2026 08:13:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AKwUvBzHz2T8xFgmifpPR9nhQuH6XCFS5MvgcHzGsUB+/r246ZikEeR03AgApbxrLxXPoBF3Z6DROj46JBCUrKlPAy4IN0so@vger.kernel.org
X-Gm-Message-State: AFq9FYKjk9b/IkAZJJMsiCCR/qGYR8b/G6Qy43AH4jJc6FLETWz6Q/0D
	C+zuS4JIJGED4TrtVLw4Z5YHSN5rRM9iYqdcqBD1oxbDUDATEwp4SW8GgPAwaeOb23ZfzLbd6n8
	RgRhcQ6F1LIJAPRZJSgNuyz3DIc9W+Xw=
X-Received: by 2002:a17:902:f691:b0:2e9:628d:e9a6 with SMTP id
 d9443c01a7336-2e9628df265mr17339715ad.57.1792077220571; Thu, 15 Oct 2026
 08:13:40 -0700 (PDT)
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
 <CAGwozwGi_hTxRYUEfMGyT0OQtLTD1Dogp_NXXfBzRpT_hV3qFQ@mail.gmail.com>
 <f95dec8e-3735-49d9-b6d0-4c1b88f3a318@amd.com>
In-Reply-To: <f95dec8e-3735-49d9-b6d0-4c1b88f3a318@amd.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Thu, 15 Oct 2026 17:13:28 +0200
X-Gmail-Original-Message-ID: 
 <CAGwozwH4k8XJJQ5K6JWRyK8r5vb-rpSu4Ta8sB1s6caS0=88mQ@mail.gmail.com>
X-Gm-Features: AclHuK_784y6Ojsi4zQTu6mfoce0x1m6Q7Z-eCSZan7Pj7w4gPfAsRJkRdUDLqk
Message-ID: 
 <CAGwozwH4k8XJJQ5K6JWRyK8r5vb-rpSu4Ta8sB1s6caS0=88mQ@mail.gmail.com>
Subject: Re: [RFC v4 0/4] platform/x86/amd: Add AMD DPTCi driver for TDP
 control in devices without vendor-specific controls
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: W_Armin@gmx.de, sashal@kernel.org, Shyam-Sundar.S-k@amd.com,
	derekjohn.clark@gmail.com, denis.benato@linux.dev, i@rong.moe,
	linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <179207722231.931394.11113647627046952790@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.6 at linux3247.grserver.gr
X-Virus-Status: Clean

On Thu, 15 Oct 2026 at 17:03, Mario Limonciello
<mario.limonciello@amd.com> wrote:
>
>
>
> On 10/15/26 09:55, Antheas Kapenekakis wrote:
> > On Thu, 15 Oct 2026 at 16:37, Mario Limonciello
> > <mario.limonciello@amd.com> wrote:
> >>
> >>
> >>
> >> On 10/15/26 04:35, Antheas Kapenekakis wrote:
> >>> On Tue, 10 Mar 2026 at 08:59, Antheas Kapenekakis <lkml@antheas.dev> wrote:
> >>>>
> >>>> On Tue, 10 Mar 2026 at 03:43, Mario Limonciello
> >>>> <mario.limonciello@amd.com> wrote:
> >>>>>
> >>>>>
> >>>>>
> >>>>> On 3/9/2026 3:51 PM, Antheas Kapenekakis wrote:
> >>>>>> Many AMD-based handheld PCs (GPD, AYANEO, OneXPlayer, AOKZOE, OrangePi)
> >>>>>> ship with the AGESA ALIB method at \_SB.ALIB, which accepts Function 0x0C
> >>>>>> (the Dynamic Power and Thermal Configuration Interface, DPTCi). This
> >>>>>> allows software to adjust APU power and thermal parameters at runtime:
> >>>>>> sustained power limit (SPL/STAPM + skin), slow PPT, fast PPT, and the
> >>>>>> thermal control target.
> >>>>>>
> >>>>>> Unlike mainstream AMD laptops, these devices do not implement vendor-
> >>>>>> specific WMI or EC hooks for TDP control. The ones that do, use DPTCi
> >>>>>> under the hood. For these devices, ALIB is the only viable mechanism for
> >>>>>> the OS to adjust power limits, making a dedicated kernel driver the
> >>>>>> correct approach rather than relying on the out-of-tree acpi_call module
> >>>>>> or ryzenadj.
> >>>>>>
> >>>>>> The driver provides two layers of control:
> >>>>>>
> >>>>>>      * Platform profile integration (low-power / balanced / performance /
> >>>>>>        custom), with per-device preset tunings derived from thermal envelope
> >>>>>>        data. Selecting a non-custom profile applies values immediately and
> >>>>>>        locks the individual tunables to read-only. The default profile is
> >>>>>>        "custom", leaving the device at firmware defaults until userspace
> >>>>>>        explicitly selects a profile.
> >>>>>>
> >>>>>>      * Four firmware-attributes tunables (ppt_pl1_spl, ppt_pl2_sppt,
> >>>>>>        ppt_pl3_fppt, cpu_temp) that become writable in "custom" mode.
> >>>>>>        Values are enforced against per-device limits (smin..smax), with an
> >>>>>>        "expanded_limits" toggle that widens the range to the full hardware-
> >>>>>>        validated envelope (min..max). A save_settings attribute controls
> >>>>>>        whether writes commit immediately ("single") or are staged for an
> >>>>>>        explicit bulk "save".
> >>>>>>
> >>>>>> On resume, the active profile or staged values are re-applied so that
> >>>>>> suspend/resume cycles do not silently revert to firmware defaults unless
> >>>>>> in custom and in bulk mode. In that case, defer to userspace.
> >>>>>>
> >>>>>> Device limits are supplied for GPD Win Mini / Win 4 / Win 5 / Win Max 2 /
> >>>>>> Duo / Pocket 4, OrangePi NEO-01, AOKZOE A1/A2, OneXPlayer F1/2/X1/G1,
> >>>>>> and numerous AYANEO models. The SoC table covers Ryzen 5000, 6000, 7040,
> >>>>>> 8000, AI 9 HX 370, and the Ryzen AI MAX series.
> >>>>>>
> >>>>>> Tested on a GPD Win 5 (Ryzen AI MAX+ 395). Confirmed with ryzenadj -i
> >>>>>> that committed values are applied to hardware, and that fast/slow PPT
> >>>>>> limits are honoured under a full-CPU stress load.
> >>>>>>
> >>>>>> Responsible disclosure: The development of this driver is AI assisted.
> >>>>>> This includes its writing, testing, reviewing, and readmes. The driver was
> >>>>>> manually reviewed line by line, but there may still be small leftover
> >>>>>> quirks. This is an RFC, not a final version. Let's push these tools to
> >>>>>> their limits and see where it takes us.
> >>>>>>
> >>>>>
> >>>>> I'll tell you where the most immediate limit is.  Humans can't review
> >>>>> RFC changes that go in daily.
> >>>>>
> >>>>> Over my weekend I see multiple copies of the series in my inbox.  To me
> >>>>> they must have obviously been garbage because you sent them so quickly
> >>>>> instead of waiting for feedback.  So I'll delete those from my inbox and
> >>>>> review the most recent one.
> >>>>>
> >>>>> That's somewhat tongue in cheek.  I know you're excited for this series,
> >>>>> but please make sure you take time to gather and take feedback into
> >>>>> account before posting another series.
> >>>>
> >>>> It's true, I've been having a bit of fun. But the series is stabilized
> >>>> now, I don't plan to send another version soon unless I messed up
> >>>> something.
> >>>>
> >>>> V3 incorporated your feedback/derek's and V4 incorporated rong's
> >>>> feedback. V4 is minor, it is just nits.
> >>>>
> >>>>> Maybe you can pass this to a robot and it
> >>>>> can give you actionable feedback, but a human sitting down and reviewing
> >>>>> a patch series in a serious way takes time.
> >>>>
> >>>> I'm using this series as a testbed to make some tooling for this,
> >>>> maybe I will post it soon.
> >>>
> >>> Opus 4.6 was something. Anyway. @Mario v4 of this driver as it stands
> >>> is pretty good for prod. Since then, I kept adding devices and
> >>> adjusting devices based on user feedback but I did not have to touch
> >>> the driver otherwise. It has been tested on most APUs and around 30
> >>> device models now.
> >>>
> >>> One thing this driver does not do is AC/DC limits and it would be good
> >>> if it did. That way presets could be pushed higher for AC but that is
> >>> only mildly necessary for AI Max platforms. 45W is more than enough
> >>> for all of them anyway, but we could go to 55W e.g. (after that they
> >>> saturate so it is unnecessary strain). But the updated limits I have
> >>> are conservative enough where it is not an issue. I also found myself
> >>> not using the commit option, so I think it can be removed.
> >>>
> >>> The only issue with this driver is that steam maxes out TDP when you
> >>> disable the TDP slider and as the custom limit is generic for both
> >>> AC/DC it can strain the battery. This is an architectural issue with
> >>> steamos manager as before steam used the _default tdp value in AMD
> >>> sysfs but dropped the notion of default when transitioning to steamos
> >>> manager. But this is a downstream problem unrelated to the driver
> >>> where special DC limits could help a bit.
> >>>
> >>> This is because I heard you might be working on something similar. So
> >>> let's prevent some duplicative work. Should I repost a cleaned up V5?
> >>>
> >>> Best,
> >>> Antheas
> >> By "something similar" do you mean the AMD overclocking driver posted
> >> recently [1]?
> >>
> >> Does that happen to work on any of this hardware?
> >
> > 95F20B61-3D44-41F8-87E1-03CBF94C4E8F returns nothing on my ACPI dumps.
> > There are functions which contain the e.g., 0x00020026 on a lot of
> > ssdts but no WMI with the GUID that series provides.
> >
> > The WMI GUID of those functions is
> > ABBC0F6A-8EA1-11D1-00A0-C90629100000. If the interface is the same,
> > consider adding it to that driver.
>
> OK - It shouldn't be the same.
>
> >
> > You may reference to check yourself [2]
> >
> > Here is what my LLM told me about that GUID:
> >
> > | Dump | GUID present |
> > |---|---|
> > | Legion Go `N3CN26WW` | No |
> > | Legion Go `N3CN28WW` / `28WW-beta` | No |
> > | Legion Go `N3CN29WW` and later versions here | Yes |
> > | ROG Ally | No |
> > | Ally X | Yes |
> > | GPD Win 4 / Win Mini | No |
> > | One Xplayer / F1 Pro | Yes |
> >
> > So very mixed, and perhaps not an alternative to what this series
> > provides to these devices. Fine by me to go through
> >
> >> If it doesn't; sure please post your v5 that has incorporated feedback
> >> from this thread after the merge window at the start of the next kernel
> >> cycle and we can review it again.
> >
> > I was specifically asking about this interface. Not in a rush, just
> > bumping this a bit so it does not end up getting re-implemented. I
> > might not be able to fix all of the issues but I will try the best I
> > can.
> >
> > It seems this interface is so universal the CPU check might be bogus,
> > but I managed to collect 99% of the CPUs, I only get a straggler
> > reported every month or so. So it should be ok to stay.
>
> I'll admit this series hasn't been top of mind for me in a while.  (So I
> might have some page faults while trying to remember things about it).
>
> Earlier in the discussion for this series that as long as this is tied
> to SMBIOS strings to *only* load on intended hardware that should be
> sufficient.  If two systems use the same SMBIOS strings between
> generations then you'll have to add CPU disambiguation.

You suggested removing it, but indeed that's the case. SMBIOS
information is shared per device generation for most manufacturers. So
typically there are 2-3 CPUs per device. But motherboard is the same,
TDP limits are the same. Typically it is bins of the same SOC, eg.
7600/7800/8600/8800 or 388/395, etc. I have not found an exception
yet.

I will add it to my todo list to revisit this submission

Antheas

> >
> >> BTW I think this version was last posted before Sashiko started
> >> reviewing patches too.  If you can; please run a local Sashiko review
> >> cycle on it before posting your v5.
> >
> > Sigh, if I figure out I will
>
> No worries if you can't.  I was just looking for an opportunity for less
> back and forth in case it flags something.
> >
> > [2] https://github.com/hhd-dev/hwinfo
> >
> >> https://lore.kernel.org/all/20261010190543.563161-1-Shyam-sundar.S-k@amd.com/
> >> [1]
> >>
> >>
> >
>
>

