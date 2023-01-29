Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C986C05027
	for <platform-driver-x86@archiver.kernel.org>; Sun, 29 Jan 2023 16:11:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229741AbjA2QLl (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 29 Jan 2023 11:11:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229549AbjA2QLl (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 29 Jan 2023 11:11:41 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E578D1E1FF
        for <platform-driver-x86@vger.kernel.org>; Sun, 29 Jan 2023 08:11:39 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 3FC3CB808D6
        for <platform-driver-x86@vger.kernel.org>; Sun, 29 Jan 2023 16:11:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E5DC3C433EF
        for <platform-driver-x86@vger.kernel.org>; Sun, 29 Jan 2023 16:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675008696;
        bh=G960STQf677qQBE0QQIbmnl92SbNt2QkhZKb07V+yJk=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=us8XvGNAz+UvrKAtHBu+YBkUDSyAjPtmWwfFzhbEnilIqDI0q5mvHiD+8chsSy+sN
         RgNlIF86Pmtwc9PoPGrfrx7ieePphebE+8ywRWlwzubUUKUPtJLJnJTqJdxuafpnU2
         VW8gPhsVLi+dPLKrJUnSbZx6Mwt2XkqPEou1NsP0uCiFfFZc699AHxu9hGAQm+xvho
         lZchFvZR1rLgTywzzNMADDcpEwNBJ4p49dLs5yJVbIt8KCcJPHwCNq/Na3/TRQQUbB
         jpjijrCy36e+U08WjzHJaUayPWnQDwRw05uobMYIQl5qnZe3ZUqqyzKfBxUiFfTdsk
         Lmwrv5VJiwbCw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id D5BCDC43145; Sun, 29 Jan 2023 16:11:36 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Sun, 29 Jan 2023 16:11:33 +0000
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
Message-ID: <bug-204807-215701-nvqE8Ot0tW@https.bugzilla.kernel.org/>
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

--- Comment #291 from Robert Kling (robert.kling@gmail.com) ---
(In reply to Denis Pauk from comment #290)
> Created attachment 303662 [details]
> Asus WMI for nct6775 v6.1.8 base (2023.01.29)
>=20
> Could you try with such one?
>=20
> Change with previous one is usage "\\_SB.PCI0.LPCB.SIO1.MUT0" mutex. Note=
 -
> it will be unsafe, looks like your board doesn't use/export mutex before
> access to sensors and change settings of fans. So code just uses IO lock
> available in dsdt.

That seems to have done the trick!

kernel: nct6775: Using Asus WMI mutex: \_SB.PCI0.LPCB.SIO1.MUT0
kernel: nct6775: Enabling hardware monitor logical device mappings.
kernel: nct6775: Found NCT6793D or compatible chip at 0x2e:0x290

Not sure if more info from dmesg would be useful for you.

sensors is outputting fan/voltage data from nct6793-isa-0290 now!

I don't want to take up too much of your time for something that's not real=
ly
crucial, but how unsafe is it? I let the mainboard/bios handle cpu/aux fan
speed, I'm not running any fan control programs at the moment. Would that be
fine?

Thank you very much for your help & time!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
