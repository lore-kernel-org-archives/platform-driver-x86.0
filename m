Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3D19C433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon, 11 Jul 2022 16:31:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231950AbiGKQbE (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 11 Jul 2022 12:31:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231938AbiGKQbD (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 11 Jul 2022 12:31:03 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14BA75247A
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Jul 2022 09:31:02 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B178BB810D2
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Jul 2022 16:31:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 86E39C34115
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Jul 2022 16:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657557058;
        bh=EVApYURKD4xWHZjqi7gAVFfVFDmMwW4/08eYiZXL9rM=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=MMg/e5VqJSgF3vAbRTtNBRllo3QxJ2pEC/E78h5Y2nTmxhudg7DkNuOJLn1+2aeDA
         j8rugfVeiAXYMmM2V+I27UuE7bySqD27ylae/OtYhyRak7Bk10WUeniLHO74nOEVLz
         +erB6xqifk7tYWmM73oyEo4HoMe/nJxIes1IzGxZ8NhB4ZCZxclIckExqdS5z7oFAQ
         BKUNCPOp/7KIaholucDj9FYK6tBv66iD5T9IhgXF34vJ4iSshoHgirSWXwM+sqJDv2
         Ua87O7M/vBHoFaNn1DoSMRyj9v7gFAZLwdAxG2NAjXzCoMdfrzeQJ77FsNqXDO097R
         zgQAkuVhjVP2g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 6D1A4CC13B0; Mon, 11 Jul 2022 16:30:58 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216230] "irq9: nobody cared" on Thinkpad T14 Gen1 (AMD) when
 s2idle is enabled
Date:   Mon, 11 Jul 2022 16:30:58 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: madcatx@atlas.cz
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216230-215701-ylt5Hnh7jT@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216230-215701@https.bugzilla.kernel.org/>
References: <bug-216230-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216230

--- Comment #7 from madcatx@atlas.cz ---
(In reply to Mario Limonciello (AMD) from comment #6)
> The tough thing with this bug is that in this design the IRQ is shared bo=
th
> for the ACPI SCI as well as for the GPIO controller.  There are patches in
> the kernel's s2idle handling created specifically for that case.  But it
> means when you're dealing with a spurious interrupt you don't know which
> device it was REALLY destined for.
>=20
> Looking at your GPIO output it seems that pin 32 switches from output pin=
 in
> the good scenario to input pin in the bad scenario.  Can you try to
> correlate if this happens every single time you see a problem or it's als=
o a
> red herring?
>=20
> Good=20
> > pin32     interrupt is disabled| interrupt is masked| disable wakeup in
> S0i3
> > state| disable wakeup in S3 state|
>  disable wakeup in S4/S5 state|     pull-up is disabled| Pull-down is
> disabled| output is high| output is enabled| debouncing filter disabled|=
=20=20
> 0xc50000
>=20
> Bad
> > pin32     interrupt is disabled| interrupt is masked| disable wakeup in
> S0i3
> > state| disable wakeup in S3 state|
>  disable wakeup in S4/S5 state| input is high|   pull-up is disabled|
> Pull-down is disabled|   output is disabled| debouncing filter disabled|=
=20=20
> 0x50000

I noticed the difference there. I'll keep an eye on it whenever I run into
this,

> > My machine is affected by the NVMe slow wakeup bug so I only started to=
 use
> > s2idle since kernel 5.18.
>=20
> Sorry what bug?  Are you talking about
> https://github.com/torvalds/linux/commit/
> 455cd867b85b53fd3602345f9b8a8facc551adc9 ?

Yes, that one, at least I think this is what made s2idle usable for me.

> > I'll see if I can downgrade the firmware if you think that'd help you t=
rack
> > this down. FTR I'm on version 1.40 which seems to be the latest one as =
of
> > now.
>=20
> > I attached the requested logs.
>=20
> I didn't see the issue listed there, I was hoping to understand the timing
> of it.

Apologies, I'll grab a fresh dmesg when it happens again. Although I'm afra=
id
it won't be very interesting.

>=20
> Something I'm wondering is if maybe it's an IRQ destined for the GPIO
> controller but the GPIO controller driver isn't yet loaded?  This could be
> particularly relevant if it's not in your initramfs but rather loaded aft=
er
> you entered your encryption key (noticed root=3D/dev/mapper/cryptroot)

Okay. Would adding pinctrl_amd to initramfs be enough to rule out this
possibility?

>=20
> Could you please turn on dynamic debugging for pinctrl_amd
> (pinctrl.dyndbg=3D+p on your kernel command line )and share a log with it
> reproducing?

Will do.

>=20
> > pcie_aspm=3Dforce
>=20
> FYI - this is generally not a safe thing to do.  If you remove this from
> your kernel command line can you reproduce the issue?

I'm aware but I've been using this machine with forced ASPM for about 2 yea=
rs
with no apparent issues related to that. I'll give it a go.

> > As such I don't know if this is a regression. I'll see if I can downgra=
de
> the
> > firmware if you think that'd help you track this down. FTR I'm on versi=
on
> > 1.40 which seems to be the latest one as of now.
>=20
> I think Mark will have to comment whether it's something they're aware of,
> tracking, etc regression wise.

Thanks a lot! I'll see what I can do and let you know...

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
