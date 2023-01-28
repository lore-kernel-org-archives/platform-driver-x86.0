Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF95DC636CB
	for <platform-driver-x86@archiver.kernel.org>; Sat, 28 Jan 2023 22:01:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231236AbjA1WBT (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 28 Jan 2023 17:01:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229999AbjA1WBS (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 28 Jan 2023 17:01:18 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85D061F5FF
        for <platform-driver-x86@vger.kernel.org>; Sat, 28 Jan 2023 14:01:17 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1E5AA60C7F
        for <platform-driver-x86@vger.kernel.org>; Sat, 28 Jan 2023 22:01:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 81163C433AC
        for <platform-driver-x86@vger.kernel.org>; Sat, 28 Jan 2023 22:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674943276;
        bh=uz1LzGk3ULfxksBG2k+lBtKgSWQi5NJqdJvcJ7wa26c=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=ANHOjJCgVZcnWitMDV4OSOwHb+lt6nuG9/vvKxQzRE+ObxR3Y2lzLtx1vo6rrnVBv
         2408mqBJs68+91kXV3qR6kGqgw3TQ5JQyVXYogsNXSHOtuo3S66pV4FUMjkPvodgav
         HjXxoIJg13tpSyQDe0SQOdpv2teXhFP7twYsGhrImcxFAA4IIpXGpBTavfOtQHbs76
         +rHmC/PX1vJ6rHaGCKKckmLkNIdEmOGWoQaW0oXtTDDKfQoe1xP+2r2ejT8Y0TbOJA
         PZJjkFUg+d/96c/U1LEBd61XUzfYYVZioc/Al1NqRyKb8VIN0k7cWxhyLl91Si3Ejp
         YXwx6y3+2b5vA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 70C54C43145; Sat, 28 Jan 2023 22:01:16 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Sat, 28 Jan 2023 22:01:13 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: robert.kling@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-hVNEptM66S@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204807-215701@https.bugzilla.kernel.org/>
References: <bug-204807-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D204807

--- Comment #289 from Robert Kling (robert.kling@gmail.com) ---
(In reply to Denis Pauk from comment #288)
> Created attachment 303660 [details]
> Asus WMI for nct6775 v6.1 base (2023.01.28)
>=20
> (In reply to Robert Kling from comment #287)
> > Created attachment 303659 [details]
> > dsdt.dat Z170 PRO GAMING/AURA
> >=20
> > Hello, would it be possible to add support for Asus Z170 PRO GAMING/AUR=
A?
> >=20
> > cat /sys/class/dmi/id/board_name:
> > Z170 PRO GAMING/AURA
>=20
> Could you please check now? There will be used mutex lock for access to
> sensors.=20
>=20
> Note, i have also checked such boards and it will be without support in a=
ny
> currently known way as no mutex used inside access methods:
> * Z170I PRO GAMING
> * B150I PRO GAMING/WIFI/AURA
> * B150I PRO GAMING/AURA=20
> * Z97-PRO GAMER (no definition like nct6775 sensor)

The patch didn't apply to 6.1.8 cleanly, some mainboards were already menti=
oned
in nct6775-platform.c. I tried to adapt and it applied/compiled.

But sensors show no fan speed & voltages.
dmesg showing:

2023-01-28T22:44:58+0100 kernel: nct6775: No such ASUS mutex: \_GPE.MUT0
2023-01-28T22:44:58+0100 kernel: nct6775: Enabling hardware monitor logical
device mappings.
2023-01-28T22:44:58+0100 kernel: nct6775: Found NCT6793D or compatible chip=
 at
0x2e:0x290
2023-01-28T22:44:58+0100 kernel: ACPI Warning: SystemIO range
0x0000000000000295-0x0000000000000296 conflicts with OpRegion
0x0000000000000290-0x0000000000000299 (\_GPE.HWM) (20220331/utaddress-204)
2023-01-28T22:44:58+0100 kernel: ACPI: OSL: Resource conflict; ACPI support
missing from driver?

Not sure if I made an error, I'll try 6.1.0 when I have some more time.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
